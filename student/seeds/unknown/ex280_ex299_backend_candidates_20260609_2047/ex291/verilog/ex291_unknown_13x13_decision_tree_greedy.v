module ex291_unknown_13x13_decision_tree_greedy(in, out);
  input [12:0] in;
  output [12:0] out;
  reg [12:0] out_r;
  always @* begin
    out_r = 13'h0000;
    if (in[10]) begin
      if (in[3]) begin
        if (in[0]) begin
          if (in[1]) begin
            if (in[12]) begin
              if (in[11]) begin
                if (in[9]) begin
                  if (in[2]) begin
                    if (in[6]) begin
                      if (in[4]) begin
                        if (in[8]) begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1f3f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h1e7f;
                            end else begin
                              out_r = 13'h1eff;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e4f;
                            end else begin
                              out_r = 13'h1e7f;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h1f27;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fdf;
                            end else begin
                              out_r = 13'h1fe7;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h1e67;
                            end else begin
                              out_r = 13'h1ee7;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e5f;
                            end else begin
                              out_r = 13'h1e67;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1f9f;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1f9f;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1f7f;
                            end else begin
                              out_r = 13'h1f3f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h1f7f;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1fbf;
                            end else begin
                              out_r = 13'h1fcf;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h1fbf;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1f9f;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1f9f;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          out_r = 13'h1f9f;
                        end else begin
                          out_r = 13'h199f;
                        end
                      end else begin
                        if (in[6]) begin
                          out_r = 13'h1c9f;
                        end else begin
                          out_r = 13'h1b9f;
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          out_r = 13'h1e1f;
                        end else begin
                          out_r = 13'h181f;
                        end
                      end else begin
                        if (in[6]) begin
                          out_r = 13'h1d9f;
                        end else begin
                          out_r = 13'h1a9f;
                        end
                      end
                    end
                  end
                end else begin
                  if (in[8]) begin
                    if (in[2]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[4]) begin
                            out_r = 13'h19ff;
                          end else begin
                            out_r = 13'h19cf;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h193f;
                          end else begin
                            out_r = 13'h18ff;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[7]) begin
                            out_r = 13'h199f;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h187f;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h19cf;
                            end else begin
                              out_r = 13'h19bf;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h181f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h1fff;
                          end else begin
                            out_r = 13'h13ff;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h19ff;
                          end else begin
                            out_r = 13'h17ff;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h1cff;
                          end else begin
                            out_r = 13'h10ff;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1bff;
                          end else begin
                            out_r = 13'h15ff;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[7]) begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h1cff;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1c9f;
                            end else begin
                              out_r = 13'h1c7f;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1ccf;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1cff;
                            end else begin
                              out_r = 13'h1c3f;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[4]) begin
                            out_r = 13'h1fff;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h1fbf;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1e7f;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1eff;
                            end else begin
                              out_r = 13'h1ebf;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h1f3f;
                          end else begin
                            out_r = 13'h133f;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h193f;
                          end else begin
                            out_r = 13'h173f;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h1c3f;
                          end else begin
                            out_r = 13'h103f;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1b3f;
                          end else begin
                            out_r = 13'h153f;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[9]) begin
                  if (in[4]) begin
                    if (in[2]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ff9;
                            end else begin
                              out_r = 13'h07f9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13f9;
                            end else begin
                              out_r = 13'h0ff9;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h19f9;
                            end else begin
                              out_r = 13'h01f9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h17f9;
                            end else begin
                              out_r = 13'h0bf9;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1cf9;
                            end else begin
                              out_r = 13'h04f9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h10f9;
                            end else begin
                              out_r = 13'h0cf9;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1bf9;
                            end else begin
                              out_r = 13'h03f9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h15f9;
                            end else begin
                              out_r = 13'h09f9;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h13f9;
                            end else begin
                              out_r = 13'h1279;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1399;
                            end else begin
                              out_r = 13'h13f9;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1339;
                            end else begin
                              out_r = 13'h12f9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1379;
                            end else begin
                              out_r = 13'h1339;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h13c9;
                            end else begin
                              out_r = 13'h1249;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13b9;
                            end else begin
                              out_r = 13'h13c9;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h13f9;
                            end else begin
                              out_r = 13'h1279;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1399;
                            end else begin
                              out_r = 13'h13f9;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1e79;
                            end else begin
                              out_r = 13'h0679;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1279;
                            end else begin
                              out_r = 13'h0e79;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1879;
                            end else begin
                              out_r = 13'h0079;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1679;
                            end else begin
                              out_r = 13'h0a79;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1df9;
                            end else begin
                              out_r = 13'h05f9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h11f9;
                            end else begin
                              out_r = 13'h0df9;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1af9;
                            end else begin
                              out_r = 13'h02f9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h14f9;
                            end else begin
                              out_r = 13'h08f9;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h13ff;
                            end else begin
                              out_r = 13'h133f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h13cf;
                            end else begin
                              out_r = 13'h13ff;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h127f;
                            end else begin
                              out_r = 13'h12ff;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h124f;
                            end else begin
                              out_r = 13'h127f;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h13e7;
                            end else begin
                              out_r = 13'h1327;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h13df;
                            end else begin
                              out_r = 13'h13e7;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h1387;
                            end else begin
                              out_r = 13'h1367;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h13af;
                            end else begin
                              out_r = 13'h1387;
                            end
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
                          out_r = 13'h1ff0;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1ff0;
                          end else begin
                            out_r = 13'h13f0;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h19f0;
                            end else begin
                              out_r = 13'h1ff0;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ff0;
                            end else begin
                              out_r = 13'h19f0;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h19f0;
                            end else begin
                              out_r = 13'h13f0;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ff0;
                            end else begin
                              out_r = 13'h17f0;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h1cf0;
                          end else begin
                            out_r = 13'h1ff0;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ff0;
                            end else begin
                              out_r = 13'h13f0;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1cf0;
                            end else begin
                              out_r = 13'h10f0;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1bf0;
                            end else begin
                              out_r = 13'h1cf0;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ff0;
                            end else begin
                              out_r = 13'h19f0;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h19f0;
                            end else begin
                              out_r = 13'h13f0;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1cf0;
                            end else begin
                              out_r = 13'h15f0;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[7]) begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h19f3;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19f3;
                            end else begin
                              out_r = 13'h1bf3;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h19f3;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1933;
                            end else begin
                              out_r = 13'h1b33;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h1e73;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e73;
                            end else begin
                              out_r = 13'h1df3;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1e43;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ec3;
                            end else begin
                              out_r = 13'h1d43;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h199f;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h199f;
                            end else begin
                              out_r = 13'h197f;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h19ff;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1bff;
                            end else begin
                              out_r = 13'h1b3f;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[8]) begin
                            out_r = 13'h1f9f;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1cff;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1fbf;
                            end else begin
                              out_r = 13'h1fcf;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f5f;
                            end else begin
                              out_r = 13'h1c0f;
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
                if (in[8]) begin
                  if (in[2]) begin
                    if (in[11]) begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[4]) begin
                            out_r = 13'h1f3f;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h073f;
                            end else begin
                              out_r = 13'h1f3f;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1f39;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h0739;
                            end else begin
                              out_r = 13'h1f39;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[4]) begin
                            out_r = 13'h1fff;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h07ff;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h0ff8;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1ff8;
                            end else begin
                              out_r = 13'h0ff8;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[4]) begin
                          if (in[7]) begin
                            if (in[5]) begin
                              out_r = 13'h17ff;
                            end else begin
                              out_r = 13'h17e7;
                            end
                          end else begin
                            out_r = 13'h179f;
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h17f3;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h17ef;
                            end else begin
                              out_r = 13'h17f3;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[5]) begin
                            out_r = 13'h17cf;
                          end else begin
                            out_r = 13'h17df;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h17bf;
                          end else begin
                            out_r = 13'h17cf;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[11]) begin
                      if (in[5]) begin
                        if (in[4]) begin
                          if (in[7]) begin
                            out_r = 13'h13fc;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h139c;
                            end else begin
                              out_r = 13'h13bc;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h13f0;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1390;
                            end else begin
                              out_r = 13'h13b0;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h1fe4;
                          end else begin
                            out_r = 13'h1f84;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1ffc;
                          end else begin
                            out_r = 13'h1fbc;
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[6]) begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h1f7f;
                            end else begin
                              out_r = 13'h1f79;
                            end
                          end else begin
                            out_r = 13'h1f7f;
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h1f7c;
                            end else begin
                              out_r = 13'h1f7b;
                            end
                          end else begin
                            out_r = 13'h1f7c;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          out_r = 13'h1f7f;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1f7f;
                          end else begin
                            out_r = 13'h1f79;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[5]) begin
                    if (in[6]) begin
                      if (in[4]) begin
                        if (in[7]) begin
                          if (in[2]) begin
                            if (in[11]) begin
                              out_r = 13'h1f33;
                            end else begin
                              out_r = 13'h133f;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h133f;
                            end else begin
                              out_r = 13'h1f33;
                            end
                          end
                        end else begin
                          if (in[2]) begin
                            if (in[11]) begin
                              out_r = 13'h1f37;
                            end else begin
                              out_r = 13'h137f;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h133f;
                            end else begin
                              out_r = 13'h1f37;
                            end
                          end
                        end
                      end else begin
                        if (in[2]) begin
                          if (in[11]) begin
                            if (in[7]) begin
                              out_r = 13'h0733;
                            end else begin
                              out_r = 13'h0737;
                            end
                          end else begin
                            out_r = 13'h1333;
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h1333;
                          end else begin
                            out_r = 13'h1f33;
                          end
                        end
                      end
                    end else begin
                      if (in[2]) begin
                        if (in[11]) begin
                          if (in[7]) begin
                            out_r = 13'h1f30;
                          end else begin
                            out_r = 13'h1f35;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h133f;
                            end else begin
                              out_r = 13'h137f;
                            end
                          end else begin
                            out_r = 13'h133f;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[7]) begin
                            if (in[11]) begin
                              out_r = 13'h133f;
                            end else begin
                              out_r = 13'h1f3c;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h130f;
                            end else begin
                              out_r = 13'h1f3b;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[7]) begin
                              out_r = 13'h1333;
                            end else begin
                              out_r = 13'h1303;
                            end
                          end else begin
                            out_r = 13'h1f3f;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[7]) begin
                        if (in[11]) begin
                          if (in[6]) begin
                            if (in[4]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h07f3;
                            end
                          end else begin
                            out_r = 13'h1ff0;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h13e7;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h13ef;
                            end else begin
                              out_r = 13'h13e7;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[6]) begin
                            if (in[4]) begin
                              out_r = 13'h0ff6;
                            end else begin
                              out_r = 13'h1ff6;
                            end
                          end else begin
                            out_r = 13'h1ff4;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h139f;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h13f3;
                            end else begin
                              out_r = 13'h13ff;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[11]) begin
                          out_r = 13'h1f27;
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1f3f;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h1f39;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[7]) begin
                            out_r = 13'h1f3f;
                          end else begin
                            out_r = 13'h1f0f;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1f30;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1f33;
                            end else begin
                              out_r = 13'h1f37;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[8]) begin
                    if (in[2]) begin
                      if (in[6]) begin
                        if (in[5]) begin
                          out_r = 13'h1e4f;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1e4f;
                          end else begin
                            out_r = 13'h1e4c;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h1fc9;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fc9;
                            end else begin
                              out_r = 13'h1fcb;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h0fc8;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0fc8;
                            end else begin
                              out_r = 13'h1fca;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          out_r = 13'h07f9;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1fc9;
                          end else begin
                            out_r = 13'h1ff9;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h07e7;
                          end else begin
                            out_r = 13'h07ff;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1fdf;
                            end else begin
                              out_r = 13'h1fe7;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[6]) begin
                        if (in[5]) begin
                          out_r = 13'h1e5f;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1e5f;
                          end else begin
                            out_r = 13'h1e5c;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h1fdf;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fdf;
                            end else begin
                              out_r = 13'h1fdc;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h0fde;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0fde;
                            end else begin
                              out_r = 13'h1fdd;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h067f;
                          end else begin
                            out_r = 13'h061f;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1e4f;
                            end else begin
                              out_r = 13'h1e7f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e3f;
                            end else begin
                              out_r = 13'h1e1f;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h0661;
                          end else begin
                            out_r = 13'h0619;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1e59;
                            end else begin
                              out_r = 13'h1e61;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e39;
                            end else begin
                              out_r = 13'h1e19;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[5]) begin
                      if (in[7]) begin
                        if (in[6]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h07ff;
                            end else begin
                              out_r = 13'h067f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h07e7;
                            end else begin
                              out_r = 13'h0667;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h079f;
                            end else begin
                              out_r = 13'h07ff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h07ff;
                            end else begin
                              out_r = 13'h079f;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h04ff;
                            end else begin
                              out_r = 13'h05ff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h04e7;
                            end else begin
                              out_r = 13'h05e7;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h049f;
                            end else begin
                              out_r = 13'h04ff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h04ff;
                            end else begin
                              out_r = 13'h049f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[6]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h07cf;
                            end else begin
                              out_r = 13'h064f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h07df;
                            end else begin
                              out_r = 13'h065f;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h07bf;
                            end else begin
                              out_r = 13'h07cf;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h07cf;
                            end else begin
                              out_r = 13'h07bf;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h043f;
                            end else begin
                              out_r = 13'h057f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0427;
                            end else begin
                              out_r = 13'h0567;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h047f;
                            end else begin
                              out_r = 13'h043f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h043f;
                            end else begin
                              out_r = 13'h047f;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h12cf;
                            end else begin
                              out_r = 13'h12df;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h12c3;
                            end else begin
                              out_r = 13'h12d7;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h12c9;
                            end else begin
                              out_r = 13'h12d9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h12c7;
                            end else begin
                              out_r = 13'h12d3;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h12cc;
                            end else begin
                              out_r = 13'h12dc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h12c0;
                            end else begin
                              out_r = 13'h12d4;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h12cb;
                            end else begin
                              out_r = 13'h12db;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h12c5;
                            end else begin
                              out_r = 13'h12d1;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h02ce;
                            end else begin
                              out_r = 13'h02de;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h02c2;
                            end else begin
                              out_r = 13'h02d6;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h02c8;
                            end else begin
                              out_r = 13'h02d8;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h02c6;
                            end else begin
                              out_r = 13'h02d2;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h12cd;
                            end else begin
                              out_r = 13'h12dd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h12c1;
                            end else begin
                              out_r = 13'h12d5;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h12ca;
                            end else begin
                              out_r = 13'h12da;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h12c4;
                            end else begin
                              out_r = 13'h12d0;
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
            if (in[11]) begin
              if (in[2]) begin
                if (in[12]) begin
                  if (in[7]) begin
                    if (in[8]) begin
                      if (in[5]) begin
                        if (in[9]) begin
                          if (in[6]) begin
                            if (in[4]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h1f93;
                            end
                          end else begin
                            out_r = 13'h1e73;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1fe7;
                          end else begin
                            out_r = 13'h1f3f;
                          end
                        end
                      end else begin
                        if (in[9]) begin
                          if (in[6]) begin
                            if (in[4]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h1f7f;
                            end
                          end else begin
                            out_r = 13'h1eff;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1fff;
                          end else begin
                            out_r = 13'h1f27;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[9]) begin
                          if (in[4]) begin
                            out_r = 13'h19f3;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h19f3;
                            end else begin
                              out_r = 13'h1993;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h13e7;
                          end else begin
                            out_r = 13'h13ff;
                          end
                        end
                      end else begin
                        if (in[9]) begin
                          if (in[4]) begin
                            out_r = 13'h193f;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h193f;
                            end else begin
                              out_r = 13'h197f;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h127f;
                          end else begin
                            out_r = 13'h1267;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[8]) begin
                      if (in[9]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[4]) begin
                              out_r = 13'h1cf3;
                            end else begin
                              out_r = 13'h1c93;
                            end
                          end else begin
                            out_r = 13'h1df3;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[4]) begin
                              out_r = 13'h1cff;
                            end else begin
                              out_r = 13'h1c9f;
                            end
                          end else begin
                            out_r = 13'h1dff;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h19e7;
                          end else begin
                            out_r = 13'h19ff;
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h19ff;
                          end else begin
                            out_r = 13'h19e7;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[9]) begin
                          if (in[4]) begin
                            out_r = 13'h1bf3;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1bf3;
                            end else begin
                              out_r = 13'h1b93;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h17e7;
                          end else begin
                            out_r = 13'h173f;
                          end
                        end
                      end else begin
                        if (in[9]) begin
                          if (in[4]) begin
                            out_r = 13'h1bff;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1bff;
                            end else begin
                              out_r = 13'h1b9f;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h167f;
                          end else begin
                            out_r = 13'h16e7;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[5]) begin
                    if (in[9]) begin
                      if (in[6]) begin
                        if (in[4]) begin
                          if (in[7]) begin
                            out_r = 13'h10ff;
                          end else begin
                            out_r = 13'h10e7;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h10ff;
                          end else begin
                            out_r = 13'h10fc;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[7]) begin
                            out_r = 13'h10f3;
                          end else begin
                            out_r = 13'h10ef;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h10f3;
                          end else begin
                            out_r = 13'h10f0;
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h193f;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1927;
                            end else begin
                              out_r = 13'h1967;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1939;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h193f;
                            end else begin
                              out_r = 13'h197f;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h19cf;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19df;
                            end else begin
                              out_r = 13'h19af;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h19c9;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h19cf;
                            end else begin
                              out_r = 13'h19bf;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[9]) begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1cf9;
                            end else begin
                              out_r = 13'h1ce1;
                            end
                          end else begin
                            out_r = 13'h1cf9;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1cc9;
                            end else begin
                              out_r = 13'h1cd9;
                            end
                          end else begin
                            out_r = 13'h1ccb;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1cf7;
                            end else begin
                              out_r = 13'h1ceb;
                            end
                          end else begin
                            out_r = 13'h1cf7;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1cc7;
                            end else begin
                              out_r = 13'h1cd3;
                            end
                          end else begin
                            out_r = 13'h1cc5;
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h013f;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0127;
                            end else begin
                              out_r = 13'h0167;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0139;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h013f;
                            end else begin
                              out_r = 13'h017f;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h01ff;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h01e7;
                            end else begin
                              out_r = 13'h0187;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h01f9;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h01ff;
                            end else begin
                              out_r = 13'h019f;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[12]) begin
                  if (in[9]) begin
                    if (in[5]) begin
                      if (in[8]) begin
                        if (in[4]) begin
                          out_r = 13'h1eff;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1eff;
                          end else begin
                            out_r = 13'h0efe;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          out_r = 13'h1efc;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1efc;
                          end else begin
                            out_r = 13'h1efd;
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        out_r = 13'h12ff;
                      end else begin
                        if (in[7]) begin
                          out_r = 13'h12ff;
                        end else begin
                          out_r = 13'h02fe;
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[8]) begin
                        if (in[4]) begin
                          if (in[7]) begin
                            out_r = 13'h1cf3;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1cff;
                            end else begin
                              out_r = 13'h1cfc;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1cff;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1cf3;
                            end else begin
                              out_r = 13'h1cf0;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[7]) begin
                            out_r = 13'h1cf7;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1cf9;
                            end else begin
                              out_r = 13'h1cfb;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1cf9;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1cf7;
                            end else begin
                              out_r = 13'h1cf5;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[7]) begin
                          out_r = 13'h1cf3;
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1cff;
                          end else begin
                            out_r = 13'h1cfc;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          out_r = 13'h0cfe;
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h0cf2;
                          end else begin
                            out_r = 13'h1cf1;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[4]) begin
                    if (in[5]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h0ff6;
                            end else begin
                              out_r = 13'h1fe5;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h0cf6;
                            end else begin
                              out_r = 13'h1ffd;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1e79;
                            end else begin
                              out_r = 13'h0fee;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1df9;
                            end else begin
                              out_r = 13'h0ff2;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h0ff2;
                            end else begin
                              out_r = 13'h1e64;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h0cf2;
                            end else begin
                              out_r = 13'h1e7c;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1e7f;
                            end else begin
                              out_r = 13'h1e6f;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1dff;
                            end else begin
                              out_r = 13'h1e73;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h0f96;
                            end else begin
                              out_r = 13'h0f26;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h0c96;
                            end else begin
                              out_r = 13'h0f3e;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1e19;
                            end else begin
                              out_r = 13'h1f2d;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1d99;
                            end else begin
                              out_r = 13'h1f31;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h0f92;
                            end else begin
                              out_r = 13'h1ee7;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h0c92;
                            end else begin
                              out_r = 13'h1eff;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1e1f;
                            end else begin
                              out_r = 13'h1eec;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1d9f;
                            end else begin
                              out_r = 13'h1ef0;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1ff7;
                            end else begin
                              out_r = 13'h13e4;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1cf7;
                            end else begin
                              out_r = 13'h13fc;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h0e78;
                            end else begin
                              out_r = 13'h13ef;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h0df8;
                            end else begin
                              out_r = 13'h13f3;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h1265;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1cf3;
                            end else begin
                              out_r = 13'h127d;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h0e7e;
                            end else begin
                              out_r = 13'h026e;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h0dfe;
                            end else begin
                              out_r = 13'h0272;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1f97;
                            end else begin
                              out_r = 13'h1327;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1c97;
                            end else begin
                              out_r = 13'h133f;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h0e18;
                            end else begin
                              out_r = 13'h132c;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h0d98;
                            end else begin
                              out_r = 13'h1330;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1f93;
                            end else begin
                              out_r = 13'h02e6;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1c93;
                            end else begin
                              out_r = 13'h02fe;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h0e1e;
                            end else begin
                              out_r = 13'h12ed;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h0d9e;
                            end else begin
                              out_r = 13'h12f1;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[12]) begin
                if (in[9]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[6]) begin
                        if (in[5]) begin
                          if (in[7]) begin
                            out_r = 13'h1f27;
                          end else begin
                            out_r = 13'h1fe7;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1fe7;
                          end else begin
                            out_r = 13'h1f27;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[7]) begin
                            out_r = 13'h0727;
                          end else begin
                            out_r = 13'h07e7;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h07e7;
                          end else begin
                            out_r = 13'h0727;
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h193f;
                            end else begin
                              out_r = 13'h19ff;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h193f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1f3f;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h013f;
                            end else begin
                              out_r = 13'h01ff;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h01ff;
                            end else begin
                              out_r = 13'h013f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h073f;
                            end else begin
                              out_r = 13'h07ff;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h07ff;
                            end else begin
                              out_r = 13'h073f;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h1fff;
                          end else begin
                            out_r = 13'h19e7;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            out_r = 13'h19ef;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h1f3f;
                          end else begin
                            out_r = 13'h1927;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1f33;
                          end else begin
                            out_r = 13'h192f;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h0ffe;
                          end else begin
                            out_r = 13'h09e6;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0ff2;
                          end else begin
                            out_r = 13'h09ee;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h0f3e;
                          end else begin
                            out_r = 13'h0926;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0f32;
                          end else begin
                            out_r = 13'h092e;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[5]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h1e43;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1fc7;
                            end else begin
                              out_r = 13'h13c7;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1e40;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1fc5;
                            end else begin
                              out_r = 13'h13c5;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h0e42;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h0fc6;
                            end else begin
                              out_r = 13'h03c6;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1e41;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1fc4;
                            end else begin
                              out_r = 13'h13c4;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1e77;
                            end else begin
                              out_r = 13'h1277;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1ff0;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1e75;
                            end else begin
                              out_r = 13'h1275;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h0ff2;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h0e76;
                            end else begin
                              out_r = 13'h0276;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1ff1;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1e74;
                            end else begin
                              out_r = 13'h1274;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h1fcf;
                          end else begin
                            out_r = 13'h13df;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h19cf;
                          end else begin
                            out_r = 13'h17df;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h1fcc;
                          end else begin
                            out_r = 13'h13dc;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h19cc;
                          end else begin
                            out_r = 13'h17dc;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h1f0f;
                          end else begin
                            out_r = 13'h131f;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h190f;
                          end else begin
                            out_r = 13'h171f;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h1f0c;
                          end else begin
                            out_r = 13'h131c;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h190c;
                          end else begin
                            out_r = 13'h171c;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[2]) begin
                  if (in[5]) begin
                    if (in[9]) begin
                      if (in[7]) begin
                        if (in[6]) begin
                          if (in[4]) begin
                            out_r = 13'h0ff8;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0fc8;
                            end else begin
                              out_r = 13'h0ff8;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h0f38;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f08;
                            end else begin
                              out_r = 13'h0f38;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h0ff8;
                          end else begin
                            out_r = 13'h0fc8;
                          end
                        end else begin
                          out_r = 13'h0e78;
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h0ff2;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0e72;
                            end else begin
                              out_r = 13'h0ff2;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0f92;
                            end else begin
                              out_r = 13'h0ff2;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0e72;
                            end else begin
                              out_r = 13'h0f92;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h0cf2;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0df2;
                            end else begin
                              out_r = 13'h0cf2;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0c92;
                            end else begin
                              out_r = 13'h0cf2;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0df2;
                            end else begin
                              out_r = 13'h0c92;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[7]) begin
                      if (in[9]) begin
                        if (in[6]) begin
                          if (in[4]) begin
                            out_r = 13'h0f9e;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f9e;
                            end else begin
                              out_r = 13'h0fbe;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h0f3e;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f3e;
                            end else begin
                              out_r = 13'h0f0e;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h0ffe;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0e7e;
                            end else begin
                              out_r = 13'h0ffe;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0f9e;
                            end else begin
                              out_r = 13'h0ffe;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0e7e;
                            end else begin
                              out_r = 13'h0f9e;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[9]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h0f9e;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h0e1e;
                            end else begin
                              out_r = 13'h0e3e;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0ffe;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h0e7e;
                            end else begin
                              out_r = 13'h0e4e;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h0c3e;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0d7e;
                            end else begin
                              out_r = 13'h0c3e;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0c7e;
                            end else begin
                              out_r = 13'h0c3e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0d7e;
                            end else begin
                              out_r = 13'h0c7e;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[9]) begin
                    if (in[6]) begin
                      if (in[4]) begin
                        if (in[7]) begin
                          out_r = 13'h127f;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h127f;
                          end else begin
                            out_r = 13'h1267;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[7]) begin
                            out_r = 13'h127f;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h127f;
                            end else begin
                              out_r = 13'h1267;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h127c;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h127c;
                            end else begin
                              out_r = 13'h1264;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[7]) begin
                          out_r = 13'h127f;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1273;
                          end else begin
                            out_r = 13'h126f;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[7]) begin
                            out_r = 13'h1279;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1277;
                            end else begin
                              out_r = 13'h126b;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h127b;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1275;
                            end else begin
                              out_r = 13'h1269;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[7]) begin
                        if (in[6]) begin
                          out_r = 13'h193f;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h193f;
                          end else begin
                            out_r = 13'h1927;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h190f;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h190f;
                            end else begin
                              out_r = 13'h191f;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1903;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1903;
                            end else begin
                              out_r = 13'h1917;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          out_r = 13'h093e;
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h090e;
                          end else begin
                            out_r = 13'h0902;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h0938;
                          end else begin
                            out_r = 13'h0920;
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h0908;
                            end else begin
                              out_r = 13'h0918;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0906;
                            end else begin
                              out_r = 13'h0912;
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
          if (in[12]) begin
            if (in[9]) begin
              if (in[11]) begin
                if (in[2]) begin
                  if (in[1]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        out_r = 13'h1fff;
                      end else begin
                        if (in[8]) begin
                          out_r = 13'h1fff;
                        end else begin
                          out_r = 13'h1f9f;
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[5]) begin
                          out_r = 13'h1fff;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1fff;
                          end else begin
                            out_r = 13'h1f9f;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          out_r = 13'h1fcf;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1fcf;
                          end else begin
                            out_r = 13'h1fbf;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h1fef;
                          end else begin
                            out_r = 13'h19ef;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1cf3;
                          end else begin
                            out_r = 13'h1bf3;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h1e7f;
                          end else begin
                            out_r = 13'h187f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1de7;
                          end else begin
                            out_r = 13'h1ae7;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f27;
                            end else begin
                              out_r = 13'h1fe7;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1927;
                            end else begin
                              out_r = 13'h19e7;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1c3f;
                            end else begin
                              out_r = 13'h1cff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1b3f;
                            end else begin
                              out_r = 13'h1bff;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ef3;
                            end else begin
                              out_r = 13'h1e73;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h18f3;
                            end else begin
                              out_r = 13'h1873;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1d6f;
                            end else begin
                              out_r = 13'h1def;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1a6f;
                            end else begin
                              out_r = 13'h1aef;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[1]) begin
                    if (in[4]) begin
                      if (in[7]) begin
                        if (in[8]) begin
                          out_r = 13'h1f0f;
                        end else begin
                          out_r = 13'h1f3f;
                        end
                      end else begin
                        if (in[8]) begin
                          out_r = 13'h073f;
                        end else begin
                          out_r = 13'h070f;
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[8]) begin
                          out_r = 13'h1c0f;
                        end else begin
                          out_r = 13'h1c3f;
                        end
                      end else begin
                        if (in[8]) begin
                          out_r = 13'h043f;
                        end else begin
                          out_r = 13'h040f;
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[7]) begin
                        if (in[4]) begin
                          if (in[8]) begin
                            out_r = 13'h1f3f;
                          end else begin
                            out_r = 13'h1f39;
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1f3f;
                          end else begin
                            out_r = 13'h073f;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          out_r = 13'h1f3c;
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1f3c;
                            end else begin
                              out_r = 13'h1f3b;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h073c;
                            end else begin
                              out_r = 13'h073b;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[8]) begin
                          out_r = 13'h1f3f;
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1f39;
                            end else begin
                              out_r = 13'h1f3f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h1f39;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0f3e;
                            end else begin
                              out_r = 13'h0f38;
                            end
                          end else begin
                            out_r = 13'h0f3e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1f3e;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f3e;
                            end else begin
                              out_r = 13'h1f38;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[6]) begin
                  if (in[1]) begin
                    if (in[4]) begin
                      if (in[2]) begin
                        if (in[8]) begin
                          if (in[5]) begin
                            out_r = 13'h1fc3;
                          end else begin
                            out_r = 13'h19c3;
                          end
                        end else begin
                          out_r = 13'h0fc2;
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ff0;
                            end else begin
                              out_r = 13'h1cf0;
                            end
                          end else begin
                            out_r = 13'h1ff0;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f90;
                            end else begin
                              out_r = 13'h1c90;
                            end
                          end else begin
                            out_r = 13'h1f90;
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[2]) begin
                          if (in[8]) begin
                            if (in[5]) begin
                              out_r = 13'h1cf3;
                            end else begin
                              out_r = 13'h1bf3;
                            end
                          end else begin
                            out_r = 13'h0ff2;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1fc3;
                          end else begin
                            out_r = 13'h1cf3;
                          end
                        end
                      end else begin
                        if (in[2]) begin
                          if (in[8]) begin
                            if (in[5]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h19f3;
                            end
                          end else begin
                            out_r = 13'h0cf2;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1fc3;
                          end else begin
                            out_r = 13'h1ff3;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[4]) begin
                        if (in[7]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1ecf;
                            end else begin
                              out_r = 13'h1e4f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e4f;
                            end else begin
                              out_r = 13'h1ecf;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1ecc;
                            end else begin
                              out_r = 13'h1e4c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e4c;
                            end else begin
                              out_r = 13'h1ecc;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h12cf;
                            end else begin
                              out_r = 13'h124f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h124f;
                            end else begin
                              out_r = 13'h12cf;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h12cc;
                            end else begin
                              out_r = 13'h124c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h124c;
                            end else begin
                              out_r = 13'h12cc;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[8]) begin
                        if (in[4]) begin
                          out_r = 13'h1fcc;
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1f0c;
                          end else begin
                            out_r = 13'h1fcc;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[4]) begin
                            out_r = 13'h13c0;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1300;
                            end else begin
                              out_r = 13'h13c0;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h17c0;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1700;
                            end else begin
                              out_r = 13'h17c0;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[1]) begin
                      if (in[4]) begin
                        if (in[8]) begin
                          if (in[5]) begin
                            out_r = 13'h13c3;
                          end else begin
                            out_r = 13'h17c3;
                          end
                        end else begin
                          out_r = 13'h03c2;
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[5]) begin
                              out_r = 13'h10f3;
                            end else begin
                              out_r = 13'h15f3;
                            end
                          end else begin
                            out_r = 13'h03f2;
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[5]) begin
                              out_r = 13'h13f3;
                            end else begin
                              out_r = 13'h17f3;
                            end
                          end else begin
                            out_r = 13'h00f2;
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[7]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h0f3e;
                            end else begin
                              out_r = 13'h0ffe;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0ffe;
                            end else begin
                              out_r = 13'h0f3e;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1f3d;
                            end else begin
                              out_r = 13'h1ffd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ffd;
                            end else begin
                              out_r = 13'h1f3d;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h033e;
                            end else begin
                              out_r = 13'h03fe;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h03fe;
                            end else begin
                              out_r = 13'h033e;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h133d;
                            end else begin
                              out_r = 13'h13fd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13fd;
                            end else begin
                              out_r = 13'h133d;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[4]) begin
                        if (in[1]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f3c;
                            end else begin
                              out_r = 13'h1c3c;
                            end
                          end else begin
                            out_r = 13'h1efc;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h13c3;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ccf;
                            end else begin
                              out_r = 13'h15c3;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h1f0f;
                          end else begin
                            if (in[1]) begin
                              out_r = 13'h1c3f;
                            end else begin
                              out_r = 13'h1303;
                            end
                          end
                        end else begin
                          if (in[1]) begin
                            if (in[8]) begin
                              out_r = 13'h1ecf;
                            end else begin
                              out_r = 13'h1eff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1c0f;
                            end else begin
                              out_r = 13'h1503;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[1]) begin
                        if (in[4]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f9c;
                            end else begin
                              out_r = 13'h1c9c;
                            end
                          end else begin
                            out_r = 13'h1e1c;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h1cff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e4f;
                            end else begin
                              out_r = 13'h1e7f;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h1e4f;
                          end else begin
                            out_r = 13'h1243;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1dcf;
                          end else begin
                            out_r = 13'h14c3;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[11]) begin
                if (in[8]) begin
                  if (in[1]) begin
                    if (in[2]) begin
                      if (in[4]) begin
                        if (in[6]) begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h1cff;
                            end else begin
                              out_r = 13'h1c3f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1ccf;
                            end else begin
                              out_r = 13'h1c0f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h1c9f;
                            end else begin
                              out_r = 13'h1cff;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1cff;
                            end else begin
                              out_r = 13'h1c9f;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1ce7;
                            end else begin
                              out_r = 13'h1c27;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1c87;
                            end else begin
                              out_r = 13'h1ce7;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1cff;
                            end else begin
                              out_r = 13'h1c3f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1ccf;
                            end else begin
                              out_r = 13'h1cbf;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[7]) begin
                          out_r = 13'h0fe6;
                        end else begin
                          out_r = 13'h039e;
                        end
                      end else begin
                        if (in[7]) begin
                          out_r = 13'h0cfe;
                        end else begin
                          out_r = 13'h0086;
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h13f7;
                            end else begin
                              out_r = 13'h10f7;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1277;
                            end else begin
                              out_r = 13'h11f7;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1337;
                            end else begin
                              out_r = 13'h1037;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h12f7;
                            end else begin
                              out_r = 13'h1177;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1397;
                            end else begin
                              out_r = 13'h1097;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1217;
                            end else begin
                              out_r = 13'h1197;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1377;
                            end else begin
                              out_r = 13'h1077;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h12b7;
                            end else begin
                              out_r = 13'h1137;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[4]) begin
                            out_r = 13'h1eb9;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1eb9;
                            end else begin
                              out_r = 13'h06b9;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1eff;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1eff;
                            end else begin
                              out_r = 13'h06ff;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[4]) begin
                            out_r = 13'h12b9;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h12b9;
                            end else begin
                              out_r = 13'h0eb9;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h02fe;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h02fe;
                            end else begin
                              out_r = 13'h16fe;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[7]) begin
                    if (in[1]) begin
                      if (in[2]) begin
                        if (in[5]) begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1f9f;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h1f87;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1fcf;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          out_r = 13'h1fe6;
                        end else begin
                          out_r = 13'h1cfe;
                        end
                      end
                    end else begin
                      if (in[2]) begin
                        if (in[4]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h17f7;
                            end else begin
                              out_r = 13'h1677;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1737;
                            end else begin
                              out_r = 13'h16f7;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h1797;
                            end else begin
                              out_r = 13'h1617;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1777;
                            end else begin
                              out_r = 13'h16b7;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h1e19;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1e1b;
                            end else begin
                              out_r = 13'h061b;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1219;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h121b;
                            end else begin
                              out_r = 13'h0e1b;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[1]) begin
                      if (in[2]) begin
                        if (in[6]) begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h1e7f;
                            end else begin
                              out_r = 13'h1e4f;
                            end
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1e67;
                            end else begin
                              out_r = 13'h1e7f;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h1eff;
                            end else begin
                              out_r = 13'h1ebf;
                            end
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1ee7;
                            end else begin
                              out_r = 13'h1e9f;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          out_r = 13'h179e;
                        end else begin
                          out_r = 13'h1486;
                        end
                      end
                    end else begin
                      if (in[2]) begin
                        if (in[4]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h15f7;
                            end else begin
                              out_r = 13'h14f7;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1537;
                            end else begin
                              out_r = 13'h1477;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h1597;
                            end else begin
                              out_r = 13'h1497;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1577;
                            end else begin
                              out_r = 13'h1437;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h1e7f;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1e7c;
                            end else begin
                              out_r = 13'h067c;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h027e;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h127d;
                            end else begin
                              out_r = 13'h067d;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[2]) begin
                  if (in[1]) begin
                    if (in[8]) begin
                      if (in[7]) begin
                        if (in[5]) begin
                          if (in[4]) begin
                            out_r = 13'h1fe1;
                          end else begin
                            out_r = 13'h1e61;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1ce1;
                          end else begin
                            out_r = 13'h1fe1;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[5]) begin
                            out_r = 13'h13e1;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h10e1;
                            end else begin
                              out_r = 13'h11e1;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h17e1;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h17e1;
                            end else begin
                              out_r = 13'h1661;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[4]) begin
                            out_r = 13'h07e1;
                          end else begin
                            out_r = 13'h0661;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h07e1;
                          end else begin
                            out_r = 13'h01e1;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[4]) begin
                            out_r = 13'h07e1;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h07e1;
                            end else begin
                              out_r = 13'h0661;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h04e1;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h03e1;
                            end else begin
                              out_r = 13'h02e1;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1f79;
                            end else begin
                              out_r = 13'h1f99;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f99;
                            end else begin
                              out_r = 13'h1f79;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1f39;
                            end else begin
                              out_r = 13'h1ff9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19f9;
                            end else begin
                              out_r = 13'h1939;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h0779;
                            end else begin
                              out_r = 13'h0799;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0799;
                            end else begin
                              out_r = 13'h0779;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h0739;
                            end else begin
                              out_r = 13'h07f9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h01f9;
                            end else begin
                              out_r = 13'h0139;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1361;
                            end else begin
                              out_r = 13'h1f81;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1321;
                            end else begin
                              out_r = 13'h1fe1;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0f61;
                            end else begin
                              out_r = 13'h0781;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f21;
                            end else begin
                              out_r = 13'h07e1;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1381;
                            end else begin
                              out_r = 13'h1f61;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h17e1;
                            end else begin
                              out_r = 13'h1921;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0f81;
                            end else begin
                              out_r = 13'h0761;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0be1;
                            end else begin
                              out_r = 13'h0121;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[8]) begin
                    if (in[5]) begin
                      if (in[1]) begin
                        if (in[6]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h00f8;
                            end else begin
                              out_r = 13'h0038;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h00e0;
                            end else begin
                              out_r = 13'h00f8;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h03f8;
                            end else begin
                              out_r = 13'h0338;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h03e0;
                            end else begin
                              out_r = 13'h03f8;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          out_r = 13'h03e0;
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h03e6;
                          end else begin
                            out_r = 13'h00e6;
                          end
                        end
                      end
                    end else begin
                      if (in[1]) begin
                        if (in[6]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h00fe;
                            end else begin
                              out_r = 13'h003e;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h00e6;
                            end else begin
                              out_r = 13'h00fe;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h03fe;
                            end else begin
                              out_r = 13'h033e;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h03e6;
                            end else begin
                              out_r = 13'h03fe;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1321;
                            end else begin
                              out_r = 13'h1327;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h12e1;
                            end else begin
                              out_r = 13'h1167;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h13e1;
                            end else begin
                              out_r = 13'h13e7;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1261;
                            end else begin
                              out_r = 13'h11e7;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[1]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h0cf8;
                            end else begin
                              out_r = 13'h0c38;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0ce0;
                            end else begin
                              out_r = 13'h0cf8;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h0ff8;
                            end else begin
                              out_r = 13'h0f38;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0fe0;
                            end else begin
                              out_r = 13'h0ff8;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h0dce;
                            end else begin
                              out_r = 13'h0d4e;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0dde;
                            end else begin
                              out_r = 13'h0dce;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h0e4e;
                            end else begin
                              out_r = 13'h0ece;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0e5e;
                            end else begin
                              out_r = 13'h0e4e;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[7]) begin
                          out_r = 13'h0fea;
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h09ee;
                          end else begin
                            out_r = 13'h0bee;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1f2b;
                            end else begin
                              out_r = 13'h192f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1eeb;
                            end else begin
                              out_r = 13'h1a6f;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1feb;
                            end else begin
                              out_r = 13'h19ef;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e6b;
                            end else begin
                              out_r = 13'h1aef;
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
            if (in[11]) begin
              if (in[9]) begin
                if (in[6]) begin
                  if (in[2]) begin
                    if (in[1]) begin
                      if (in[7]) begin
                        if (in[8]) begin
                          out_r = 13'h1dff;
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1e67;
                          end else begin
                            out_r = 13'h1e64;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[8]) begin
                            out_r = 13'h1cf3;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1fef;
                            end else begin
                              out_r = 13'h1fec;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0cf2;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h0fee;
                            end else begin
                              out_r = 13'h1fed;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[7]) begin
                            out_r = 13'h19ff;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h199f;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h17f3;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h17f3;
                            end else begin
                              out_r = 13'h1793;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[7]) begin
                            out_r = 13'h1ff9;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ff9;
                            end else begin
                              out_r = 13'h1f99;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h13f9;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13f9;
                            end else begin
                              out_r = 13'h1399;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[7]) begin
                        if (in[1]) begin
                          if (in[4]) begin
                            out_r = 13'h0ff8;
                          end else begin
                            out_r = 13'h0fe0;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1fe8;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h0fe0;
                            end else begin
                              out_r = 13'h09e0;
                            end
                          end
                        end
                      end else begin
                        if (in[1]) begin
                          out_r = 13'h1f39;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1fec;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h19e7;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[1]) begin
                        if (in[7]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h0ffe;
                            end else begin
                              out_r = 13'h0fce;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0fe6;
                            end else begin
                              out_r = 13'h0fde;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1f3f;
                          end else begin
                            out_r = 13'h1f0f;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h1f29;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1f21;
                            end else begin
                              out_r = 13'h1921;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1f2d;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h0f26;
                            end else begin
                              out_r = 13'h0926;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[1]) begin
                    if (in[2]) begin
                      if (in[7]) begin
                        if (in[8]) begin
                          out_r = 13'h1df9;
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1e61;
                          end else begin
                            out_r = 13'h1e63;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[8]) begin
                            out_r = 13'h1cf7;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1feb;
                            end else begin
                              out_r = 13'h1fe9;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0cf6;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h0fea;
                            end else begin
                              out_r = 13'h1fe8;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[4]) begin
                            out_r = 13'h1ff8;
                          end else begin
                            out_r = 13'h1fe0;
                          end
                        end else begin
                          out_r = 13'h0739;
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1ffe;
                            end else begin
                              out_r = 13'h1fce;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fe6;
                            end else begin
                              out_r = 13'h1fde;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h073f;
                          end else begin
                            out_r = 13'h070f;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[7]) begin
                            out_r = 13'h01e7;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h01df;
                            end else begin
                              out_r = 13'h01af;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h0bf3;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0bc3;
                            end else begin
                              out_r = 13'h0bb3;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[7]) begin
                            out_r = 13'h07e1;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h07d9;
                            end else begin
                              out_r = 13'h07a9;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h0ff9;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0fc9;
                            end else begin
                              out_r = 13'h0fb9;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h0e6a;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1e62;
                            end else begin
                              out_r = 13'h1862;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1e6f;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1e64;
                            end else begin
                              out_r = 13'h1864;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h1eeb;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1ee3;
                            end else begin
                              out_r = 13'h18e3;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0eee;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1ee5;
                            end else begin
                              out_r = 13'h18e5;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[1]) begin
                  if (in[7]) begin
                    if (in[2]) begin
                      if (in[6]) begin
                        if (in[4]) begin
                          out_r = 13'h1e67;
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h0667;
                          end else begin
                            out_r = 13'h1e67;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[4]) begin
                            out_r = 13'h1ee7;
                          end else begin
                            out_r = 13'h06e7;
                          end
                        end else begin
                          out_r = 13'h0ee6;
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h127c;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h124c;
                            end else begin
                              out_r = 13'h127c;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h0e64;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0e5c;
                            end else begin
                              out_r = 13'h0e64;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h1e7f;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e43;
                            end else begin
                              out_r = 13'h1e73;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h0667;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0657;
                            end else begin
                              out_r = 13'h066f;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h1fe1;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h07e1;
                            end else begin
                              out_r = 13'h1fe1;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1fe7;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h07e7;
                            end else begin
                              out_r = 13'h1fe7;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1f23;
                            end else begin
                              out_r = 13'h1f24;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0723;
                            end else begin
                              out_r = 13'h0724;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1f22;
                          end else begin
                            out_r = 13'h1f25;
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h121f;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h123f;
                            end else begin
                              out_r = 13'h121f;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h0e1f;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0e3f;
                            end else begin
                              out_r = 13'h0e1f;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h1e1c;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e30;
                            end else begin
                              out_r = 13'h1e10;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h061c;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0630;
                            end else begin
                              out_r = 13'h0610;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[5]) begin
                            out_r = 13'h1bff;
                          end else begin
                            out_r = 13'h1bf9;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1bcf;
                          end else begin
                            out_r = 13'h1bff;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1b87;
                            end else begin
                              out_r = 13'h1baf;
                            end
                          end else begin
                            out_r = 13'h1b87;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1b99;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1bbf;
                            end else begin
                              out_r = 13'h1b9f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[5]) begin
                              out_r = 13'h15fc;
                            end else begin
                              out_r = 13'h15fb;
                            end
                          end else begin
                            out_r = 13'h15cc;
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1587;
                            end else begin
                              out_r = 13'h15af;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1599;
                            end else begin
                              out_r = 13'h15bf;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[5]) begin
                            out_r = 13'h15f0;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h15f5;
                            end else begin
                              out_r = 13'h15f0;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h158f;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1597;
                            end else begin
                              out_r = 13'h1593;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ffa;
                            end else begin
                              out_r = 13'h1cf1;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0e7e;
                            end else begin
                              out_r = 13'h0df6;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f39;
                            end else begin
                              out_r = 13'h1c33;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1efc;
                            end else begin
                              out_r = 13'h1d75;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ffb;
                            end else begin
                              out_r = 13'h1cf0;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e7f;
                            end else begin
                              out_r = 13'h1df7;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0f38;
                            end else begin
                              out_r = 13'h0c32;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1efd;
                            end else begin
                              out_r = 13'h1d74;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1fca;
                            end else begin
                              out_r = 13'h1cc1;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0e4e;
                            end else begin
                              out_r = 13'h0dc6;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f09;
                            end else begin
                              out_r = 13'h1c03;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ecc;
                            end else begin
                              out_r = 13'h1d45;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1fcb;
                            end else begin
                              out_r = 13'h1cc0;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e4f;
                            end else begin
                              out_r = 13'h1dc7;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0f08;
                            end else begin
                              out_r = 13'h0c02;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ecd;
                            end else begin
                              out_r = 13'h1d44;
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
                if (in[9]) begin
                  if (in[2]) begin
                    if (in[7]) begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h13ff;
                          end else begin
                            out_r = 13'h139f;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h13cf;
                          end else begin
                            out_r = 13'h13ff;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h13e7;
                          end else begin
                            out_r = 13'h1387;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h13e7;
                          end else begin
                            out_r = 13'h13df;
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h133f;
                            end else begin
                              out_r = 13'h130f;
                            end
                          end else begin
                            out_r = 13'h133f;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h12ff;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h12ff;
                            end else begin
                              out_r = 13'h12cf;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[8]) begin
                            out_r = 13'h139f;
                          end else begin
                            out_r = 13'h121f;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h13cf;
                            end else begin
                              out_r = 13'h127f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13ff;
                            end else begin
                              out_r = 13'h124f;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h117f;
                            end else begin
                              out_r = 13'h1167;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1173;
                            end else begin
                              out_r = 13'h116f;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1179;
                            end else begin
                              out_r = 13'h1161;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1177;
                            end else begin
                              out_r = 13'h116b;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h117c;
                            end else begin
                              out_r = 13'h1164;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1170;
                            end else begin
                              out_r = 13'h116c;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h117b;
                            end else begin
                              out_r = 13'h1163;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1175;
                            end else begin
                              out_r = 13'h1169;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h017e;
                            end else begin
                              out_r = 13'h0166;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0172;
                            end else begin
                              out_r = 13'h016e;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0178;
                            end else begin
                              out_r = 13'h0160;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0176;
                            end else begin
                              out_r = 13'h016a;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h117d;
                            end else begin
                              out_r = 13'h1165;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1171;
                            end else begin
                              out_r = 13'h116d;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h117a;
                            end else begin
                              out_r = 13'h1162;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1174;
                            end else begin
                              out_r = 13'h1168;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[7]) begin
                      if (in[4]) begin
                        if (in[6]) begin
                          if (in[5]) begin
                            out_r = 13'h187f;
                          end else begin
                            out_r = 13'h1867;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h184f;
                          end else begin
                            out_r = 13'h18cf;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h1873;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1873;
                            end else begin
                              out_r = 13'h18f3;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1867;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h187f;
                            end else begin
                              out_r = 13'h18ff;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[4]) begin
                          if (in[8]) begin
                            out_r = 13'h199f;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h193f;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1993;
                            end else begin
                              out_r = 13'h19f3;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19b3;
                            end else begin
                              out_r = 13'h1903;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h19e7;
                          end else begin
                            out_r = 13'h1987;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h197f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19cf;
                            end else begin
                              out_r = 13'h195f;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[8]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          out_r = 13'h19e7;
                        end else begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h19f9;
                            end else begin
                              out_r = 13'h19ff;
                            end
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h19f9;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[7]) begin
                            out_r = 13'h19fc;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h19e3;
                            end else begin
                              out_r = 13'h19e4;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h19ff;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h19e7;
                            end else begin
                              out_r = 13'h19e1;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h198f;
                            end else begin
                              out_r = 13'h1997;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h199c;
                            end else begin
                              out_r = 13'h1983;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1987;
                            end else begin
                              out_r = 13'h199f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1990;
                            end else begin
                              out_r = 13'h198c;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h198f;
                            end else begin
                              out_r = 13'h1993;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h199f;
                            end else begin
                              out_r = 13'h1987;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1987;
                            end else begin
                              out_r = 13'h1999;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1993;
                            end else begin
                              out_r = 13'h198b;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[2]) begin
                  if (in[4]) begin
                    if (in[9]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h1ff5;
                          end else begin
                            out_r = 13'h19f5;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1ffb;
                          end else begin
                            out_r = 13'h19fb;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h1f30;
                          end else begin
                            out_r = 13'h19f0;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1f3c;
                          end else begin
                            out_r = 13'h19fc;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          out_r = 13'h01fb;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h01fb;
                          end else begin
                            out_r = 13'h013b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h019b;
                            end else begin
                              out_r = 13'h01fb;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h01fb;
                            end else begin
                              out_r = 13'h019b;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h019b;
                            end else begin
                              out_r = 13'h013b;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h01fb;
                            end else begin
                              out_r = 13'h017b;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[9]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f99;
                            end else begin
                              out_r = 13'h1999;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ff9;
                            end else begin
                              out_r = 13'h19f9;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f97;
                            end else begin
                              out_r = 13'h1997;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ff7;
                            end else begin
                              out_r = 13'h19f7;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f7f;
                            end else begin
                              out_r = 13'h199f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h19ff;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f73;
                            end else begin
                              out_r = 13'h1993;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f33;
                            end else begin
                              out_r = 13'h19f3;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h01cc;
                          end else begin
                            out_r = 13'h01fc;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h01fc;
                            end else begin
                              out_r = 13'h013c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h01cc;
                            end else begin
                              out_r = 13'h010c;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h01bc;
                            end else begin
                              out_r = 13'h01cc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h01fc;
                            end else begin
                              out_r = 13'h019c;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h019c;
                            end else begin
                              out_r = 13'h013c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h01cc;
                            end else begin
                              out_r = 13'h015c;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[4]) begin
                    if (in[5]) begin
                      if (in[9]) begin
                        if (in[7]) begin
                          if (in[6]) begin
                            out_r = 13'h0bfe;
                          end else begin
                            out_r = 13'h0be6;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0bce;
                          end else begin
                            out_r = 13'h0bfe;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[6]) begin
                            out_r = 13'h1bff;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1bf3;
                            end else begin
                              out_r = 13'h1bef;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1bbf;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1b9f;
                            end else begin
                              out_r = 13'h1b87;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1bf3;
                            end else begin
                              out_r = 13'h1bf9;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1bff;
                            end else begin
                              out_r = 13'h1bb9;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1bc3;
                            end else begin
                              out_r = 13'h1bff;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1bff;
                            end else begin
                              out_r = 13'h1b9f;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[7]) begin
                            if (in[9]) begin
                              out_r = 13'h1be7;
                            end else begin
                              out_r = 13'h1bf9;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1bcf;
                            end else begin
                              out_r = 13'h1be7;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[9]) begin
                              out_r = 13'h1bef;
                            end else begin
                              out_r = 13'h1bb7;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1bf3;
                            end else begin
                              out_r = 13'h1b8f;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[7]) begin
                      if (in[6]) begin
                        if (in[9]) begin
                          if (in[5]) begin
                            out_r = 13'h1bf8;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h03f3;
                            end else begin
                              out_r = 13'h03ff;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h03fc;
                          end else begin
                            out_r = 13'h03bc;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[9]) begin
                            out_r = 13'h1be0;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h03f3;
                            end else begin
                              out_r = 13'h03bf;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h03e7;
                            end else begin
                              out_r = 13'h03ff;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h03ef;
                            end else begin
                              out_r = 13'h03b3;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[9]) begin
                            out_r = 13'h1bce;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h03fc;
                            end else begin
                              out_r = 13'h03ef;
                            end
                          end
                        end else begin
                          if (in[9]) begin
                            out_r = 13'h1bfe;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h039c;
                            end else begin
                              out_r = 13'h0387;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h03c7;
                            end else begin
                              out_r = 13'h03fb;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h03f9;
                            end else begin
                              out_r = 13'h039b;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h03c9;
                            end else begin
                              out_r = 13'h03e1;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h03f7;
                            end else begin
                              out_r = 13'h038b;
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
        if (in[12]) begin
          if (in[11]) begin
            if (in[2]) begin
              if (in[0]) begin
                if (in[9]) begin
                  if (in[1]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[7]) begin
                            out_r = 13'h1fff;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1ff9;
                            end else begin
                              out_r = 13'h1ffb;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h1ff0;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h0ffe;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0ff8;
                            end else begin
                              out_r = 13'h0ffe;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1fff;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ffb;
                            end else begin
                              out_r = 13'h1ffc;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[6]) begin
                            out_r = 13'h13ff;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h13ff;
                            end else begin
                              out_r = 13'h13fc;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h13f3;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h13f7;
                            end else begin
                              out_r = 13'h13f5;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h17fe;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h17fe;
                            end else begin
                              out_r = 13'h17f8;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h0fff;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0ffc;
                            end else begin
                              out_r = 13'h0ffb;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h0ffe;
                            end else begin
                              out_r = 13'h0ff8;
                            end
                          end else begin
                            out_r = 13'h0ffe;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h1fc9;
                            end
                          end else begin
                            out_r = 13'h1fcf;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h0fe6;
                            end else begin
                              out_r = 13'h0fe0;
                            end
                          end else begin
                            out_r = 13'h0fe6;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h1fe1;
                            end
                          end else begin
                            out_r = 13'h1fe7;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[8]) begin
                          out_r = 13'h03f2;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h13c3;
                          end else begin
                            out_r = 13'h13f3;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[8]) begin
                            out_r = 13'h03f8;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h13c9;
                            end else begin
                              out_r = 13'h13f9;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h03fe;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h13cf;
                            end else begin
                              out_r = 13'h13ff;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[1]) begin
                    if (in[5]) begin
                      if (in[6]) begin
                        if (in[4]) begin
                          if (in[8]) begin
                            out_r = 13'h1fcf;
                          end else begin
                            out_r = 13'h1fdf;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0fce;
                            end else begin
                              out_r = 13'h0fde;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0fc2;
                            end else begin
                              out_r = 13'h0fd6;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h1fff;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1ff3;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1fe1;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fe1;
                            end else begin
                              out_r = 13'h1feb;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[4]) begin
                          if (in[7]) begin
                            out_r = 13'h07cc;
                          end else begin
                            out_r = 13'h07cf;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h0fcd;
                          end else begin
                            out_r = 13'h1fc2;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h07fc;
                          end else begin
                            out_r = 13'h07fb;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h07ff;
                            end else begin
                              out_r = 13'h07f9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h07f3;
                            end else begin
                              out_r = 13'h07f7;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[7]) begin
                      if (in[8]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h1f3f;
                          end else begin
                            out_r = 13'h1f27;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1f33;
                          end else begin
                            out_r = 13'h1f3f;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h1fff;
                          end else begin
                            out_r = 13'h1fe7;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            out_r = 13'h1fff;
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h070f;
                            end else begin
                              out_r = 13'h0703;
                            end
                          end else begin
                            out_r = 13'h070f;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h07bf;
                            end else begin
                              out_r = 13'h07b3;
                            end
                          end else begin
                            out_r = 13'h07bf;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[8]) begin
                            out_r = 13'h0727;
                          end else begin
                            out_r = 13'h0787;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h0733;
                            end else begin
                              out_r = 13'h0793;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h073f;
                            end else begin
                              out_r = 13'h079f;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[1]) begin
                  if (in[5]) begin
                    if (in[7]) begin
                      if (in[9]) begin
                        if (in[4]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1fe7;
                            end
                          end else begin
                            out_r = 13'h07f9;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0ffe;
                            end else begin
                              out_r = 13'h0fe6;
                            end
                          end else begin
                            out_r = 13'h1ffe;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[8]) begin
                            if (in[6]) begin
                              out_r = 13'h13e7;
                            end else begin
                              out_r = 13'h13e4;
                            end
                          end else begin
                            out_r = 13'h13ef;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h13e7;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0fe4;
                            end else begin
                              out_r = 13'h0fe7;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[9]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            out_r = 13'h1fef;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h07f7;
                          end else begin
                            out_r = 13'h07f3;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[8]) begin
                            if (in[6]) begin
                              out_r = 13'h13e1;
                            end else begin
                              out_r = 13'h13e3;
                            end
                          end else begin
                            out_r = 13'h13eb;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h13e1;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0fe3;
                            end else begin
                              out_r = 13'h0fe1;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[9]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h1fff;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0ffe;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1fe4;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fe5;
                            end else begin
                              out_r = 13'h1fe4;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h0ffe;
                            end else begin
                              out_r = 13'h0ff2;
                            end
                          end else begin
                            out_r = 13'h0ffe;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1ff9;
                            end else begin
                              out_r = 13'h1ff7;
                            end
                          end else begin
                            out_r = 13'h1ff9;
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[8]) begin
                          if (in[9]) begin
                            out_r = 13'h07f9;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1ffd;
                            end else begin
                              out_r = 13'h1ffb;
                            end
                          end
                        end else begin
                          if (in[9]) begin
                            out_r = 13'h07fb;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0ff2;
                            end else begin
                              out_r = 13'h1ff7;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1ffe;
                            end else begin
                              out_r = 13'h0ffd;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h0ffd;
                            end else begin
                              out_r = 13'h1ffe;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h07ff;
                            end else begin
                              out_r = 13'h07fb;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h07fc;
                            end else begin
                              out_r = 13'h07f9;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[6]) begin
                    if (in[7]) begin
                      if (in[9]) begin
                        if (in[8]) begin
                          out_r = 13'h1fff;
                        end else begin
                          out_r = 13'h07ff;
                        end
                      end else begin
                        if (in[4]) begin
                          out_r = 13'h079e;
                        end else begin
                          out_r = 13'h179d;
                        end
                      end
                    end else begin
                      if (in[9]) begin
                        if (in[8]) begin
                          out_r = 13'h13cf;
                        end else begin
                          out_r = 13'h0fcf;
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h09fe;
                          end else begin
                            out_r = 13'h09e6;
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h19fd;
                          end else begin
                            out_r = 13'h19e5;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[7]) begin
                      if (in[8]) begin
                        if (in[9]) begin
                          out_r = 13'h1fe7;
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h0392;
                          end else begin
                            out_r = 13'h139d;
                          end
                        end
                      end else begin
                        if (in[9]) begin
                          out_r = 13'h07e7;
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h03b2;
                          end else begin
                            out_r = 13'h13bd;
                          end
                        end
                      end
                    end else begin
                      if (in[8]) begin
                        if (in[9]) begin
                          out_r = 13'h13df;
                        end else begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h0ff2;
                            end else begin
                              out_r = 13'h0fee;
                            end
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1ffd;
                            end else begin
                              out_r = 13'h1fe5;
                            end
                          end
                        end
                      end else begin
                        if (in[9]) begin
                          out_r = 13'h0fdf;
                        end else begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h0fc2;
                            end else begin
                              out_r = 13'h0fd6;
                            end
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1fcd;
                            end else begin
                              out_r = 13'h1fdd;
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
                if (in[5]) begin
                  if (in[0]) begin
                    if (in[4]) begin
                      if (in[9]) begin
                        if (in[8]) begin
                          if (in[6]) begin
                            out_r = 13'h1ff9;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1ff9;
                            end else begin
                              out_r = 13'h1fc9;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1f39;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1f79;
                            end else begin
                              out_r = 13'h1f59;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h1cf3;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1c33;
                            end else begin
                              out_r = 13'h1cf3;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f73;
                            end else begin
                              out_r = 13'h1f93;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[9]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h1f93;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fc3;
                            end else begin
                              out_r = 13'h1fb3;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h1ce7;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ce7;
                            end else begin
                              out_r = 13'h1c27;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1fe7;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f87;
                            end else begin
                              out_r = 13'h1f67;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[9]) begin
                      if (in[4]) begin
                        if (in[7]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h1e73;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f93;
                            end else begin
                              out_r = 13'h1ff3;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1f33;
                            end else begin
                              out_r = 13'h1ef3;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f73;
                            end else begin
                              out_r = 13'h1f33;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ff7;
                            end else begin
                              out_r = 13'h1e77;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f37;
                            end else begin
                              out_r = 13'h1ef7;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1feb;
                            end else begin
                              out_r = 13'h1f8b;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f2b;
                            end else begin
                              out_r = 13'h1f6b;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[4]) begin
                          out_r = 13'h1ff9;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1ff9;
                          end else begin
                            out_r = 13'h1f99;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          out_r = 13'h1e49;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1e49;
                          end else begin
                            out_r = 13'h1e39;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[8]) begin
                    if (in[9]) begin
                      if (in[7]) begin
                        if (in[0]) begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h1fe1;
                            end else begin
                              out_r = 13'h1ff9;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1f9f;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1ff9;
                            end else begin
                              out_r = 13'h1fe1;
                            end
                          end
                        end
                      end else begin
                        if (in[0]) begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h1fe1;
                            end else begin
                              out_r = 13'h1fc9;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h1fcf;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h1fbf;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1fc9;
                            end else begin
                              out_r = 13'h1fd9;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[0]) begin
                        if (in[4]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1cf3;
                            end else begin
                              out_r = 13'h1c33;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fc3;
                            end else begin
                              out_r = 13'h1f53;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1cff;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h1fbf;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[4]) begin
                            out_r = 13'h1fe1;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fe1;
                            end else begin
                              out_r = 13'h1f81;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1e59;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e59;
                            end else begin
                              out_r = 13'h1e29;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[0]) begin
                        if (in[4]) begin
                          if (in[9]) begin
                            if (in[7]) begin
                              out_r = 13'h1f21;
                            end else begin
                              out_r = 13'h1f61;
                            end
                          end else begin
                            out_r = 13'h1df3;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[9]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h1dff;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1f87;
                            end else begin
                              out_r = 13'h1d7f;
                            end
                          end
                        end
                      end else begin
                        if (in[9]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1e7f;
                            end else begin
                              out_r = 13'h1e4f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e79;
                            end else begin
                              out_r = 13'h1e49;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1f21;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1f21;
                            end else begin
                              out_r = 13'h1f61;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[9]) begin
                        if (in[7]) begin
                          if (in[0]) begin
                            if (in[4]) begin
                              out_r = 13'h1f39;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1f81;
                            end
                          end
                        end else begin
                          if (in[0]) begin
                            if (in[4]) begin
                              out_r = 13'h1f59;
                            end else begin
                              out_r = 13'h1fbf;
                            end
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h1fa9;
                            end
                          end
                        end
                      end else begin
                        if (in[0]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1e43;
                            end else begin
                              out_r = 13'h1e33;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e4f;
                            end else begin
                              out_r = 13'h1e9f;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1ed9;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1ed9;
                            end else begin
                              out_r = 13'h1e89;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[0]) begin
                  if (in[4]) begin
                    if (in[5]) begin
                      if (in[6]) begin
                        if (in[9]) begin
                          out_r = 13'h1fff;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h13cf;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h10cf;
                            end else begin
                              out_r = 13'h13cf;
                            end
                          end
                        end
                      end else begin
                        if (in[9]) begin
                          out_r = 13'h1fe7;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h13ff;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h11ff;
                            end else begin
                              out_r = 13'h127f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[9]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h131f;
                            end else begin
                              out_r = 13'h101f;
                            end
                          end
                        end else begin
                          if (in[9]) begin
                            out_r = 13'h1f93;
                          end else begin
                            out_r = 13'h13df;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[9]) begin
                            out_r = 13'h1fef;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h13e7;
                            end else begin
                              out_r = 13'h11e7;
                            end
                          end
                        end else begin
                          if (in[9]) begin
                            out_r = 13'h1f8f;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1327;
                            end else begin
                              out_r = 13'h12e7;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[9]) begin
                            out_r = 13'h1ff9;
                          end else begin
                            out_r = 13'h1393;
                          end
                        end else begin
                          if (in[9]) begin
                            out_r = 13'h1fc9;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h10f3;
                            end else begin
                              out_r = 13'h13f3;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[9]) begin
                            out_r = 13'h1fe1;
                          end else begin
                            out_r = 13'h13b3;
                          end
                        end else begin
                          if (in[9]) begin
                            out_r = 13'h1fd9;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h11c3;
                            end else begin
                              out_r = 13'h1243;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1ff7;
                            end else begin
                              out_r = 13'h132f;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1f97;
                            end else begin
                              out_r = 13'h13ef;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1fc7;
                            end else begin
                              out_r = 13'h106f;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1fb7;
                            end else begin
                              out_r = 13'h138f;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1feb;
                            end else begin
                              out_r = 13'h13d7;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1f8b;
                            end else begin
                              out_r = 13'h1317;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1fd3;
                            end else begin
                              out_r = 13'h11a7;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1fa3;
                            end else begin
                              out_r = 13'h1287;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[4]) begin
                    if (in[5]) begin
                      if (in[9]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1fdd;
                            end else begin
                              out_r = 13'h19dd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ce5;
                            end else begin
                              out_r = 13'h1be5;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1e4d;
                            end else begin
                              out_r = 13'h19cd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1dfd;
                            end else begin
                              out_r = 13'h1bfd;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h19e2;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19e2;
                            end else begin
                              out_r = 13'h1862;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1922;
                            end else begin
                              out_r = 13'h19e2;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19e2;
                            end else begin
                              out_r = 13'h18e2;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[9]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f2d;
                            end else begin
                              out_r = 13'h192d;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1cd5;
                            end else begin
                              out_r = 13'h1bd5;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ef1;
                            end else begin
                              out_r = 13'h1931;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1dc1;
                            end else begin
                              out_r = 13'h1bc1;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h199a;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19fa;
                            end else begin
                              out_r = 13'h187a;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h193a;
                            end else begin
                              out_r = 13'h19fa;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h199a;
                            end else begin
                              out_r = 13'h18ba;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[6]) begin
                        if (in[9]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1fba;
                            end else begin
                              out_r = 13'h19ca;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1c9a;
                            end else begin
                              out_r = 13'h1bfa;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h19c4;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19c4;
                            end else begin
                              out_r = 13'h1844;
                            end
                          end
                        end
                      end else begin
                        if (in[9]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1e5a;
                            end else begin
                              out_r = 13'h19aa;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1de2;
                            end else begin
                              out_r = 13'h1b82;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1934;
                            end else begin
                              out_r = 13'h19f4;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19f4;
                            end else begin
                              out_r = 13'h18f4;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[9]) begin
                            if (in[8]) begin
                              out_r = 13'h1f74;
                            end else begin
                              out_r = 13'h1934;
                            end
                          end else begin
                            out_r = 13'h1988;
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1cb4;
                            end else begin
                              out_r = 13'h19e8;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1bc4;
                            end else begin
                              out_r = 13'h1868;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1ee8;
                            end else begin
                              out_r = 13'h1910;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1968;
                            end else begin
                              out_r = 13'h19d0;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1dd0;
                            end else begin
                              out_r = 13'h19a0;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1ba0;
                            end else begin
                              out_r = 13'h1880;
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
                if (in[0]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ff9;
                            end else begin
                              out_r = 13'h193f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f99;
                            end else begin
                              out_r = 13'h197f;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1fc9;
                            end else begin
                              out_r = 13'h190f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fb9;
                            end else begin
                              out_r = 13'h195f;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1fe1;
                            end else begin
                              out_r = 13'h19e7;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f81;
                            end else begin
                              out_r = 13'h1987;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1fd9;
                            end else begin
                              out_r = 13'h19df;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fa9;
                            end else begin
                              out_r = 13'h19af;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h1ff7;
                          end else begin
                            out_r = 13'h1933;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1fc7;
                          end else begin
                            out_r = 13'h1903;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h1feb;
                          end else begin
                            out_r = 13'h19ef;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1fd3;
                          end else begin
                            out_r = 13'h19d7;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[7]) begin
                        if (in[8]) begin
                          out_r = 13'h17ff;
                        end else begin
                          out_r = 13'h1ff3;
                        end
                      end else begin
                        if (in[8]) begin
                          out_r = 13'h13f9;
                        end else begin
                          out_r = 13'h19f7;
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[8]) begin
                          out_r = 13'h0b9f;
                        end else begin
                          out_r = 13'h0793;
                        end
                      end else begin
                        if (in[8]) begin
                          out_r = 13'h0f99;
                        end else begin
                          out_r = 13'h0197;
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[5]) begin
                      if (in[7]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h13f3;
                          end else begin
                            out_r = 13'h1273;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h13f3;
                          end else begin
                            out_r = 13'h1393;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h0332;
                          end else begin
                            out_r = 13'h02f2;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h0332;
                          end else begin
                            out_r = 13'h0372;
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            out_r = 13'h1e73;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            out_r = 13'h1f93;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h0ff2;
                          end else begin
                            out_r = 13'h0e72;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h0ff2;
                          end else begin
                            out_r = 13'h0f92;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0c3f;
                            end else begin
                              out_r = 13'h0c27;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0c33;
                            end else begin
                              out_r = 13'h0c2f;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0c39;
                            end else begin
                              out_r = 13'h0c21;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0c37;
                            end else begin
                              out_r = 13'h0c2b;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0c3c;
                            end else begin
                              out_r = 13'h0c24;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0c30;
                            end else begin
                              out_r = 13'h0c2c;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0c3b;
                            end else begin
                              out_r = 13'h0c23;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0c35;
                            end else begin
                              out_r = 13'h0c29;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h143e;
                            end else begin
                              out_r = 13'h1426;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1432;
                            end else begin
                              out_r = 13'h142e;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1438;
                            end else begin
                              out_r = 13'h1420;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1436;
                            end else begin
                              out_r = 13'h142a;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h043d;
                            end else begin
                              out_r = 13'h0425;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0431;
                            end else begin
                              out_r = 13'h042d;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h043a;
                            end else begin
                              out_r = 13'h0422;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0434;
                            end else begin
                              out_r = 13'h0428;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[0]) begin
                  if (in[2]) begin
                    if (in[7]) begin
                      if (in[8]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h07e1;
                          end else begin
                            out_r = 13'h0721;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h07e1;
                          end else begin
                            out_r = 13'h0781;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h1ce0;
                            end else begin
                              out_r = 13'h1c20;
                            end
                          end else begin
                            out_r = 13'h1ce0;
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h1fe0;
                            end else begin
                              out_r = 13'h1f20;
                            end
                          end else begin
                            out_r = 13'h1f80;
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h1fe1;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1fe1;
                            end else begin
                              out_r = 13'h1f81;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h0fe0;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h0ce0;
                            end else begin
                              out_r = 13'h0c80;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[8]) begin
                            out_r = 13'h1ee1;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h0ee0;
                            end else begin
                              out_r = 13'h0d60;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1e61;
                            end else begin
                              out_r = 13'h0e60;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e01;
                            end else begin
                              out_r = 13'h0d80;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          out_r = 13'h127f;
                        end else begin
                          out_r = 13'h13e7;
                        end
                      end else begin
                        if (in[7]) begin
                          out_r = 13'h13f3;
                        end else begin
                          out_r = 13'h126f;
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h127c;
                          end else begin
                            out_r = 13'h124c;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h13e4;
                          end else begin
                            out_r = 13'h13dc;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h13f0;
                          end else begin
                            out_r = 13'h13c0;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h126c;
                          end else begin
                            out_r = 13'h1254;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[5]) begin
                      if (in[4]) begin
                        if (in[6]) begin
                          out_r = 13'h1fcb;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1fcb;
                          end else begin
                            out_r = 13'h19cb;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          out_r = 13'h1fcb;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1e4b;
                          end else begin
                            out_r = 13'h184b;
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h1f0b;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f0b;
                            end else begin
                              out_r = 13'h190b;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1f0b;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ecb;
                            end else begin
                              out_r = 13'h18cb;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h1c0b;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1c0b;
                            end else begin
                              out_r = 13'h1b0b;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1c0b;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1d4b;
                            end else begin
                              out_r = 13'h1a4b;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1cfe;
                            end else begin
                              out_r = 13'h1c9e;
                            end
                          end else begin
                            out_r = 13'h1cfe;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1ffe;
                            end else begin
                              out_r = 13'h1f9e;
                            end
                          end else begin
                            out_r = 13'h1ffe;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1cf2;
                            end else begin
                              out_r = 13'h1c92;
                            end
                          end else begin
                            out_r = 13'h1cf2;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1fc2;
                            end else begin
                              out_r = 13'h1fb2;
                            end
                          end else begin
                            out_r = 13'h1fc2;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h1cf8;
                          end else begin
                            out_r = 13'h1ff8;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ce0;
                            end else begin
                              out_r = 13'h1c80;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fe0;
                            end else begin
                              out_r = 13'h1f80;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h1cf6;
                          end else begin
                            out_r = 13'h1fc6;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1cea;
                            end else begin
                              out_r = 13'h1c8a;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fd2;
                            end else begin
                              out_r = 13'h1fa2;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[0]) begin
                if (in[1]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h10ff;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1dff;
                            end else begin
                              out_r = 13'h1cff;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h103f;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1d7f;
                            end else begin
                              out_r = 13'h1c3f;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h13ff;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1e7f;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h133f;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1eff;
                            end else begin
                              out_r = 13'h1f3f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[8]) begin
                          out_r = 13'h1ce7;
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h11e7;
                          end else begin
                            out_r = 13'h10e7;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          out_r = 13'h1fe7;
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1267;
                          end else begin
                            out_r = 13'h13e7;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0f0f;
                            end else begin
                              out_r = 13'h0f1f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f03;
                            end else begin
                              out_r = 13'h0f17;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0f09;
                            end else begin
                              out_r = 13'h0f19;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f07;
                            end else begin
                              out_r = 13'h0f13;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0f0c;
                            end else begin
                              out_r = 13'h0f1c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f00;
                            end else begin
                              out_r = 13'h0f14;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0f0b;
                            end else begin
                              out_r = 13'h0f1b;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f05;
                            end else begin
                              out_r = 13'h0f11;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h170e;
                            end else begin
                              out_r = 13'h171e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1702;
                            end else begin
                              out_r = 13'h1716;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1708;
                            end else begin
                              out_r = 13'h1718;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1706;
                            end else begin
                              out_r = 13'h1712;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h070d;
                            end else begin
                              out_r = 13'h071d;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0701;
                            end else begin
                              out_r = 13'h0715;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h070a;
                            end else begin
                              out_r = 13'h071a;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0704;
                            end else begin
                              out_r = 13'h0710;
                            end
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
                            if (in[8]) begin
                              out_r = 13'h13cd;
                            end else begin
                              out_r = 13'h19cc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h10cd;
                            end else begin
                              out_r = 13'h1ccc;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1fcd;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h17cc;
                            end else begin
                              out_r = 13'h13cc;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h130d;
                            end else begin
                              out_r = 13'h1f0c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h100d;
                            end else begin
                              out_r = 13'h1b0c;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1ecd;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h12cc;
                            end else begin
                              out_r = 13'h16cc;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[8]) begin
                          out_r = 13'h13bd;
                        end else begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h19bc;
                            end else begin
                              out_r = 13'h1fbc;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fbc;
                            end else begin
                              out_r = 13'h19bc;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1fbd;
                            end else begin
                              out_r = 13'h17bc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1cbd;
                            end else begin
                              out_r = 13'h10bc;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1e3d;
                            end else begin
                              out_r = 13'h123c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1dbd;
                            end else begin
                              out_r = 13'h14bc;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[6]) begin
                        if (in[8]) begin
                          out_r = 13'h1c3e;
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1f3e;
                          end else begin
                            out_r = 13'h1f7e;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          out_r = 13'h1fe6;
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1ce6;
                          end else begin
                            out_r = 13'h1c86;
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h1cfe;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1ffe;
                            end else begin
                              out_r = 13'h1f9e;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1cce;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1fce;
                            end else begin
                              out_r = 13'h1fbe;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h1f26;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1c26;
                            end else begin
                              out_r = 13'h1c66;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1f1e;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1c1e;
                            end else begin
                              out_r = 13'h1c4e;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[1]) begin
                  if (in[4]) begin
                    if (in[7]) begin
                      if (in[8]) begin
                        if (in[2]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h187f;
                            end else begin
                              out_r = 13'h004f;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h01cf;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h187f;
                            end else begin
                              out_r = 13'h19ff;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h187f;
                            end
                          end
                        end
                      end else begin
                        if (in[2]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h18ff;
                            end else begin
                              out_r = 13'h00cf;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h193f;
                            end else begin
                              out_r = 13'h010f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h127f;
                            end else begin
                              out_r = 13'h13ff;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h13ff;
                            end else begin
                              out_r = 13'h127f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[2]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1e1f;
                            end else begin
                              out_r = 13'h1ebf;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h063f;
                            end else begin
                              out_r = 13'h069f;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1f9f;
                            end else begin
                              out_r = 13'h1f7f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h07bf;
                            end else begin
                              out_r = 13'h075f;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h1e7f;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1e7f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h167f;
                            end else begin
                              out_r = 13'h17ff;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h17ff;
                            end else begin
                              out_r = 13'h167f;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h1e7f;
                          end else begin
                            out_r = 13'h181f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h064f;
                          end else begin
                            out_r = 13'h003f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h1fff;
                          end else begin
                            out_r = 13'h199f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h07cf;
                          end else begin
                            out_r = 13'h01bf;
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h181f;
                            end else begin
                              out_r = 13'h199f;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h199f;
                            end else begin
                              out_r = 13'h181f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h121f;
                            end else begin
                              out_r = 13'h139f;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h139f;
                            end else begin
                              out_r = 13'h121f;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h1e1f;
                            end else begin
                              out_r = 13'h1f9f;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1f9f;
                            end else begin
                              out_r = 13'h1e1f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h161f;
                            end else begin
                              out_r = 13'h179f;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h179f;
                            end else begin
                              out_r = 13'h161f;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[8]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          out_r = 13'h19e7;
                        end else begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h1e67;
                            end else begin
                              out_r = 13'h1fe7;
                            end
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h1e67;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[7]) begin
                            out_r = 13'h1fe7;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1867;
                            end else begin
                              out_r = 13'h19e7;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1f27;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1927;
                            end else begin
                              out_r = 13'h18e7;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h03e7;
                            end else begin
                              out_r = 13'h05e7;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h07e7;
                            end else begin
                              out_r = 13'h0067;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h01e7;
                            end else begin
                              out_r = 13'h07e7;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h04e7;
                            end else begin
                              out_r = 13'h03e7;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h03e7;
                            end else begin
                              out_r = 13'h04e7;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0727;
                            end else begin
                              out_r = 13'h0127;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h01e7;
                            end else begin
                              out_r = 13'h0667;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0427;
                            end else begin
                              out_r = 13'h0267;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h187f;
                            end else begin
                              out_r = 13'h17ff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e7f;
                            end else begin
                              out_r = 13'h13ff;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1813;
                            end else begin
                              out_r = 13'h1793;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e13;
                            end else begin
                              out_r = 13'h1393;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h164f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h124f;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1993;
                            end else begin
                              out_r = 13'h1633;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f93;
                            end else begin
                              out_r = 13'h1233;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h187c;
                            end else begin
                              out_r = 13'h17fc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e64;
                            end else begin
                              out_r = 13'h13e4;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1810;
                            end else begin
                              out_r = 13'h1790;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e0c;
                            end else begin
                              out_r = 13'h138c;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h19fc;
                            end else begin
                              out_r = 13'h164c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fe4;
                            end else begin
                              out_r = 13'h125c;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1990;
                            end else begin
                              out_r = 13'h1630;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f8c;
                            end else begin
                              out_r = 13'h1224;
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
          if (in[1]) begin
            if (in[0]) begin
              if (in[9]) begin
                if (in[11]) begin
                  if (in[4]) begin
                    if (in[2]) begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h07f3;
                            end else begin
                              out_r = 13'h1ff3;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h07f3;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h0673;
                            end else begin
                              out_r = 13'h1e73;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1e73;
                            end else begin
                              out_r = 13'h0673;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h0733;
                            end else begin
                              out_r = 13'h1f33;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1f33;
                            end else begin
                              out_r = 13'h0733;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h06f3;
                            end else begin
                              out_r = 13'h1ef3;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1ef3;
                            end else begin
                              out_r = 13'h06f3;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[7]) begin
                              out_r = 13'h1f33;
                            end else begin
                              out_r = 13'h1333;
                            end
                          end else begin
                            out_r = 13'h0733;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1933;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1333;
                            end else begin
                              out_r = 13'h1f33;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h1f33;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0733;
                            end else begin
                              out_r = 13'h0f33;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1b33;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1c33;
                            end else begin
                              out_r = 13'h1033;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h07ef;
                            end else begin
                              out_r = 13'h1fef;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1fef;
                            end else begin
                              out_r = 13'h07ef;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h066f;
                            end else begin
                              out_r = 13'h1e6f;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1e6f;
                            end else begin
                              out_r = 13'h066f;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h072f;
                            end else begin
                              out_r = 13'h1f2f;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1f2f;
                            end else begin
                              out_r = 13'h072f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h06ef;
                            end else begin
                              out_r = 13'h1eef;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1eef;
                            end else begin
                              out_r = 13'h06ef;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[7]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h13f3;
                            end
                          end else begin
                            out_r = 13'h07f3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h17f3;
                            end else begin
                              out_r = 13'h19f3;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h1e73;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0673;
                            end else begin
                              out_r = 13'h0e73;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1df3;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1af3;
                            end else begin
                              out_r = 13'h14f3;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[6]) begin
                    if (in[2]) begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1f37;
                            end else begin
                              out_r = 13'h1337;
                            end
                          end else begin
                            out_r = 13'h1f37;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h0733;
                            end else begin
                              out_r = 13'h0f33;
                            end
                          end else begin
                            out_r = 13'h0733;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1f33;
                            end else begin
                              out_r = 13'h1333;
                            end
                          end else begin
                            out_r = 13'h1f33;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1f37;
                            end else begin
                              out_r = 13'h1337;
                            end
                          end else begin
                            out_r = 13'h1f37;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h13f3;
                            end else begin
                              out_r = 13'h1333;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h13ef;
                            end else begin
                              out_r = 13'h13f3;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h1f33;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fef;
                            end else begin
                              out_r = 13'h1ff3;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h13f7;
                            end else begin
                              out_r = 13'h1337;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h13eb;
                            end else begin
                              out_r = 13'h13f7;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1e47;
                            end else begin
                              out_r = 13'h1ec7;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e53;
                            end else begin
                              out_r = 13'h1e47;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1f39;
                            end else begin
                              out_r = 13'h1339;
                            end
                          end else begin
                            out_r = 13'h1f39;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h073f;
                            end else begin
                              out_r = 13'h0f3f;
                            end
                          end else begin
                            out_r = 13'h073f;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h133f;
                            end
                          end else begin
                            out_r = 13'h1f3f;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1f39;
                            end else begin
                              out_r = 13'h1339;
                            end
                          end else begin
                            out_r = 13'h1f39;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h13ff;
                            end else begin
                              out_r = 13'h133f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h13e7;
                            end else begin
                              out_r = 13'h13ff;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1f3f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h13f9;
                            end else begin
                              out_r = 13'h1339;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h13e1;
                            end else begin
                              out_r = 13'h13f9;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1e49;
                            end else begin
                              out_r = 13'h1ec9;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e59;
                            end else begin
                              out_r = 13'h1e49;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[5]) begin
                  if (in[2]) begin
                    if (in[6]) begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[4]) begin
                              out_r = 13'h09e6;
                            end else begin
                              out_r = 13'h09de;
                            end
                          end else begin
                            out_r = 13'h1e67;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[4]) begin
                              out_r = 13'h0be6;
                            end else begin
                              out_r = 13'h0bde;
                            end
                          end else begin
                            out_r = 13'h0e66;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[4]) begin
                              out_r = 13'h0866;
                            end else begin
                              out_r = 13'h085e;
                            end
                          end else begin
                            out_r = 13'h0664;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[4]) begin
                              out_r = 13'h0ae6;
                            end else begin
                              out_r = 13'h0ade;
                            end
                          end else begin
                            out_r = 13'h0e65;
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[7]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h0926;
                            end else begin
                              out_r = 13'h0b26;
                            end
                          end else begin
                            out_r = 13'h127f;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h08e6;
                            end else begin
                              out_r = 13'h0a66;
                            end
                          end else begin
                            out_r = 13'h0e7c;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h091e;
                            end else begin
                              out_r = 13'h0b1e;
                            end
                          end else begin
                            out_r = 13'h1e7f;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h08de;
                            end else begin
                              out_r = 13'h0a5e;
                            end
                          end else begin
                            out_r = 13'h067c;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[7]) begin
                      if (in[11]) begin
                        if (in[4]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1ee4;
                            end else begin
                              out_r = 13'h1ee5;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h12e4;
                            end else begin
                              out_r = 13'h1ee4;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1e64;
                            end else begin
                              out_r = 13'h1e65;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1de4;
                            end else begin
                              out_r = 13'h11e4;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          out_r = 13'h1fef;
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h1cf3;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f33;
                            end else begin
                              out_r = 13'h1c33;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[11]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1ee7;
                            end else begin
                              out_r = 13'h0ee6;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h12e7;
                            end else begin
                              out_r = 13'h1ee7;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h186f;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1873;
                            end else begin
                              out_r = 13'h1af3;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h1e67;
                            end else begin
                              out_r = 13'h0e66;
                            end
                          end else begin
                            out_r = 13'h1857;
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1de7;
                            end else begin
                              out_r = 13'h18c3;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h11e7;
                            end else begin
                              out_r = 13'h1a43;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[2]) begin
                    if (in[6]) begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[4]) begin
                              out_r = 13'h0986;
                            end else begin
                              out_r = 13'h09ae;
                            end
                          end else begin
                            out_r = 13'h186f;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[4]) begin
                              out_r = 13'h0b86;
                            end else begin
                              out_r = 13'h0bae;
                            end
                          end else begin
                            out_r = 13'h086e;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[4]) begin
                              out_r = 13'h0806;
                            end else begin
                              out_r = 13'h082e;
                            end
                          end else begin
                            out_r = 13'h186c;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[4]) begin
                              out_r = 13'h0a86;
                            end else begin
                              out_r = 13'h0aae;
                            end
                          end else begin
                            out_r = 13'h186d;
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[7]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h0966;
                            end else begin
                              out_r = 13'h0b66;
                            end
                          end else begin
                            out_r = 13'h1673;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h08a6;
                            end else begin
                              out_r = 13'h0a26;
                            end
                          end else begin
                            out_r = 13'h1670;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h094e;
                            end else begin
                              out_r = 13'h0b4e;
                            end
                          end else begin
                            out_r = 13'h1873;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h088e;
                            end else begin
                              out_r = 13'h0a0e;
                            end
                          end else begin
                            out_r = 13'h1870;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[7]) begin
                      if (in[11]) begin
                        if (in[4]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1f24;
                            end else begin
                              out_r = 13'h1f25;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1324;
                            end else begin
                              out_r = 13'h1f24;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1fe4;
                            end else begin
                              out_r = 13'h1fe5;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ce4;
                            end else begin
                              out_r = 13'h10e4;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h1fe7;
                          end else begin
                            out_r = 13'h1f87;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1c9f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h1c7f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[11]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0127;
                            end else begin
                              out_r = 13'h1926;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0b27;
                            end else begin
                              out_r = 13'h0127;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h19e7;
                            end else begin
                              out_r = 13'h1987;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h1b9f;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h01e7;
                            end else begin
                              out_r = 13'h19df;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h19e6;
                            end else begin
                              out_r = 13'h19af;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h03e7;
                            end else begin
                              out_r = 13'h190f;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h09e7;
                            end else begin
                              out_r = 13'h1b5f;
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
                if (in[6]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[5]) begin
                              out_r = 13'h1fe5;
                            end else begin
                              out_r = 13'h1f85;
                            end
                          end else begin
                            out_r = 13'h1ff3;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[5]) begin
                              out_r = 13'h1ce5;
                            end else begin
                              out_r = 13'h1c85;
                            end
                          end else begin
                            out_r = 13'h1fc3;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[5]) begin
                              out_r = 13'h1e65;
                            end else begin
                              out_r = 13'h1e05;
                            end
                          end else begin
                            out_r = 13'h07ef;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[5]) begin
                              out_r = 13'h1de5;
                            end else begin
                              out_r = 13'h1d85;
                            end
                          end else begin
                            out_r = 13'h1fd6;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1fdd;
                            end else begin
                              out_r = 13'h1cf3;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1cdd;
                            end else begin
                              out_r = 13'h1cc3;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1e5d;
                            end else begin
                              out_r = 13'h04ef;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1ddd;
                            end else begin
                              out_r = 13'h1cd6;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1fad;
                            end else begin
                              out_r = 13'h1bf3;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1cad;
                            end else begin
                              out_r = 13'h1bc3;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1e2d;
                            end else begin
                              out_r = 13'h03ef;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1dad;
                            end else begin
                              out_r = 13'h1bd6;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[7]) begin
                      if (in[11]) begin
                        if (in[5]) begin
                          if (in[8]) begin
                            out_r = 13'h1f0f;
                          end else begin
                            out_r = 13'h0f0e;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h19cf;
                            end else begin
                              out_r = 13'h0fce;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h09ce;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h0ff2;
                          end else begin
                            out_r = 13'h0f92;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1ff1;
                          end else begin
                            out_r = 13'h1fc1;
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[11]) begin
                            out_r = 13'h070f;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0fee;
                            end else begin
                              out_r = 13'h0cee;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h01cf;
                            end else begin
                              out_r = 13'h0f8e;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h07cf;
                            end else begin
                              out_r = 13'h0c8e;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[5]) begin
                            out_r = 13'h040f;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h04cf;
                            end else begin
                              out_r = 13'h03cf;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1fed;
                          end else begin
                            out_r = 13'h1cd5;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[5]) begin
                    if (in[7]) begin
                      if (in[2]) begin
                        if (in[4]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1f25;
                            end else begin
                              out_r = 13'h13ff;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1c25;
                            end else begin
                              out_r = 13'h13cf;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1f1d;
                            end else begin
                              out_r = 13'h10ff;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1c1d;
                            end else begin
                              out_r = 13'h10cf;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[8]) begin
                            out_r = 13'h12cf;
                          end else begin
                            out_r = 13'h02ce;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h0f3e;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f3d;
                            end else begin
                              out_r = 13'h1f0d;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[2]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1ee5;
                            end else begin
                              out_r = 13'h13e7;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1d65;
                            end else begin
                              out_r = 13'h03de;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h12cf;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0ee6;
                            end else begin
                              out_r = 13'h0d66;
                            end
                          end
                        end
                      end else begin
                        if (in[2]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1edd;
                            end else begin
                              out_r = 13'h10e7;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1d5d;
                            end else begin
                              out_r = 13'h00de;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h114f;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ee5;
                            end else begin
                              out_r = 13'h1d5d;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[4]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1f65;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1c65;
                            end else begin
                              out_r = 13'h1fcf;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1ea5;
                            end else begin
                              out_r = 13'h1fe7;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1d25;
                            end else begin
                              out_r = 13'h0fde;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1f4d;
                            end else begin
                              out_r = 13'h1bff;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1c4d;
                            end else begin
                              out_r = 13'h1bcf;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1e8d;
                            end else begin
                              out_r = 13'h1be7;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1d0d;
                            end else begin
                              out_r = 13'h0bde;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[11]) begin
                        if (in[4]) begin
                          if (in[8]) begin
                            out_r = 13'h184f;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0e4e;
                            end else begin
                              out_r = 13'h1e4f;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1e4f;
                            end else begin
                              out_r = 13'h084e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1dcf;
                            end else begin
                              out_r = 13'h1acf;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[7]) begin
                            out_r = 13'h0f9e;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0e06;
                            end else begin
                              out_r = 13'h0d86;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ffd;
                            end else begin
                              out_r = 13'h1fcd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e65;
                            end else begin
                              out_r = 13'h1ddd;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[4]) begin
                    if (in[6]) begin
                      if (in[5]) begin
                        if (in[2]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ffe;
                            end else begin
                              out_r = 13'h1e7e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h07ff;
                            end else begin
                              out_r = 13'h067f;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0ffe;
                          end else begin
                            out_r = 13'h1ffe;
                          end
                        end
                      end else begin
                        if (in[2]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0ffe;
                            end else begin
                              out_r = 13'h0e7e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1e7f;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h0f3e;
                          end else begin
                            out_r = 13'h0c3e;
                          end
                        end
                      end
                    end else begin
                      if (in[2]) begin
                        if (in[5]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f9f;
                            end else begin
                              out_r = 13'h1e1f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f9e;
                            end else begin
                              out_r = 13'h0e1e;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h079f;
                            end else begin
                              out_r = 13'h061f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f9e;
                            end else begin
                              out_r = 13'h1e1e;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[8]) begin
                            out_r = 13'h1fff;
                          end else begin
                            out_r = 13'h01ff;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h193f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1c3f;
                            end else begin
                              out_r = 13'h1b3f;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1fe6;
                            end else begin
                              out_r = 13'h1e66;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h07e7;
                            end else begin
                              out_r = 13'h0667;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f87;
                            end else begin
                              out_r = 13'h1e07;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f86;
                            end else begin
                              out_r = 13'h0e06;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0fe6;
                            end else begin
                              out_r = 13'h0e66;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h1e67;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0787;
                            end else begin
                              out_r = 13'h0607;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f86;
                            end else begin
                              out_r = 13'h1e06;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0e1e;
                            end else begin
                              out_r = 13'h1e1e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h021e;
                            end else begin
                              out_r = 13'h161e;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f9f;
                            end else begin
                              out_r = 13'h019f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h139f;
                            end else begin
                              out_r = 13'h0b9f;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h0ebe;
                          end else begin
                            out_r = 13'h013e;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f7f;
                            end else begin
                              out_r = 13'h197f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h107f;
                            end else begin
                              out_r = 13'h157f;
                            end
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
                            if (in[8]) begin
                              out_r = 13'h0ff2;
                            end else begin
                              out_r = 13'h1ff2;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h07f3;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h0fee;
                          end else begin
                            out_r = 13'h1fef;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0cfe;
                            end else begin
                              out_r = 13'h1cfe;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h10ff;
                            end else begin
                              out_r = 13'h0cff;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h0ce6;
                          end else begin
                            out_r = 13'h10e7;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0e76;
                            end else begin
                              out_r = 13'h1e76;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e77;
                            end else begin
                              out_r = 13'h0677;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h086a;
                          end else begin
                            out_r = 13'h186b;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0df8;
                            end else begin
                              out_r = 13'h1df8;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h11f9;
                            end else begin
                              out_r = 13'h0df9;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h0ae0;
                          end else begin
                            out_r = 13'h14e1;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h17f2;
                            end else begin
                              out_r = 13'h1672;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1792;
                            end else begin
                              out_r = 13'h17f2;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h14f2;
                            end else begin
                              out_r = 13'h15f2;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1492;
                            end else begin
                              out_r = 13'h14f2;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h17fe;
                            end else begin
                              out_r = 13'h167e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h179e;
                            end else begin
                              out_r = 13'h17fe;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h140e;
                            end else begin
                              out_r = 13'h154e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h145e;
                            end else begin
                              out_r = 13'h140e;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h17f6;
                            end else begin
                              out_r = 13'h1676;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h14f6;
                            end else begin
                              out_r = 13'h15f6;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h17ea;
                            end else begin
                              out_r = 13'h178a;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h14ea;
                            end else begin
                              out_r = 13'h148a;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h17f8;
                            end else begin
                              out_r = 13'h1678;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1408;
                            end else begin
                              out_r = 13'h1548;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h17e0;
                            end else begin
                              out_r = 13'h1780;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1418;
                            end else begin
                              out_r = 13'h1448;
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
            if (in[7]) begin
              if (in[0]) begin
                if (in[8]) begin
                  if (in[9]) begin
                    if (in[2]) begin
                      if (in[11]) begin
                        out_r = 13'h1ff0;
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h1f0f;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h070f;
                            end else begin
                              out_r = 13'h0f0f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h1b0f;
                            end else begin
                              out_r = 13'h030f;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1c0f;
                            end else begin
                              out_r = 13'h0c0f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[6]) begin
                          if (in[11]) begin
                            out_r = 13'h1fff;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1fcd;
                            end else begin
                              out_r = 13'h1f0d;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h1f3f;
                          end else begin
                            out_r = 13'h1fc1;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[11]) begin
                            out_r = 13'h1fcf;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h0f9e;
                            end else begin
                              out_r = 13'h0f3e;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h1f0f;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h0f92;
                            end else begin
                              out_r = 13'h0ff2;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[2]) begin
                        if (in[11]) begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h0799;
                            end else begin
                              out_r = 13'h0499;
                            end
                          end else begin
                            out_r = 13'h0779;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[4]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h13cf;
                            end
                          end else begin
                            out_r = 13'h0fce;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[11]) begin
                            out_r = 13'h19f3;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h07bf;
                            end else begin
                              out_r = 13'h0799;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h09f2;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h07af;
                            end else begin
                              out_r = 13'h0761;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[2]) begin
                        if (in[11]) begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h1e19;
                            end else begin
                              out_r = 13'h1d99;
                            end
                          end else begin
                            out_r = 13'h1eb9;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[4]) begin
                              out_r = 13'h19c3;
                            end else begin
                              out_r = 13'h17c3;
                            end
                          end else begin
                            out_r = 13'h09c2;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[11]) begin
                            out_r = 13'h1993;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h064f;
                            end else begin
                              out_r = 13'h0679;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h0992;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h065f;
                            end else begin
                              out_r = 13'h06e1;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[9]) begin
                    if (in[2]) begin
                      if (in[11]) begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h19f3;
                          end else begin
                            out_r = 13'h1ff3;
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            out_r = 13'h19f3;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h1f3c;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h073c;
                            end else begin
                              out_r = 13'h0f3c;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h1b3f;
                            end else begin
                              out_r = 13'h033f;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1c3f;
                            end else begin
                              out_r = 13'h0c3f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[6]) begin
                          if (in[11]) begin
                            out_r = 13'h1cff;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h19fd;
                            end else begin
                              out_r = 13'h193d;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h1c3f;
                          end else begin
                            out_r = 13'h19f1;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[11]) begin
                            out_r = 13'h1ccf;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h09be;
                            end else begin
                              out_r = 13'h090e;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h1c0f;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h09b2;
                            end else begin
                              out_r = 13'h09c2;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[11]) begin
                            if (in[6]) begin
                              out_r = 13'h0f9f;
                            end else begin
                              out_r = 13'h049f;
                            end
                          end else begin
                            out_r = 13'h1fb9;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[6]) begin
                              out_r = 13'h121f;
                            end else begin
                              out_r = 13'h1d9f;
                            end
                          end else begin
                            out_r = 13'h19b7;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[11]) begin
                              out_r = 13'h077f;
                            end else begin
                              out_r = 13'h13bf;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h0f7f;
                            end else begin
                              out_r = 13'h1fbf;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[11]) begin
                              out_r = 13'h1ebf;
                            end else begin
                              out_r = 13'h17b3;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h12bf;
                            end else begin
                              out_r = 13'h19b3;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[11]) begin
                            out_r = 13'h1bf7;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h0fcf;
                            end else begin
                              out_r = 13'h0ff9;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h0bf6;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h0cdf;
                            end else begin
                              out_r = 13'h0c21;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[11]) begin
                            out_r = 13'h1b97;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h0e3f;
                            end else begin
                              out_r = 13'h0e19;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h0b96;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h0daf;
                            end else begin
                              out_r = 13'h0d21;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[5]) begin
                  if (in[9]) begin
                    if (in[4]) begin
                      if (in[8]) begin
                        if (in[2]) begin
                          if (in[11]) begin
                            out_r = 13'h1ff9;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1f9f;
                            end else begin
                              out_r = 13'h199f;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[11]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h1faf;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h199f;
                            end else begin
                              out_r = 13'h1fd7;
                            end
                          end
                        end
                      end else begin
                        if (in[2]) begin
                          if (in[11]) begin
                            out_r = 13'h13f9;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1fbf;
                            end else begin
                              out_r = 13'h19bf;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[11]) begin
                              out_r = 13'h187f;
                            end else begin
                              out_r = 13'h1387;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h181f;
                            end else begin
                              out_r = 13'h13ef;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[2]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            out_r = 13'h1f39;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1e1f;
                            end else begin
                              out_r = 13'h181f;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h1339;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1e3f;
                            end else begin
                              out_r = 13'h183f;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h13ff;
                            end else begin
                              out_r = 13'h1f5c;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h127f;
                            end else begin
                              out_r = 13'h137c;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h139f;
                            end else begin
                              out_r = 13'h1f00;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h121f;
                            end else begin
                              out_r = 13'h1330;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[4]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            out_r = 13'h13f5;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1f7f;
                            end else begin
                              out_r = 13'h1f67;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[11]) begin
                              out_r = 13'h13f0;
                            end else begin
                              out_r = 13'h1f3f;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h17f0;
                            end else begin
                              out_r = 13'h0727;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1ff5;
                            end else begin
                              out_r = 13'h1f79;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1ff0;
                            end else begin
                              out_r = 13'h1f39;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1e75;
                            end else begin
                              out_r = 13'h1961;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1870;
                            end else begin
                              out_r = 13'h0121;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[11]) begin
                          if (in[8]) begin
                            out_r = 13'h1ccf;
                          end else begin
                            out_r = 13'h1dc9;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h13dd;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13ba;
                            end else begin
                              out_r = 13'h13ca;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            out_r = 13'h1cbf;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h124d;
                            end else begin
                              out_r = 13'h125a;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h1db9;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h13cd;
                            end else begin
                              out_r = 13'h13aa;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[4]) begin
                    if (in[9]) begin
                      if (in[6]) begin
                        if (in[2]) begin
                          if (in[11]) begin
                            out_r = 13'h1e79;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h079f;
                            end else begin
                              out_r = 13'h1fb9;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h1f81;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h187f;
                            end else begin
                              out_r = 13'h1229;
                            end
                          end
                        end
                      end else begin
                        if (in[2]) begin
                          if (in[11]) begin
                            out_r = 13'h1df9;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h019f;
                            end else begin
                              out_r = 13'h19b9;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h019f;
                            end else begin
                              out_r = 13'h1feb;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h001f;
                            end else begin
                              out_r = 13'h1253;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[2]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            out_r = 13'h1335;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1c7f;
                            end else begin
                              out_r = 13'h1c67;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[11]) begin
                              out_r = 13'h1330;
                            end else begin
                              out_r = 13'h1c3f;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1730;
                            end else begin
                              out_r = 13'h0427;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h10ff;
                            end else begin
                              out_r = 13'h11f9;
                            end
                          end else begin
                            out_r = 13'h13ed;
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h0c9f;
                            end else begin
                              out_r = 13'h1271;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h0d99;
                            end else begin
                              out_r = 13'h13f1;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[6]) begin
                        if (in[9]) begin
                          if (in[11]) begin
                            out_r = 13'h1f39;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h061f;
                            end else begin
                              out_r = 13'h1e39;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1f35;
                            end else begin
                              out_r = 13'h1c79;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1f30;
                            end else begin
                              out_r = 13'h1c39;
                            end
                          end
                        end
                      end else begin
                        if (in[9]) begin
                          if (in[11]) begin
                            out_r = 13'h1c39;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h001f;
                            end else begin
                              out_r = 13'h1839;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1ef5;
                            end else begin
                              out_r = 13'h1b61;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h18f0;
                            end else begin
                              out_r = 13'h0321;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[9]) begin
                            if (in[11]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1f7b;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1cff;
                            end else begin
                              out_r = 13'h1394;
                            end
                          end
                        end else begin
                          if (in[9]) begin
                            if (in[11]) begin
                              out_r = 13'h1e7f;
                            end else begin
                              out_r = 13'h129b;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1df9;
                            end else begin
                              out_r = 13'h13f4;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[9]) begin
                            if (in[11]) begin
                              out_r = 13'h079f;
                            end else begin
                              out_r = 13'h1f35;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h049f;
                            end else begin
                              out_r = 13'h1268;
                            end
                          end
                        end else begin
                          if (in[9]) begin
                            if (in[11]) begin
                              out_r = 13'h061f;
                            end else begin
                              out_r = 13'h12c5;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h0599;
                            end else begin
                              out_r = 13'h1388;
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
                if (in[2]) begin
                  if (in[0]) begin
                    if (in[4]) begin
                      if (in[8]) begin
                        if (in[9]) begin
                          out_r = 13'h1ff0;
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h1f99;
                            end else begin
                              out_r = 13'h1c99;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h0019;
                            end else begin
                              out_r = 13'h0299;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[9]) begin
                            out_r = 13'h19f3;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h139f;
                            end else begin
                              out_r = 13'h1c9f;
                            end
                          end
                        end else begin
                          if (in[9]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h0a1f;
                            end else begin
                              out_r = 13'h029f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[8]) begin
                        if (in[9]) begin
                          out_r = 13'h1cf0;
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1f79;
                          end else begin
                            out_r = 13'h00b9;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[9]) begin
                            out_r = 13'h1cf3;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1f7f;
                            end else begin
                              out_r = 13'h137f;
                            end
                          end
                        end else begin
                          if (in[9]) begin
                            out_r = 13'h1bf3;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h00bf;
                            end else begin
                              out_r = 13'h0abf;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[9]) begin
                          if (in[6]) begin
                            out_r = 13'h19f9;
                          end else begin
                            out_r = 13'h1ff9;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1cf7;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1cf3;
                            end else begin
                              out_r = 13'h1bf3;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[9]) begin
                            if (in[6]) begin
                              out_r = 13'h1879;
                            end else begin
                              out_r = 13'h1df9;
                            end
                          end else begin
                            out_r = 13'h1f37;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[9]) begin
                              out_r = 13'h1679;
                            end else begin
                              out_r = 13'h1f33;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h11f9;
                            end else begin
                              out_r = 13'h1933;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[9]) begin
                          if (in[5]) begin
                            out_r = 13'h1f39;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f39;
                            end else begin
                              out_r = 13'h1339;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h10f7;
                            end else begin
                              out_r = 13'h10f3;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1337;
                            end else begin
                              out_r = 13'h1333;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[9]) begin
                            out_r = 13'h1939;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h11f7;
                            end else begin
                              out_r = 13'h14f3;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1b39;
                            end else begin
                              out_r = 13'h12f7;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h1539;
                            end else begin
                              out_r = 13'h16f3;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[0]) begin
                    if (in[6]) begin
                      if (in[8]) begin
                        if (in[9]) begin
                          if (in[4]) begin
                            out_r = 13'h0e7e;
                          end else begin
                            out_r = 13'h0e4e;
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1873;
                          end else begin
                            out_r = 13'h1813;
                          end
                        end
                      end else begin
                        if (in[9]) begin
                          if (in[4]) begin
                            out_r = 13'h0dfe;
                          end else begin
                            out_r = 13'h0dce;
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1af7;
                          end else begin
                            out_r = 13'h1a97;
                          end
                        end
                      end
                    end else begin
                      if (in[8]) begin
                        if (in[9]) begin
                          if (in[4]) begin
                            out_r = 13'h0efe;
                          end else begin
                            out_r = 13'h0ece;
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h0872;
                          end else begin
                            out_r = 13'h0812;
                          end
                        end
                      end else begin
                        if (in[9]) begin
                          if (in[4]) begin
                            out_r = 13'h0d7e;
                          end else begin
                            out_r = 13'h0d4e;
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h0af6;
                          end else begin
                            out_r = 13'h0a96;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[8]) begin
                        if (in[9]) begin
                          if (in[4]) begin
                            out_r = 13'h193f;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h133f;
                            end else begin
                              out_r = 13'h1f3f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1c0f;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h103f;
                            end else begin
                              out_r = 13'h1c3f;
                            end
                          end
                        end
                      end else begin
                        if (in[9]) begin
                          if (in[4]) begin
                            out_r = 13'h18fc;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h12fc;
                            end else begin
                              out_r = 13'h1efc;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1d4b;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h117b;
                            end else begin
                              out_r = 13'h1d7b;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[9]) begin
                            if (in[4]) begin
                              out_r = 13'h097e;
                            end else begin
                              out_r = 13'h037e;
                            end
                          end else begin
                            out_r = 13'h0c5e;
                          end
                        end else begin
                          if (in[9]) begin
                            if (in[4]) begin
                              out_r = 13'h18bd;
                            end else begin
                              out_r = 13'h12bd;
                            end
                          end else begin
                            out_r = 13'h1d1a;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h197e;
                            end else begin
                              out_r = 13'h147e;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h08bd;
                            end else begin
                              out_r = 13'h053a;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[9]) begin
                              out_r = 13'h1f7e;
                            end else begin
                              out_r = 13'h1c7e;
                            end
                          end else begin
                            if (in[9]) begin
                              out_r = 13'h0ebd;
                            end else begin
                              out_r = 13'h0d3a;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[9]) begin
                  if (in[0]) begin
                    if (in[2]) begin
                      if (in[4]) begin
                        if (in[8]) begin
                          if (in[5]) begin
                            out_r = 13'h1f1f;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1f1f;
                            end else begin
                              out_r = 13'h131f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1f25;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1f25;
                            end else begin
                              out_r = 13'h1325;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[8]) begin
                            out_r = 13'h1b1f;
                          end else begin
                            out_r = 13'h0b26;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1c1f;
                            end else begin
                              out_r = 13'h0c26;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h101f;
                            end else begin
                              out_r = 13'h0026;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[6]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1fdd;
                            end else begin
                              out_r = 13'h1be5;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f1d;
                            end else begin
                              out_r = 13'h1b25;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1e55;
                          end else begin
                            out_r = 13'h1aed;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0f86;
                            end else begin
                              out_r = 13'h0bae;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0e0e;
                            end else begin
                              out_r = 13'h0aa6;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0f26;
                            end else begin
                              out_r = 13'h0b1e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0e6e;
                            end else begin
                              out_r = 13'h0ad6;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[2]) begin
                        if (in[4]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1f9c;
                            end else begin
                              out_r = 13'h1fbc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h199c;
                            end else begin
                              out_r = 13'h19bc;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h121f;
                            end else begin
                              out_r = 13'h123f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h161f;
                            end else begin
                              out_r = 13'h163f;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1fbf;
                            end else begin
                              out_r = 13'h139f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fc3;
                            end else begin
                              out_r = 13'h13f3;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1fac;
                            end else begin
                              out_r = 13'h1384;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fd4;
                            end else begin
                              out_r = 13'h13ec;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[2]) begin
                            if (in[4]) begin
                              out_r = 13'h079c;
                            end else begin
                              out_r = 13'h0e1f;
                            end
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1f99;
                            end else begin
                              out_r = 13'h1f83;
                            end
                          end
                        end else begin
                          if (in[2]) begin
                            if (in[4]) begin
                              out_r = 13'h1fbb;
                            end else begin
                              out_r = 13'h1239;
                            end
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1239;
                            end else begin
                              out_r = 13'h122b;
                            end
                          end
                        end
                      end else begin
                        if (in[2]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h019c;
                            end else begin
                              out_r = 13'h19bb;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0a1f;
                            end else begin
                              out_r = 13'h1639;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1ff7;
                            end else begin
                              out_r = 13'h1247;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fe9;
                            end else begin
                              out_r = 13'h1251;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[0]) begin
                    if (in[2]) begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[6]) begin
                            if (in[4]) begin
                              out_r = 13'h1ffc;
                            end else begin
                              out_r = 13'h13fc;
                            end
                          end else begin
                            out_r = 13'h1ffd;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1f9b;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h139c;
                            end else begin
                              out_r = 13'h1f9c;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[6]) begin
                            if (in[4]) begin
                              out_r = 13'h01f0;
                            end else begin
                              out_r = 13'h0bf0;
                            end
                          end else begin
                            out_r = 13'h09f1;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h0195;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h0b90;
                            end else begin
                              out_r = 13'h0190;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h019f;
                            end else begin
                              out_r = 13'h0bff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0187;
                            end else begin
                              out_r = 13'h09e7;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h01ff;
                            end else begin
                              out_r = 13'h0b9f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h01e7;
                            end else begin
                              out_r = 13'h0987;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h01b9;
                            end else begin
                              out_r = 13'h0bc9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0149;
                            end else begin
                              out_r = 13'h0919;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h01c9;
                            end else begin
                              out_r = 13'h0bb9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0119;
                            end else begin
                              out_r = 13'h0949;
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
                            if (in[8]) begin
                              out_r = 13'h1f5f;
                            end else begin
                              out_r = 13'h1f0f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f4f;
                            end else begin
                              out_r = 13'h071f;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h105f;
                            end else begin
                              out_r = 13'h100f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h104f;
                            end else begin
                              out_r = 13'h0c1f;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1f59;
                            end else begin
                              out_r = 13'h1f09;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1949;
                            end else begin
                              out_r = 13'h0119;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1059;
                            end else begin
                              out_r = 13'h1009;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1549;
                            end else begin
                              out_r = 13'h0919;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h10e5;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h11fd;
                            end else begin
                              out_r = 13'h10fd;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1015;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1141;
                            end else begin
                              out_r = 13'h1001;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h109a;
                            end else begin
                              out_r = 13'h10fa;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h11e2;
                            end else begin
                              out_r = 13'h1082;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1054;
                            end else begin
                              out_r = 13'h1004;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1150;
                            end else begin
                              out_r = 13'h1040;
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
    end else begin
      if (in[9]) begin
        if (in[3]) begin
          if (in[1]) begin
            if (in[2]) begin
              if (in[0]) begin
                if (in[12]) begin
                  if (in[8]) begin
                    if (in[11]) begin
                      if (in[4]) begin
                        if (in[5]) begin
                          out_r = 13'h1fff;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1fff;
                          end else begin
                            out_r = 13'h1f3f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[5]) begin
                            out_r = 13'h1fff;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1f3f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1f9f;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1f9f;
                            end else begin
                              out_r = 13'h1f7f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          out_r = 13'h1fef;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h13ef;
                          end else begin
                            out_r = 13'h1fef;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[5]) begin
                            out_r = 13'h19ef;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h17ef;
                            end else begin
                              out_r = 13'h19ef;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1fef;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h13ef;
                            end else begin
                              out_r = 13'h1fef;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[11]) begin
                        if (in[5]) begin
                          out_r = 13'h19ff;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h19ff;
                          end else begin
                            out_r = 13'h193f;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          out_r = 13'h1fec;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h13ec;
                          end else begin
                            out_r = 13'h1fec;
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[11]) begin
                          if (in[5]) begin
                            out_r = 13'h187f;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h187f;
                            end else begin
                              out_r = 13'h18ff;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h07ec;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0fec;
                            end else begin
                              out_r = 13'h07ec;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[5]) begin
                            out_r = 13'h181f;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h181f;
                            end else begin
                              out_r = 13'h18bf;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h01ec;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0bec;
                            end else begin
                              out_r = 13'h01ec;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[11]) begin
                    if (in[5]) begin
                      if (in[7]) begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h1cff;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1cf3;
                            end else begin
                              out_r = 13'h1cff;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1cff;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1cf0;
                            end else begin
                              out_r = 13'h1cfc;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h1fe7;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fef;
                            end else begin
                              out_r = 13'h1fe7;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1fe7;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fec;
                            end else begin
                              out_r = 13'h1fe4;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h1c39;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1c37;
                            end else begin
                              out_r = 13'h1c39;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1c39;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1c35;
                            end else begin
                              out_r = 13'h1c3b;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h1f27;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f2f;
                            end else begin
                              out_r = 13'h1f27;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1f27;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f2c;
                            end else begin
                              out_r = 13'h1f24;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[4]) begin
                        if (in[7]) begin
                          if (in[5]) begin
                            out_r = 13'h1fff;
                          end else begin
                            out_r = 13'h1f9f;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1e7f;
                          end else begin
                            out_r = 13'h1dff;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          out_r = 13'h1fcf;
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1e4f;
                            end else begin
                              out_r = 13'h1dcf;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e3f;
                            end else begin
                              out_r = 13'h1dbf;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[8]) begin
                          out_r = 13'h1f3f;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1fff;
                          end else begin
                            out_r = 13'h1cff;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1f9f;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1f9f;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1f7f;
                            end else begin
                              out_r = 13'h1c3f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h1c7f;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[12]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          out_r = 13'h0ff2;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0cf2;
                          end else begin
                            out_r = 13'h0ff2;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0e72;
                            end else begin
                              out_r = 13'h0ff2;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0ff2;
                            end else begin
                              out_r = 13'h0e72;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0df2;
                            end else begin
                              out_r = 13'h0ff2;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0cf2;
                            end else begin
                              out_r = 13'h0e72;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h0f32;
                          end else begin
                            out_r = 13'h0ff2;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0cf2;
                            end else begin
                              out_r = 13'h0ff2;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0c32;
                            end else begin
                              out_r = 13'h0f32;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0ef2;
                            end else begin
                              out_r = 13'h0f32;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0ff2;
                            end else begin
                              out_r = 13'h0e72;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0df2;
                            end else begin
                              out_r = 13'h0ff2;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0c32;
                            end else begin
                              out_r = 13'h0ef2;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h199f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19f3;
                            end else begin
                              out_r = 13'h19ff;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h187f;
                            end else begin
                              out_r = 13'h181f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1873;
                            end else begin
                              out_r = 13'h187f;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h19e7;
                            end else begin
                              out_r = 13'h1987;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19ef;
                            end else begin
                              out_r = 13'h19e7;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1867;
                            end else begin
                              out_r = 13'h1807;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h186f;
                            end else begin
                              out_r = 13'h1867;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h19f9;
                            end else begin
                              out_r = 13'h1999;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19f7;
                            end else begin
                              out_r = 13'h19f9;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h184f;
                            end else begin
                              out_r = 13'h183f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1843;
                            end else begin
                              out_r = 13'h184f;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h19e1;
                            end else begin
                              out_r = 13'h1981;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19eb;
                            end else begin
                              out_r = 13'h19e1;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h185f;
                            end else begin
                              out_r = 13'h182f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1857;
                            end else begin
                              out_r = 13'h185f;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[12]) begin
                    if (in[4]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[5]) begin
                            out_r = 13'h1f0f;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f0f;
                            end else begin
                              out_r = 13'h070f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1f0c;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f0c;
                            end else begin
                              out_r = 13'h070c;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[5]) begin
                            out_r = 13'h1fcf;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h07cf;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1fcc;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fcc;
                            end else begin
                              out_r = 13'h07cc;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[5]) begin
                            out_r = 13'h1f3f;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h073f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h133c;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h133c;
                            end else begin
                              out_r = 13'h0f3c;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[5]) begin
                            out_r = 13'h1fff;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h07ff;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h13fc;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13fc;
                            end else begin
                              out_r = 13'h0ffc;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[4]) begin
                            out_r = 13'h07f9;
                          end else begin
                            out_r = 13'h0799;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h07f9;
                          end else begin
                            out_r = 13'h04f9;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h0739;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0739;
                            end else begin
                              out_r = 13'h0779;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h07f9;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h04f9;
                            end else begin
                              out_r = 13'h0499;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[5]) begin
                          if (in[4]) begin
                            out_r = 13'h0679;
                          end else begin
                            out_r = 13'h0619;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0679;
                          end else begin
                            out_r = 13'h06f9;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h07f9;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h07f9;
                            end else begin
                              out_r = 13'h0799;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h04f9;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h0439;
                            end else begin
                              out_r = 13'h0479;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[0]) begin
                if (in[8]) begin
                  if (in[11]) begin
                    if (in[5]) begin
                      if (in[12]) begin
                        if (in[6]) begin
                          out_r = 13'h1ff3;
                        end else begin
                          out_r = 13'h07f3;
                        end
                      end else begin
                        if (in[4]) begin
                          out_r = 13'h13f3;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h13f3;
                          end else begin
                            out_r = 13'h13c3;
                          end
                        end
                      end
                    end else begin
                      if (in[12]) begin
                        if (in[6]) begin
                          out_r = 13'h13ff;
                        end else begin
                          out_r = 13'h0fff;
                        end
                      end else begin
                        if (in[4]) begin
                          out_r = 13'h039e;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h039e;
                          end else begin
                            out_r = 13'h03be;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[12]) begin
                        if (in[5]) begin
                          out_r = 13'h07e7;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h0727;
                          end else begin
                            out_r = 13'h0427;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[7]) begin
                            out_r = 13'h043f;
                          end else begin
                            out_r = 13'h0427;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h0439;
                          end else begin
                            out_r = 13'h043f;
                          end
                        end
                      end
                    end else begin
                      if (in[12]) begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h07ff;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h073f;
                            end else begin
                              out_r = 13'h043f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h067f;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h06ff;
                            end else begin
                              out_r = 13'h057f;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h0433;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0439;
                            end else begin
                              out_r = 13'h0421;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h043f;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0433;
                            end else begin
                              out_r = 13'h042f;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[11]) begin
                    if (in[5]) begin
                      if (in[12]) begin
                        if (in[6]) begin
                          out_r = 13'h1e70;
                        end else begin
                          out_r = 13'h0670;
                        end
                      end else begin
                        if (in[4]) begin
                          out_r = 13'h10ff;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h10ff;
                          end else begin
                            out_r = 13'h10cf;
                          end
                        end
                      end
                    end else begin
                      if (in[12]) begin
                        if (in[6]) begin
                          out_r = 13'h127c;
                        end else begin
                          out_r = 13'h0e7c;
                        end
                      end else begin
                        if (in[4]) begin
                          out_r = 13'h00f2;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h00f2;
                          end else begin
                            out_r = 13'h00c2;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[12]) begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h19e7;
                          end else begin
                            out_r = 13'h1fff;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1927;
                            end else begin
                              out_r = 13'h1b27;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h1c3f;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h1987;
                          end else begin
                            out_r = 13'h1e1f;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1967;
                            end else begin
                              out_r = 13'h1b67;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1ebf;
                            end else begin
                              out_r = 13'h1d3f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h04cf;
                            end else begin
                              out_r = 13'h04e7;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h04f3;
                            end else begin
                              out_r = 13'h04c3;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h04c9;
                            end else begin
                              out_r = 13'h04f9;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h04f9;
                            end else begin
                              out_r = 13'h04d9;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h04cf;
                            end else begin
                              out_r = 13'h04e7;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h04ff;
                            end else begin
                              out_r = 13'h04cf;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h04cf;
                            end else begin
                              out_r = 13'h04ff;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h04f3;
                            end else begin
                              out_r = 13'h04d7;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[4]) begin
                    if (in[7]) begin
                      if (in[12]) begin
                        if (in[5]) begin
                          out_r = 13'h1ce7;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1ce7;
                          end else begin
                            out_r = 13'h1ce1;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1fe2;
                            end else begin
                              out_r = 13'h19e2;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0fe0;
                            end else begin
                              out_r = 13'h09e0;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1f24;
                            end else begin
                              out_r = 13'h1924;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f27;
                            end else begin
                              out_r = 13'h1927;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[12]) begin
                        if (in[5]) begin
                          out_r = 13'h1c3c;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1c3c;
                          end else begin
                            out_r = 13'h1c3b;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1ffd;
                            end else begin
                              out_r = 13'h19fd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0ffe;
                            end else begin
                              out_r = 13'h09fe;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1f3b;
                            end else begin
                              out_r = 13'h193b;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f39;
                            end else begin
                              out_r = 13'h1939;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[7]) begin
                      if (in[12]) begin
                        if (in[5]) begin
                          out_r = 13'h10ff;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h10ff;
                          end else begin
                            out_r = 13'h10f9;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1f80;
                            end else begin
                              out_r = 13'h1980;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f82;
                            end else begin
                              out_r = 13'h0982;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0767;
                            end else begin
                              out_r = 13'h0167;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0764;
                            end else begin
                              out_r = 13'h0164;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[12]) begin
                        if (in[5]) begin
                          out_r = 13'h1027;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1027;
                          end else begin
                            out_r = 13'h1021;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1f9e;
                            end else begin
                              out_r = 13'h199e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f9d;
                            end else begin
                              out_r = 13'h099d;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0779;
                            end else begin
                              out_r = 13'h0179;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h077b;
                            end else begin
                              out_r = 13'h017b;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[12]) begin
                    if (in[4]) begin
                      if (in[6]) begin
                        if (in[8]) begin
                          out_r = 13'h0fc2;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h03f2;
                          end else begin
                            out_r = 13'h0ff2;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0cce;
                            end else begin
                              out_r = 13'h00fe;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0bce;
                            end else begin
                              out_r = 13'h0bfe;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0fce;
                            end else begin
                              out_r = 13'h03fe;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h09ce;
                            end else begin
                              out_r = 13'h09fe;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h1fc1;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h13f1;
                            end else begin
                              out_r = 13'h1ff1;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ccd;
                            end else begin
                              out_r = 13'h10fd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1bcd;
                            end else begin
                              out_r = 13'h1bfd;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h1e41;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1271;
                            end else begin
                              out_r = 13'h1e71;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1e4d;
                            end else begin
                              out_r = 13'h127d;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h184d;
                            end else begin
                              out_r = 13'h187d;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[4]) begin
                        if (in[7]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0bfe;
                            end else begin
                              out_r = 13'h0b9e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0be6;
                            end else begin
                              out_r = 13'h0b86;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0bce;
                            end else begin
                              out_r = 13'h0bfe;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0bfe;
                            end else begin
                              out_r = 13'h0bce;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0bf8;
                            end else begin
                              out_r = 13'h0b98;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0be0;
                            end else begin
                              out_r = 13'h0b80;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0bc8;
                            end else begin
                              out_r = 13'h0bf8;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0bf8;
                            end else begin
                              out_r = 13'h0bc8;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h0bf2;
                            end else begin
                              out_r = 13'h0bfe;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h0bfe;
                            end else begin
                              out_r = 13'h0bf2;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h0b92;
                            end else begin
                              out_r = 13'h0b9e;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h0b9e;
                            end else begin
                              out_r = 13'h0b92;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0bc2;
                            end else begin
                              out_r = 13'h0bf2;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0be6;
                            end else begin
                              out_r = 13'h0bde;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0bce;
                            end else begin
                              out_r = 13'h0bfe;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0bee;
                            end else begin
                              out_r = 13'h0bd6;
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
            if (in[0]) begin
              if (in[2]) begin
                if (in[5]) begin
                  if (in[7]) begin
                    if (in[12]) begin
                      if (in[6]) begin
                        if (in[11]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h19fc;
                            end else begin
                              out_r = 13'h187c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19e4;
                            end else begin
                              out_r = 13'h1864;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1ffc;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ffc;
                            end else begin
                              out_r = 13'h1e7c;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h199c;
                            end else begin
                              out_r = 13'h181c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1984;
                            end else begin
                              out_r = 13'h1804;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h19fc;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19fc;
                            end else begin
                              out_r = 13'h187c;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[11]) begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h1fff;
                          end else begin
                            out_r = 13'h1ffc;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h07ff;
                          end else begin
                            out_r = 13'h07fc;
                          end
                        end
                      end else begin
                        out_r = 13'h17ff;
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[11]) begin
                        if (in[4]) begin
                          if (in[12]) begin
                            if (in[8]) begin
                              out_r = 13'h193c;
                            end else begin
                              out_r = 13'h18fc;
                            end
                          end else begin
                            out_r = 13'h1f3f;
                          end
                        end else begin
                          if (in[12]) begin
                            if (in[8]) begin
                              out_r = 13'h1924;
                            end else begin
                              out_r = 13'h18e4;
                            end
                          end else begin
                            out_r = 13'h073f;
                          end
                        end
                      end else begin
                        if (in[12]) begin
                          if (in[4]) begin
                            out_r = 13'h13fc;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13fc;
                            end else begin
                              out_r = 13'h127c;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h17ff;
                          end else begin
                            out_r = 13'h173f;
                          end
                        end
                      end
                    end else begin
                      if (in[11]) begin
                        if (in[4]) begin
                          if (in[12]) begin
                            if (in[8]) begin
                              out_r = 13'h197c;
                            end else begin
                              out_r = 13'h18bc;
                            end
                          end else begin
                            out_r = 13'h1f3c;
                          end
                        end else begin
                          if (in[12]) begin
                            if (in[8]) begin
                              out_r = 13'h1964;
                            end else begin
                              out_r = 13'h18a4;
                            end
                          end else begin
                            out_r = 13'h073c;
                          end
                        end
                      end else begin
                        if (in[12]) begin
                          if (in[4]) begin
                            out_r = 13'h17fc;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h17fc;
                            end else begin
                              out_r = 13'h167c;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h179f;
                          end else begin
                            out_r = 13'h177f;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[12]) begin
                    if (in[7]) begin
                      if (in[6]) begin
                        if (in[11]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h19cc;
                            end else begin
                              out_r = 13'h184c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19dc;
                            end else begin
                              out_r = 13'h185c;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1fcc;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fcc;
                            end else begin
                              out_r = 13'h1e4c;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h19bc;
                            end else begin
                              out_r = 13'h183c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19ac;
                            end else begin
                              out_r = 13'h182c;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h19cc;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19cc;
                            end else begin
                              out_r = 13'h184c;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[11]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h190c;
                            end else begin
                              out_r = 13'h18cc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h191c;
                            end else begin
                              out_r = 13'h18dc;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h13cc;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13cc;
                            end else begin
                              out_r = 13'h124c;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h195c;
                            end else begin
                              out_r = 13'h189c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h194c;
                            end else begin
                              out_r = 13'h188c;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h17cc;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h17cc;
                            end else begin
                              out_r = 13'h164c;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[6]) begin
                        if (in[11]) begin
                          if (in[7]) begin
                            out_r = 13'h1fcf;
                          end else begin
                            out_r = 13'h1f0f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h17ff;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h17ff;
                            end else begin
                              out_r = 13'h173f;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[11]) begin
                            out_r = 13'h1fcc;
                          end else begin
                            out_r = 13'h17cf;
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h1f0c;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h17bf;
                            end else begin
                              out_r = 13'h175f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[11]) begin
                          if (in[7]) begin
                            out_r = 13'h07cf;
                          end else begin
                            out_r = 13'h070f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h17e7;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h17e7;
                            end else begin
                              out_r = 13'h1727;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[11]) begin
                            out_r = 13'h07cc;
                          end else begin
                            out_r = 13'h17df;
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h070c;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h17af;
                            end else begin
                              out_r = 13'h174f;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[11]) begin
                  if (in[12]) begin
                    if (in[5]) begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h1fcf;
                          end else begin
                            out_r = 13'h1e4f;
                          end
                        end else begin
                          out_r = 13'h07cf;
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h19bf;
                          end else begin
                            out_r = 13'h183f;
                          end
                        end else begin
                          out_r = 13'h01bf;
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h1cfc;
                          end else begin
                            out_r = 13'h1dfc;
                          end
                        end else begin
                          out_r = 13'h04fc;
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h1b9c;
                          end else begin
                            out_r = 13'h1a9c;
                          end
                        end else begin
                          out_r = 13'h039c;
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          out_r = 13'h1ffd;
                        end else begin
                          out_r = 13'h0ffe;
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h1fe7;
                          end else begin
                            out_r = 13'h1fff;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1fe4;
                          end else begin
                            out_r = 13'h1ffc;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ff0;
                            end else begin
                              out_r = 13'h1ffc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ffc;
                            end else begin
                              out_r = 13'h1ff0;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1ff3;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0fee;
                            end else begin
                              out_r = 13'h0ffe;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0fe6;
                            end else begin
                              out_r = 13'h0ff2;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1fed;
                            end else begin
                              out_r = 13'h1ffd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fe5;
                            end else begin
                              out_r = 13'h1ff1;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[6]) begin
                    if (in[7]) begin
                      if (in[12]) begin
                        if (in[5]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1e7f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1ffc;
                            end else begin
                              out_r = 13'h1e7c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fe4;
                            end else begin
                              out_r = 13'h1ffc;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[8]) begin
                            out_r = 13'h19cf;
                          end else begin
                            out_r = 13'h1903;
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h01cf;
                            end else begin
                              out_r = 13'h010f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19ce;
                            end else begin
                              out_r = 13'h190e;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[12]) begin
                        if (in[5]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h13ff;
                            end else begin
                              out_r = 13'h127f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13e7;
                            end else begin
                              out_r = 13'h13ff;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h13fc;
                            end else begin
                              out_r = 13'h127c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13e4;
                            end else begin
                              out_r = 13'h13fc;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[8]) begin
                            out_r = 13'h19b9;
                          end else begin
                            out_r = 13'h1959;
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h01b9;
                            end else begin
                              out_r = 13'h0157;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19b8;
                            end else begin
                              out_r = 13'h1956;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[7]) begin
                        if (in[12]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1999;
                            end else begin
                              out_r = 13'h1819;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1981;
                            end else begin
                              out_r = 13'h1999;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h1933;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h01ff;
                            end else begin
                              out_r = 13'h013f;
                            end
                          end
                        end
                      end else begin
                        if (in[12]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1799;
                            end else begin
                              out_r = 13'h1619;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1781;
                            end else begin
                              out_r = 13'h1799;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h199f;
                            end else begin
                              out_r = 13'h197f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h019f;
                            end else begin
                              out_r = 13'h0173;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[12]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h199b;
                            end else begin
                              out_r = 13'h181b;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1983;
                            end else begin
                              out_r = 13'h199b;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h19fc;
                            end else begin
                              out_r = 13'h1930;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h09fd;
                            end else begin
                              out_r = 13'h093d;
                            end
                          end
                        end
                      end else begin
                        if (in[12]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h179b;
                            end else begin
                              out_r = 13'h161b;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1783;
                            end else begin
                              out_r = 13'h179b;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h199c;
                            end else begin
                              out_r = 13'h197c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h099d;
                            end else begin
                              out_r = 13'h0971;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[12]) begin
                if (in[11]) begin
                  if (in[2]) begin
                    if (in[6]) begin
                      if (in[5]) begin
                        if (in[4]) begin
                          if (in[7]) begin
                            out_r = 13'h13f9;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1279;
                            end else begin
                              out_r = 13'h13f9;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h13c9;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1249;
                            end else begin
                              out_r = 13'h13c9;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          out_r = 13'h1399;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1279;
                          end else begin
                            out_r = 13'h13f9;
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h1339;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1339;
                            end else begin
                              out_r = 13'h1309;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h13f9;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h13f9;
                            end else begin
                              out_r = 13'h13c9;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[8]) begin
                            out_r = 13'h1279;
                          end else begin
                            out_r = 13'h1339;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1219;
                            end else begin
                              out_r = 13'h1379;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1239;
                            end else begin
                              out_r = 13'h1359;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          out_r = 13'h1f7f;
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h0799;
                          end else begin
                            out_r = 13'h1f99;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          out_r = 13'h133f;
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h0ff9;
                          end else begin
                            out_r = 13'h13f9;
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h195f;
                          end else begin
                            out_r = 13'h095e;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h01b9;
                            end else begin
                              out_r = 13'h19b8;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19b9;
                            end else begin
                              out_r = 13'h09b8;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h170f;
                          end else begin
                            out_r = 13'h070e;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h0bc9;
                            end else begin
                              out_r = 13'h13c8;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h17c9;
                            end else begin
                              out_r = 13'h07c8;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[7]) begin
                    if (in[2]) begin
                      if (in[4]) begin
                        if (in[6]) begin
                          out_r = 13'h1f93;
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h13b3;
                          end else begin
                            out_r = 13'h17b3;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h1f9f;
                          end else begin
                            out_r = 13'h13bf;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1c9f;
                          end else begin
                            out_r = 13'h15bf;
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0ff3;
                            end else begin
                              out_r = 13'h13ff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f30;
                            end else begin
                              out_r = 13'h133c;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0f93;
                            end else begin
                              out_r = 13'h109f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f70;
                            end else begin
                              out_r = 13'h107c;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h13c3;
                            end else begin
                              out_r = 13'h0fcf;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1300;
                            end else begin
                              out_r = 13'h0f0c;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h13b3;
                            end else begin
                              out_r = 13'h0cbf;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1350;
                            end else begin
                              out_r = 13'h0c5c;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[4]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            out_r = 13'h07f3;
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1fc3;
                            end else begin
                              out_r = 13'h07c3;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19c3;
                            end else begin
                              out_r = 13'h01c3;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h07ff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h07cf;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1cff;
                            end else begin
                              out_r = 13'h04ff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1bcf;
                            end else begin
                              out_r = 13'h03cf;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h07f7;
                            end else begin
                              out_r = 13'h1ff9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0735;
                            end else begin
                              out_r = 13'h1f3b;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0797;
                            end else begin
                              out_r = 13'h1c99;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0775;
                            end else begin
                              out_r = 13'h1c7b;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1e47;
                            end else begin
                              out_r = 13'h0649;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ec5;
                            end else begin
                              out_r = 13'h06cb;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1e37;
                            end else begin
                              out_r = 13'h05b9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e95;
                            end else begin
                              out_r = 13'h051b;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[2]) begin
                  if (in[7]) begin
                    if (in[6]) begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            out_r = 13'h1b9f;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h03fd;
                            end else begin
                              out_r = 13'h03e5;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h1b87;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h027d;
                            end else begin
                              out_r = 13'h0265;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[11]) begin
                            out_r = 13'h1b9c;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h03cd;
                            end else begin
                              out_r = 13'h024d;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h1b9d;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h03dd;
                            end else begin
                              out_r = 13'h025d;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[11]) begin
                        if (in[5]) begin
                          if (in[8]) begin
                            out_r = 13'h1b99;
                          end else begin
                            out_r = 13'h1b81;
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1b99;
                          end else begin
                            out_r = 13'h0b98;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h039d;
                            end else begin
                              out_r = 13'h021d;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h03bd;
                            end else begin
                              out_r = 13'h023d;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h0385;
                            end else begin
                              out_r = 13'h0205;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h03ad;
                            end else begin
                              out_r = 13'h022d;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[11]) begin
                      if (in[4]) begin
                        if (in[8]) begin
                          if (in[5]) begin
                            out_r = 13'h1bf3;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1bf0;
                            end else begin
                              out_r = 13'h1bf3;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1be7;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1bfc;
                            end else begin
                              out_r = 13'h1bff;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[8]) begin
                            out_r = 13'h1bff;
                          end else begin
                            out_r = 13'h1bef;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1bfd;
                            end else begin
                              out_r = 13'h1bf1;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0bfe;
                            end else begin
                              out_r = 13'h0bf2;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h033d;
                            end else begin
                              out_r = 13'h02fd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h037d;
                            end else begin
                              out_r = 13'h02bd;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h030d;
                            end else begin
                              out_r = 13'h02cd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h035d;
                            end else begin
                              out_r = 13'h029d;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0325;
                            end else begin
                              out_r = 13'h02e5;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0365;
                            end else begin
                              out_r = 13'h02a5;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h031d;
                            end else begin
                              out_r = 13'h02dd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h034d;
                            end else begin
                              out_r = 13'h028d;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[7]) begin
                    if (in[6]) begin
                      if (in[8]) begin
                        if (in[11]) begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h09fa;
                            end else begin
                              out_r = 13'h09ca;
                            end
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h09e2;
                            end else begin
                              out_r = 13'h09da;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h1bff;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1bff;
                            end else begin
                              out_r = 13'h0bfe;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[11]) begin
                            if (in[4]) begin
                              out_r = 13'h087a;
                            end else begin
                              out_r = 13'h0862;
                            end
                          end else begin
                            out_r = 13'h1b27;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[11]) begin
                              out_r = 13'h084a;
                            end else begin
                              out_r = 13'h1b3f;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h085a;
                            end else begin
                              out_r = 13'h0b3e;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[4]) begin
                              out_r = 13'h099a;
                            end else begin
                              out_r = 13'h0982;
                            end
                          end else begin
                            out_r = 13'h1bf9;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[4]) begin
                              out_r = 13'h081a;
                            end else begin
                              out_r = 13'h0802;
                            end
                          end else begin
                            out_r = 13'h1b21;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h09ba;
                            end else begin
                              out_r = 13'h1bfb;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h083a;
                            end else begin
                              out_r = 13'h1b3b;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h09aa;
                            end else begin
                              out_r = 13'h1bfa;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h082a;
                            end else begin
                              out_r = 13'h1b3a;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[8]) begin
                        if (in[11]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h093a;
                            end else begin
                              out_r = 13'h097a;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h090a;
                            end else begin
                              out_r = 13'h095a;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1b93;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1b93;
                            end else begin
                              out_r = 13'h1b90;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[11]) begin
                            if (in[6]) begin
                              out_r = 13'h08fa;
                            end else begin
                              out_r = 13'h08ba;
                            end
                          end else begin
                            out_r = 13'h1b67;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[11]) begin
                              out_r = 13'h08ca;
                            end else begin
                              out_r = 13'h1b7f;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h089a;
                            end else begin
                              out_r = 13'h1b7c;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[6]) begin
                              out_r = 13'h0922;
                            end else begin
                              out_r = 13'h0962;
                            end
                          end else begin
                            out_r = 13'h1b9f;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[6]) begin
                              out_r = 13'h08e2;
                            end else begin
                              out_r = 13'h08a2;
                            end
                          end else begin
                            out_r = 13'h1b6f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h091a;
                            end else begin
                              out_r = 13'h0b9e;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h08da;
                            end else begin
                              out_r = 13'h0b72;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h094a;
                            end else begin
                              out_r = 13'h1b9d;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h088a;
                            end else begin
                              out_r = 13'h1b71;
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
          if (in[2]) begin
            if (in[12]) begin
              if (in[0]) begin
                if (in[6]) begin
                  if (in[1]) begin
                    if (in[11]) begin
                      if (in[4]) begin
                        if (in[7]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h0f3e;
                            end else begin
                              out_r = 13'h0f0e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f38;
                            end else begin
                              out_r = 13'h0f3e;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h0ffe;
                            end else begin
                              out_r = 13'h0fce;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0ff8;
                            end else begin
                              out_r = 13'h0ffe;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1f3d;
                            end else begin
                              out_r = 13'h1f0d;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f3a;
                            end else begin
                              out_r = 13'h1f3d;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h0fe6;
                            end else begin
                              out_r = 13'h0fde;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0fe0;
                            end else begin
                              out_r = 13'h0fe6;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h17fe;
                            end else begin
                              out_r = 13'h1e7e;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1ffe;
                            end else begin
                              out_r = 13'h17fe;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h00fe;
                            end else begin
                              out_r = 13'h0dfe;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0cfe;
                            end else begin
                              out_r = 13'h00fe;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h039e;
                            end else begin
                              out_r = 13'h0e1e;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0f9e;
                            end else begin
                              out_r = 13'h039e;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h179e;
                            end else begin
                              out_r = 13'h1e1e;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1f9e;
                            end else begin
                              out_r = 13'h179e;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[11]) begin
                          out_r = 13'h10cf;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0bf8;
                          end else begin
                            out_r = 13'h1bf9;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            out_r = 13'h00fe;
                          end else begin
                            out_r = 13'h0fe0;
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h10ff;
                          end else begin
                            out_r = 13'h1fe1;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[11]) begin
                          if (in[7]) begin
                            out_r = 13'h0fcf;
                          end else begin
                            out_r = 13'h13cf;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h09f8;
                          end else begin
                            out_r = 13'h19f9;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[7]) begin
                              out_r = 13'h17fe;
                            end else begin
                              out_r = 13'h03fe;
                            end
                          end else begin
                            out_r = 13'h0ce0;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[7]) begin
                              out_r = 13'h0fff;
                            end else begin
                              out_r = 13'h13ff;
                            end
                          end else begin
                            out_r = 13'h1ce1;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[11]) begin
                    if (in[1]) begin
                      if (in[4]) begin
                        if (in[7]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h1f0f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f39;
                            end else begin
                              out_r = 13'h1f3f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1fcf;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ff9;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1f3c;
                            end else begin
                              out_r = 13'h1f0c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f3b;
                            end else begin
                              out_r = 13'h1f3c;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h1fdf;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fe1;
                            end else begin
                              out_r = 13'h1fe7;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          out_r = 13'h1ccf;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0cfe;
                          end else begin
                            out_r = 13'h1cff;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[7]) begin
                            out_r = 13'h07cf;
                          end else begin
                            out_r = 13'h1fcf;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ffe;
                            end else begin
                              out_r = 13'h07ff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0ffe;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[1]) begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h0fff;
                            end else begin
                              out_r = 13'h067f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h07ff;
                            end else begin
                              out_r = 13'h0fff;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h10ff;
                            end else begin
                              out_r = 13'h1dff;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1cff;
                            end else begin
                              out_r = 13'h10ff;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h139f;
                            end else begin
                              out_r = 13'h1e1f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1f9f;
                            end else begin
                              out_r = 13'h139f;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h0f9f;
                            end else begin
                              out_r = 13'h061f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h079f;
                            end else begin
                              out_r = 13'h0f9f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[8]) begin
                            out_r = 13'h0cf8;
                          end else begin
                            out_r = 13'h1cf9;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h09e0;
                          end else begin
                            out_r = 13'h19e1;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[8]) begin
                            out_r = 13'h0ff8;
                          end else begin
                            out_r = 13'h1ff9;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0be0;
                          end else begin
                            out_r = 13'h1be1;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[1]) begin
                  if (in[8]) begin
                    if (in[11]) begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h127c;
                            end else begin
                              out_r = 13'h124c;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1264;
                            end else begin
                              out_r = 13'h125c;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1e70;
                          end else begin
                            out_r = 13'h1e6c;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[7]) begin
                            out_r = 13'h127b;
                          end else begin
                            out_r = 13'h124b;
                          end
                        end else begin
                          out_r = 13'h1e75;
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          out_r = 13'h1fce;
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h07cf;
                          end else begin
                            out_r = 13'h04cf;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[7]) begin
                            out_r = 13'h0e4e;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1e4f;
                            end else begin
                              out_r = 13'h1dcf;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h0fce;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h1ccf;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[6]) begin
                        if (in[11]) begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h13ff;
                            end else begin
                              out_r = 13'h13cf;
                            end
                          end else begin
                            out_r = 13'h1ff3;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h19cd;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h19cc;
                            end else begin
                              out_r = 13'h1bcc;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h1387;
                            end else begin
                              out_r = 13'h13af;
                            end
                          end else begin
                            out_r = 13'h1f8f;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h0e4d;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h064c;
                            end else begin
                              out_r = 13'h05cc;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[11]) begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h13f9;
                            end else begin
                              out_r = 13'h13c9;
                            end
                          end else begin
                            out_r = 13'h1ff7;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1fcd;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1fcc;
                            end else begin
                              out_r = 13'h1ccc;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h1399;
                            end else begin
                              out_r = 13'h13b9;
                            end
                          end else begin
                            out_r = 13'h1f97;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h09cd;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h01cc;
                            end else begin
                              out_r = 13'h03cc;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[5]) begin
                    if (in[6]) begin
                      if (in[8]) begin
                        if (in[11]) begin
                          out_r = 13'h049f;
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h17f1;
                            end else begin
                              out_r = 13'h1731;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h17ed;
                            end else begin
                              out_r = 13'h172d;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[11]) begin
                            out_r = 13'h1c9f;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1671;
                            end else begin
                              out_r = 13'h16f1;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h1c87;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h166d;
                            end else begin
                              out_r = 13'h16ed;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[8]) begin
                        if (in[11]) begin
                          out_r = 13'h03f9;
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1791;
                            end else begin
                              out_r = 13'h1771;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h178d;
                            end else begin
                              out_r = 13'h176d;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[11]) begin
                            out_r = 13'h1bf9;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1611;
                            end else begin
                              out_r = 13'h16b1;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h1be1;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h160d;
                            end else begin
                              out_r = 13'h16ad;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[8]) begin
                        if (in[11]) begin
                          out_r = 13'h079c;
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h17c1;
                            end else begin
                              out_r = 13'h1701;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h17d5;
                            end else begin
                              out_r = 13'h1715;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[11]) begin
                            out_r = 13'h1f9c;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1641;
                            end else begin
                              out_r = 13'h16c1;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h1f84;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1655;
                            end else begin
                              out_r = 13'h16d5;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[8]) begin
                        if (in[11]) begin
                          out_r = 13'h01fb;
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h17b1;
                            end else begin
                              out_r = 13'h1751;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h17a5;
                            end else begin
                              out_r = 13'h1745;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[11]) begin
                            out_r = 13'h19fb;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1631;
                            end else begin
                              out_r = 13'h1691;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h19e3;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1625;
                            end else begin
                              out_r = 13'h1685;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[0]) begin
                if (in[6]) begin
                  if (in[11]) begin
                    if (in[1]) begin
                      if (in[7]) begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h07fc;
                          end else begin
                            out_r = 13'h1ffc;
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1ffc;
                          end else begin
                            out_r = 13'h07fc;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h04ff;
                          end else begin
                            out_r = 13'h1cff;
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1cff;
                          end else begin
                            out_r = 13'h04ff;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h01f0;
                            end else begin
                              out_r = 13'h19f0;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h19f0;
                            end else begin
                              out_r = 13'h01f0;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h01fc;
                            end else begin
                              out_r = 13'h19fc;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h19fc;
                            end else begin
                              out_r = 13'h01fc;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h07f0;
                            end else begin
                              out_r = 13'h1ff0;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1ff0;
                            end else begin
                              out_r = 13'h07f0;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h07fc;
                            end else begin
                              out_r = 13'h1ffc;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1ffc;
                            end else begin
                              out_r = 13'h07fc;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[1]) begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h1ff0;
                            end
                          end else begin
                            out_r = 13'h0ff2;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1fef;
                            end else begin
                              out_r = 13'h1fec;
                            end
                          end else begin
                            out_r = 13'h0fee;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h19fc;
                            end
                          end else begin
                            out_r = 13'h09fe;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h17e7;
                            end else begin
                              out_r = 13'h17e4;
                            end
                          end else begin
                            out_r = 13'h07e6;
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[8]) begin
                          out_r = 13'h1f0b;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h07cb;
                          end else begin
                            out_r = 13'h1fcb;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[8]) begin
                            out_r = 13'h1f05;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h07c5;
                            end else begin
                              out_r = 13'h1fc5;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1c05;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h04c5;
                            end else begin
                              out_r = 13'h1cc5;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[1]) begin
                    if (in[11]) begin
                      if (in[7]) begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h067f;
                          end else begin
                            out_r = 13'h1e7f;
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1e7f;
                          end else begin
                            out_r = 13'h067f;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h05fc;
                          end else begin
                            out_r = 13'h1dfc;
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1dfc;
                          end else begin
                            out_r = 13'h05fc;
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h07c3;
                            end else begin
                              out_r = 13'h07c0;
                            end
                          end else begin
                            out_r = 13'h07c3;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1fd7;
                            end else begin
                              out_r = 13'h1fd4;
                            end
                          end else begin
                            out_r = 13'h1fd7;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h01cf;
                            end else begin
                              out_r = 13'h01cc;
                            end
                          end else begin
                            out_r = 13'h01cf;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h17df;
                            end else begin
                              out_r = 13'h17dc;
                            end
                          end else begin
                            out_r = 13'h17df;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[8]) begin
                        if (in[11]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h01f3;
                            end else begin
                              out_r = 13'h19f3;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h19f3;
                            end else begin
                              out_r = 13'h01f3;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1f3b;
                            end else begin
                              out_r = 13'h133b;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1f35;
                            end else begin
                              out_r = 13'h1335;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h01ff;
                            end else begin
                              out_r = 13'h19ff;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h01ff;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h07fb;
                            end else begin
                              out_r = 13'h13fb;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h07f5;
                            end else begin
                              out_r = 13'h13f5;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[8]) begin
                        if (in[11]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h07f3;
                            end else begin
                              out_r = 13'h1ff3;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h07f3;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h193b;
                            end else begin
                              out_r = 13'h173b;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1b35;
                            end else begin
                              out_r = 13'h1535;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h07ff;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h07ff;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h01fb;
                            end else begin
                              out_r = 13'h17fb;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h03f5;
                            end else begin
                              out_r = 13'h15f5;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[5]) begin
                  if (in[1]) begin
                    if (in[7]) begin
                      if (in[8]) begin
                        if (in[11]) begin
                          out_r = 13'h0ff8;
                        end else begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h0f0e;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h193f;
                            end else begin
                              out_r = 13'h090e;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          out_r = 13'h0ff6;
                        end else begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h0fce;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h09ce;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            out_r = 13'h19ff;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1f7c;
                            end else begin
                              out_r = 13'h1f5c;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h19f3;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1f9f;
                            end else begin
                              out_r = 13'h1fbf;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            out_r = 13'h1fff;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h197c;
                            end else begin
                              out_r = 13'h195c;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h199f;
                            end else begin
                              out_r = 13'h19bf;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[11]) begin
                            out_r = 13'h0ff8;
                          end else begin
                            out_r = 13'h1e19;
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h03fe;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e79;
                            end else begin
                              out_r = 13'h0679;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[11]) begin
                            out_r = 13'h1f3a;
                          end else begin
                            out_r = 13'h1e39;
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h133d;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1249;
                            end else begin
                              out_r = 13'h0e49;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[11]) begin
                            out_r = 13'h0fc8;
                          end else begin
                            out_r = 13'h1f97;
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h024e;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ff7;
                            end else begin
                              out_r = 13'h07f7;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[11]) begin
                            out_r = 13'h1f0a;
                          end else begin
                            out_r = 13'h1fb7;
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h12cd;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13c7;
                            end else begin
                              out_r = 13'h0fc7;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[1]) begin
                    if (in[7]) begin
                      if (in[8]) begin
                        if (in[11]) begin
                          out_r = 13'h1ff9;
                        end else begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h1f27;
                            end else begin
                              out_r = 13'h1f1e;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1727;
                            end else begin
                              out_r = 13'h131e;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          out_r = 13'h13f7;
                        end else begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h1fde;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h17e7;
                            end else begin
                              out_r = 13'h13de;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            out_r = 13'h09fe;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1f64;
                            end else begin
                              out_r = 13'h074c;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h07f2;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1f87;
                            end else begin
                              out_r = 13'h07af;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            out_r = 13'h0ffe;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1764;
                            end else begin
                              out_r = 13'h0b4c;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            out_r = 13'h03f2;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1787;
                            end else begin
                              out_r = 13'h0baf;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h1f99;
                            end else begin
                              out_r = 13'h1c99;
                            end
                          end else begin
                            out_r = 13'h1e01;
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h139f;
                            end else begin
                              out_r = 13'h1e61;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h109f;
                            end else begin
                              out_r = 13'h0661;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h1f7b;
                            end else begin
                              out_r = 13'h1c7b;
                            end
                          end else begin
                            out_r = 13'h1829;
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h137c;
                            end else begin
                              out_r = 13'h1659;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h107c;
                            end else begin
                              out_r = 13'h0a59;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h1fb9;
                            end else begin
                              out_r = 13'h1cb9;
                            end
                          end else begin
                            out_r = 13'h1c8b;
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h123f;
                            end else begin
                              out_r = 13'h1ceb;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h11bf;
                            end else begin
                              out_r = 13'h04eb;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h1f5b;
                            end else begin
                              out_r = 13'h1c5b;
                            end
                          end else begin
                            out_r = 13'h1ba3;
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h129c;
                            end else begin
                              out_r = 13'h15d3;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h111c;
                            end else begin
                              out_r = 13'h09d3;
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
            if (in[11]) begin
              if (in[0]) begin
                if (in[1]) begin
                  if (in[8]) begin
                    if (in[12]) begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[7]) begin
                            if (in[6]) begin
                              out_r = 13'h13e7;
                            end else begin
                              out_r = 13'h1327;
                            end
                          end else begin
                            out_r = 13'h1267;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h13e7;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1367;
                            end else begin
                              out_r = 13'h1387;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[7]) begin
                            out_r = 13'h13ff;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h127f;
                            end else begin
                              out_r = 13'h12ff;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h13cf;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h13bf;
                            end else begin
                              out_r = 13'h135f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[4]) begin
                            out_r = 13'h1dc3;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1dc3;
                            end else begin
                              out_r = 13'h1ac3;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h0643;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e43;
                            end else begin
                              out_r = 13'h1843;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h1cc3;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h0cc2;
                            end else begin
                              out_r = 13'h0bc2;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h07c3;
                            end else begin
                              out_r = 13'h1fc2;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fc3;
                            end else begin
                              out_r = 13'h09c2;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[12]) begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h1ce7;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1ce7;
                            end else begin
                              out_r = 13'h1de7;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1cff;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1ccf;
                            end else begin
                              out_r = 13'h1dcf;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[4]) begin
                            out_r = 13'h1dcc;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1dcc;
                            end else begin
                              out_r = 13'h1acc;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h10cc;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h10cd;
                            end else begin
                              out_r = 13'h15cd;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[12]) begin
                            if (in[7]) begin
                              out_r = 13'h1f27;
                            end else begin
                              out_r = 13'h1fe7;
                            end
                          end else begin
                            out_r = 13'h064f;
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[12]) begin
                              out_r = 13'h1f67;
                            end else begin
                              out_r = 13'h0fcf;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1e07;
                            end else begin
                              out_r = 13'h17ce;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[7]) begin
                            if (in[12]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1e4f;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h184f;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[12]) begin
                              out_r = 13'h1fbf;
                            end else begin
                              out_r = 13'h13cf;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1e9f;
                            end else begin
                              out_r = 13'h07ce;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[4]) begin
                    if (in[8]) begin
                      if (in[12]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h0cf8;
                            end else begin
                              out_r = 13'h0c98;
                            end
                          end else begin
                            out_r = 13'h0cc8;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h0cf8;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0cf8;
                            end else begin
                              out_r = 13'h0c98;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1f9c;
                            end else begin
                              out_r = 13'h139c;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1f7f;
                            end else begin
                              out_r = 13'h137f;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1ffc;
                            end else begin
                              out_r = 13'h13fc;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h133f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[12]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h0f38;
                            end else begin
                              out_r = 13'h0f98;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0fc8;
                            end else begin
                              out_r = 13'h0f08;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h0f38;
                            end else begin
                              out_r = 13'h0ff8;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0ff8;
                            end else begin
                              out_r = 13'h0f78;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h0790;
                            end else begin
                              out_r = 13'h0f90;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0773;
                            end else begin
                              out_r = 13'h0f73;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h04f0;
                            end else begin
                              out_r = 13'h0cf0;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0433;
                            end else begin
                              out_r = 13'h0c33;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[8]) begin
                        if (in[12]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h0cf6;
                            end else begin
                              out_r = 13'h0c96;
                            end
                          end else begin
                            out_r = 13'h0cf6;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1e3c;
                            end else begin
                              out_r = 13'h13bc;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e9f;
                            end else begin
                              out_r = 13'h135f;
                            end
                          end
                        end
                      end else begin
                        if (in[12]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h0f36;
                            end else begin
                              out_r = 13'h0f96;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0ff6;
                            end else begin
                              out_r = 13'h0f36;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1e30;
                            end else begin
                              out_r = 13'h13b0;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e93;
                            end else begin
                              out_r = 13'h1353;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[12]) begin
                            out_r = 13'h0cea;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e4c;
                            end else begin
                              out_r = 13'h13cc;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[12]) begin
                              out_r = 13'h0f2a;
                            end else begin
                              out_r = 13'h1dc0;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0fea;
                            end else begin
                              out_r = 13'h10c0;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h0cd2;
                            end else begin
                              out_r = 13'h1ecf;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0fd2;
                            end else begin
                              out_r = 13'h1d43;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h0ca2;
                            end else begin
                              out_r = 13'h130f;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0f42;
                            end else begin
                              out_r = 13'h1003;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[5]) begin
                  if (in[8]) begin
                    if (in[12]) begin
                      if (in[1]) begin
                        if (in[4]) begin
                          out_r = 13'h1ffb;
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1fe3;
                          end else begin
                            out_r = 13'h1f83;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h19f4;
                            end else begin
                              out_r = 13'h1934;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1994;
                            end else begin
                              out_r = 13'h1974;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h19e8;
                            end else begin
                              out_r = 13'h1928;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1988;
                            end else begin
                              out_r = 13'h1968;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[1]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1c9f;
                            end else begin
                              out_r = 13'h1f9f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0c9e;
                            end else begin
                              out_r = 13'h1f9d;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1f87;
                            end else begin
                              out_r = 13'h1f61;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h1f21;
                            end
                          end
                        end
                      end else begin
                        if (in[1]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1cff;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0cfe;
                            end else begin
                              out_r = 13'h1ffd;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1f9f;
                            end else begin
                              out_r = 13'h0779;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h0739;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[1]) begin
                      if (in[4]) begin
                        if (in[6]) begin
                          if (in[12]) begin
                            out_r = 13'h19fb;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1b9f;
                            end else begin
                              out_r = 13'h1999;
                            end
                          end
                        end else begin
                          if (in[12]) begin
                            out_r = 13'h187b;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0b9e;
                            end else begin
                              out_r = 13'h199a;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[12]) begin
                            out_r = 13'h19e3;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1bff;
                            end else begin
                              out_r = 13'h19f9;
                            end
                          end
                        end else begin
                          if (in[12]) begin
                            out_r = 13'h1803;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0bfe;
                            end else begin
                              out_r = 13'h19fa;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[12]) begin
                              out_r = 13'h1874;
                            end else begin
                              out_r = 13'h1e07;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h18f4;
                            end else begin
                              out_r = 13'h1ea1;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[12]) begin
                              out_r = 13'h1814;
                            end else begin
                              out_r = 13'h1e67;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h18b4;
                            end else begin
                              out_r = 13'h1ee1;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[12]) begin
                              out_r = 13'h1868;
                            end else begin
                              out_r = 13'h1e1f;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h18e8;
                            end else begin
                              out_r = 13'h06b9;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[12]) begin
                              out_r = 13'h1808;
                            end else begin
                              out_r = 13'h1e7f;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h18a8;
                            end else begin
                              out_r = 13'h06f9;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[1]) begin
                    if (in[4]) begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[12]) begin
                            out_r = 13'h1fcb;
                          end else begin
                            out_r = 13'h1c7f;
                          end
                        end else begin
                          if (in[12]) begin
                            if (in[6]) begin
                              out_r = 13'h19cb;
                            end else begin
                              out_r = 13'h184b;
                            end
                          end else begin
                            out_r = 13'h1b7f;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[12]) begin
                            out_r = 13'h1f0b;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1f7f;
                            end else begin
                              out_r = 13'h1f7c;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[12]) begin
                              out_r = 13'h190b;
                            end else begin
                              out_r = 13'h1979;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h18cb;
                            end else begin
                              out_r = 13'h197b;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[12]) begin
                            if (in[6]) begin
                              out_r = 13'h1fdb;
                            end else begin
                              out_r = 13'h1fab;
                            end
                          end else begin
                            out_r = 13'h043f;
                          end
                        end else begin
                          if (in[12]) begin
                            if (in[6]) begin
                              out_r = 13'h19db;
                            end else begin
                              out_r = 13'h182b;
                            end
                          end else begin
                            out_r = 13'h033f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1f1b;
                            end else begin
                              out_r = 13'h073f;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h191b;
                            end else begin
                              out_r = 13'h0139;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1f4b;
                            end else begin
                              out_r = 13'h073c;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h188b;
                            end else begin
                              out_r = 13'h013b;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h19c4;
                            end else begin
                              out_r = 13'h19af;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1844;
                            end else begin
                              out_r = 13'h082e;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1904;
                            end else begin
                              out_r = 13'h1949;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h18c4;
                            end else begin
                              out_r = 13'h0888;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h19b4;
                            end else begin
                              out_r = 13'h19df;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1834;
                            end else begin
                              out_r = 13'h085e;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1954;
                            end else begin
                              out_r = 13'h1919;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1894;
                            end else begin
                              out_r = 13'h08d8;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h19d0;
                            end else begin
                              out_r = 13'h19bf;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1850;
                            end else begin
                              out_r = 13'h083e;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1910;
                            end else begin
                              out_r = 13'h0159;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h18d0;
                            end else begin
                              out_r = 13'h1898;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h19a0;
                            end else begin
                              out_r = 13'h19cf;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1820;
                            end else begin
                              out_r = 13'h084e;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1940;
                            end else begin
                              out_r = 13'h0109;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1880;
                            end else begin
                              out_r = 13'h18c8;
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
                if (in[6]) begin
                  if (in[0]) begin
                    if (in[5]) begin
                      if (in[12]) begin
                        if (in[4]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h067f;
                            end else begin
                              out_r = 13'h1e7f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0667;
                            end else begin
                              out_r = 13'h1e67;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h073c;
                            end else begin
                              out_r = 13'h1f3c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0724;
                            end else begin
                              out_r = 13'h1f24;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[7]) begin
                            out_r = 13'h07e4;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h07e4;
                            end else begin
                              out_r = 13'h01e4;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h07e4;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0784;
                            end else begin
                              out_r = 13'h0184;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[12]) begin
                        if (in[4]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h07ff;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h07e7;
                            end else begin
                              out_r = 13'h1fe7;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h06fc;
                            end else begin
                              out_r = 13'h1efc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h06e4;
                            end else begin
                              out_r = 13'h1ee4;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h073c;
                            end else begin
                              out_r = 13'h07fc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h07fc;
                            end else begin
                              out_r = 13'h073c;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h073c;
                            end else begin
                              out_r = 13'h01fc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h079c;
                            end else begin
                              out_r = 13'h017c;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[12]) begin
                            out_r = 13'h11ff;
                          end else begin
                            out_r = 13'h1f95;
                          end
                        end else begin
                          if (in[12]) begin
                            out_r = 13'h1e7f;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ff5;
                            end else begin
                              out_r = 13'h19f5;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[12]) begin
                            out_r = 13'h1273;
                          end else begin
                            out_r = 13'h1e15;
                          end
                        end else begin
                          if (in[12]) begin
                            out_r = 13'h1df3;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e75;
                            end else begin
                              out_r = 13'h1875;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h10f9;
                            end else begin
                              out_r = 13'h1f3b;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1099;
                            end else begin
                              out_r = 13'h1ffb;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1ff9;
                            end else begin
                              out_r = 13'h1f7b;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1f99;
                            end else begin
                              out_r = 13'h199b;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h13f7;
                            end else begin
                              out_r = 13'h1e7b;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1397;
                            end else begin
                              out_r = 13'h1efb;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1cf7;
                            end else begin
                              out_r = 13'h1e1b;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1c97;
                            end else begin
                              out_r = 13'h18bb;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[0]) begin
                    if (in[5]) begin
                      if (in[7]) begin
                        if (in[12]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h0673;
                            end else begin
                              out_r = 13'h1e73;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0730;
                            end else begin
                              out_r = 13'h1f30;
                            end
                          end
                        end else begin
                          out_r = 13'h065c;
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h066f;
                            end else begin
                              out_r = 13'h05dc;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1e6f;
                            end else begin
                              out_r = 13'h02dc;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h072c;
                            end else begin
                              out_r = 13'h05ac;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1f2c;
                            end else begin
                              out_r = 13'h02ac;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[12]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h07f3;
                            end else begin
                              out_r = 13'h1ff3;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h06f0;
                            end else begin
                              out_r = 13'h1ef0;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h070c;
                            end else begin
                              out_r = 13'h07cc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h07cc;
                            end else begin
                              out_r = 13'h070c;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h07ef;
                            end else begin
                              out_r = 13'h040c;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1fef;
                            end else begin
                              out_r = 13'h03cc;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h06ec;
                            end else begin
                              out_r = 13'h04bc;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1eec;
                            end else begin
                              out_r = 13'h035c;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[7]) begin
                        if (in[12]) begin
                          if (in[5]) begin
                            out_r = 13'h10e7;
                          end else begin
                            out_r = 13'h13ef;
                          end
                        end else begin
                          out_r = 13'h1fb5;
                        end
                      end else begin
                        if (in[12]) begin
                          if (in[5]) begin
                            out_r = 13'h1fe7;
                          end else begin
                            out_r = 13'h1cef;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1cc5;
                          end else begin
                            out_r = 13'h1bc5;
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[12]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h11e1;
                            end else begin
                              out_r = 13'h1181;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h126b;
                            end else begin
                              out_r = 13'h120b;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1f0b;
                            end else begin
                              out_r = 13'h1fcb;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fcb;
                            end else begin
                              out_r = 13'h1f0b;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1e61;
                            end else begin
                              out_r = 13'h1c5b;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1e01;
                            end else begin
                              out_r = 13'h1bbb;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1deb;
                            end else begin
                              out_r = 13'h1cbb;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1d8b;
                            end else begin
                              out_r = 13'h1b5b;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[0]) begin
                  if (in[4]) begin
                    if (in[12]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1bff;
                            end else begin
                              out_r = 13'h19ff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h15f9;
                            end else begin
                              out_r = 13'h17f9;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1cff;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h10f9;
                            end else begin
                              out_r = 13'h13f9;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h099e;
                            end else begin
                              out_r = 13'h0b9e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0798;
                            end else begin
                              out_r = 13'h0598;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0f9e;
                            end else begin
                              out_r = 13'h0c9e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0398;
                            end else begin
                              out_r = 13'h0098;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h13f9;
                            end else begin
                              out_r = 13'h1279;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1399;
                            end else begin
                              out_r = 13'h1219;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1339;
                            end else begin
                              out_r = 13'h13f9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13f9;
                            end else begin
                              out_r = 13'h1339;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h13c9;
                            end else begin
                              out_r = 13'h1249;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1309;
                            end else begin
                              out_r = 13'h13c9;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h13f9;
                            end else begin
                              out_r = 13'h1279;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1399;
                            end else begin
                              out_r = 13'h1379;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[12]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1bcf;
                            end else begin
                              out_r = 13'h01cf;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h15c9;
                            end else begin
                              out_r = 13'h0bc9;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1ccf;
                            end else begin
                              out_r = 13'h07cf;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h10c9;
                            end else begin
                              out_r = 13'h0fc9;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h13f7;
                            end else begin
                              out_r = 13'h1277;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1397;
                            end else begin
                              out_r = 13'h1217;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1337;
                            end else begin
                              out_r = 13'h13f7;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13f7;
                            end else begin
                              out_r = 13'h1337;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[12]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h09be;
                            end else begin
                              out_r = 13'h1bbe;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h07b8;
                            end else begin
                              out_r = 13'h11b8;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h13eb;
                            end else begin
                              out_r = 13'h126b;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h132b;
                            end else begin
                              out_r = 13'h13eb;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h0fbe;
                            end else begin
                              out_r = 13'h13d3;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1cbe;
                            end else begin
                              out_r = 13'h1253;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h03b8;
                            end else begin
                              out_r = 13'h13a3;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h14b8;
                            end else begin
                              out_r = 13'h1343;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[5]) begin
                    if (in[12]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h04ff;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1cff;
                            end else begin
                              out_r = 13'h1ce7;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0c3f;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h103f;
                            end else begin
                              out_r = 13'h1027;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h0399;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1b99;
                            end else begin
                              out_r = 13'h1b81;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0979;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1579;
                            end else begin
                              out_r = 13'h1561;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h07e2;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0662;
                            end else begin
                              out_r = 13'h07e2;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0722;
                            end else begin
                              out_r = 13'h07e2;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0662;
                            end else begin
                              out_r = 13'h0722;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h07c4;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0644;
                            end else begin
                              out_r = 13'h07c4;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0734;
                            end else begin
                              out_r = 13'h07f4;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0674;
                            end else begin
                              out_r = 13'h0734;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[12]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h07fc;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1ffc;
                            end else begin
                              out_r = 13'h1fe4;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0f3c;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h133c;
                            end else begin
                              out_r = 13'h1324;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h019b;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h199b;
                            end else begin
                              out_r = 13'h1983;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0b7b;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h177b;
                            end else begin
                              out_r = 13'h1763;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h079a;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h067a;
                            end else begin
                              out_r = 13'h07fa;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h073a;
                            end else begin
                              out_r = 13'h07fa;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h061a;
                            end else begin
                              out_r = 13'h077a;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h0788;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0668;
                            end else begin
                              out_r = 13'h07e8;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0710;
                            end else begin
                              out_r = 13'h07d0;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0620;
                            end else begin
                              out_r = 13'h0740;
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
        if (in[3]) begin
          if (in[11]) begin
            if (in[0]) begin
              if (in[1]) begin
                if (in[2]) begin
                  if (in[6]) begin
                    if (in[5]) begin
                      if (in[4]) begin
                        if (in[8]) begin
                          if (in[12]) begin
                            out_r = 13'h1fff;
                          end else begin
                            out_r = 13'h193f;
                          end
                        end else begin
                          if (in[12]) begin
                            if (in[7]) begin
                              out_r = 13'h13ff;
                            end else begin
                              out_r = 13'h17ff;
                            end
                          end else begin
                            out_r = 13'h1f3f;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[12]) begin
                            out_r = 13'h1f3f;
                          end else begin
                            out_r = 13'h1939;
                          end
                        end else begin
                          if (in[12]) begin
                            if (in[7]) begin
                              out_r = 13'h133f;
                            end else begin
                              out_r = 13'h173f;
                            end
                          end else begin
                            out_r = 13'h1f79;
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[12]) begin
                            out_r = 13'h1e7f;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h19f3;
                            end else begin
                              out_r = 13'h19f7;
                            end
                          end
                        end else begin
                          if (in[12]) begin
                            out_r = 13'h127f;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h1f97;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[12]) begin
                            out_r = 13'h1fff;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h19f9;
                            end
                          end
                        end else begin
                          if (in[12]) begin
                            out_r = 13'h17ff;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1f99;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[8]) begin
                      if (in[12]) begin
                        if (in[7]) begin
                          if (in[4]) begin
                            out_r = 13'h1cff;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1cff;
                            end else begin
                              out_r = 13'h1c3f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1fff;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1e7f;
                            end else begin
                              out_r = 13'h1eff;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          out_r = 13'h18e7;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h186f;
                          end else begin
                            out_r = 13'h1867;
                          end
                        end
                      end
                    end else begin
                      if (in[12]) begin
                        if (in[7]) begin
                          if (in[4]) begin
                            out_r = 13'h13ff;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h13ff;
                            end else begin
                              out_r = 13'h133f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h15ff;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h14ff;
                            end else begin
                              out_r = 13'h147f;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h1eff;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e73;
                            end else begin
                              out_r = 13'h1e7f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1ebf;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e13;
                            end else begin
                              out_r = 13'h1e1f;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[5]) begin
                    if (in[6]) begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[12]) begin
                            out_r = 13'h1ce7;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h07e4;
                            end else begin
                              out_r = 13'h0fe5;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[12]) begin
                              out_r = 13'h1fe1;
                            end else begin
                              out_r = 13'h07fc;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h0f9d;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[12]) begin
                            out_r = 13'h1ce4;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h04e4;
                            end else begin
                              out_r = 13'h0ce5;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[12]) begin
                              out_r = 13'h1fe3;
                            end else begin
                              out_r = 13'h04fc;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1fe4;
                            end else begin
                              out_r = 13'h0c9d;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[12]) begin
                            out_r = 13'h1cff;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h067c;
                            end else begin
                              out_r = 13'h0e7d;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[12]) begin
                              out_r = 13'h1ff9;
                            end else begin
                              out_r = 13'h0664;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h0e05;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[12]) begin
                            out_r = 13'h1cfc;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h05fc;
                            end else begin
                              out_r = 13'h0dfd;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[12]) begin
                              out_r = 13'h1ffb;
                            end else begin
                              out_r = 13'h05e4;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1ffc;
                            end else begin
                              out_r = 13'h0d85;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[12]) begin
                            out_r = 13'h04ef;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h07e7;
                            end else begin
                              out_r = 13'h1fe6;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[12]) begin
                              out_r = 13'h07eb;
                            end else begin
                              out_r = 13'h07ff;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h07ef;
                            end else begin
                              out_r = 13'h1f9e;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[12]) begin
                            out_r = 13'h04ec;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h04e7;
                            end else begin
                              out_r = 13'h1ce6;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[12]) begin
                              out_r = 13'h07e9;
                            end else begin
                              out_r = 13'h04ff;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h07ec;
                            end else begin
                              out_r = 13'h1c9e;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[12]) begin
                            out_r = 13'h04f3;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h067f;
                            end else begin
                              out_r = 13'h1e7e;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[12]) begin
                              out_r = 13'h07f7;
                            end else begin
                              out_r = 13'h0667;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h07f3;
                            end else begin
                              out_r = 13'h1e06;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[12]) begin
                            out_r = 13'h04f0;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h05ff;
                            end else begin
                              out_r = 13'h1dfe;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[12]) begin
                              out_r = 13'h07f5;
                            end else begin
                              out_r = 13'h05e7;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h07f0;
                            end else begin
                              out_r = 13'h1d86;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[2]) begin
                  if (in[8]) begin
                    if (in[6]) begin
                      if (in[5]) begin
                        out_r = 13'h19ff;
                      end else begin
                        if (in[12]) begin
                          if (in[4]) begin
                            out_r = 13'h19ff;
                          end else begin
                            out_r = 13'h19cf;
                          end
                        end else begin
                          out_r = 13'h19cc;
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[12]) begin
                          if (in[7]) begin
                            out_r = 13'h19ff;
                          end else begin
                            out_r = 13'h193f;
                          end
                        end else begin
                          out_r = 13'h199f;
                        end
                      end else begin
                        if (in[12]) begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h199f;
                            end else begin
                              out_r = 13'h197f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h19bf;
                            end else begin
                              out_r = 13'h195f;
                            end
                          end
                        end else begin
                          out_r = 13'h19bc;
                        end
                      end
                    end
                  end else begin
                    if (in[12]) begin
                      if (in[7]) begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h1bff;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1bff;
                            end else begin
                              out_r = 13'h1b9f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1bff;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1bcf;
                            end else begin
                              out_r = 13'h1bbf;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[4]) begin
                            out_r = 13'h1aff;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1aff;
                            end else begin
                              out_r = 13'h1acf;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1a7f;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1a3f;
                            end else begin
                              out_r = 13'h1a1f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h187f;
                          end else begin
                            out_r = 13'h181f;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h184c;
                          end else begin
                            out_r = 13'h183c;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h1867;
                          end else begin
                            out_r = 13'h1807;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h185c;
                          end else begin
                            out_r = 13'h182c;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[5]) begin
                    if (in[6]) begin
                      if (in[7]) begin
                        if (in[12]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1f3c;
                            end else begin
                              out_r = 13'h1f3d;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1c3c;
                            end else begin
                              out_r = 13'h1f3c;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h03fb;
                            end else begin
                              out_r = 13'h02fb;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h03e3;
                            end else begin
                              out_r = 13'h02e3;
                            end
                          end
                        end
                      end else begin
                        if (in[12]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h073c;
                            end else begin
                              out_r = 13'h0f3d;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h043c;
                            end else begin
                              out_r = 13'h073c;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h033b;
                            end else begin
                              out_r = 13'h027b;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0323;
                            end else begin
                              out_r = 13'h0263;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[12]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h13fb;
                            end else begin
                              out_r = 13'h13fa;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h10fb;
                            end else begin
                              out_r = 13'h13fb;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h039b;
                            end else begin
                              out_r = 13'h029b;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0383;
                            end else begin
                              out_r = 13'h0283;
                            end
                          end
                        end
                      end else begin
                        if (in[12]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h0ffb;
                            end else begin
                              out_r = 13'h07fa;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0cfb;
                            end else begin
                              out_r = 13'h0ffb;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h037b;
                            end else begin
                              out_r = 13'h023b;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0363;
                            end else begin
                              out_r = 13'h0223;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[7]) begin
                        if (in[12]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h197f;
                            end else begin
                              out_r = 13'h097e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1b7f;
                            end else begin
                              out_r = 13'h197f;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h03cb;
                            end else begin
                              out_r = 13'h02cb;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h03db;
                            end else begin
                              out_r = 13'h02db;
                            end
                          end
                        end
                      end else begin
                        if (in[12]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h017f;
                            end else begin
                              out_r = 13'h197e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h037f;
                            end else begin
                              out_r = 13'h017f;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h030b;
                            end else begin
                              out_r = 13'h024b;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h031b;
                            end else begin
                              out_r = 13'h025b;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[12]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1799;
                            end else begin
                              out_r = 13'h0798;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1599;
                            end else begin
                              out_r = 13'h1799;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h03bb;
                            end else begin
                              out_r = 13'h02bb;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h03ab;
                            end else begin
                              out_r = 13'h02ab;
                            end
                          end
                        end
                      end else begin
                        if (in[12]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h0b99;
                            end else begin
                              out_r = 13'h1398;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0999;
                            end else begin
                              out_r = 13'h0b99;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h035b;
                            end else begin
                              out_r = 13'h021b;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h034b;
                            end else begin
                              out_r = 13'h020b;
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
                if (in[5]) begin
                  if (in[12]) begin
                    if (in[2]) begin
                      if (in[4]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0ff9;
                            end else begin
                              out_r = 13'h0bf9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0cf9;
                            end else begin
                              out_r = 13'h09f9;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0e79;
                            end else begin
                              out_r = 13'h0a79;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0df9;
                            end else begin
                              out_r = 13'h08f9;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0f99;
                            end else begin
                              out_r = 13'h0b99;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0c99;
                            end else begin
                              out_r = 13'h0999;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0e19;
                            end else begin
                              out_r = 13'h0a19;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0d99;
                            end else begin
                              out_r = 13'h0899;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h1e79;
                          end else begin
                            out_r = 13'h0ff8;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1e77;
                          end else begin
                            out_r = 13'h0ff6;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1879;
                            end else begin
                              out_r = 13'h187b;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h09f8;
                            end else begin
                              out_r = 13'h19fa;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1877;
                            end else begin
                              out_r = 13'h1875;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h09f6;
                            end else begin
                              out_r = 13'h19f4;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[8]) begin
                      if (in[2]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h1f3f;
                          end else begin
                            out_r = 13'h1f27;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1ff3;
                          end else begin
                            out_r = 13'h1fe7;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1ff1;
                            end else begin
                              out_r = 13'h1ffd;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1ffd;
                            end else begin
                              out_r = 13'h1ff1;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1ff3;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[2]) begin
                          if (in[6]) begin
                            out_r = 13'h1c3f;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1cf3;
                            end else begin
                              out_r = 13'h1cff;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1cf1;
                            end else begin
                              out_r = 13'h1cfd;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1cfd;
                            end else begin
                              out_r = 13'h1cf1;
                            end
                          end
                        end
                      end else begin
                        if (in[2]) begin
                          if (in[6]) begin
                            out_r = 13'h1c0f;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1cc3;
                            end else begin
                              out_r = 13'h1ccf;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1cc3;
                            end else begin
                              out_r = 13'h1ccf;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1ccf;
                            end else begin
                              out_r = 13'h1cc3;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[4]) begin
                    if (in[2]) begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[7]) begin
                            if (in[12]) begin
                              out_r = 13'h0f39;
                            end else begin
                              out_r = 13'h1f79;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0c39;
                            end else begin
                              out_r = 13'h1f61;
                            end
                          end
                        end else begin
                          if (in[12]) begin
                            if (in[7]) begin
                              out_r = 13'h0b39;
                            end else begin
                              out_r = 13'h0939;
                            end
                          end else begin
                            out_r = 13'h1c79;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h0ef9;
                            end else begin
                              out_r = 13'h1f93;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0af9;
                            end else begin
                              out_r = 13'h1c93;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h0d79;
                            end else begin
                              out_r = 13'h1f87;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0879;
                            end else begin
                              out_r = 13'h1c9f;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[12]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h1e1f;
                          end else begin
                            out_r = 13'h0f9e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1e13;
                          end else begin
                            out_r = 13'h0f92;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h0f92;
                            end else begin
                              out_r = 13'h0f9e;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0f9e;
                            end else begin
                              out_r = 13'h0f92;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h0c92;
                            end else begin
                              out_r = 13'h0c9e;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0c9e;
                            end else begin
                              out_r = 13'h0c92;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[8]) begin
                      if (in[12]) begin
                        if (in[2]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h0f79;
                            end else begin
                              out_r = 13'h0c79;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0eb9;
                            end else begin
                              out_r = 13'h0d39;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h181f;
                            end else begin
                              out_r = 13'h099e;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1813;
                            end else begin
                              out_r = 13'h0992;
                            end
                          end
                        end
                      end else begin
                        if (in[2]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1f7b;
                            end else begin
                              out_r = 13'h1f63;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1f90;
                            end else begin
                              out_r = 13'h1f84;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1f90;
                            end else begin
                              out_r = 13'h1f9c;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1f9c;
                            end else begin
                              out_r = 13'h1f90;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[12]) begin
                        if (in[2]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h0b79;
                            end else begin
                              out_r = 13'h0979;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0ab9;
                            end else begin
                              out_r = 13'h0839;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h181c;
                            end else begin
                              out_r = 13'h199d;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1810;
                            end else begin
                              out_r = 13'h1991;
                            end
                          end
                        end
                      end else begin
                        if (in[2]) begin
                          if (in[6]) begin
                            out_r = 13'h1c5b;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1cb0;
                            end else begin
                              out_r = 13'h1cbc;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1cb0;
                            end else begin
                              out_r = 13'h1cbc;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1cbc;
                            end else begin
                              out_r = 13'h1cb0;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[12]) begin
                  if (in[2]) begin
                    if (in[8]) begin
                      if (in[4]) begin
                        if (in[6]) begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1f3f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h1f0f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h1f9f;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1f9f;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h1f27;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1f87;
                            end else begin
                              out_r = 13'h1fe7;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1f3f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h1fbf;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[5]) begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h1cff;
                            end else begin
                              out_r = 13'h1c9f;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1ce7;
                            end else begin
                              out_r = 13'h1c87;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h1ccf;
                            end else begin
                              out_r = 13'h1cff;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1cff;
                            end else begin
                              out_r = 13'h1ccf;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h1dff;
                            end else begin
                              out_r = 13'h1dcf;
                            end
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1de7;
                            end else begin
                              out_r = 13'h1dff;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h1d7f;
                            end else begin
                              out_r = 13'h1d3f;
                            end
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1d67;
                            end else begin
                              out_r = 13'h1d1f;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h0f9e;
                          end else begin
                            out_r = 13'h1f9e;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h199d;
                          end else begin
                            out_r = 13'h099d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h1fff;
                          end else begin
                            out_r = 13'h04ff;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h19fc;
                          end else begin
                            out_r = 13'h03fc;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            out_r = 13'h0fbe;
                          end else begin
                            out_r = 13'h0e3e;
                          end
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h19bd;
                          end else begin
                            out_r = 13'h183d;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h1ccf;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1e4f;
                            end else begin
                              out_r = 13'h1dcf;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h19cc;
                            end else begin
                              out_r = 13'h1bcc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h184c;
                            end else begin
                              out_r = 13'h1acc;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[5]) begin
                    if (in[2]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h1d67;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1df3;
                            end else begin
                              out_r = 13'h1dff;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1d61;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1df9;
                            end else begin
                              out_r = 13'h1df7;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          out_r = 13'h1d5c;
                        end else begin
                          if (in[4]) begin
                            if (in[7]) begin
                              out_r = 13'h1dc0;
                            end else begin
                              out_r = 13'h1dcc;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1dcc;
                            end else begin
                              out_r = 13'h1dc0;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[6]) begin
                          out_r = 13'h0dfd;
                        end else begin
                          out_r = 13'h1dce;
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1df0;
                            end else begin
                              out_r = 13'h1dfc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1dfc;
                            end else begin
                              out_r = 13'h1df0;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1dc3;
                            end else begin
                              out_r = 13'h1dcf;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1dcf;
                            end else begin
                              out_r = 13'h1dc3;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[2]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1d7f;
                            end else begin
                              out_r = 13'h1def;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1d79;
                            end else begin
                              out_r = 13'h1de1;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1d4f;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1dd7;
                            end else begin
                              out_r = 13'h1ddf;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h05ff;
                          end else begin
                            out_r = 13'h05e7;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h05cc;
                          end else begin
                            out_r = 13'h05dc;
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[2]) begin
                              out_r = 13'h0d7e;
                            end else begin
                              out_r = 13'h0df2;
                            end
                          end else begin
                            out_r = 13'h0de6;
                          end
                        end else begin
                          if (in[2]) begin
                            if (in[8]) begin
                              out_r = 13'h0d78;
                            end else begin
                              out_r = 13'h0dea;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0dfe;
                            end else begin
                              out_r = 13'h0dee;
                            end
                          end
                        end
                      end else begin
                        if (in[2]) begin
                          if (in[8]) begin
                            out_r = 13'h0d4e;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0dde;
                            end else begin
                              out_r = 13'h0dd6;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1dc1;
                            end else begin
                              out_r = 13'h1ddd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1dcd;
                            end else begin
                              out_r = 13'h1dd5;
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
            if (in[12]) begin
              if (in[0]) begin
                if (in[1]) begin
                  if (in[2]) begin
                    if (in[7]) begin
                      if (in[4]) begin
                        if (in[6]) begin
                          out_r = 13'h1fdf;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1fdf;
                          end else begin
                            out_r = 13'h0fde;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          out_r = 13'h1fdf;
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h13df;
                          end else begin
                            out_r = 13'h03de;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h1fdc;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1fdc;
                            end else begin
                              out_r = 13'h1fdd;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1fdc;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13dc;
                            end else begin
                              out_r = 13'h13dd;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h07dc;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h07dc;
                            end else begin
                              out_r = 13'h0fdd;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h07dc;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0fdc;
                            end else begin
                              out_r = 13'h07dd;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[7]) begin
                        if (in[8]) begin
                          out_r = 13'h07cf;
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h17ce;
                          end else begin
                            out_r = 13'h1fce;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[8]) begin
                            out_r = 13'h19ff;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h07fe;
                            end else begin
                              out_r = 13'h09fe;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1fff;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h03fe;
                            end else begin
                              out_r = 13'h0ffe;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h070f;
                          end else begin
                            out_r = 13'h170e;
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h193f;
                            end else begin
                              out_r = 13'h073e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h033e;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h040f;
                          end else begin
                            out_r = 13'h1c0e;
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1b3f;
                            end else begin
                              out_r = 13'h0b3e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1c3f;
                            end else begin
                              out_r = 13'h0c3e;
                            end
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
                          out_r = 13'h1ffc;
                        end else begin
                          out_r = 13'h139c;
                        end
                      end else begin
                        if (in[6]) begin
                          out_r = 13'h19fc;
                        end else begin
                          out_r = 13'h179c;
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          out_r = 13'h1cfc;
                        end else begin
                          out_r = 13'h109c;
                        end
                      end else begin
                        if (in[6]) begin
                          out_r = 13'h1bfc;
                        end else begin
                          out_r = 13'h159c;
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h07ff;
                            end else begin
                              out_r = 13'h04ff;
                            end
                          end else begin
                            out_r = 13'h07ff;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1e73;
                            end else begin
                              out_r = 13'h1df3;
                            end
                          end else begin
                            out_r = 13'h1e73;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h0f39;
                            end else begin
                              out_r = 13'h0c39;
                            end
                          end else begin
                            out_r = 13'h0f39;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h12f7;
                            end else begin
                              out_r = 13'h1177;
                            end
                          end else begin
                            out_r = 13'h12f7;
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h019f;
                            end else begin
                              out_r = 13'h039f;
                            end
                          end else begin
                            out_r = 13'h019f;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1813;
                            end else begin
                              out_r = 13'h1a93;
                            end
                          end else begin
                            out_r = 13'h1813;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h0b79;
                            end else begin
                              out_r = 13'h0979;
                            end
                          end else begin
                            out_r = 13'h0b79;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h16b7;
                            end else begin
                              out_r = 13'h1437;
                            end
                          end else begin
                            out_r = 13'h16b7;
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[1]) begin
                  if (in[2]) begin
                    if (in[5]) begin
                      if (in[8]) begin
                        if (in[6]) begin
                          out_r = 13'h1f87;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h1f87;
                          end else begin
                            out_r = 13'h0787;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          out_r = 13'h1f84;
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1f85;
                          end else begin
                            out_r = 13'h0f85;
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h1fe7;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1fe4;
                            end else begin
                              out_r = 13'h1fe5;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h13e7;
                            end else begin
                              out_r = 13'h13e4;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0fe7;
                            end else begin
                              out_r = 13'h07e5;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h19e7;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h19e4;
                            end else begin
                              out_r = 13'h19e5;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h17e7;
                            end else begin
                              out_r = 13'h17e4;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0be7;
                            end else begin
                              out_r = 13'h03e5;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h03e6;
                          end else begin
                            out_r = 13'h13e7;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h14fe;
                            end else begin
                              out_r = 13'h0cff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h17fe;
                            end else begin
                              out_r = 13'h0fff;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h0fe6;
                          end else begin
                            out_r = 13'h1fe7;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1cfe;
                            end else begin
                              out_r = 13'h04ff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1ffe;
                            end else begin
                              out_r = 13'h07ff;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h0320;
                          end else begin
                            out_r = 13'h1721;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1438;
                            end else begin
                              out_r = 13'h0939;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1738;
                            end else begin
                              out_r = 13'h0b39;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h0f20;
                          end else begin
                            out_r = 13'h1921;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1c38;
                            end else begin
                              out_r = 13'h0339;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f38;
                            end else begin
                              out_r = 13'h0139;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[6]) begin
                    if (in[2]) begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h1fe7;
                          end else begin
                            out_r = 13'h0fe6;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h13e7;
                          end else begin
                            out_r = 13'h17e6;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h0ffe;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13ff;
                            end else begin
                              out_r = 13'h17fe;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1cff;
                            end else begin
                              out_r = 13'h0cfe;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h10ff;
                            end else begin
                              out_r = 13'h14fe;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h03fe;
                            end else begin
                              out_r = 13'h13ff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h03f8;
                            end else begin
                              out_r = 13'h13f9;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h17cf;
                            end else begin
                              out_r = 13'h07ce;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h17c9;
                            end else begin
                              out_r = 13'h07c8;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h00fe;
                            end else begin
                              out_r = 13'h10ff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h00f8;
                            end else begin
                              out_r = 13'h10f9;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h15cf;
                            end else begin
                              out_r = 13'h05ce;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h15c9;
                            end else begin
                              out_r = 13'h05c8;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[5]) begin
                        if (in[8]) begin
                          out_r = 13'h1fdf;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h0fde;
                          end else begin
                            out_r = 13'h1fde;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[8]) begin
                            out_r = 13'h19cf;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h09ce;
                            end else begin
                              out_r = 13'h19ce;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1bcf;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0bce;
                            end else begin
                              out_r = 13'h1bce;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1f9d;
                            end else begin
                              out_r = 13'h1f9c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f9a;
                            end else begin
                              out_r = 13'h1f9b;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h19bc;
                            end else begin
                              out_r = 13'h19bd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19bb;
                            end else begin
                              out_r = 13'h19ba;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1c9d;
                            end else begin
                              out_r = 13'h1c9c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1c9a;
                            end else begin
                              out_r = 13'h1c9b;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h1bbc;
                            end else begin
                              out_r = 13'h1bbd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1bbb;
                            end else begin
                              out_r = 13'h1bba;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[2]) begin
                if (in[0]) begin
                  if (in[1]) begin
                    if (in[7]) begin
                      if (in[8]) begin
                        if (in[4]) begin
                          out_r = 13'h0fff;
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h0fff;
                          end else begin
                            out_r = 13'h0f9f;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          out_r = 13'h0bff;
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h0a7f;
                          end else begin
                            out_r = 13'h0a1f;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h0cff;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h0cff;
                            end else begin
                              out_r = 13'h0c9f;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h09ff;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h08ff;
                            end else begin
                              out_r = 13'h089f;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h0c3f;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h0c3f;
                            end else begin
                              out_r = 13'h0c7f;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h093f;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h087f;
                            end else begin
                              out_r = 13'h083f;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h09fc;
                            end else begin
                              out_r = 13'h08fc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h093c;
                            end else begin
                              out_r = 13'h087c;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h099c;
                            end else begin
                              out_r = 13'h089c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h097c;
                            end else begin
                              out_r = 13'h083c;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h09cc;
                            end else begin
                              out_r = 13'h08cc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h090c;
                            end else begin
                              out_r = 13'h084c;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h09bc;
                            end else begin
                              out_r = 13'h08bc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h095c;
                            end else begin
                              out_r = 13'h081c;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h09e4;
                            end else begin
                              out_r = 13'h08e4;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0924;
                            end else begin
                              out_r = 13'h0864;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h0984;
                            end else begin
                              out_r = 13'h0884;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0964;
                            end else begin
                              out_r = 13'h0824;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h09dc;
                            end else begin
                              out_r = 13'h08dc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h091c;
                            end else begin
                              out_r = 13'h085c;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h09ac;
                            end else begin
                              out_r = 13'h08ac;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h094c;
                            end else begin
                              out_r = 13'h080c;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[8]) begin
                    if (in[1]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          out_r = 13'h13fe;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h13fe;
                          end else begin
                            out_r = 13'h133e;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h13fe;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h139e;
                            end else begin
                              out_r = 13'h137e;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h13ce;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h13be;
                            end else begin
                              out_r = 13'h135e;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          out_r = 13'h11fe;
                        end else begin
                          if (in[7]) begin
                            out_r = 13'h11fe;
                          end else begin
                            out_r = 13'h119e;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[6]) begin
                            out_r = 13'h11fe;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h11ce;
                            end else begin
                              out_r = 13'h11be;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h11e6;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h11de;
                            end else begin
                              out_r = 13'h11ae;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[7]) begin
                      if (in[1]) begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h11fe;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h11fe;
                            end else begin
                              out_r = 13'h119e;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h11fe;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h11ce;
                            end else begin
                              out_r = 13'h11be;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h10fe;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h10fe;
                            end else begin
                              out_r = 13'h10ce;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h10fe;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h10e6;
                            end else begin
                              out_r = 13'h10de;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[1]) begin
                          if (in[4]) begin
                            out_r = 13'h10fe;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h10fe;
                            end else begin
                              out_r = 13'h10ce;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            out_r = 13'h107e;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h107e;
                            end else begin
                              out_r = 13'h1066;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[1]) begin
                            out_r = 13'h107e;
                          end else begin
                            out_r = 13'h103e;
                          end
                        end else begin
                          if (in[1]) begin
                            if (in[4]) begin
                              out_r = 13'h103e;
                            end else begin
                              out_r = 13'h101e;
                            end
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h101e;
                            end else begin
                              out_r = 13'h100e;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[7]) begin
                  if (in[8]) begin
                    if (in[0]) begin
                      if (in[1]) begin
                        if (in[4]) begin
                          out_r = 13'h1bff;
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1bf9;
                          end else begin
                            out_r = 13'h1be1;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h17ff;
                          end else begin
                            out_r = 13'h1799;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h17cc;
                          end else begin
                            out_r = 13'h17bb;
                          end
                        end
                      end
                    end else begin
                      if (in[1]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h03ff;
                          end else begin
                            out_r = 13'h039f;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h03f9;
                          end else begin
                            out_r = 13'h0399;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h1bff;
                            end else begin
                              out_r = 13'h1b9c;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h0bce;
                            end else begin
                              out_r = 13'h1bbd;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h03e7;
                            end else begin
                              out_r = 13'h0384;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1bde;
                            end else begin
                              out_r = 13'h0bad;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[0]) begin
                        if (in[1]) begin
                          if (in[4]) begin
                            out_r = 13'h1aff;
                          end else begin
                            out_r = 13'h1af9;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h167f;
                            end else begin
                              out_r = 13'h164c;
                            end
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1667;
                            end else begin
                              out_r = 13'h165c;
                            end
                          end
                        end
                      end else begin
                        if (in[1]) begin
                          if (in[5]) begin
                            out_r = 13'h02ff;
                          end else begin
                            out_r = 13'h02c9;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h1aff;
                            end else begin
                              out_r = 13'h0ace;
                            end
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h02e7;
                            end else begin
                              out_r = 13'h1ade;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[0]) begin
                        if (in[1]) begin
                          if (in[4]) begin
                            out_r = 13'h1a9f;
                          end else begin
                            out_r = 13'h1a81;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h1619;
                            end else begin
                              out_r = 13'h163b;
                            end
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1601;
                            end else begin
                              out_r = 13'h162b;
                            end
                          end
                        end
                      end else begin
                        if (in[1]) begin
                          if (in[5]) begin
                            out_r = 13'h029f;
                          end else begin
                            out_r = 13'h02b9;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[5]) begin
                              out_r = 13'h1a9c;
                            end else begin
                              out_r = 13'h1abd;
                            end
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h0284;
                            end else begin
                              out_r = 13'h0aad;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[8]) begin
                    if (in[0]) begin
                      if (in[1]) begin
                        if (in[4]) begin
                          if (in[5]) begin
                            out_r = 13'h1b3f;
                          end else begin
                            out_r = 13'h1b0f;
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h1b39;
                            end else begin
                              out_r = 13'h1b21;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1b09;
                            end else begin
                              out_r = 13'h1b19;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h173f;
                          end else begin
                            out_r = 13'h1779;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h170c;
                          end else begin
                            out_r = 13'h175b;
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[1]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h033f;
                            end else begin
                              out_r = 13'h037f;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h0339;
                            end else begin
                              out_r = 13'h0379;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h1b39;
                            end else begin
                              out_r = 13'h1b7b;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h0b08;
                            end else begin
                              out_r = 13'h1b5a;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[1]) begin
                            if (in[5]) begin
                              out_r = 13'h0327;
                            end else begin
                              out_r = 13'h0321;
                            end
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h0321;
                            end else begin
                              out_r = 13'h1b18;
                            end
                          end
                        end else begin
                          if (in[1]) begin
                            if (in[5]) begin
                              out_r = 13'h0367;
                            end else begin
                              out_r = 13'h0361;
                            end
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h0363;
                            end else begin
                              out_r = 13'h0b4a;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[6]) begin
                        if (in[0]) begin
                          if (in[1]) begin
                            if (in[4]) begin
                              out_r = 13'h1a7f;
                            end else begin
                              out_r = 13'h1a79;
                            end
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h16ff;
                            end else begin
                              out_r = 13'h16e7;
                            end
                          end
                        end else begin
                          if (in[1]) begin
                            if (in[4]) begin
                              out_r = 13'h027f;
                            end else begin
                              out_r = 13'h0267;
                            end
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1a79;
                            end else begin
                              out_r = 13'h0261;
                            end
                          end
                        end
                      end else begin
                        if (in[0]) begin
                          if (in[1]) begin
                            if (in[4]) begin
                              out_r = 13'h1a3f;
                            end else begin
                              out_r = 13'h1a21;
                            end
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h16b9;
                            end else begin
                              out_r = 13'h16a1;
                            end
                          end
                        end else begin
                          if (in[1]) begin
                            if (in[4]) begin
                              out_r = 13'h023f;
                            end else begin
                              out_r = 13'h0227;
                            end
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h1a3b;
                            end else begin
                              out_r = 13'h0223;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[0]) begin
                        if (in[1]) begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h1a4f;
                            end else begin
                              out_r = 13'h1a1f;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1a49;
                            end else begin
                              out_r = 13'h1a09;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h16cc;
                            end else begin
                              out_r = 13'h169b;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h16dc;
                            end else begin
                              out_r = 13'h168b;
                            end
                          end
                        end
                      end else begin
                        if (in[1]) begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h0249;
                            end else begin
                              out_r = 13'h0219;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h0259;
                            end else begin
                              out_r = 13'h0209;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[6]) begin
                              out_r = 13'h0a48;
                            end else begin
                              out_r = 13'h1a1a;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1a58;
                            end else begin
                              out_r = 13'h0a0a;
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
          if (in[1]) begin
            if (in[12]) begin
              if (in[2]) begin
                if (in[7]) begin
                  if (in[11]) begin
                    if (in[0]) begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h1efc;
                          end else begin
                            out_r = 13'h1efb;
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1ebc;
                          end else begin
                            out_r = 13'h1efc;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[4]) begin
                            out_r = 13'h1e64;
                          end else begin
                            out_r = 13'h1e63;
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1e04;
                          end else begin
                            out_r = 13'h1e64;
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0f3e;
                            end else begin
                              out_r = 13'h0f0e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0ffe;
                            end else begin
                              out_r = 13'h0fce;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0f7e;
                            end else begin
                              out_r = 13'h0f5e;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f9e;
                            end else begin
                              out_r = 13'h0fbe;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h093e;
                            end else begin
                              out_r = 13'h193d;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h09fe;
                            end else begin
                              out_r = 13'h19fd;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h097e;
                            end else begin
                              out_r = 13'h197d;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h099e;
                            end else begin
                              out_r = 13'h199d;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[0]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h17fe;
                            end else begin
                              out_r = 13'h0fff;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h07ff;
                            end else begin
                              out_r = 13'h1ffe;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h13fe;
                            end else begin
                              out_r = 13'h0bfc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h093e;
                            end else begin
                              out_r = 13'h193c;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[0]) begin
                            if (in[6]) begin
                              out_r = 13'h033e;
                            end else begin
                              out_r = 13'h1f3f;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1ffe;
                            end else begin
                              out_r = 13'h033e;
                            end
                          end
                        end else begin
                          if (in[0]) begin
                            if (in[6]) begin
                              out_r = 13'h173f;
                            end else begin
                              out_r = 13'h093e;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h07fc;
                            end else begin
                              out_r = 13'h133c;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[0]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1f9e;
                            end else begin
                              out_r = 13'h079f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f9f;
                            end else begin
                              out_r = 13'h179e;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h0f7e;
                            end else begin
                              out_r = 13'h197f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h137f;
                            end else begin
                              out_r = 13'h077e;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h17fe;
                            end else begin
                              out_r = 13'h0cfc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f3e;
                            end else begin
                              out_r = 13'h1c3c;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h19fe;
                            end else begin
                              out_r = 13'h03fc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h073e;
                            end else begin
                              out_r = 13'h153c;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[6]) begin
                    if (in[11]) begin
                      if (in[4]) begin
                        if (in[8]) begin
                          if (in[0]) begin
                            out_r = 13'h1f0f;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1f3f;
                            end else begin
                              out_r = 13'h1f7f;
                            end
                          end
                        end else begin
                          if (in[0]) begin
                            if (in[5]) begin
                              out_r = 13'h1f5f;
                            end else begin
                              out_r = 13'h1f0f;
                            end
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1f0f;
                            end else begin
                              out_r = 13'h1f5f;
                            end
                          end
                        end
                      end else begin
                        if (in[0]) begin
                          if (in[8]) begin
                            out_r = 13'h1f39;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1f7f;
                            end else begin
                              out_r = 13'h1f3f;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h193f;
                            end else begin
                              out_r = 13'h193c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h197f;
                            end else begin
                              out_r = 13'h197c;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[0]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h10fd;
                            end else begin
                              out_r = 13'h10fc;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f9d;
                            end else begin
                              out_r = 13'h1f9c;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h17ff;
                            end else begin
                              out_r = 13'h17fd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13ff;
                            end else begin
                              out_r = 13'h10fd;
                            end
                          end
                        end
                      end else begin
                        if (in[0]) begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h043d;
                            end else begin
                              out_r = 13'h093c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f7d;
                            end else begin
                              out_r = 13'h017c;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1ffd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h1bfd;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[0]) begin
                      if (in[4]) begin
                        if (in[11]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1fdf;
                            end else begin
                              out_r = 13'h1faf;
                            end
                          end else begin
                            out_r = 13'h1fdf;
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1cfc;
                            end else begin
                              out_r = 13'h1cfd;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h043c;
                            end else begin
                              out_r = 13'h0b3d;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            out_r = 13'h1fe1;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h139c;
                            end else begin
                              out_r = 13'h0f7c;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[11]) begin
                              out_r = 13'h1f87;
                            end else begin
                              out_r = 13'h139d;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h037d;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[5]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h013f;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1fcf;
                            end else begin
                              out_r = 13'h093d;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1f9f;
                            end else begin
                              out_r = 13'h0f3f;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1fbf;
                            end else begin
                              out_r = 13'h073d;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h073f;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h19fc;
                            end else begin
                              out_r = 13'h0c3d;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h199f;
                            end else begin
                              out_r = 13'h0b3f;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h199c;
                            end else begin
                              out_r = 13'h013d;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[0]) begin
                  if (in[8]) begin
                    if (in[4]) begin
                      if (in[6]) begin
                        if (in[5]) begin
                          if (in[7]) begin
                            if (in[11]) begin
                              out_r = 13'h1ffc;
                            end else begin
                              out_r = 13'h1cfc;
                            end
                          end else begin
                            out_r = 13'h1cfc;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[7]) begin
                              out_r = 13'h1f3c;
                            end else begin
                              out_r = 13'h1c3c;
                            end
                          end else begin
                            out_r = 13'h1dfc;
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[5]) begin
                            if (in[7]) begin
                              out_r = 13'h1e7c;
                            end else begin
                              out_r = 13'h1ffc;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1ffc;
                            end else begin
                              out_r = 13'h1e7c;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h1fe4;
                          end else begin
                            out_r = 13'h1e64;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[11]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1fcc;
                            end else begin
                              out_r = 13'h1ccc;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1e4c;
                            end else begin
                              out_r = 13'h1fcc;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1f3c;
                          end else begin
                            out_r = 13'h1c24;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[11]) begin
                            if (in[7]) begin
                              out_r = 13'h1fbc;
                            end else begin
                              out_r = 13'h1cbc;
                            end
                          end else begin
                            out_r = 13'h1efc;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[7]) begin
                              out_r = 13'h1f5c;
                            end else begin
                              out_r = 13'h1e9c;
                            end
                          end else begin
                            out_r = 13'h1d64;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[11]) begin
                        if (in[7]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h13fc;
                            end else begin
                              out_r = 13'h127c;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h133c;
                            end else begin
                              out_r = 13'h13fc;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h17fc;
                            end else begin
                              out_r = 13'h15fc;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h173c;
                            end else begin
                              out_r = 13'h14fc;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h1cfd;
                          end else begin
                            out_r = 13'h1fe5;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h1dfd;
                          end else begin
                            out_r = 13'h1e65;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[11]) begin
                            if (in[7]) begin
                              out_r = 13'h13cc;
                            end else begin
                              out_r = 13'h17cc;
                            end
                          end else begin
                            out_r = 13'h1f3d;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[7]) begin
                              out_r = 13'h124c;
                            end else begin
                              out_r = 13'h15cc;
                            end
                          end else begin
                            out_r = 13'h1c25;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[11]) begin
                            if (in[7]) begin
                              out_r = 13'h13bc;
                            end else begin
                              out_r = 13'h17bc;
                            end
                          end else begin
                            out_r = 13'h1efd;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[7]) begin
                              out_r = 13'h135c;
                            end else begin
                              out_r = 13'h141c;
                            end
                          end else begin
                            out_r = 13'h1d65;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[4]) begin
                    if (in[8]) begin
                      if (in[11]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h03e6;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h03e6;
                            end else begin
                              out_r = 13'h0266;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h03e6;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h0326;
                            end else begin
                              out_r = 13'h02e6;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h199f;
                            end else begin
                              out_r = 13'h019f;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h181f;
                            end else begin
                              out_r = 13'h001f;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h1f79;
                            end else begin
                              out_r = 13'h0779;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1eb9;
                            end else begin
                              out_r = 13'h06b9;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[11]) begin
                          if (in[5]) begin
                            out_r = 13'h07e6;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h07e6;
                            end else begin
                              out_r = 13'h0726;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h0fbe;
                            end else begin
                              out_r = 13'h0e3e;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h0958;
                            end else begin
                              out_r = 13'h0898;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[11]) begin
                            out_r = 13'h05e6;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h1fbe;
                            end else begin
                              out_r = 13'h1958;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[11]) begin
                              out_r = 13'h04e6;
                            end else begin
                              out_r = 13'h1e3e;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h0466;
                            end else begin
                              out_r = 13'h1898;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[8]) begin
                        if (in[11]) begin
                          if (in[6]) begin
                            out_r = 13'h03de;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h03de;
                            end else begin
                              out_r = 13'h025e;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[7]) begin
                              out_r = 13'h19ff;
                            end else begin
                              out_r = 13'h01ff;
                            end
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h187f;
                            end else begin
                              out_r = 13'h007f;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[11]) begin
                            out_r = 13'h07de;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h0fce;
                            end else begin
                              out_r = 13'h0e4e;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[11]) begin
                              out_r = 13'h05de;
                            end else begin
                              out_r = 13'h1fce;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h04de;
                            end else begin
                              out_r = 13'h1e4e;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            out_r = 13'h03ae;
                          end else begin
                            if (in[7]) begin
                              out_r = 13'h1f39;
                            end else begin
                              out_r = 13'h0739;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[11]) begin
                              out_r = 13'h07ae;
                            end else begin
                              out_r = 13'h0908;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h05ae;
                            end else begin
                              out_r = 13'h1908;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h034e;
                            end else begin
                              out_r = 13'h1ef9;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h074e;
                            end else begin
                              out_r = 13'h08c8;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h028e;
                            end else begin
                              out_r = 13'h06f9;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h040e;
                            end else begin
                              out_r = 13'h18c8;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (in[0]) begin
                if (in[5]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[6]) begin
                        if (in[11]) begin
                          if (in[8]) begin
                            out_r = 13'h0f98;
                          end else begin
                            out_r = 13'h039e;
                          end
                        end else begin
                          out_r = 13'h19f3;
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[8]) begin
                            out_r = 13'h1c9f;
                          end else begin
                            out_r = 13'h1099;
                          end
                        end else begin
                          out_r = 13'h1993;
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[11]) begin
                          if (in[8]) begin
                            out_r = 13'h1f79;
                          end else begin
                            out_r = 13'h1f7f;
                          end
                        end else begin
                          out_r = 13'h17ef;
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[8]) begin
                            out_r = 13'h0c7e;
                          end else begin
                            out_r = 13'h0c78;
                          end
                        end else begin
                          out_r = 13'h178f;
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            out_r = 13'h1b8f;
                          end else begin
                            out_r = 13'h07f9;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[4]) begin
                              out_r = 13'h1b93;
                            end else begin
                              out_r = 13'h1593;
                            end
                          end else begin
                            out_r = 13'h0ff9;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            out_r = 13'h1c84;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h01f9;
                            end else begin
                              out_r = 13'h0139;
                            end
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[11]) begin
                              out_r = 13'h1c9c;
                            end else begin
                              out_r = 13'h0bf9;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h109c;
                            end else begin
                              out_r = 13'h0b39;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[4]) begin
                              out_r = 13'h198f;
                            end else begin
                              out_r = 13'h098e;
                            end
                          end else begin
                            out_r = 13'h0499;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[4]) begin
                              out_r = 13'h1997;
                            end else begin
                              out_r = 13'h0796;
                            end
                          end else begin
                            out_r = 13'h0c99;
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1f84;
                            end else begin
                              out_r = 13'h0399;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1f9b;
                            end else begin
                              out_r = 13'h0999;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h1f85;
                            end else begin
                              out_r = 13'h0379;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h139a;
                            end else begin
                              out_r = 13'h0979;
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
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h1f98;
                          end else begin
                            out_r = 13'h179e;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h049f;
                          end else begin
                            out_r = 13'h0c99;
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            out_r = 13'h0779;
                          end else begin
                            out_r = 13'h077f;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h1c7e;
                          end else begin
                            out_r = 13'h1c78;
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h038f;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h0393;
                            end else begin
                              out_r = 13'h0993;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0487;
                          end else begin
                            if (in[4]) begin
                              out_r = 13'h049f;
                            end else begin
                              out_r = 13'h0c9f;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h018f;
                            end else begin
                              out_r = 13'h0197;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0787;
                            end else begin
                              out_r = 13'h0799;
                            end
                          end
                        end else begin
                          if (in[7]) begin
                            if (in[8]) begin
                              out_r = 13'h198e;
                            end else begin
                              out_r = 13'h1396;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1f86;
                            end else begin
                              out_r = 13'h1798;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[4]) begin
                        if (in[6]) begin
                          out_r = 13'h01c3;
                        end else begin
                          out_r = 13'h01b3;
                        end
                      end else begin
                        if (in[6]) begin
                          out_r = 13'h0bd7;
                        end else begin
                          out_r = 13'h0ba7;
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h07c9;
                          end else begin
                            out_r = 13'h0e49;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h01c9;
                            end else begin
                              out_r = 13'h0a49;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0109;
                            end else begin
                              out_r = 13'h0ac9;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            out_r = 13'h04b9;
                          end else begin
                            out_r = 13'h0db9;
                          end
                        end else begin
                          if (in[4]) begin
                            if (in[8]) begin
                              out_r = 13'h03b9;
                            end else begin
                              out_r = 13'h08b9;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0359;
                            end else begin
                              out_r = 13'h0819;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[4]) begin
                  if (in[2]) begin
                    if (in[5]) begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h13cc;
                            end else begin
                              out_r = 13'h17cf;
                            end
                          end else begin
                            out_r = 13'h1cf3;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h10cc;
                            end else begin
                              out_r = 13'h15cf;
                            end
                          end else begin
                            out_r = 13'h0cf2;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h0fcb;
                            end else begin
                              out_r = 13'h0bc9;
                            end
                          end else begin
                            out_r = 13'h0493;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h0ccb;
                            end else begin
                              out_r = 13'h09c9;
                            end
                          end else begin
                            out_r = 13'h1c92;
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[7]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h1f0f;
                            end else begin
                              out_r = 13'h190c;
                            end
                          end else begin
                            out_r = 13'h10c3;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h1c0f;
                            end else begin
                              out_r = 13'h1b0c;
                            end
                          end else begin
                            out_r = 13'h00c2;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h0709;
                            end else begin
                              out_r = 13'h010b;
                            end
                          end else begin
                            out_r = 13'h0cb3;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h0409;
                            end else begin
                              out_r = 13'h030b;
                            end
                          end else begin
                            out_r = 13'h14b2;
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[7]) begin
                        if (in[11]) begin
                          if (in[6]) begin
                            out_r = 13'h1fc3;
                          end else begin
                            out_r = 13'h0647;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h17f8;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h13f8;
                            end else begin
                              out_r = 13'h1278;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[6]) begin
                            out_r = 13'h0cce;
                          end else begin
                            out_r = 13'h1dc8;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h14f8;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h11f8;
                            end else begin
                              out_r = 13'h10f8;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[7]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[6]) begin
                              out_r = 13'h13c3;
                            end else begin
                              out_r = 13'h0e47;
                            end
                          end else begin
                            out_r = 13'h17c8;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[11]) begin
                              out_r = 13'h13c0;
                            end else begin
                              out_r = 13'h13c8;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h0e45;
                            end else begin
                              out_r = 13'h1248;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[6]) begin
                              out_r = 13'h00ce;
                            end else begin
                              out_r = 13'h15c8;
                            end
                          end else begin
                            out_r = 13'h1408;
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[11]) begin
                              out_r = 13'h10cd;
                            end else begin
                              out_r = 13'h1108;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h05ca;
                            end else begin
                              out_r = 13'h1048;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[6]) begin
                    if (in[7]) begin
                      if (in[2]) begin
                        if (in[5]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h13bc;
                            end else begin
                              out_r = 13'h13bf;
                            end
                          end else begin
                            out_r = 13'h1bef;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h1f5f;
                            end else begin
                              out_r = 13'h1f5c;
                            end
                          end else begin
                            out_r = 13'h15d7;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h19b3;
                            end else begin
                              out_r = 13'h17e0;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h1fb3;
                            end else begin
                              out_r = 13'h13e0;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h17b3;
                            end else begin
                              out_r = 13'h17d8;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h13b0;
                            end else begin
                              out_r = 13'h13d8;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[11]) begin
                        if (in[2]) begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h10bc;
                            end else begin
                              out_r = 13'h10bf;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1c5f;
                            end else begin
                              out_r = 13'h1c5c;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h1bbf;
                            end else begin
                              out_r = 13'h1cbf;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h15bf;
                            end else begin
                              out_r = 13'h10bc;
                            end
                          end
                        end
                      end else begin
                        if (in[2]) begin
                          if (in[5]) begin
                            out_r = 13'h0bee;
                          end else begin
                            out_r = 13'h05d6;
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[8]) begin
                              out_r = 13'h14e0;
                            end else begin
                              out_r = 13'h11e0;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1418;
                            end else begin
                              out_r = 13'h1118;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[2]) begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h0fbb;
                            end else begin
                              out_r = 13'h0fb9;
                            end
                          end else begin
                            out_r = 13'h038f;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h0cbb;
                            end else begin
                              out_r = 13'h0cb9;
                            end
                          end else begin
                            out_r = 13'h1b8e;
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h0759;
                            end else begin
                              out_r = 13'h075b;
                            end
                          end else begin
                            out_r = 13'h09a7;
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[8]) begin
                              out_r = 13'h0459;
                            end else begin
                              out_r = 13'h045b;
                            end
                          end else begin
                            out_r = 13'h11a6;
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h0037;
                            end else begin
                              out_r = 13'h1780;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h0637;
                            end else begin
                              out_r = 13'h1200;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h02b9;
                            end else begin
                              out_r = 13'h1480;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h05b9;
                            end else begin
                              out_r = 13'h1080;
                            end
                          end
                        end
                      end else begin
                        if (in[7]) begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h0a37;
                            end else begin
                              out_r = 13'h17a8;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h0e35;
                            end else begin
                              out_r = 13'h1228;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[11]) begin
                              out_r = 13'h08b9;
                            end else begin
                              out_r = 13'h1448;
                            end
                          end else begin
                            if (in[11]) begin
                              out_r = 13'h0dbb;
                            end else begin
                              out_r = 13'h1008;
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
            if (in[7]) begin
              if (in[2]) begin
                if (in[6]) begin
                  if (in[5]) begin
                    if (in[11]) begin
                      if (in[0]) begin
                        if (in[4]) begin
                          if (in[12]) begin
                            out_r = 13'h07cf;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h03fe;
                            end else begin
                              out_r = 13'h10e7;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1ffe;
                            end else begin
                              out_r = 13'h13ff;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h07ff;
                            end else begin
                              out_r = 13'h03e6;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1de7;
                            end else begin
                              out_r = 13'h1fff;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1e6f;
                            end else begin
                              out_r = 13'h07ff;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h04df;
                            end else begin
                              out_r = 13'h0ffe;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1fd7;
                            end else begin
                              out_r = 13'h1e66;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[0]) begin
                        if (in[4]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h15f0;
                            end else begin
                              out_r = 13'h1ff0;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h14f0;
                            end else begin
                              out_r = 13'h1e70;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h15ec;
                            end else begin
                              out_r = 13'h1cec;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h14ec;
                            end else begin
                              out_r = 13'h1dec;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h03f9;
                            end else begin
                              out_r = 13'h1ff1;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0bf8;
                            end else begin
                              out_r = 13'h0ff1;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h0079;
                            end else begin
                              out_r = 13'h1fed;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0878;
                            end else begin
                              out_r = 13'h0e6d;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[0]) begin
                      if (in[4]) begin
                        if (in[11]) begin
                          if (in[12]) begin
                            out_r = 13'h01bf;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h079e;
                            end else begin
                              out_r = 13'h1587;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h15c0;
                            end else begin
                              out_r = 13'h19f0;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h14c0;
                            end else begin
                              out_r = 13'h1870;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h199e;
                            end else begin
                              out_r = 13'h179f;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h15d4;
                            end else begin
                              out_r = 13'h1bec;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h019f;
                            end else begin
                              out_r = 13'h0786;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h14d4;
                            end else begin
                              out_r = 13'h1aec;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[4]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h1e67;
                            end else begin
                              out_r = 13'h1ccc;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h07f9;
                            end else begin
                              out_r = 13'h1cc1;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h1def;
                            end else begin
                              out_r = 13'h04cc;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0ff8;
                            end else begin
                              out_r = 13'h0cc1;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h07df;
                            end else begin
                              out_r = 13'h1ccd;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h05f9;
                            end else begin
                              out_r = 13'h1cd5;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h1cd7;
                            end else begin
                              out_r = 13'h0ddd;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0df8;
                            end else begin
                              out_r = 13'h0dd5;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[0]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[11]) begin
                          if (in[12]) begin
                            out_r = 13'h07c9;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0f38;
                            end else begin
                              out_r = 13'h1c21;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1590;
                            end else begin
                              out_r = 13'h1390;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1490;
                            end else begin
                              out_r = 13'h1210;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[12]) begin
                            out_r = 13'h01b9;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0978;
                            end else begin
                              out_r = 13'h1b61;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h15b0;
                            end else begin
                              out_r = 13'h1790;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h14b0;
                            end else begin
                              out_r = 13'h1610;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[8]) begin
                        if (in[11]) begin
                          if (in[5]) begin
                            if (in[12]) begin
                              out_r = 13'h1ff8;
                            end else begin
                              out_r = 13'h1f39;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1998;
                            end else begin
                              out_r = 13'h1979;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[12]) begin
                              out_r = 13'h158c;
                            end else begin
                              out_r = 13'h108c;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h15a4;
                            end else begin
                              out_r = 13'h158c;
                            end
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[5]) begin
                            if (in[12]) begin
                              out_r = 13'h07f9;
                            end else begin
                              out_r = 13'h0f20;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0199;
                            end else begin
                              out_r = 13'h0960;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[12]) begin
                              out_r = 13'h148c;
                            end else begin
                              out_r = 13'h118c;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h14a4;
                            end else begin
                              out_r = 13'h148c;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h1de4;
                            end else begin
                              out_r = 13'h19ff;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h04c9;
                            end else begin
                              out_r = 13'h19f1;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h1e6c;
                            end else begin
                              out_r = 13'h01ff;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0cc8;
                            end else begin
                              out_r = 13'h09f1;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h1e64;
                            end else begin
                              out_r = 13'h1bcc;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h01c9;
                            end else begin
                              out_r = 13'h1bc1;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h1dec;
                            end else begin
                              out_r = 13'h03cc;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h09c8;
                            end else begin
                              out_r = 13'h0bc1;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h04dc;
                            end else begin
                              out_r = 13'h09fe;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0649;
                            end else begin
                              out_r = 13'h19ed;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h1fd4;
                            end else begin
                              out_r = 13'h1866;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0e48;
                            end else begin
                              out_r = 13'h086d;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h07dc;
                            end else begin
                              out_r = 13'h1bcd;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h02c9;
                            end else begin
                              out_r = 13'h1bd5;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h1cd4;
                            end else begin
                              out_r = 13'h0add;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0ac8;
                            end else begin
                              out_r = 13'h0ad5;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[4]) begin
                  if (in[11]) begin
                    if (in[12]) begin
                      if (in[0]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1bf5;
                            end else begin
                              out_r = 13'h1af5;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1b95;
                            end else begin
                              out_r = 13'h1a95;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1bc5;
                            end else begin
                              out_r = 13'h1ac5;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1bb5;
                            end else begin
                              out_r = 13'h1ab5;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h067b;
                            end else begin
                              out_r = 13'h064b;
                            end
                          end else begin
                            out_r = 13'h067b;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h043b;
                          end else begin
                            if (in[5]) begin
                              out_r = 13'h04cb;
                            end else begin
                              out_r = 13'h04fb;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[0]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1f3c;
                            end else begin
                              out_r = 13'h1f24;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h13fb;
                            end else begin
                              out_r = 13'h13e3;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h197f;
                            end else begin
                              out_r = 13'h1967;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1799;
                            end else begin
                              out_r = 13'h1781;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1f27;
                            end else begin
                              out_r = 13'h073f;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1967;
                            end else begin
                              out_r = 13'h017f;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[8]) begin
                              out_r = 13'h1c1c;
                            end else begin
                              out_r = 13'h040c;
                            end
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h1b4c;
                            end else begin
                              out_r = 13'h035c;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[0]) begin
                      if (in[12]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            out_r = 13'h1fcf;
                          end else begin
                            out_r = 13'h1309;
                          end
                        end else begin
                          if (in[6]) begin
                            out_r = 13'h19bf;
                          end else begin
                            out_r = 13'h1759;
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[5]) begin
                            out_r = 13'h0bf7;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h0bf7;
                            end else begin
                              out_r = 13'h0b97;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            out_r = 13'h09f7;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h09f7;
                            end else begin
                              out_r = 13'h0997;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1fe7;
                            end else begin
                              out_r = 13'h01f4;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1e6f;
                            end else begin
                              out_r = 13'h00f4;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1384;
                            end else begin
                              out_r = 13'h0194;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h120c;
                            end else begin
                              out_r = 13'h0094;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h19df;
                            end else begin
                              out_r = 13'h01c4;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0856;
                            end else begin
                              out_r = 13'h00c4;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h17ac;
                            end else begin
                              out_r = 13'h01b4;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1625;
                            end else begin
                              out_r = 13'h00b4;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[0]) begin
                    if (in[5]) begin
                      if (in[8]) begin
                        if (in[11]) begin
                          if (in[6]) begin
                            if (in[12]) begin
                              out_r = 13'h1be9;
                            end else begin
                              out_r = 13'h1c3c;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1b89;
                            end else begin
                              out_r = 13'h10fb;
                            end
                          end
                        end else begin
                          if (in[12]) begin
                            if (in[6]) begin
                              out_r = 13'h0ffe;
                            end else begin
                              out_r = 13'h0338;
                            end
                          end else begin
                            out_r = 13'h0beb;
                          end
                        end
                      end else begin
                        if (in[11]) begin
                          if (in[6]) begin
                            if (in[12]) begin
                              out_r = 13'h1ae9;
                            end else begin
                              out_r = 13'h1f25;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1a89;
                            end else begin
                              out_r = 13'h13e2;
                            end
                          end
                        end else begin
                          if (in[12]) begin
                            if (in[6]) begin
                              out_r = 13'h1fff;
                            end else begin
                              out_r = 13'h1339;
                            end
                          end else begin
                            out_r = 13'h09eb;
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h1bd1;
                            end else begin
                              out_r = 13'h1b7f;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h099e;
                            end else begin
                              out_r = 13'h0bd3;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h1ad1;
                            end else begin
                              out_r = 13'h0966;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h199f;
                            end else begin
                              out_r = 13'h09d3;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h1ba1;
                            end else begin
                              out_r = 13'h1599;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0778;
                            end else begin
                              out_r = 13'h0ba3;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h1aa1;
                            end else begin
                              out_r = 13'h0780;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1779;
                            end else begin
                              out_r = 13'h09a3;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[5]) begin
                      if (in[8]) begin
                        if (in[11]) begin
                          if (in[12]) begin
                            out_r = 13'h0675;
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h0f3e;
                            end else begin
                              out_r = 13'h097e;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[12]) begin
                              out_r = 13'h04ff;
                            end else begin
                              out_r = 13'h01e8;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0c9c;
                            end else begin
                              out_r = 13'h0188;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h0435;
                            end else begin
                              out_r = 13'h1ee6;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h05f3;
                            end else begin
                              out_r = 13'h00e8;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h04f5;
                            end else begin
                              out_r = 13'h18a6;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0d90;
                            end else begin
                              out_r = 13'h0088;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[6]) begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h0669;
                            end else begin
                              out_r = 13'h1c0d;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h03cf;
                            end else begin
                              out_r = 13'h01d0;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h0429;
                            end else begin
                              out_r = 13'h0d5d;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1ac2;
                            end else begin
                              out_r = 13'h00d0;
                            end
                          end
                        end
                      end else begin
                        if (in[8]) begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h0651;
                            end else begin
                              out_r = 13'h1b5d;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h09bc;
                            end else begin
                              out_r = 13'h01a0;
                            end
                          end
                        end else begin
                          if (in[11]) begin
                            if (in[12]) begin
                              out_r = 13'h04d1;
                            end else begin
                              out_r = 13'h0a0d;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h00b1;
                            end else begin
                              out_r = 13'h00a0;
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
                if (in[4]) begin
                  if (in[0]) begin
                    if (in[2]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[12]) begin
                            out_r = 13'h1fc3;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h027e;
                            end else begin
                              out_r = 13'h11e7;
                            end
                          end
                        end else begin
                          if (in[12]) begin
                            out_r = 13'h1fc7;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0ef8;
                            end else begin
                              out_r = 13'h1d61;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[12]) begin
                            out_r = 13'h19b3;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h061e;
                            end else begin
                              out_r = 13'h1487;
                            end
                          end
                        end else begin
                          if (in[12]) begin
                            out_r = 13'h19b7;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h08b8;
                            end else begin
                              out_r = 13'h1a21;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1b35;
                            end else begin
                              out_r = 13'h1efc;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1a75;
                            end else begin
                              out_r = 13'h1ee4;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1b75;
                            end else begin
                              out_r = 13'h127b;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1a35;
                            end else begin
                              out_r = 13'h1263;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1b05;
                            end else begin
                              out_r = 13'h18bf;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1a45;
                            end else begin
                              out_r = 13'h18a7;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1b55;
                            end else begin
                              out_r = 13'h1619;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1a15;
                            end else begin
                              out_r = 13'h1601;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[8]) begin
                      if (in[2]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[12]) begin
                              out_r = 13'h10e7;
                            end else begin
                              out_r = 13'h1ff3;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h10e4;
                            end else begin
                              out_r = 13'h19f3;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[12]) begin
                              out_r = 13'h13e7;
                            end else begin
                              out_r = 13'h1cc0;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h13e4;
                            end else begin
                              out_r = 13'h1bc0;
                            end
                          end
                        end
                      end else begin
                        if (in[12]) begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h079b;
                            end else begin
                              out_r = 13'h07cb;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h07fb;
                            end else begin
                              out_r = 13'h079b;
                            end
                          end
                        end else begin
                          if (in[5]) begin
                            if (in[6]) begin
                              out_r = 13'h1fef;
                            end else begin
                              out_r = 13'h198f;
                            end
                          end else begin
                            if (in[6]) begin
                              out_r = 13'h1cd4;
                            end else begin
                              out_r = 13'h1ba4;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[12]) begin
                            if (in[2]) begin
                              out_r = 13'h13ef;
                            end else begin
                              out_r = 13'h059b;
                            end
                          end else begin
                            out_r = 13'h07f3;
                          end
                        end else begin
                          if (in[2]) begin
                            if (in[12]) begin
                              out_r = 13'h13ec;
                            end else begin
                              out_r = 13'h01f3;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h054b;
                            end else begin
                              out_r = 13'h0193;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[12]) begin
                            if (in[2]) begin
                              out_r = 13'h10ef;
                            end else begin
                              out_r = 13'h05fb;
                            end
                          end else begin
                            out_r = 13'h04c0;
                          end
                        end else begin
                          if (in[2]) begin
                            if (in[12]) begin
                              out_r = 13'h10ec;
                            end else begin
                              out_r = 13'h03c0;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h053b;
                            end else begin
                              out_r = 13'h03b0;
                            end
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (in[8]) begin
                    if (in[5]) begin
                      if (in[6]) begin
                        if (in[0]) begin
                          if (in[2]) begin
                            if (in[12]) begin
                              out_r = 13'h0ff2;
                            end else begin
                              out_r = 13'h127f;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1b29;
                            end else begin
                              out_r = 13'h1d7c;
                            end
                          end
                        end else begin
                          if (in[12]) begin
                            if (in[2]) begin
                              out_r = 13'h0ddf;
                            end else begin
                              out_r = 13'h0795;
                            end
                          end else begin
                            out_r = 13'h0ff2;
                          end
                        end
                      end else begin
                        if (in[0]) begin
                          if (in[2]) begin
                            if (in[12]) begin
                              out_r = 13'h0ff6;
                            end else begin
                              out_r = 13'h1ef9;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1b69;
                            end else begin
                              out_r = 13'h11fb;
                            end
                          end
                        end else begin
                          if (in[2]) begin
                            if (in[12]) begin
                              out_r = 13'h0ddc;
                            end else begin
                              out_r = 13'h09f2;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h07f5;
                            end else begin
                              out_r = 13'h0992;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[0]) begin
                        if (in[2]) begin
                          if (in[6]) begin
                            if (in[12]) begin
                              out_r = 13'h0992;
                            end else begin
                              out_r = 13'h161f;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0996;
                            end else begin
                              out_r = 13'h18b9;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[12]) begin
                              out_r = 13'h1b11;
                            end else begin
                              out_r = 13'h1a3f;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1b41;
                            end else begin
                              out_r = 13'h1499;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[12]) begin
                            if (in[2]) begin
                              out_r = 13'h0e5f;
                            end else begin
                              out_r = 13'h07e9;
                            end
                          end else begin
                            out_r = 13'h1cc1;
                          end
                        end else begin
                          if (in[2]) begin
                            if (in[12]) begin
                              out_r = 13'h0e5c;
                            end else begin
                              out_r = 13'h1bc1;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h07a1;
                            end else begin
                              out_r = 13'h1bb1;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[0]) begin
                      if (in[2]) begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[12]) begin
                              out_r = 13'h1ff3;
                            end else begin
                              out_r = 13'h0266;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1ff7;
                            end else begin
                              out_r = 13'h0ee0;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[12]) begin
                              out_r = 13'h1993;
                            end else begin
                              out_r = 13'h0606;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1997;
                            end else begin
                              out_r = 13'h08a0;
                            end
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[6]) begin
                            if (in[12]) begin
                              out_r = 13'h1a69;
                            end else begin
                              out_r = 13'h1ee5;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1a29;
                            end else begin
                              out_r = 13'h1262;
                            end
                          end
                        end else begin
                          if (in[6]) begin
                            if (in[12]) begin
                              out_r = 13'h1a51;
                            end else begin
                              out_r = 13'h08a6;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1a01;
                            end else begin
                              out_r = 13'h0600;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[12]) begin
                            if (in[2]) begin
                              out_r = 13'h1257;
                            end else begin
                              out_r = 13'h0595;
                            end
                          end else begin
                            out_r = 13'h1e6e;
                          end
                        end else begin
                          if (in[2]) begin
                            if (in[12]) begin
                              out_r = 13'h1254;
                            end else begin
                              out_r = 13'h186e;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0575;
                            end else begin
                              out_r = 13'h180e;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[12]) begin
                            if (in[2]) begin
                              out_r = 13'h11d7;
                            end else begin
                              out_r = 13'h05e9;
                            end
                          end else begin
                            out_r = 13'h0dd5;
                          end
                        end else begin
                          if (in[2]) begin
                            if (in[12]) begin
                              out_r = 13'h11d4;
                            end else begin
                              out_r = 13'h0ad5;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0501;
                            end else begin
                              out_r = 13'h0aa5;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end else begin
                if (in[0]) begin
                  if (in[2]) begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1530;
                            end else begin
                              out_r = 13'h07f0;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1470;
                            end else begin
                              out_r = 13'h0670;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1570;
                            end else begin
                              out_r = 13'h0f90;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1430;
                            end else begin
                              out_r = 13'h0e10;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1500;
                            end else begin
                              out_r = 13'h01f0;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1440;
                            end else begin
                              out_r = 13'h0070;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1550;
                            end else begin
                              out_r = 13'h0b90;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1410;
                            end else begin
                              out_r = 13'h0a10;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h152c;
                            end else begin
                              out_r = 13'h04ec;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h146c;
                            end else begin
                              out_r = 13'h05ec;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h156c;
                            end else begin
                              out_r = 13'h0c8c;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h142c;
                            end else begin
                              out_r = 13'h0d8c;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1514;
                            end else begin
                              out_r = 13'h03ec;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1454;
                            end else begin
                              out_r = 13'h02ec;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1544;
                            end else begin
                              out_r = 13'h098c;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1404;
                            end else begin
                              out_r = 13'h088c;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[6]) begin
                      if (in[4]) begin
                        if (in[12]) begin
                          if (in[5]) begin
                            out_r = 13'h07c3;
                          end else begin
                            out_r = 13'h01b3;
                          end
                        end else begin
                          if (in[8]) begin
                            out_r = 13'h0bf7;
                          end else begin
                            out_r = 13'h08f7;
                          end
                        end
                      end else begin
                        if (in[5]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1ff2;
                            end else begin
                              out_r = 13'h0beb;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h07f3;
                            end else begin
                              out_r = 13'h08eb;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1992;
                            end else begin
                              out_r = 13'h0bd3;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0193;
                            end else begin
                              out_r = 13'h08d3;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[4]) begin
                          if (in[12]) begin
                            out_r = 13'h0f07;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0b37;
                            end else begin
                              out_r = 13'h0877;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1736;
                            end else begin
                              out_r = 13'h0b2b;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0f37;
                            end else begin
                              out_r = 13'h086b;
                            end
                          end
                        end
                      end else begin
                        if (in[4]) begin
                          if (in[12]) begin
                            out_r = 13'h0b57;
                          end else begin
                            if (in[8]) begin
                              out_r = 13'h0b77;
                            end else begin
                              out_r = 13'h0837;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1376;
                            end else begin
                              out_r = 13'h0b43;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0b77;
                            end else begin
                              out_r = 13'h0803;
                            end
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
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1bf9;
                            end else begin
                              out_r = 13'h1331;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1bf8;
                            end else begin
                              out_r = 13'h0731;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1cc9;
                            end else begin
                              out_r = 13'h1731;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1cc8;
                            end else begin
                              out_r = 13'h0331;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1ff9;
                            end else begin
                              out_r = 13'h1001;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1ff8;
                            end else begin
                              out_r = 13'h0401;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h19c9;
                            end else begin
                              out_r = 13'h1501;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h19c8;
                            end else begin
                              out_r = 13'h0101;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1879;
                            end else begin
                              out_r = 13'h132d;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1878;
                            end else begin
                              out_r = 13'h06ed;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1e49;
                            end else begin
                              out_r = 13'h172d;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1e48;
                            end else begin
                              out_r = 13'h02ed;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1df9;
                            end else begin
                              out_r = 13'h1015;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1df8;
                            end else begin
                              out_r = 13'h0555;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1ac9;
                            end else begin
                              out_r = 13'h1515;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1ac8;
                            end else begin
                              out_r = 13'h0055;
                            end
                          end
                        end
                      end
                    end
                  end else begin
                    if (in[4]) begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1fe1;
                            end else begin
                              out_r = 13'h0134;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1e6b;
                            end else begin
                              out_r = 13'h0074;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1383;
                            end else begin
                              out_r = 13'h0174;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1209;
                            end else begin
                              out_r = 13'h0034;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h19d9;
                            end else begin
                              out_r = 13'h0104;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0852;
                            end else begin
                              out_r = 13'h0044;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h17ab;
                            end else begin
                              out_r = 13'h0154;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1620;
                            end else begin
                              out_r = 13'h0014;
                            end
                          end
                        end
                      end
                    end else begin
                      if (in[5]) begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1cf9;
                            end else begin
                              out_r = 13'h0128;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1df7;
                            end else begin
                              out_r = 13'h0068;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h109b;
                            end else begin
                              out_r = 13'h0168;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h1195;
                            end else begin
                              out_r = 13'h0028;
                            end
                          end
                        end
                      end else begin
                        if (in[6]) begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h1bc9;
                            end else begin
                              out_r = 13'h0110;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h0ac6;
                            end else begin
                              out_r = 13'h0050;
                            end
                          end
                        end else begin
                          if (in[8]) begin
                            if (in[12]) begin
                              out_r = 13'h15bb;
                            end else begin
                              out_r = 13'h0140;
                            end
                          end else begin
                            if (in[12]) begin
                              out_r = 13'h14b4;
                            end else begin
                              out_r = 13'h0000;
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
  end
  assign out = out_r;
endmodule
