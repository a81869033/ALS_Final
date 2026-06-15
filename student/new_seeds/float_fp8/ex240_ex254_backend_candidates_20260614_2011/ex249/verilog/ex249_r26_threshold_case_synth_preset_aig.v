module top(in, out);
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

  function [1:0] delta_table;
    input [6:0] key;
    begin
      case (key)
        7'h12: delta_table = 2'd1;
        7'h13: delta_table = 2'd1;
        7'h14: delta_table = 2'd1;
        7'h15: delta_table = 2'd1;
        7'h16: delta_table = 2'd1;
        7'h17: delta_table = 2'd1;
        7'h1a: delta_table = 2'd1;
        7'h1b: delta_table = 2'd1;
        7'h1c: delta_table = 2'd1;
        7'h1d: delta_table = 2'd1;
        7'h1e: delta_table = 2'd1;
        7'h1f: delta_table = 2'd1;
        7'h23: delta_table = 2'd1;
        7'h24: delta_table = 2'd2;
        7'h25: delta_table = 2'd2;
        7'h26: delta_table = 2'd2;
        7'h27: delta_table = 2'd2;
        7'h2b: delta_table = 2'd1;
        7'h2c: delta_table = 2'd1;
        7'h2d: delta_table = 2'd2;
        7'h2e: delta_table = 2'd2;
        7'h2f: delta_table = 2'd2;
        7'h33: delta_table = 2'd1;
        7'h34: delta_table = 2'd1;
        7'h35: delta_table = 2'd2;
        7'h36: delta_table = 2'd2;
        7'h37: delta_table = 2'd2;
        7'h3b: delta_table = 2'd1;
        7'h3c: delta_table = 2'd1;
        7'h3d: delta_table = 2'd1;
        7'h3e: delta_table = 2'd2;
        7'h3f: delta_table = 2'd2;
        7'h65: delta_table = 2'd1;
        7'h66: delta_table = 2'd1;
        7'h67: delta_table = 2'd1;
        7'h6d: delta_table = 2'd1;
        7'h6e: delta_table = 2'd1;
        7'h6f: delta_table = 2'd1;
        7'h76: delta_table = 2'd1;
        7'h77: delta_table = 2'd1;
        7'h7e: delta_table = 2'd1;
        7'h7f: delta_table = 2'd1;
        default: delta_table = 2'd0;
      endcase
    end
  endfunction

  wire [2:0] smax = sig3(maxc);
  wire [2:0] smin = sig3(minc);
  wire [5:0] emax = eff_exp(maxc);
  wire [5:0] emin = eff_exp(minc);
  wire gap0 = (emax == emin);
  wire gap1 = (emax == (emin + 6'd1));
  wire [1:0] delta_raw = delta_table({gap1, smax, smin});
  wire [1:0] delta = (gap0 || gap1) ? delta_raw : 2'd0;
  wire sat = (maxc == 7'h7e) || ((maxc == 7'h7d) && delta[1]);
  wire [6:0] mag = sat ? 7'h7e : (maxc + {5'd0, delta});
  assign out = nan ? 8'h7f : {1'b0, mag};
endmodule
