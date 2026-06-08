module ex249_semantic_hypot_threshold_formula(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] a = in[14:8];
  wire [6:0] b = in[6:0];
  wire nan = (a == 7'h7f) || (b == 7'h7f);
  wire a_ge_b = (a >= b);
  wire [6:0] maxc = a_ge_b ? a : b;
  wire [6:0] minc = a_ge_b ? b : a;
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

  wire [2:0] smax = sig3(maxc);
  wire [2:0] smin = sig3(minc);
  wire [5:0] emax = eff_exp(maxc);
  wire [5:0] emin = eff_exp(minc);
  wire [5:0] gap = emax - emin;
  wire gap0 = (gap == 6'd0);
  wire gap1 = (gap == 6'd1);
  wire d2_g0 =
    ((smax == 3'd4) && (smin >= 3'd4)) ||
    ((smax == 3'd5) && (smin >= 3'd5)) ||
    ((smax == 3'd6) && (smin >= 3'd5)) ||
    ((smax == 3'd7) && (smin >= 3'd6));
  wire d1_g0 =
    ((smax == 3'd2) && (smin >= 3'd2)) ||
    ((smax == 3'd3) && (smin >= 3'd2)) ||
    ((smax == 3'd4) && (smin >= 3'd3)) ||
    ((smax == 3'd5) && (smin >= 3'd3)) ||
    ((smax == 3'd6) && (smin >= 3'd3)) ||
    ((smax == 3'd7) && (smin >= 3'd3));
  wire d1_g1 =
    (((smax == 3'd4) || (smax == 3'd5)) && (smin >= 3'd5)) ||
    (((smax == 3'd6) || (smax == 3'd7)) && (smin >= 3'd6));
  wire [1:0] delta = gap0 ? (d2_g0 ? 2'd2 : (d1_g0 ? 2'd1 : 2'd0)) : (gap1 && d1_g1 ? 2'd1 : 2'd0);
  wire [7:0] raw = {1'b0, maxc} + {6'd0, delta};
  wire [6:0] mag = (raw >= 8'h7f) ? 7'h7e : raw[6:0];
  assign out = nan ? 8'h7f : {1'b0, mag};
endmodule
