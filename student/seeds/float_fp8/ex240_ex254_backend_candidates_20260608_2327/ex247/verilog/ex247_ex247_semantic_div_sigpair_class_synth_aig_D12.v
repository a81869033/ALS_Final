module ex247_semantic_div_sigpair_class(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire den_nan = (den[6:0] == 7'h7f);
  wire num_nan = (num[6:0] == 7'h7f);
  wire sign = den[7] ^ num[7];
  wire den_zero = (den[6:0] == 7'h00);
  wire num_zero = (num[6:0] == 7'h00);
  function [2:0] sig3;
    input [6:0] v;
    begin
      sig3 = (v[6:2] == 5'd0) ? {1'b0, v[1:0]} : {1'b1, v[1:0]};
    end
  endfunction

  function [5:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:2] == 5'd0) ? 6'd1 : {1'b0, v[6:2]};
    end
  endfunction

  function [6:0] mag_table;
    input signed [6:0] delta;
    input [5:0] sig_key;
    begin
      case (sig_key)
        6'h00: begin
          mag_table = 7'h00;
        end
        6'h01: begin
          mag_table = 7'h00;
        end
        6'h02: begin
          mag_table = 7'h00;
        end
        6'h03: begin
          mag_table = 7'h00;
        end
        6'h04: begin
          mag_table = 7'h00;
        end
        6'h05: begin
          mag_table = 7'h00;
        end
        6'h06: begin
          mag_table = 7'h00;
        end
        6'h07: begin
          mag_table = 7'h00;
        end
        6'h08: begin
          mag_table = 7'h00;
        end
        6'h09: begin
          if (delta <= -7'sd17) mag_table = 7'h00;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h02;
          else if (delta >= 7'sd17) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd15) << 2) | 7'd0);
        end
        6'h0a: begin
          if (delta <= -7'sd16) mag_table = 7'h00;
          else if (delta == -7'sd15) mag_table = 7'h01;
          else if (delta == -7'sd14) mag_table = 7'h02;
          else if (delta >= 7'sd18) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd14) << 2) | 7'd0);
        end
        6'h0b: begin
          if (delta <= -7'sd16) mag_table = 7'h00;
          else if (delta == -7'sd15) mag_table = 7'h01;
          else if (delta == -7'sd14) mag_table = 7'h01;
          else if (delta == -7'sd13) mag_table = 7'h03;
          else if (delta >= 7'sd19) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd13) << 2) | 7'd1);
        end
        6'h0c: begin
          if (delta <= -7'sd15) mag_table = 7'h00;
          else if (delta == -7'sd14) mag_table = 7'h01;
          else if (delta == -7'sd13) mag_table = 7'h02;
          else if (delta >= 7'sd19) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd13) << 2) | 7'd0);
        end
        6'h0d: begin
          if (delta <= -7'sd15) mag_table = 7'h00;
          else if (delta == -7'sd14) mag_table = 7'h01;
          else if (delta == -7'sd13) mag_table = 7'h02;
          else if (delta == -7'sd12) mag_table = 7'h03;
          else if (delta >= 7'sd19) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd12) << 2) | 7'd2);
        end
        6'h0e: begin
          if (delta <= -7'sd15) mag_table = 7'h00;
          else if (delta == -7'sd14) mag_table = 7'h01;
          else if (delta == -7'sd13) mag_table = 7'h01;
          else if (delta == -7'sd12) mag_table = 7'h03;
          else if (delta >= 7'sd20) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd12) << 2) | 7'd1);
        end
        6'h0f: begin
          if (delta <= -7'sd15) mag_table = 7'h00;
          else if (delta == -7'sd14) mag_table = 7'h01;
          else if (delta == -7'sd13) mag_table = 7'h01;
          else if (delta == -7'sd12) mag_table = 7'h02;
          else if (delta >= 7'sd20) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd12) << 2) | 7'd1);
        end
        6'h10: begin
          mag_table = 7'h00;
        end
        6'h11: begin
          if (delta <= -7'sd18) mag_table = 7'h00;
          else if (delta == -7'sd17) mag_table = 7'h01;
          else if (delta == -7'sd16) mag_table = 7'h02;
          else if (delta >= 7'sd16) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd16) << 2) | 7'd0);
        end
        6'h12: begin
          if (delta <= -7'sd17) mag_table = 7'h00;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h02;
          else if (delta >= 7'sd17) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd15) << 2) | 7'd0);
        end
        6'h13: begin
          if (delta <= -7'sd17) mag_table = 7'h00;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h01;
          else if (delta == -7'sd14) mag_table = 7'h03;
          else if (delta >= 7'sd18) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd14) << 2) | 7'd1);
        end
        6'h14: begin
          if (delta <= -7'sd16) mag_table = 7'h00;
          else if (delta == -7'sd15) mag_table = 7'h01;
          else if (delta == -7'sd14) mag_table = 7'h02;
          else if (delta >= 7'sd18) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd14) << 2) | 7'd0);
        end
        6'h15: begin
          if (delta <= -7'sd16) mag_table = 7'h00;
          else if (delta == -7'sd15) mag_table = 7'h01;
          else if (delta == -7'sd14) mag_table = 7'h02;
          else if (delta == -7'sd13) mag_table = 7'h03;
          else if (delta >= 7'sd18) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd13) << 2) | 7'd2);
        end
        6'h16: begin
          if (delta <= -7'sd16) mag_table = 7'h00;
          else if (delta == -7'sd15) mag_table = 7'h01;
          else if (delta == -7'sd14) mag_table = 7'h01;
          else if (delta == -7'sd13) mag_table = 7'h03;
          else if (delta >= 7'sd19) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd13) << 2) | 7'd1);
        end
        6'h17: begin
          if (delta <= -7'sd16) mag_table = 7'h00;
          else if (delta == -7'sd15) mag_table = 7'h01;
          else if (delta == -7'sd14) mag_table = 7'h01;
          else if (delta == -7'sd13) mag_table = 7'h02;
          else if (delta >= 7'sd19) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd13) << 2) | 7'd1);
        end
        6'h18: begin
          mag_table = 7'h00;
        end
        6'h19: begin
          if (delta <= -7'sd19) mag_table = 7'h00;
          else if (delta == -7'sd18) mag_table = 7'h01;
          else if (delta == -7'sd17) mag_table = 7'h02;
          else if (delta == -7'sd16) mag_table = 7'h03;
          else if (delta >= 7'sd15) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd16) << 2) | 7'd2);
        end
        6'h1a: begin
          if (delta <= -7'sd18) mag_table = 7'h00;
          else if (delta == -7'sd17) mag_table = 7'h01;
          else if (delta == -7'sd16) mag_table = 7'h02;
          else if (delta == -7'sd15) mag_table = 7'h03;
          else if (delta >= 7'sd16) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd15) << 2) | 7'd2);
        end
        6'h1b: begin
          if (delta <= -7'sd17) mag_table = 7'h00;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h02;
          else if (delta >= 7'sd17) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd15) << 2) | 7'd0);
        end
        6'h1c: begin
          if (delta <= -7'sd17) mag_table = 7'h00;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h02;
          else if (delta == -7'sd14) mag_table = 7'h03;
          else if (delta >= 7'sd17) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd14) << 2) | 7'd2);
        end
        6'h1d: begin
          if (delta <= -7'sd17) mag_table = 7'h00;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h01;
          else if (delta == -7'sd14) mag_table = 7'h02;
          else if (delta >= 7'sd18) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd14) << 2) | 7'd1);
        end
        6'h1e: begin
          if (delta <= -7'sd16) mag_table = 7'h00;
          else if (delta == -7'sd15) mag_table = 7'h01;
          else if (delta == -7'sd14) mag_table = 7'h02;
          else if (delta >= 7'sd18) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd14) << 2) | 7'd0);
        end
        6'h1f: begin
          if (delta <= -7'sd16) mag_table = 7'h00;
          else if (delta == -7'sd15) mag_table = 7'h01;
          else if (delta == -7'sd14) mag_table = 7'h02;
          else if (delta == -7'sd13) mag_table = 7'h03;
          else if (delta >= 7'sd18) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd13) << 2) | 7'd3);
        end
        6'h20: begin
          mag_table = 7'h00;
        end
        6'h21: begin
          if (delta <= -7'sd19) mag_table = 7'h00;
          else if (delta == -7'sd18) mag_table = 7'h01;
          else if (delta == -7'sd17) mag_table = 7'h02;
          else if (delta >= 7'sd15) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd17) << 2) | 7'd0);
        end
        6'h22: begin
          if (delta <= -7'sd18) mag_table = 7'h00;
          else if (delta == -7'sd17) mag_table = 7'h01;
          else if (delta == -7'sd16) mag_table = 7'h02;
          else if (delta >= 7'sd16) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd16) << 2) | 7'd0);
        end
        6'h23: begin
          if (delta <= -7'sd18) mag_table = 7'h00;
          else if (delta == -7'sd17) mag_table = 7'h01;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h03;
          else if (delta >= 7'sd17) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd15) << 2) | 7'd1);
        end
        6'h24: begin
          if (delta <= -7'sd17) mag_table = 7'h00;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h02;
          else if (delta >= 7'sd17) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd15) << 2) | 7'd0);
        end
        6'h25: begin
          if (delta <= -7'sd17) mag_table = 7'h00;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h02;
          else if (delta == -7'sd14) mag_table = 7'h03;
          else if (delta >= 7'sd17) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd14) << 2) | 7'd2);
        end
        6'h26: begin
          if (delta <= -7'sd17) mag_table = 7'h00;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h01;
          else if (delta == -7'sd14) mag_table = 7'h03;
          else if (delta >= 7'sd18) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd14) << 2) | 7'd1);
        end
        6'h27: begin
          if (delta <= -7'sd17) mag_table = 7'h00;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h01;
          else if (delta == -7'sd14) mag_table = 7'h02;
          else if (delta >= 7'sd18) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd14) << 2) | 7'd1);
        end
        6'h28: begin
          mag_table = 7'h00;
        end
        6'h29: begin
          if (delta <= -7'sd20) mag_table = 7'h00;
          else if (delta == -7'sd19) mag_table = 7'h01;
          else if (delta == -7'sd18) mag_table = 7'h01;
          else if (delta == -7'sd17) mag_table = 7'h02;
          else if (delta >= 7'sd15) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd17) << 2) | 7'd1);
        end
        6'h2a: begin
          if (delta <= -7'sd19) mag_table = 7'h00;
          else if (delta == -7'sd18) mag_table = 7'h01;
          else if (delta == -7'sd17) mag_table = 7'h01;
          else if (delta == -7'sd16) mag_table = 7'h02;
          else if (delta >= 7'sd16) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd16) << 2) | 7'd1);
        end
        6'h2b: begin
          if (delta <= -7'sd18) mag_table = 7'h00;
          else if (delta == -7'sd17) mag_table = 7'h01;
          else if (delta == -7'sd16) mag_table = 7'h02;
          else if (delta == -7'sd15) mag_table = 7'h03;
          else if (delta >= 7'sd16) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd15) << 2) | 7'd3);
        end
        6'h2c: begin
          if (delta <= -7'sd18) mag_table = 7'h00;
          else if (delta == -7'sd17) mag_table = 7'h01;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h02;
          else if (delta >= 7'sd17) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd15) << 2) | 7'd1);
        end
        6'h2d: begin
          if (delta <= -7'sd17) mag_table = 7'h00;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h02;
          else if (delta >= 7'sd17) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd15) << 2) | 7'd0);
        end
        6'h2e: begin
          if (delta <= -7'sd17) mag_table = 7'h00;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h02;
          else if (delta == -7'sd14) mag_table = 7'h03;
          else if (delta >= 7'sd17) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd14) << 2) | 7'd3);
        end
        6'h2f: begin
          if (delta <= -7'sd17) mag_table = 7'h00;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h01;
          else if (delta == -7'sd14) mag_table = 7'h03;
          else if (delta >= 7'sd17) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd14) << 2) | 7'd2);
        end
        6'h30: begin
          mag_table = 7'h00;
        end
        6'h31: begin
          if (delta <= -7'sd20) mag_table = 7'h00;
          else if (delta == -7'sd19) mag_table = 7'h01;
          else if (delta == -7'sd18) mag_table = 7'h02;
          else if (delta == -7'sd17) mag_table = 7'h03;
          else if (delta >= 7'sd14) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd17) << 2) | 7'd2);
        end
        6'h32: begin
          if (delta <= -7'sd19) mag_table = 7'h00;
          else if (delta == -7'sd18) mag_table = 7'h01;
          else if (delta == -7'sd17) mag_table = 7'h02;
          else if (delta == -7'sd16) mag_table = 7'h03;
          else if (delta >= 7'sd15) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd16) << 2) | 7'd2);
        end
        6'h33: begin
          if (delta <= -7'sd18) mag_table = 7'h00;
          else if (delta == -7'sd17) mag_table = 7'h01;
          else if (delta == -7'sd16) mag_table = 7'h02;
          else if (delta >= 7'sd16) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd16) << 2) | 7'd0);
        end
        6'h34: begin
          if (delta <= -7'sd18) mag_table = 7'h00;
          else if (delta == -7'sd17) mag_table = 7'h01;
          else if (delta == -7'sd16) mag_table = 7'h02;
          else if (delta == -7'sd15) mag_table = 7'h03;
          else if (delta >= 7'sd16) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd15) << 2) | 7'd2);
        end
        6'h35: begin
          if (delta <= -7'sd18) mag_table = 7'h00;
          else if (delta == -7'sd17) mag_table = 7'h01;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h02;
          else if (delta >= 7'sd17) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd15) << 2) | 7'd1);
        end
        6'h36: begin
          if (delta <= -7'sd17) mag_table = 7'h00;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h02;
          else if (delta >= 7'sd17) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd15) << 2) | 7'd0);
        end
        6'h37: begin
          if (delta <= -7'sd17) mag_table = 7'h00;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h02;
          else if (delta == -7'sd14) mag_table = 7'h03;
          else if (delta >= 7'sd17) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd14) << 2) | 7'd3);
        end
        6'h38: begin
          mag_table = 7'h00;
        end
        6'h39: begin
          if (delta <= -7'sd20) mag_table = 7'h00;
          else if (delta == -7'sd19) mag_table = 7'h01;
          else if (delta == -7'sd18) mag_table = 7'h02;
          else if (delta == -7'sd17) mag_table = 7'h04;
          else if (delta >= 7'sd14) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd17) << 2) | 7'd3);
        end
        6'h3a: begin
          if (delta <= -7'sd19) mag_table = 7'h00;
          else if (delta == -7'sd18) mag_table = 7'h01;
          else if (delta == -7'sd17) mag_table = 7'h02;
          else if (delta == -7'sd16) mag_table = 7'h04;
          else if (delta >= 7'sd15) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd16) << 2) | 7'd3);
        end
        6'h3b: begin
          if (delta <= -7'sd19) mag_table = 7'h00;
          else if (delta == -7'sd18) mag_table = 7'h01;
          else if (delta == -7'sd17) mag_table = 7'h01;
          else if (delta == -7'sd16) mag_table = 7'h02;
          else if (delta >= 7'sd16) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd16) << 2) | 7'd1);
        end
        6'h3c: begin
          if (delta <= -7'sd18) mag_table = 7'h00;
          else if (delta == -7'sd17) mag_table = 7'h01;
          else if (delta == -7'sd16) mag_table = 7'h02;
          else if (delta == -7'sd15) mag_table = 7'h04;
          else if (delta >= 7'sd16) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd15) << 2) | 7'd3);
        end
        6'h3d: begin
          if (delta <= -7'sd18) mag_table = 7'h00;
          else if (delta == -7'sd17) mag_table = 7'h01;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h03;
          else if (delta >= 7'sd16) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd15) << 2) | 7'd2);
        end
        6'h3e: begin
          if (delta <= -7'sd18) mag_table = 7'h00;
          else if (delta == -7'sd17) mag_table = 7'h01;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h02;
          else if (delta >= 7'sd17) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd15) << 2) | 7'd1);
        end
        6'h3f: begin
          if (delta <= -7'sd17) mag_table = 7'h00;
          else if (delta == -7'sd16) mag_table = 7'h01;
          else if (delta == -7'sd15) mag_table = 7'h02;
          else if (delta >= 7'sd17) mag_table = 7'h7e;
          else mag_table = (((delta + 7'sd15) << 2) | 7'd0);
        end
        default: mag_table = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(num[6:0]);
  wire [2:0] sig_d = sig3(den[6:0]);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(num[6:0])}) - $signed({1'b0, eff_exp(den[6:0])});
  wire invalid = den_nan || num_nan || (den_zero && num_zero);
  wire [6:0] out_mag = den_zero ? 7'h7e : mag_table(delta, {sig_n, sig_d});
  assign out = invalid ? 8'h7f : {sign, out_mag};
endmodule
