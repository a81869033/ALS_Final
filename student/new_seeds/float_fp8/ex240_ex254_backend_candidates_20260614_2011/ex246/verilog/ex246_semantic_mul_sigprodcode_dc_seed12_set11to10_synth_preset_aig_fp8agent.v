module ex246_semantic_mul_sigprodcode_dc_seed12_set11to10(in, out);
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

  function [5:0] sig_product_code;
    input [2:0] sig_a;
    input [2:0] sig_b;
    begin
      case ({sig_a, sig_b})
        6'h00: sig_product_code = 6'd0;
        6'h01: sig_product_code = 6'd0;
        6'h02: sig_product_code = 6'd0;
        6'h03: sig_product_code = 6'd0;
        6'h04: sig_product_code = 6'd0;
        6'h05: sig_product_code = 6'd0;
        6'h06: sig_product_code = 6'd0;
        6'h07: sig_product_code = 6'd0;
        6'h08: sig_product_code = 6'd0;
        6'h09: sig_product_code = 6'd1;
        6'h0a: sig_product_code = 6'd2;
        6'h0b: sig_product_code = 6'd3;
        6'h0c: sig_product_code = 6'd4;
        6'h0d: sig_product_code = 6'd5;
        6'h0e: sig_product_code = 6'd6;
        6'h0f: sig_product_code = 6'd7;
        6'h10: sig_product_code = 6'd0;
        6'h11: sig_product_code = 6'd2;
        6'h12: sig_product_code = 6'd4;
        6'h13: sig_product_code = 6'd6;
        6'h14: sig_product_code = 6'd8;
        6'h15: sig_product_code = 6'd10;
        6'h16: sig_product_code = 6'd12;
        6'h17: sig_product_code = 6'd14;
        6'h18: sig_product_code = 6'd0;
        6'h19: sig_product_code = 6'd3;
        6'h1a: sig_product_code = 6'd6;
        6'h1b: sig_product_code = 6'd9;
        6'h1c: sig_product_code = 6'd12;
        6'h1d: sig_product_code = 6'd15;
        6'h1e: sig_product_code = 6'd18;
        6'h1f: sig_product_code = 6'd21;
        6'h20: sig_product_code = 6'd0;
        6'h21: sig_product_code = 6'd4;
        6'h22: sig_product_code = 6'd8;
        6'h23: sig_product_code = 6'd12;
        6'h24: sig_product_code = 6'd16;
        6'h25: sig_product_code = 6'd20;
        6'h26: sig_product_code = 6'd24;
        6'h27: sig_product_code = 6'd28;
        6'h28: sig_product_code = 6'd0;
        6'h29: sig_product_code = 6'd5;
        6'h2a: sig_product_code = 6'd10;
        6'h2b: sig_product_code = 6'd15;
        6'h2c: sig_product_code = 6'd20;
        6'h2d: sig_product_code = 6'd25;
        6'h2e: sig_product_code = 6'd30;
        6'h2f: sig_product_code = 6'd35;
        6'h30: sig_product_code = 6'd0;
        6'h31: sig_product_code = 6'd6;
        6'h32: sig_product_code = 6'd12;
        6'h33: sig_product_code = 6'd18;
        6'h34: sig_product_code = 6'd24;
        6'h35: sig_product_code = 6'd30;
        6'h36: sig_product_code = 6'd36;
        6'h37: sig_product_code = 6'd42;
        6'h38: sig_product_code = 6'd0;
        6'h39: sig_product_code = 6'd7;
        6'h3a: sig_product_code = 6'd14;
        6'h3b: sig_product_code = 6'd21;
        6'h3c: sig_product_code = 6'd28;
        6'h3d: sig_product_code = 6'd35;
        6'h3e: sig_product_code = 6'd42;
        6'h3f: sig_product_code = 6'd49;
        default: sig_product_code = 6'd0;
      endcase
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
          else if (exp_sum == 6'd15) product_mag = 7'h01;
          else if (exp_sum == 6'd16) product_mag = 7'h02;
          else if (exp_sum >= 6'd48) product_mag = 7'h7e;
          else product_mag = (((exp_sum - 6'd16) << 2) | 7'd1);
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

  wire [2:0] sig_a = sig3(am);
  wire [2:0] sig_b = sig3(bm);
  wire [5:0] product = sig_product_code(sig_a, sig_b);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  assign out = nan ? 8'h7f : {sign, product_mag(exp_sum, product)};
endmodule
