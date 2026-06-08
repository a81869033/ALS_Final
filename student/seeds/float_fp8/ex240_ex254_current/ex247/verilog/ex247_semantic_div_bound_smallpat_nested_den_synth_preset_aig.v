module ex247_semantic_div_bound_smallpat_nested_den(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire nan = (dm == 7'h7f) || (nm == 7'h7f);
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
  wire sign = den[7] ^ num[7];
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

  function [6:0] low_from_pat;
    input [1:0] pat;
    input [1:0] step;
    begin
      case ({pat, step})
        4'h1, 4'h5, 4'h9, 4'hd: low_from_pat = 7'h01;
        4'h2, 4'h7, 4'he: low_from_pat = 7'h02;
        4'h6, 4'ha: low_from_pat = 7'h01;
        4'h3: low_from_pat = 7'h04;
        default: low_from_pat = 7'h03;
      endcase
    end
  endfunction

  function [23:0] bound_attr;
    input [2:0] sig_n;
    input [2:0] sig_d;
    begin
      case (sig_d)
        3'd1: begin
          case (sig_n)
          3'd1: bound_attr = {1'b1, 7'h6f, 7'h11, 5'd15, 2'd0, 2'd0};
          3'd2: bound_attr = {1'b1, 7'h6e, 7'h10, 5'd16, 2'd0, 2'd0};
          3'd3: bound_attr = {1'b1, 7'h6d, 7'h0f, 5'd16, 2'd2, 2'd3};
          3'd4: bound_attr = {1'b1, 7'h6d, 7'h0f, 5'd17, 2'd0, 2'd0};
          3'd5: bound_attr = {1'b1, 7'h6c, 7'h0f, 5'd17, 2'd1, 2'd1};
          3'd6: bound_attr = {1'b1, 7'h6c, 7'h0e, 5'd17, 2'd2, 2'd3};
          3'd7: bound_attr = {1'b1, 7'h6c, 7'h0e, 5'd17, 2'd3, 2'd0};
            default: bound_attr = 24'd0;
          endcase
        end
        3'd2: begin
          case (sig_n)
          3'd1: bound_attr = {1'b1, 7'h70, 7'h12, 5'd14, 2'd0, 2'd0};
          3'd2: bound_attr = {1'b1, 7'h6f, 7'h11, 5'd15, 2'd0, 2'd0};
          3'd3: bound_attr = {1'b1, 7'h6e, 7'h10, 5'd15, 2'd2, 2'd3};
          3'd4: bound_attr = {1'b1, 7'h6e, 7'h10, 5'd16, 2'd0, 2'd0};
          3'd5: bound_attr = {1'b1, 7'h6d, 7'h10, 5'd16, 2'd1, 2'd1};
          3'd6: bound_attr = {1'b1, 7'h6d, 7'h0f, 5'd16, 2'd2, 2'd3};
          3'd7: bound_attr = {1'b1, 7'h6d, 7'h0f, 5'd16, 2'd3, 2'd0};
            default: bound_attr = 24'd0;
          endcase
        end
        3'd3: begin
          case (sig_n)
          3'd1: bound_attr = {1'b1, 7'h70, 7'h13, 5'd13, 2'd1, 2'd2};
          3'd2: bound_attr = {1'b1, 7'h6f, 7'h12, 5'd14, 2'd1, 2'd2};
          3'd3: bound_attr = {1'b1, 7'h6f, 7'h11, 5'd15, 2'd0, 2'd0};
          3'd4: bound_attr = {1'b1, 7'h6e, 7'h11, 5'd15, 2'd1, 2'd2};
          3'd5: bound_attr = {1'b1, 7'h6e, 7'h10, 5'd15, 2'd3, 2'd3};
          3'd6: bound_attr = {1'b1, 7'h6e, 7'h10, 5'd16, 2'd0, 2'd0};
          3'd7: bound_attr = {1'b1, 7'h6d, 7'h10, 5'd16, 2'd1, 2'd1};
            default: bound_attr = 24'd0;
          endcase
        end
        3'd4: begin
          case (sig_n)
          3'd1: bound_attr = {1'b1, 7'h71, 7'h13, 5'd13, 2'd0, 2'd0};
          3'd2: bound_attr = {1'b1, 7'h70, 7'h12, 5'd14, 2'd0, 2'd0};
          3'd3: bound_attr = {1'b1, 7'h6f, 7'h11, 5'd14, 2'd2, 2'd3};
          3'd4: bound_attr = {1'b1, 7'h6f, 7'h11, 5'd15, 2'd0, 2'd0};
          3'd5: bound_attr = {1'b1, 7'h6e, 7'h11, 5'd15, 2'd1, 2'd1};
          3'd6: bound_attr = {1'b1, 7'h6e, 7'h10, 5'd15, 2'd2, 2'd3};
          3'd7: bound_attr = {1'b1, 7'h6e, 7'h10, 5'd15, 2'd3, 2'd0};
            default: bound_attr = 24'd0;
          endcase
        end
        3'd5: begin
          case (sig_n)
          3'd1: bound_attr = {1'b1, 7'h71, 7'h13, 5'd12, 2'd2, 2'd3};
          3'd2: bound_attr = {1'b1, 7'h70, 7'h12, 5'd13, 2'd2, 2'd3};
          3'd3: bound_attr = {1'b1, 7'h6f, 7'h12, 5'd14, 2'd1, 2'd1};
          3'd4: bound_attr = {1'b1, 7'h6f, 7'h11, 5'd14, 2'd2, 2'd3};
          3'd5: bound_attr = {1'b1, 7'h6f, 7'h11, 5'd15, 2'd0, 2'd0};
          3'd6: bound_attr = {1'b1, 7'h6e, 7'h11, 5'd15, 2'd1, 2'd1};
          3'd7: bound_attr = {1'b1, 7'h6e, 7'h10, 5'd15, 2'd2, 2'd2};
            default: bound_attr = 24'd0;
          endcase
        end
        3'd6: begin
          case (sig_n)
          3'd1: bound_attr = {1'b1, 7'h71, 7'h14, 5'd12, 2'd1, 2'd2};
          3'd2: bound_attr = {1'b1, 7'h70, 7'h13, 5'd13, 2'd1, 2'd2};
          3'd3: bound_attr = {1'b1, 7'h70, 7'h12, 5'd14, 2'd0, 2'd0};
          3'd4: bound_attr = {1'b1, 7'h6f, 7'h12, 5'd14, 2'd1, 2'd2};
          3'd5: bound_attr = {1'b1, 7'h6f, 7'h11, 5'd14, 2'd3, 2'd3};
          3'd6: bound_attr = {1'b1, 7'h6f, 7'h11, 5'd15, 2'd0, 2'd0};
          3'd7: bound_attr = {1'b1, 7'h6e, 7'h11, 5'd15, 2'd1, 2'd1};
            default: bound_attr = 24'd0;
          endcase
        end
        3'd7: begin
          case (sig_n)
          3'd1: bound_attr = {1'b1, 7'h71, 7'h14, 5'd12, 2'd1, 2'd1};
          3'd2: bound_attr = {1'b1, 7'h70, 7'h13, 5'd13, 2'd1, 2'd1};
          3'd3: bound_attr = {1'b1, 7'h70, 7'h12, 5'd13, 2'd3, 2'd3};
          3'd4: bound_attr = {1'b1, 7'h6f, 7'h12, 5'd14, 2'd1, 2'd1};
          3'd5: bound_attr = {1'b1, 7'h6f, 7'h11, 5'd14, 2'd2, 2'd2};
          3'd6: bound_attr = {1'b1, 7'h6f, 7'h11, 5'd14, 2'd3, 2'd3};
          3'd7: bound_attr = {1'b1, 7'h6f, 7'h11, 5'd15, 2'd0, 2'd0};
            default: bound_attr = 24'd0;
          endcase
        end
        default: bound_attr = 24'd0;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(nm)}) - $signed({1'b0, eff_exp(dm)});
  wire [23:0] attr = bound_attr(sig_n, sig_d);
  wire valid = attr[23];
  wire signed [6:0] zero_hi = attr[22:16];
  wire signed [6:0] sat_lo = attr[15:9];
  wire [4:0] offset = attr[8:4];
  wire [1:0] mant = attr[3:2];
  wire [1:0] pat = attr[1:0];
  wire signed [6:0] step = delta - zero_hi;
  wire signed [6:0] out_exp_s = delta + $signed({2'b0, offset});
  wire zero = !valid || num_zero || (delta <= zero_hi);
  wire sat = den_zero || (delta >= sat_lo);
  wire [6:0] low_mag = low_from_pat(pat, step[1:0]);
  wire [6:0] linear_mag = {out_exp_s[4:0], mant};
  wire invalid = nan || (den_zero && num_zero);
  wire [6:0] mag = den_zero ? 7'h7e : (zero ? 7'h00 : (sat ? 7'h7e : ((step <= 7'sd3) ? low_mag : linear_mag)));
  assign out = invalid ? 8'h7f : {sign, mag};
endmodule
