module ex249_r9_truth_residual16_overlay(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] core_out;
  ex249_r9_truth_residual16_overlay_core core(.in(in), .out(core_out));

  wire [7:0] hi = in[15:8];
  wire [7:0] lo = in[7:0];
  wire [6:0] hm = hi[6:0];
  wire [6:0] lm = lo[6:0];
  wire hi_nan = (hm == 7'h7f);
  wire lo_nan = (lm == 7'h7f);
  wire nan = hi_nan || lo_nan;

  reg residual_hit;
  reg [7:0] residual_out;
  always @* begin
    residual_hit = 1'b1;
    residual_out = core_out;
    case ({hi[7], hm, lo[7], lm})
      16'h0101: residual_out = 8'h01;
      16'h0102: residual_out = 8'h02;
      16'h0103: residual_out = 8'h03;
      16'h0104: residual_out = 8'h04;
      16'h0105: residual_out = 8'h05;
      16'h0106: residual_out = 8'h06;
      16'h0107: residual_out = 8'h07;
      16'h0108: residual_out = 8'h08;
      16'h0109: residual_out = 8'h09;
      16'h010a: residual_out = 8'h0a;
      16'h010b: residual_out = 8'h0b;
      16'h010c: residual_out = 8'h0c;
      16'h010d: residual_out = 8'h0d;
      16'h010e: residual_out = 8'h0e;
      16'h010f: residual_out = 8'h0f;
      16'h0110: residual_out = 8'h10;
      default: residual_hit = 1'b0;
    endcase
  end
  assign out = residual_hit ? residual_out : core_out;
endmodule

module ex249_r9_truth_residual16_overlay_core(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] a = in[14:8];
  wire [6:0] b = in[6:0];
  wire nan = (a == 7'h7f) || (b == 7'h7f);
  wire a_ge_b = (a >= b);
  wire [6:0] maxc = a_ge_b ? a : b;
  wire [6:0] minc = a_ge_b ? b : a;
  wire [4:0] max_exp = maxc[6:2];
  wire [4:0] min_exp = minc[6:2];
  wire [2:0] smax = (max_exp == 5'd0) ? {1'b0, maxc[1:0]} : {1'b1, maxc[1:0]};
  wire [2:0] smin = (min_exp == 5'd0) ? {1'b0, minc[1:0]} : {1'b1, minc[1:0]};
  wire low_pair = (max_exp <= 5'd1) && (min_exp <= 5'd1);
  wire gap0 = (max_exp == min_exp) || low_pair;
  wire gap1 = ((min_exp <= 5'd1) && (max_exp == 5'd2)) || ((min_exp >= 5'd2) && (max_exp == (min_exp + 5'd1)));
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
  wire [1:0] delta_raw = delta_table({gap1, smax, smin});
  wire [1:0] delta = (gap0 || gap1) ? delta_raw : 2'd0;
  wire sat = (maxc == 7'h7e) || ((maxc == 7'h7d) && delta[1]);
  wire [6:0] mag = sat ? 7'h7e : (maxc + {5'd0, delta});
  assign out = nan ? 8'h7f : {1'b0, mag};
endmodule

