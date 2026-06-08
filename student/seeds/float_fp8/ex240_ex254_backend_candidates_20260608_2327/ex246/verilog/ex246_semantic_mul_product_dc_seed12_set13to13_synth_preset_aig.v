module ex246_semantic_mul_product_dc_seed12_set13to13(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
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

  function [6:0] product_mag;
    input [5:0] exp_sum;
    input [5:0] product;
    begin
      case (product)
        6'd1: begin
          if (exp_sum <= 6'd17) product_mag = 7'h00;
          else if (exp_sum == 6'd18) product_mag = 7'h01;
          else if (exp_sum == 6'd19) product_mag = 7'h02;
          else if (exp_sum >= 6'd51) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd19) << 2) | 7'd0);
        end
        6'd2: begin
          if (exp_sum <= 6'd16) product_mag = 7'h00;
          else if (exp_sum == 6'd17) product_mag = 7'h01;
          else if (exp_sum == 6'd18) product_mag = 7'h02;
          else if (exp_sum >= 6'd50) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd18) << 2) | 7'd0);
        end
        6'd3: begin
          if (exp_sum <= 6'd15) product_mag = 7'h00;
          else if (exp_sum == 6'd16) product_mag = 7'h01;
          else if (exp_sum == 6'd17) product_mag = 7'h02;
          else if (exp_sum == 6'd18) product_mag = 7'h03;
          else if (exp_sum >= 6'd49) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd18) << 2) | 7'd2);
        end
        6'd4: begin
          if (exp_sum <= 6'd15) product_mag = 7'h00;
          else if (exp_sum == 6'd16) product_mag = 7'h01;
          else if (exp_sum == 6'd17) product_mag = 7'h02;
          else if (exp_sum >= 6'd49) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd17) << 2) | 7'd0);
        end
        6'd5: begin
          if (exp_sum <= 6'd14) product_mag = 7'h00;
          else if (exp_sum == 6'd15) product_mag = 7'h01;
          else if (exp_sum == 6'd16) product_mag = 7'h01;
          else if (exp_sum == 6'd17) product_mag = 7'h02;
          else if (exp_sum >= 6'd49) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd17) << 2) | 7'd1);
        end
        6'd6: begin
          if (exp_sum <= 6'd14) product_mag = 7'h00;
          else if (exp_sum == 6'd15) product_mag = 7'h01;
          else if (exp_sum == 6'd16) product_mag = 7'h02;
          else if (exp_sum == 6'd17) product_mag = 7'h03;
          else if (exp_sum >= 6'd48) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd17) << 2) | 7'd2);
        end
        6'd7: begin
          if (exp_sum <= 6'd14) product_mag = 7'h00;
          else if (exp_sum == 6'd15) product_mag = 7'h01;
          else if (exp_sum == 6'd16) product_mag = 7'h02;
          else if (exp_sum == 6'd17) product_mag = 7'h04;
          else if (exp_sum >= 6'd48) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd17) << 2) | 7'd3);
        end
        6'd8: begin
          if (exp_sum <= 6'd14) product_mag = 7'h00;
          else if (exp_sum == 6'd15) product_mag = 7'h01;
          else if (exp_sum == 6'd16) product_mag = 7'h02;
          else if (exp_sum >= 6'd48) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd16) << 2) | 7'd0);
        end
        6'd9: begin
          if (exp_sum <= 6'd13) product_mag = 7'h00;
          else if (exp_sum == 6'd14) product_mag = 7'h01;
          else if (exp_sum == 6'd15) product_mag = 7'h01;
          else if (exp_sum == 6'd16) product_mag = 7'h02;
          else if (exp_sum >= 6'd48) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd16) << 2) | 7'd0);
        end
        6'd10: begin
          if (exp_sum <= 6'd13) product_mag = 7'h00;
          else if (exp_sum == 6'd14) product_mag = 7'h01;
          else if (exp_sum == 6'd15) product_mag = 7'h01;
          else if (exp_sum == 6'd16) product_mag = 7'h02;
          else if (exp_sum >= 6'd48) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd16) << 2) | 7'd1);
        end
        6'd11: begin
          if (exp_sum <= 6'd13) product_mag = 7'h00;
          else if (exp_sum == 6'd14) product_mag = 7'h01;
          else if (exp_sum == 6'd15) product_mag = 7'h02;
          else if (exp_sum == 6'd16) product_mag = 7'h03;
          else if (exp_sum >= 6'd47) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd16) << 2) | 7'd2);
        end
        6'd12: begin
          if (exp_sum <= 6'd13) product_mag = 7'h00;
          else if (exp_sum == 6'd14) product_mag = 7'h01;
          else if (exp_sum == 6'd15) product_mag = 7'h02;
          else if (exp_sum == 6'd16) product_mag = 7'h03;
          else if (exp_sum >= 6'd47) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd16) << 2) | 7'd2);
        end
        6'd13: begin
          if (exp_sum <= 6'd13) product_mag = 7'h00;
          else if (exp_sum == 6'd14) product_mag = 7'h01;
          else if (exp_sum == 6'd15) product_mag = 7'h02;
          else if (exp_sum == 6'd16) product_mag = 7'h03;
          else if (exp_sum >= 6'd47) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd16) << 2) | 7'd2);
        end
        6'd14: begin
          if (exp_sum <= 6'd13) product_mag = 7'h00;
          else if (exp_sum == 6'd14) product_mag = 7'h01;
          else if (exp_sum == 6'd15) product_mag = 7'h02;
          else if (exp_sum == 6'd16) product_mag = 7'h04;
          else if (exp_sum >= 6'd47) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd16) << 2) | 7'd3);
        end
        6'd15: begin
          if (exp_sum <= 6'd13) product_mag = 7'h00;
          else if (exp_sum == 6'd14) product_mag = 7'h01;
          else if (exp_sum == 6'd15) product_mag = 7'h02;
          else if (exp_sum >= 6'd47) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd15) << 2) | 7'd0);
        end
        6'd16: begin
          if (exp_sum <= 6'd13) product_mag = 7'h00;
          else if (exp_sum == 6'd14) product_mag = 7'h01;
          else if (exp_sum == 6'd15) product_mag = 7'h02;
          else if (exp_sum >= 6'd47) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd15) << 2) | 7'd0);
        end
        6'd17: begin
          if (exp_sum <= 6'd13) product_mag = 7'h00;
          else if (exp_sum == 6'd14) product_mag = 7'h01;
          else if (exp_sum == 6'd15) product_mag = 7'h02;
          else if (exp_sum >= 6'd47) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd15) << 2) | 7'd0);
        end
        6'd18: begin
          if (exp_sum <= 6'd12) product_mag = 7'h00;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h01;
          else if (exp_sum == 6'd15) product_mag = 7'h02;
          else if (exp_sum >= 6'd47) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd15) << 2) | 7'd0);
        end
        6'd19: begin
          if (exp_sum <= 6'd12) product_mag = 7'h00;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h01;
          else if (exp_sum == 6'd15) product_mag = 7'h02;
          else if (exp_sum >= 6'd47) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd15) << 2) | 7'd1);
        end
        6'd20: begin
          if (exp_sum <= 6'd12) product_mag = 7'h00;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h01;
          else if (exp_sum == 6'd15) product_mag = 7'h02;
          else if (exp_sum >= 6'd47) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd15) << 2) | 7'd1);
        end
        6'd21: begin
          if (exp_sum <= 6'd12) product_mag = 7'h00;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h01;
          else if (exp_sum == 6'd15) product_mag = 7'h03;
          else if (exp_sum >= 6'd47) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd15) << 2) | 7'd1);
        end
        6'd22: begin
          if (exp_sum <= 6'd12) product_mag = 7'h00;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h02;
          else if (exp_sum == 6'd15) product_mag = 7'h03;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd15) << 2) | 7'd2);
        end
        6'd23: begin
          product_mag = 7'h00;
        end
        6'd24: begin
          if (exp_sum <= 6'd12) product_mag = 7'h00;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h02;
          else if (exp_sum == 6'd15) product_mag = 7'h03;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd15) << 2) | 7'd2);
        end
        6'd25: begin
          if (exp_sum <= 6'd12) product_mag = 7'h00;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h02;
          else if (exp_sum == 6'd15) product_mag = 7'h03;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd15) << 2) | 7'd2);
        end
        6'd26: begin
          if (exp_sum <= 6'd12) product_mag = 7'h00;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h02;
          else if (exp_sum == 6'd15) product_mag = 7'h03;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd15) << 2) | 7'd2);
        end
        6'd27: begin
          if (exp_sum <= 6'd12) product_mag = 7'h00;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h02;
          else if (exp_sum == 6'd15) product_mag = 7'h04;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd15) << 2) | 7'd3);
        end
        6'd28: begin
          if (exp_sum <= 6'd12) product_mag = 7'h00;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h02;
          else if (exp_sum == 6'd15) product_mag = 7'h04;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd15) << 2) | 7'd3);
        end
        6'd29: begin
          if (exp_sum <= 6'd12) product_mag = 7'h00;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h02;
          else if (exp_sum == 6'd15) product_mag = 7'h04;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd15) << 2) | 7'd3);
        end
        6'd30: begin
          if (exp_sum <= 6'd12) product_mag = 7'h00;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h02;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd14) << 2) | 7'd0);
        end
        6'd31: begin
          if (exp_sum <= 6'd11) product_mag = 7'h00;
          else if (exp_sum == 6'd12) product_mag = 7'h01;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h02;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd14) << 2) | 7'd0);
        end
        6'd32: begin
          if (exp_sum <= 6'd12) product_mag = 7'h00;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h02;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd14) << 2) | 7'd0);
        end
        6'd33: begin
          product_mag = 7'h00;
        end
        6'd34: begin
          if (exp_sum <= 6'd11) product_mag = 7'h00;
          else if (exp_sum == 6'd12) product_mag = 7'h01;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h02;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd14) << 2) | 7'd0);
        end
        6'd35: begin
          if (exp_sum <= 6'd11) product_mag = 7'h00;
          else if (exp_sum == 6'd12) product_mag = 7'h01;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h02;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd14) << 2) | 7'd0);
        end
        6'd36: begin
          if (exp_sum <= 6'd11) product_mag = 7'h00;
          else if (exp_sum == 6'd12) product_mag = 7'h01;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h02;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd14) << 2) | 7'd0);
        end
        6'd37: begin
          if (exp_sum <= 6'd11) product_mag = 7'h00;
          else if (exp_sum == 6'd12) product_mag = 7'h01;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h03;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd14) << 2) | 7'd1);
        end
        6'd38: begin
          if (exp_sum <= 6'd11) product_mag = 7'h00;
          else if (exp_sum == 6'd12) product_mag = 7'h01;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h02;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd14) << 2) | 7'd0);
        end
        6'd39: begin
          if (exp_sum <= 6'd11) product_mag = 7'h00;
          else if (exp_sum == 6'd12) product_mag = 7'h01;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h02;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd14) << 2) | 7'd1);
        end
        6'd40: begin
          if (exp_sum <= 6'd11) product_mag = 7'h00;
          else if (exp_sum == 6'd12) product_mag = 7'h01;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h02;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd14) << 2) | 7'd0);
        end
        6'd41: begin
          if (exp_sum <= 6'd11) product_mag = 7'h00;
          else if (exp_sum == 6'd12) product_mag = 7'h01;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h03;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd14) << 2) | 7'd1);
        end
        6'd42: begin
          if (exp_sum <= 6'd11) product_mag = 7'h00;
          else if (exp_sum == 6'd12) product_mag = 7'h01;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h03;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd14) << 2) | 7'd1);
        end
        6'd43: begin
          product_mag = 7'h00;
        end
        6'd44: begin
          if (exp_sum <= 6'd11) product_mag = 7'h00;
          else if (exp_sum == 6'd12) product_mag = 7'h01;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h03;
          else if (exp_sum >= 6'd45) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd14) << 2) | 7'd2);
        end
        6'd45: begin
          product_mag = 7'h00;
        end
        6'd46: begin
          if (exp_sum <= 6'd11) product_mag = 7'h00;
          else if (exp_sum == 6'd12) product_mag = 7'h01;
          else if (exp_sum == 6'd13) product_mag = 7'h01;
          else if (exp_sum == 6'd14) product_mag = 7'h03;
          else if (exp_sum >= 6'd46) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd14) << 2) | 7'd1);
        end
        6'd47: begin
          if (exp_sum <= 6'd11) product_mag = 7'h00;
          else if (exp_sum == 6'd12) product_mag = 7'h01;
          else if (exp_sum == 6'd13) product_mag = 7'h02;
          else if (exp_sum == 6'd14) product_mag = 7'h03;
          else if (exp_sum >= 6'd45) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd14) << 2) | 7'd2);
        end
        6'd48: begin
          product_mag = 7'h00;
        end
        6'd49: begin
          if (exp_sum <= 6'd11) product_mag = 7'h00;
          else if (exp_sum == 6'd12) product_mag = 7'h01;
          else if (exp_sum == 6'd13) product_mag = 7'h02;
          else if (exp_sum == 6'd14) product_mag = 7'h03;
          else if (exp_sum >= 6'd45) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd14) << 2) | 7'd2);
        end
        default: product_mag = 7'h00;
      endcase
    end
  endfunction

  wire [5:0] product = sig3(am) * sig3(bm);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  assign out = nan ? 8'h7f : {sign, product_mag(exp_sum, product)};
endmodule
