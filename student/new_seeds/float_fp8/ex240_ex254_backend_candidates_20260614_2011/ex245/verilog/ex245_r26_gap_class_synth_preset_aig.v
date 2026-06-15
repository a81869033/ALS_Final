module top(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire same_sign = (a[7] == b[7]);
  wire a_ge_b = (am >= bm);
  wire [6:0] maxc = a_ge_b ? am : bm;
  wire [6:0] minc = a_ge_b ? bm : am;
  wire max_sign = a_ge_b ? a[7] : b[7];
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

  function [6:0] same_class_mag;
    input [7:0] key;
    input [5:0] base_eff;
    begin
      case (key)
        8'h00: begin
          same_class_mag = 7'h00;
        end
        8'h01: begin
          if (base_eff == 6'd1) same_class_mag = 7'h01;
          else if (base_eff == 6'd2) same_class_mag = 7'h02;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        8'h02: begin
          if (base_eff == 6'd1) same_class_mag = 7'h02;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        8'h03: begin
          if (base_eff == 6'd1) same_class_mag = 7'h03;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        8'h04: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        8'h05: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        8'h06: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        8'h07: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        8'h08: begin
          if (base_eff == 6'd1) same_class_mag = 7'h01;
          else if (base_eff == 6'd2) same_class_mag = 7'h02;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        8'h09: begin
          if (base_eff == 6'd1) same_class_mag = 7'h02;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        8'h0a: begin
          if (base_eff == 6'd1) same_class_mag = 7'h03;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        8'h0b: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        8'h0c: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        8'h0d: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        8'h0e: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        8'h0f: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h10: begin
          if (base_eff == 6'd1) same_class_mag = 7'h02;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        8'h11: begin
          if (base_eff == 6'd1) same_class_mag = 7'h03;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        8'h12: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        8'h13: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        8'h14: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        8'h15: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        8'h16: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h17: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h18: begin
          if (base_eff == 6'd1) same_class_mag = 7'h03;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        8'h19: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        8'h1a: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        8'h1b: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        8'h1c: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        8'h1d: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h1e: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h1f: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        8'h20: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        8'h21: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        8'h22: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        8'h23: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        8'h24: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h25: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h26: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        8'h27: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h28: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        8'h29: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        8'h2a: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        8'h2b: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h2c: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h2d: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        8'h2e: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h2f: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h30: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        8'h31: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        8'h32: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h33: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h34: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        8'h35: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h36: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h37: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h38: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        8'h39: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h3a: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h3b: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        8'h3c: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h3d: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h3e: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h3f: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        8'h40: begin
          same_class_mag = 7'h00;
        end
        8'h41: begin
          if (base_eff == 6'd1) same_class_mag = 7'h01;
          else if (base_eff == 6'd2) same_class_mag = 7'h02;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        8'h42: begin
          if (base_eff == 6'd1) same_class_mag = 7'h02;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        8'h43: begin
          if (base_eff == 6'd1) same_class_mag = 7'h03;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        8'h44: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        8'h45: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        8'h46: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        8'h47: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        8'h48: begin
          if (base_eff == 6'd1) same_class_mag = 7'h02;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        8'h49: begin
          if (base_eff == 6'd1) same_class_mag = 7'h03;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        8'h4a: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        8'h4b: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        8'h4c: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        8'h4d: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        8'h4e: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h4f: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h50: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        8'h51: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        8'h52: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        8'h53: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        8'h54: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h55: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h56: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        8'h57: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h58: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        8'h59: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        8'h5a: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h5b: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h5c: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        8'h5d: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h5e: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h5f: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h60: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h61: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h62: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        8'h63: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h64: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h65: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h66: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        8'h67: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h68: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        8'h69: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h6a: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h6b: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h6c: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        8'h6d: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h6e: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h6f: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h70: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h71: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h72: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        8'h73: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h74: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h75: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h76: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h77: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        8'h78: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        8'h79: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h7a: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h7b: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h7c: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h7d: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        8'h7e: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        8'h7f: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        8'h80: begin
          same_class_mag = 7'h00;
        end
        8'h81: begin
          if (base_eff == 6'd1) same_class_mag = 7'h01;
          else if (base_eff == 6'd2) same_class_mag = 7'h02;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        8'h82: begin
          if (base_eff == 6'd1) same_class_mag = 7'h02;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        8'h83: begin
          if (base_eff == 6'd1) same_class_mag = 7'h03;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        8'h84: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        8'h85: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        8'h86: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        8'h87: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        8'h88: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        8'h89: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        8'h8a: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        8'h8b: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        8'h8c: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h8d: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h8e: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        8'h8f: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h90: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h91: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'h92: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        8'h93: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h94: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h95: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h96: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        8'h97: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h98: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h99: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'h9a: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        8'h9b: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h9c: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h9d: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h9e: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'h9f: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        8'ha0: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'ha1: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'ha2: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'ha3: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        8'ha4: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        8'ha5: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        8'ha6: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        8'ha7: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        8'ha8: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        8'ha9: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        8'haa: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        8'hab: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        8'hac: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        8'had: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        8'hae: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        8'haf: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        8'hb0: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        8'hb1: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        8'hb2: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        8'hb3: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        8'hb4: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        8'hb5: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        8'hb6: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        8'hb7: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        8'hb8: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        8'hb9: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        8'hba: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        8'hbb: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        8'hbc: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        8'hbd: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        8'hbe: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        8'hbf: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        8'hc0: begin
          same_class_mag = 7'h00;
        end
        8'hc1: begin
          if (base_eff == 6'd1) same_class_mag = 7'h01;
          else if (base_eff == 6'd2) same_class_mag = 7'h02;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        8'hc2: begin
          if (base_eff == 6'd1) same_class_mag = 7'h02;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        8'hc3: begin
          if (base_eff == 6'd1) same_class_mag = 7'h03;
          else if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        8'hc4: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        8'hc5: begin
          if (base_eff >= 6'd32) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        8'hc6: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        8'hc7: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        8'hc8: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'hc9: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        8'hca: begin
          if (base_eff >= 6'd31) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        8'hcb: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'hcc: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'hcd: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        8'hce: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        8'hcf: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'hd0: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'hd1: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'hd2: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        8'hd3: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        8'hd4: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        8'hd5: begin
          if (base_eff >= 6'd30) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        8'hd6: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        8'hd7: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        8'hd8: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        8'hd9: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        8'hda: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        8'hdb: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        8'hdc: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        8'hdd: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        8'hde: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        8'hdf: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        8'he0: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        8'he1: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        8'he2: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        8'he3: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        8'he4: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        8'he5: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        8'he6: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        8'he7: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        8'he8: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        8'he9: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        8'hea: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        8'heb: begin
          if (base_eff >= 6'd29) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        8'hec: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        8'hed: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        8'hee: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        8'hef: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        8'hf0: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        8'hf1: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        8'hf2: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        8'hf3: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        8'hf4: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        8'hf5: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        8'hf6: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        8'hf7: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        8'hf8: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        8'hf9: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        8'hfa: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        8'hfb: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        8'hfc: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        8'hfd: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        8'hfe: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        8'hff: begin
          if (base_eff >= 6'd28) same_class_mag = 7'h7e;
          else same_class_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        default: same_class_mag = 7'h00;
      endcase
    end
  endfunction

  function [6:0] diff_class_mag;
    input [8:0] key;
    input [5:0] base_eff;
    begin
      case (key)
        9'h000: begin
          diff_class_mag = 7'h00;
        end
        9'h001: begin
          diff_class_mag = 7'h00;
        end
        9'h002: begin
          diff_class_mag = 7'h00;
        end
        9'h003: begin
          diff_class_mag = 7'h00;
        end
        9'h004: begin
          diff_class_mag = 7'h00;
        end
        9'h005: begin
          diff_class_mag = 7'h00;
        end
        9'h006: begin
          diff_class_mag = 7'h00;
        end
        9'h007: begin
          diff_class_mag = 7'h00;
        end
        9'h008: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h01;
          else if (base_eff == 6'd2) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        9'h009: begin
          diff_class_mag = 7'h00;
        end
        9'h00a: begin
          diff_class_mag = 7'h00;
        end
        9'h00b: begin
          diff_class_mag = 7'h00;
        end
        9'h00c: begin
          diff_class_mag = 7'h00;
        end
        9'h00d: begin
          diff_class_mag = 7'h00;
        end
        9'h00e: begin
          diff_class_mag = 7'h00;
        end
        9'h00f: begin
          diff_class_mag = 7'h00;
        end
        9'h010: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        9'h011: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h01;
          else if (base_eff == 6'd2) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        9'h012: begin
          diff_class_mag = 7'h00;
        end
        9'h013: begin
          diff_class_mag = 7'h00;
        end
        9'h014: begin
          diff_class_mag = 7'h00;
        end
        9'h015: begin
          diff_class_mag = 7'h00;
        end
        9'h016: begin
          diff_class_mag = 7'h00;
        end
        9'h017: begin
          diff_class_mag = 7'h00;
        end
        9'h018: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h03;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        9'h019: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        9'h01a: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h01;
          else if (base_eff == 6'd2) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        9'h01b: begin
          diff_class_mag = 7'h00;
        end
        9'h01c: begin
          diff_class_mag = 7'h00;
        end
        9'h01d: begin
          diff_class_mag = 7'h00;
        end
        9'h01e: begin
          diff_class_mag = 7'h00;
        end
        9'h01f: begin
          diff_class_mag = 7'h00;
        end
        9'h020: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        9'h021: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h03;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        9'h022: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        9'h023: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h01;
          else if (base_eff == 6'd2) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        9'h024: begin
          diff_class_mag = 7'h00;
        end
        9'h025: begin
          diff_class_mag = 7'h00;
        end
        9'h026: begin
          diff_class_mag = 7'h00;
        end
        9'h027: begin
          diff_class_mag = 7'h00;
        end
        9'h028: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        9'h029: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        9'h02a: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h03;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        9'h02b: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        9'h02c: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h01;
          else if (base_eff == 6'd2) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        9'h02d: begin
          diff_class_mag = 7'h00;
        end
        9'h02e: begin
          diff_class_mag = 7'h00;
        end
        9'h02f: begin
          diff_class_mag = 7'h00;
        end
        9'h030: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        9'h031: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        9'h032: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        9'h033: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h03;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        9'h034: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        9'h035: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h01;
          else if (base_eff == 6'd2) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        9'h036: begin
          diff_class_mag = 7'h00;
        end
        9'h037: begin
          diff_class_mag = 7'h00;
        end
        9'h038: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        9'h039: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        9'h03a: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        9'h03b: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        9'h03c: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h03;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        9'h03d: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        9'h03e: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h01;
          else if (base_eff == 6'd2) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        9'h03f: begin
          diff_class_mag = 7'h00;
        end
        9'h040: begin
          diff_class_mag = 7'h00;
        end
        9'h041: begin
          diff_class_mag = 7'h00;
        end
        9'h042: begin
          diff_class_mag = 7'h00;
        end
        9'h043: begin
          diff_class_mag = 7'h00;
        end
        9'h044: begin
          diff_class_mag = 7'h00;
        end
        9'h045: begin
          diff_class_mag = 7'h00;
        end
        9'h046: begin
          diff_class_mag = 7'h00;
        end
        9'h047: begin
          diff_class_mag = 7'h00;
        end
        9'h048: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        9'h049: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h01;
          else if (base_eff == 6'd2) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        9'h04a: begin
          diff_class_mag = 7'h00;
        end
        9'h04b: begin
          diff_class_mag = 7'h00;
        end
        9'h04c: begin
          diff_class_mag = 7'h00;
        end
        9'h04d: begin
          diff_class_mag = 7'h00;
        end
        9'h04e: begin
          diff_class_mag = 7'h00;
        end
        9'h04f: begin
          diff_class_mag = 7'h00;
        end
        9'h050: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        9'h051: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h03;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        9'h052: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        9'h053: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h01;
          else if (base_eff == 6'd2) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        9'h054: begin
          diff_class_mag = 7'h00;
        end
        9'h055: begin
          diff_class_mag = 7'h00;
        end
        9'h056: begin
          diff_class_mag = 7'h00;
        end
        9'h057: begin
          diff_class_mag = 7'h00;
        end
        9'h058: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        9'h059: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        9'h05a: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        9'h05b: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h03;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        9'h05c: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        9'h05d: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h01;
          else if (base_eff == 6'd2) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        9'h05e: begin
          diff_class_mag = 7'h00;
        end
        9'h05f: begin
          diff_class_mag = 7'h00;
        end
        9'h060: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        9'h061: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        9'h062: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        9'h063: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        9'h064: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        9'h065: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h03;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        9'h066: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        9'h067: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h01;
          else if (base_eff == 6'd2) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        9'h068: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        9'h069: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        9'h06a: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        9'h06b: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        9'h06c: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        9'h06d: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        9'h06e: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        9'h06f: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h03;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        9'h070: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h071: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h072: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        9'h073: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        9'h074: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        9'h075: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        9'h076: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        9'h077: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        9'h078: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        9'h079: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h07a: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h07b: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h07c: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        9'h07d: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        9'h07e: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        9'h07f: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        9'h080: begin
          diff_class_mag = 7'h00;
        end
        9'h081: begin
          diff_class_mag = 7'h00;
        end
        9'h082: begin
          diff_class_mag = 7'h00;
        end
        9'h083: begin
          diff_class_mag = 7'h00;
        end
        9'h084: begin
          diff_class_mag = 7'h00;
        end
        9'h085: begin
          diff_class_mag = 7'h00;
        end
        9'h086: begin
          diff_class_mag = 7'h00;
        end
        9'h087: begin
          diff_class_mag = 7'h00;
        end
        9'h088: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        9'h089: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h03;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        9'h08a: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        9'h08b: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h01;
          else if (base_eff == 6'd2) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        9'h08c: begin
          diff_class_mag = 7'h00;
        end
        9'h08d: begin
          diff_class_mag = 7'h00;
        end
        9'h08e: begin
          diff_class_mag = 7'h00;
        end
        9'h08f: begin
          diff_class_mag = 7'h00;
        end
        9'h090: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        9'h091: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        9'h092: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        9'h093: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        9'h094: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        9'h095: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h03;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        9'h096: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        9'h097: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h01;
          else if (base_eff == 6'd2) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        9'h098: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h099: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h09a: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        9'h09b: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        9'h09c: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        9'h09d: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        9'h09e: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        9'h09f: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        9'h0a0: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        9'h0a1: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        9'h0a2: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        9'h0a3: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h0a4: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h0a5: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h0a6: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        9'h0a7: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        9'h0a8: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        9'h0a9: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        9'h0aa: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        9'h0ab: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        9'h0ac: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        9'h0ad: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        9'h0ae: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        9'h0af: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h0b0: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        9'h0b1: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        9'h0b2: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        9'h0b3: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        9'h0b4: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        9'h0b5: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        9'h0b6: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        9'h0b7: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        9'h0b8: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        9'h0b9: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        9'h0ba: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        9'h0bb: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        9'h0bc: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        9'h0bd: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        9'h0be: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        9'h0bf: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        9'h0c0: begin
          diff_class_mag = 7'h00;
        end
        9'h0c1: begin
          diff_class_mag = 7'h00;
        end
        9'h0c2: begin
          diff_class_mag = 7'h00;
        end
        9'h0c3: begin
          diff_class_mag = 7'h00;
        end
        9'h0c4: begin
          diff_class_mag = 7'h00;
        end
        9'h0c5: begin
          diff_class_mag = 7'h00;
        end
        9'h0c6: begin
          diff_class_mag = 7'h00;
        end
        9'h0c7: begin
          diff_class_mag = 7'h00;
        end
        9'h0c8: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        9'h0c9: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        9'h0ca: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        9'h0cb: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        9'h0cc: begin
          if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        9'h0cd: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h03;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        9'h0ce: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        9'h0cf: begin
          if (base_eff == 6'd1) diff_class_mag = 7'h01;
          else if (base_eff == 6'd2) diff_class_mag = 7'h02;
          else if (base_eff >= 6'd32) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        9'h0d0: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        9'h0d1: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        9'h0d2: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        9'h0d3: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h0d4: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h0d5: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h0d6: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        9'h0d7: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        9'h0d8: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        9'h0d9: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        9'h0da: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        9'h0db: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        9'h0dc: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        9'h0dd: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        9'h0de: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        9'h0df: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        9'h0e0: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        9'h0e1: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        9'h0e2: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        9'h0e3: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        9'h0e4: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        9'h0e5: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        9'h0e6: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        9'h0e7: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        9'h0e8: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        9'h0e9: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        9'h0ea: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        9'h0eb: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        9'h0ec: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        9'h0ed: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        9'h0ee: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        9'h0ef: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        9'h0f0: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        9'h0f1: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        9'h0f2: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        9'h0f3: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        9'h0f4: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        9'h0f5: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        9'h0f6: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        9'h0f7: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        9'h0f8: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        9'h0f9: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        9'h0fa: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        9'h0fb: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        9'h0fc: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        9'h0fd: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        9'h0fe: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        9'h0ff: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        9'h100: begin
          diff_class_mag = 7'h00;
        end
        9'h101: begin
          diff_class_mag = 7'h00;
        end
        9'h102: begin
          diff_class_mag = 7'h00;
        end
        9'h103: begin
          diff_class_mag = 7'h00;
        end
        9'h104: begin
          diff_class_mag = 7'h00;
        end
        9'h105: begin
          diff_class_mag = 7'h00;
        end
        9'h106: begin
          diff_class_mag = 7'h00;
        end
        9'h107: begin
          diff_class_mag = 7'h00;
        end
        9'h108: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        9'h109: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        9'h10a: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        9'h10b: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h10c: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h10d: begin
          if (base_eff >= 6'd30) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        9'h10e: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        9'h10f: begin
          if (base_eff >= 6'd31) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        9'h110: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        9'h111: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        9'h112: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        9'h113: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        9'h114: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        9'h115: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        9'h116: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        9'h117: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        9'h118: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        9'h119: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        9'h11a: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        9'h11b: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        9'h11c: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        9'h11d: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        9'h11e: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        9'h11f: begin
          if (base_eff >= 6'd29) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        9'h120: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        9'h121: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        9'h122: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        9'h123: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        9'h124: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        9'h125: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        9'h126: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        9'h127: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        9'h128: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd1);
        end
        9'h129: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd1);
        end
        9'h12a: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd1);
        end
        9'h12b: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd1);
        end
        9'h12c: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd1);
        end
        9'h12d: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd1);
        end
        9'h12e: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd1);
        end
        9'h12f: begin
          if (base_eff >= 6'd28) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd1);
        end
        9'h130: begin
          if (base_eff >= 6'd27) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd2);
        end
        9'h131: begin
          if (base_eff >= 6'd27) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd2);
        end
        9'h132: begin
          if (base_eff >= 6'd27) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd2);
        end
        9'h133: begin
          if (base_eff >= 6'd27) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd2);
        end
        9'h134: begin
          if (base_eff >= 6'd27) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd2);
        end
        9'h135: begin
          if (base_eff >= 6'd27) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd2);
        end
        9'h136: begin
          if (base_eff >= 6'd27) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd2);
        end
        9'h137: begin
          if (base_eff >= 6'd27) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd2);
        end
        9'h138: begin
          if (base_eff >= 6'd27) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd3);
        end
        9'h139: begin
          if (base_eff >= 6'd27) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd3);
        end
        9'h13a: begin
          if (base_eff >= 6'd27) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd3);
        end
        9'h13b: begin
          if (base_eff >= 6'd27) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd3);
        end
        9'h13c: begin
          if (base_eff >= 6'd27) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd3);
        end
        9'h13d: begin
          if (base_eff >= 6'd27) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd3);
        end
        9'h13e: begin
          if (base_eff >= 6'd27) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd3);
        end
        9'h13f: begin
          if (base_eff >= 6'd27) diff_class_mag = 7'h7e;
          else diff_class_mag = (((base_eff + 6'd4) << 2) | 7'd3);
        end
        default: diff_class_mag = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] max_sig = sig3(maxc);
  wire [2:0] min_sig = sig3(minc);
  wire [5:0] max_eff = eff_exp(maxc);
  wire [5:0] min_eff = eff_exp(minc);
  wire [5:0] gap = max_eff - min_eff;
  wire [6:0] same_mag = (gap <= 6'd3) ? same_class_mag({gap[1:0], max_sig, min_sig}, min_eff) : maxc;
  wire [6:0] diff_mag = (gap <= 6'd4) ? diff_class_mag({gap[2:0], max_sig, min_sig}, min_eff) : maxc;
  wire [6:0] out_mag = same_sign ? same_mag : diff_mag;
  wire diff_sign = (maxc == minc) ? 1'b0 : max_sign;
  wire out_sign = same_sign ? a[7] : diff_sign;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
