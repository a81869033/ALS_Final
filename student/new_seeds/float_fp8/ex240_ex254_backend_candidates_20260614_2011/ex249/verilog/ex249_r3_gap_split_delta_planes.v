module ex249_r3_gap_split_delta_planes(in, out);
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
  function [1:0] delta_gap0;
    input [5:0] key;
    begin
      case (key)
        6'h12: delta_gap0 = 2'd1;
        6'h13: delta_gap0 = 2'd1;
        6'h14: delta_gap0 = 2'd1;
        6'h15: delta_gap0 = 2'd1;
        6'h16: delta_gap0 = 2'd1;
        6'h17: delta_gap0 = 2'd1;
        6'h1a: delta_gap0 = 2'd1;
        6'h1b: delta_gap0 = 2'd1;
        6'h1c: delta_gap0 = 2'd1;
        6'h1d: delta_gap0 = 2'd1;
        6'h1e: delta_gap0 = 2'd1;
        6'h1f: delta_gap0 = 2'd1;
        6'h23: delta_gap0 = 2'd1;
        6'h24: delta_gap0 = 2'd2;
        6'h25: delta_gap0 = 2'd2;
        6'h26: delta_gap0 = 2'd2;
        6'h27: delta_gap0 = 2'd2;
        6'h2b: delta_gap0 = 2'd1;
        6'h2c: delta_gap0 = 2'd1;
        6'h2d: delta_gap0 = 2'd2;
        6'h2e: delta_gap0 = 2'd2;
        6'h2f: delta_gap0 = 2'd2;
        6'h33: delta_gap0 = 2'd1;
        6'h34: delta_gap0 = 2'd1;
        6'h35: delta_gap0 = 2'd2;
        6'h36: delta_gap0 = 2'd2;
        6'h37: delta_gap0 = 2'd2;
        6'h3b: delta_gap0 = 2'd1;
        6'h3c: delta_gap0 = 2'd1;
        6'h3d: delta_gap0 = 2'd1;
        6'h3e: delta_gap0 = 2'd2;
        6'h3f: delta_gap0 = 2'd2;
        default: delta_gap0 = 2'd0;
      endcase
    end
  endfunction
  function [1:0] delta_gap1;
    input [5:0] key;
    begin
      case (key)
        6'h25: delta_gap1 = 2'd1;
        6'h26: delta_gap1 = 2'd1;
        6'h27: delta_gap1 = 2'd1;
        6'h2d: delta_gap1 = 2'd1;
        6'h2e: delta_gap1 = 2'd1;
        6'h2f: delta_gap1 = 2'd1;
        6'h36: delta_gap1 = 2'd1;
        6'h37: delta_gap1 = 2'd1;
        6'h3e: delta_gap1 = 2'd1;
        6'h3f: delta_gap1 = 2'd1;
        default: delta_gap1 = 2'd0;
      endcase
    end
  endfunction
  wire [5:0] delta_pair_key = {smax, smin};
  wire [1:0] delta0 = delta_gap0(delta_pair_key);
  wire [1:0] delta1 = delta_gap1(delta_pair_key);
  wire [1:0] delta = gap0 ? delta0 : (gap1 ? delta1 : 2'd0);
  wire sat = (maxc == 7'h7e) || ((maxc == 7'h7d) && delta[1]);
  wire [6:0] mag = sat ? 7'h7e : (maxc + {5'd0, delta});
  assign out = nan ? 8'h7f : {1'b0, mag};
endmodule
