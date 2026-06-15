module ex249_r2_current_tail_conemix_abc_g_aig_frontend_current(in, out);
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


module ex249_r2_current_tail_conemix_abc_g_aig_frontend_alt(in, out);
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
  function delta_is_one;
    input [6:0] key;
    begin
      case (key)
        7'h12, 7'h13, 7'h14, 7'h15, 7'h16, 7'h17, 7'h1a, 7'h1b, 7'h1c, 7'h1d, 7'h1e, 7'h1f, 7'h23, 7'h2b, 7'h2c, 7'h33, 7'h34, 7'h3b, 7'h3c, 7'h3d, 7'h65, 7'h66, 7'h67, 7'h6d, 7'h6e, 7'h6f, 7'h76, 7'h77, 7'h7e, 7'h7f: delta_is_one = 1'b1;
        default: delta_is_one = 1'b0;
      endcase
    end
  endfunction

  function delta_is_two;
    input [6:0] key;
    begin
      case (key)
        7'h24, 7'h25, 7'h26, 7'h27, 7'h2d, 7'h2e, 7'h2f, 7'h35, 7'h36, 7'h37, 7'h3e, 7'h3f: delta_is_two = 1'b1;
        default: delta_is_two = 1'b0;
      endcase
    end
  endfunction

  wire active_gap = gap0 || gap1;
  wire [6:0] delta_key = {gap1, smax, smin};
  wire inc1 = active_gap && delta_is_one(delta_key);
  wire inc2 = active_gap && delta_is_two(delta_key);
  wire sum0 = maxc[0] ^ inc1;
  wire carry1 = maxc[0] && inc1;
  wire sum1 = maxc[1] ^ inc2 ^ carry1;
  wire carry2 = (maxc[1] && inc2) || (maxc[1] && carry1) || (inc2 && carry1);
  wire [5:0] high_sum = {1'b0, maxc[6:2]} + {5'd0, carry2};
  wire sat = (maxc == 7'h7e) || ((maxc == 7'h7d) && inc2);
  wire [6:0] add_mag = {high_sum[4:0], sum1, sum0};
  wire [6:0] mag = sat ? 7'h7e : add_mag;
  assign out = nan ? 8'h7f : {1'b0, mag};
endmodule


module ex249_r2_current_tail_conemix_abc_g_aig_frontend(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] current_out;
  wire [7:0] alt_out;
  ex249_r2_current_tail_conemix_abc_g_aig_frontend_current u_current(.in(in), .out(current_out));
  ex249_r2_current_tail_conemix_abc_g_aig_frontend_alt u_alt(.in(in), .out(alt_out));
  assign out = {current_out[7:4], alt_out[3:0]};
endmodule
