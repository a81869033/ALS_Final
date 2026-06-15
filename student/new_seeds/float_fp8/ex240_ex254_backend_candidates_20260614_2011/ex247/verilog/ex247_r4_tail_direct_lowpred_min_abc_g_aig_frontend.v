module ex247_r4_tail_direct_lowpred_min_abc_g_aig_frontend(in, out);
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

  function [8:0] bound_tail;
    input [2:0] sig_n;
    input [2:0] sig_d;
    begin
      case (sig_d)
        3'd1: begin
          case (sig_n)
          3'd1: bound_tail = {5'd15, 2'd0, 2'd0};
          3'd2: bound_tail = {5'd16, 2'd0, 2'd0};
          3'd3: bound_tail = {5'd16, 2'd2, 2'd3};
          3'd4: bound_tail = {5'd17, 2'd0, 2'd0};
          3'd5: bound_tail = {5'd17, 2'd1, 2'd1};
          3'd6: bound_tail = {5'd17, 2'd2, 2'd3};
          3'd7: bound_tail = {5'd17, 2'd3, 2'd0};
            default: bound_tail = 9'd0;
          endcase
        end
        3'd2: begin
          case (sig_n)
          3'd1: bound_tail = {5'd14, 2'd0, 2'd0};
          3'd2: bound_tail = {5'd15, 2'd0, 2'd0};
          3'd3: bound_tail = {5'd15, 2'd2, 2'd3};
          3'd4: bound_tail = {5'd16, 2'd0, 2'd0};
          3'd5: bound_tail = {5'd16, 2'd1, 2'd1};
          3'd6: bound_tail = {5'd16, 2'd2, 2'd3};
          3'd7: bound_tail = {5'd16, 2'd3, 2'd0};
            default: bound_tail = 9'd0;
          endcase
        end
        3'd3: begin
          case (sig_n)
          3'd1: bound_tail = {5'd13, 2'd1, 2'd2};
          3'd2: bound_tail = {5'd14, 2'd1, 2'd2};
          3'd3: bound_tail = {5'd15, 2'd0, 2'd0};
          3'd4: bound_tail = {5'd15, 2'd1, 2'd2};
          3'd5: bound_tail = {5'd15, 2'd3, 2'd3};
          3'd6: bound_tail = {5'd16, 2'd0, 2'd0};
          3'd7: bound_tail = {5'd16, 2'd1, 2'd1};
            default: bound_tail = 9'd0;
          endcase
        end
        3'd4: begin
          case (sig_n)
          3'd1: bound_tail = {5'd13, 2'd0, 2'd0};
          3'd2: bound_tail = {5'd14, 2'd0, 2'd0};
          3'd3: bound_tail = {5'd14, 2'd2, 2'd3};
          3'd4: bound_tail = {5'd15, 2'd0, 2'd0};
          3'd5: bound_tail = {5'd15, 2'd1, 2'd1};
          3'd6: bound_tail = {5'd15, 2'd2, 2'd3};
          3'd7: bound_tail = {5'd15, 2'd3, 2'd0};
            default: bound_tail = 9'd0;
          endcase
        end
        3'd5: begin
          case (sig_n)
          3'd1: bound_tail = {5'd12, 2'd2, 2'd3};
          3'd2: bound_tail = {5'd13, 2'd2, 2'd3};
          3'd3: bound_tail = {5'd14, 2'd1, 2'd1};
          3'd4: bound_tail = {5'd14, 2'd2, 2'd3};
          3'd5: bound_tail = {5'd15, 2'd0, 2'd0};
          3'd6: bound_tail = {5'd15, 2'd1, 2'd1};
          3'd7: bound_tail = {5'd15, 2'd2, 2'd2};
            default: bound_tail = 9'd0;
          endcase
        end
        3'd6: begin
          case (sig_n)
          3'd1: bound_tail = {5'd12, 2'd1, 2'd2};
          3'd2: bound_tail = {5'd13, 2'd1, 2'd2};
          3'd3: bound_tail = {5'd14, 2'd0, 2'd0};
          3'd4: bound_tail = {5'd14, 2'd1, 2'd2};
          3'd5: bound_tail = {5'd14, 2'd3, 2'd3};
          3'd6: bound_tail = {5'd15, 2'd0, 2'd0};
          3'd7: bound_tail = {5'd15, 2'd1, 2'd1};
            default: bound_tail = 9'd0;
          endcase
        end
        3'd7: begin
          case (sig_n)
          3'd1: bound_tail = {5'd12, 2'd1, 2'd1};
          3'd2: bound_tail = {5'd13, 2'd1, 2'd1};
          3'd3: bound_tail = {5'd13, 2'd3, 2'd3};
          3'd4: bound_tail = {5'd14, 2'd1, 2'd1};
          3'd5: bound_tail = {5'd14, 2'd2, 2'd2};
          3'd6: bound_tail = {5'd14, 2'd3, 2'd3};
          3'd7: bound_tail = {5'd15, 2'd0, 2'd0};
            default: bound_tail = 9'd0;
          endcase
        end
        default: bound_tail = 9'd0;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(nm)}) - $signed({1'b0, eff_exp(dm)});
  wire [8:0] attr_tail = bound_tail(sig_n, sig_d);
  wire [4:0] offset = attr_tail[8:4];
  wire [1:0] mant = attr_tail[3:2];
  wire [1:0] pat = attr_tail[1:0];
  wire active = !num_zero && !den_zero;
  wire mant_nonzero = |mant;
  wire [5:0] zero_abs = {1'b0, offset} + 6'd2 + {5'd0, mant_nonzero};
  wire signed [6:0] zero_hi = -$signed({1'b0, zero_abs});
  wire [5:0] sat_abs = (mant[1] ? 6'd31 : 6'd32) - {1'b0, offset};
  wire signed [6:0] sat_lo = $signed({1'b0, sat_abs});
  wire signed [6:0] out_exp_s = delta + $signed({2'b0, offset});
  wire [2:0] low_bias = 3'd2 + {2'b00, mant_nonzero};
  wire signed [6:0] step = out_exp_s + $signed({4'b0000, low_bias});
  wire zero_region = !active || (step <= 7'sd0);
  wire sat_region = active && (out_exp_s >= (mant[1] ? 7'sd31 : 7'sd32));
  wire low_region = active && !sat_region && (step > 7'sd0) && (step <= 7'sd3);
  wire [1:0] low_step = step[1:0];
  wire pat0 = !pat[1] && !pat[0];
  wire pat1 = !pat[1] && pat[0];
  wire pat2 = pat[1] && !pat[0];
  wire pat3 = pat[1] && pat[0];
  wire step0 = !low_step[1] && !low_step[0];
  wire step2 = low_step[1] && !low_step[0];
  wire step3 = low_step[1] && low_step[0];
  wire pat12 = pat1 || pat2;
  wire pat23 = pat2 || pat3;
  wire low_b2 = pat0 && step3;
  wire low_b1 = step0 || (step2 && (pat0 || pat3)) || (step3 && !pat0);
  wire low_b0 = !low_step[1] || (step2 && pat12) || (step3 && pat23);
  wire [6:0] low_mag = {4'b0000, low_b2, low_b1, low_b0};
  wire [6:0] linear_mag = {out_exp_s[4:0], mant};
  reg [6:0] mag;
  always @* begin
    casez ({den_zero, zero_region, sat_region, low_region})
      4'b1???: mag = 7'h7e;
      4'b01??: mag = 7'h00;
      4'b001?: mag = 7'h7e;
      4'b0001: mag = low_mag;
      default: mag = linear_mag;
    endcase
  end
  wire invalid = nan || (den_zero && num_zero);
  wire special_non_nan = den_zero || num_zero;
  wire [7:0] special_out = den_zero ? {sign, 7'h7e} : {sign, 7'h00};
  assign out = invalid ? 8'h7f : (special_non_nan ? special_out : {sign, mag});
endmodule
