module ex254_semantic_e4add_fp4product_grs_magfactored(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  function [6:0] fp4_product_mag_e4;
    input [2:0] left_mag;
    input [2:0] right_mag;
    begin
      case ({left_mag, right_mag})
        6'h00: fp4_product_mag_e4 = 7'h00;
        6'h01: fp4_product_mag_e4 = 7'h00;
        6'h02: fp4_product_mag_e4 = 7'h00;
        6'h03: fp4_product_mag_e4 = 7'h00;
        6'h04: fp4_product_mag_e4 = 7'h00;
        6'h05: fp4_product_mag_e4 = 7'h00;
        6'h06: fp4_product_mag_e4 = 7'h00;
        6'h07: fp4_product_mag_e4 = 7'h00;
        6'h08: fp4_product_mag_e4 = 7'h00;
        6'h09: fp4_product_mag_e4 = 7'h28;
        6'h0a: fp4_product_mag_e4 = 7'h30;
        6'h0b: fp4_product_mag_e4 = 7'h34;
        6'h0c: fp4_product_mag_e4 = 7'h38;
        6'h0d: fp4_product_mag_e4 = 7'h3c;
        6'h0e: fp4_product_mag_e4 = 7'h40;
        6'h0f: fp4_product_mag_e4 = 7'h44;
        6'h10: fp4_product_mag_e4 = 7'h00;
        6'h11: fp4_product_mag_e4 = 7'h30;
        6'h12: fp4_product_mag_e4 = 7'h38;
        6'h13: fp4_product_mag_e4 = 7'h3c;
        6'h14: fp4_product_mag_e4 = 7'h40;
        6'h15: fp4_product_mag_e4 = 7'h44;
        6'h16: fp4_product_mag_e4 = 7'h48;
        6'h17: fp4_product_mag_e4 = 7'h4c;
        6'h18: fp4_product_mag_e4 = 7'h00;
        6'h19: fp4_product_mag_e4 = 7'h34;
        6'h1a: fp4_product_mag_e4 = 7'h3c;
        6'h1b: fp4_product_mag_e4 = 7'h41;
        6'h1c: fp4_product_mag_e4 = 7'h44;
        6'h1d: fp4_product_mag_e4 = 7'h49;
        6'h1e: fp4_product_mag_e4 = 7'h4c;
        6'h1f: fp4_product_mag_e4 = 7'h51;
        6'h20: fp4_product_mag_e4 = 7'h00;
        6'h21: fp4_product_mag_e4 = 7'h38;
        6'h22: fp4_product_mag_e4 = 7'h40;
        6'h23: fp4_product_mag_e4 = 7'h44;
        6'h24: fp4_product_mag_e4 = 7'h48;
        6'h25: fp4_product_mag_e4 = 7'h4c;
        6'h26: fp4_product_mag_e4 = 7'h50;
        6'h27: fp4_product_mag_e4 = 7'h54;
        6'h28: fp4_product_mag_e4 = 7'h00;
        6'h29: fp4_product_mag_e4 = 7'h3c;
        6'h2a: fp4_product_mag_e4 = 7'h44;
        6'h2b: fp4_product_mag_e4 = 7'h49;
        6'h2c: fp4_product_mag_e4 = 7'h4c;
        6'h2d: fp4_product_mag_e4 = 7'h51;
        6'h2e: fp4_product_mag_e4 = 7'h54;
        6'h2f: fp4_product_mag_e4 = 7'h59;
        6'h30: fp4_product_mag_e4 = 7'h00;
        6'h31: fp4_product_mag_e4 = 7'h40;
        6'h32: fp4_product_mag_e4 = 7'h48;
        6'h33: fp4_product_mag_e4 = 7'h4c;
        6'h34: fp4_product_mag_e4 = 7'h50;
        6'h35: fp4_product_mag_e4 = 7'h54;
        6'h36: fp4_product_mag_e4 = 7'h58;
        6'h37: fp4_product_mag_e4 = 7'h5c;
        6'h38: fp4_product_mag_e4 = 7'h00;
        6'h39: fp4_product_mag_e4 = 7'h44;
        6'h3a: fp4_product_mag_e4 = 7'h4c;
        6'h3b: fp4_product_mag_e4 = 7'h51;
        6'h3c: fp4_product_mag_e4 = 7'h54;
        6'h3d: fp4_product_mag_e4 = 7'h59;
        6'h3e: fp4_product_mag_e4 = 7'h5c;
        6'h3f: fp4_product_mag_e4 = 7'h61;
        default: fp4_product_mag_e4 = 7'h00;
      endcase
    end
  endfunction

  function [7:0] fp4_product_e4;
    input [7:0] packed;
    reg neg;
    reg is_zero;
    reg [6:0] mag_code;
    begin
      neg = packed[7] ^ packed[3];
      is_zero = (packed[6:4] == 3'd0) || (packed[2:0] == 3'd0);
      mag_code = fp4_product_mag_e4(packed[6:4], packed[2:0]);
      fp4_product_e4 = is_zero ? {neg, 7'h00} : {neg, mag_code};
    end
  endfunction

  wire [7:0] b = fp4_product_e4(in[7:0]);
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire same_sign = (a[7] == b[7]);
  wire a_ge_b = (am >= bm);
  wire [6:0] maxc = a_ge_b ? am : bm;
  wire [6:0] minc = a_ge_b ? bm : am;

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [3:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 4'd1 : v[6:3];
    end
  endfunction

  function [7:0] norm_param;
    input [7:0] sigval;
    begin
      case (sigval)
        8'd1: norm_param = 8'hd8;
        8'd2: norm_param = 8'he8;
        8'd3: norm_param = 8'hec;
        8'd4: norm_param = 8'hf8;
        8'd5: norm_param = 8'hfa;
        8'd6: norm_param = 8'hfc;
        8'd7: norm_param = 8'hfe;
        8'd8: norm_param = 8'h08;
        8'd9: norm_param = 8'h09;
        8'd10: norm_param = 8'h0a;
        8'd11: norm_param = 8'h0b;
        8'd12: norm_param = 8'h0c;
        8'd13: norm_param = 8'h0d;
        8'd14: norm_param = 8'h0e;
        8'd15: norm_param = 8'h0f;
        8'd16: norm_param = 8'h18;
        8'd17: norm_param = 8'h18;
        8'd18: norm_param = 8'h19;
        8'd19: norm_param = 8'h1a;
        8'd20: norm_param = 8'h1a;
        8'd21: norm_param = 8'h1a;
        8'd22: norm_param = 8'h1b;
        8'd23: norm_param = 8'h1c;
        8'd24: norm_param = 8'h1c;
        8'd25: norm_param = 8'h1c;
        8'd26: norm_param = 8'h1d;
        8'd27: norm_param = 8'h1e;
        8'd28: norm_param = 8'h1e;
        8'd29: norm_param = 8'h1e;
        8'd30: norm_param = 8'h1f;
        8'd31: norm_param = 8'h28;
        8'd32: norm_param = 8'h28;
        8'd33: norm_param = 8'h28;
        8'd34: norm_param = 8'h28;
        8'd35: norm_param = 8'h29;
        8'd36: norm_param = 8'h29;
        8'd37: norm_param = 8'h29;
        8'd38: norm_param = 8'h2a;
        8'd39: norm_param = 8'h2a;
        8'd40: norm_param = 8'h2a;
        8'd41: norm_param = 8'h2a;
        8'd42: norm_param = 8'h2a;
        8'd43: norm_param = 8'h2b;
        8'd44: norm_param = 8'h2b;
        8'd45: norm_param = 8'h2b;
        8'd46: norm_param = 8'h2c;
        8'd47: norm_param = 8'h2c;
        8'd48: norm_param = 8'h2c;
        8'd49: norm_param = 8'h2c;
        8'd50: norm_param = 8'h2c;
        8'd51: norm_param = 8'h2d;
        8'd52: norm_param = 8'h2d;
        8'd53: norm_param = 8'h2d;
        8'd54: norm_param = 8'h2e;
        8'd55: norm_param = 8'h2e;
        8'd56: norm_param = 8'h2e;
        8'd57: norm_param = 8'h2e;
        8'd58: norm_param = 8'h2e;
        8'd59: norm_param = 8'h2f;
        8'd60: norm_param = 8'h2f;
        8'd61: norm_param = 8'h2f;
        8'd62: norm_param = 8'h38;
        8'd63: norm_param = 8'h38;
        8'd64: norm_param = 8'h38;
        8'd65: norm_param = 8'h38;
        8'd66: norm_param = 8'h38;
        8'd67: norm_param = 8'h38;
        8'd68: norm_param = 8'h38;
        8'd69: norm_param = 8'h39;
        8'd70: norm_param = 8'h39;
        8'd71: norm_param = 8'h39;
        8'd72: norm_param = 8'h39;
        8'd73: norm_param = 8'h39;
        8'd74: norm_param = 8'h39;
        8'd75: norm_param = 8'h39;
        8'd76: norm_param = 8'h3a;
        8'd77: norm_param = 8'h3a;
        8'd78: norm_param = 8'h3a;
        8'd79: norm_param = 8'h3a;
        8'd80: norm_param = 8'h3a;
        8'd81: norm_param = 8'h3a;
        8'd82: norm_param = 8'h3a;
        8'd83: norm_param = 8'h3a;
        8'd84: norm_param = 8'h3a;
        8'd85: norm_param = 8'h3b;
        8'd86: norm_param = 8'h3b;
        8'd87: norm_param = 8'h3b;
        8'd88: norm_param = 8'h3b;
        8'd89: norm_param = 8'h3b;
        8'd90: norm_param = 8'h3b;
        8'd91: norm_param = 8'h3b;
        8'd92: norm_param = 8'h3c;
        8'd93: norm_param = 8'h3c;
        8'd94: norm_param = 8'h3c;
        8'd95: norm_param = 8'h3c;
        8'd96: norm_param = 8'h3c;
        8'd97: norm_param = 8'h3c;
        8'd98: norm_param = 8'h3c;
        8'd99: norm_param = 8'h3c;
        8'd100: norm_param = 8'h3c;
        8'd101: norm_param = 8'h3d;
        8'd102: norm_param = 8'h3d;
        8'd103: norm_param = 8'h3d;
        8'd104: norm_param = 8'h3d;
        8'd105: norm_param = 8'h3d;
        8'd106: norm_param = 8'h3d;
        8'd107: norm_param = 8'h3d;
        8'd108: norm_param = 8'h3e;
        8'd109: norm_param = 8'h3e;
        8'd110: norm_param = 8'h3e;
        8'd111: norm_param = 8'h3e;
        8'd112: norm_param = 8'h3e;
        8'd113: norm_param = 8'h3e;
        8'd114: norm_param = 8'h3e;
        8'd115: norm_param = 8'h3e;
        8'd116: norm_param = 8'h3e;
        8'd117: norm_param = 8'h3f;
        8'd118: norm_param = 8'h3f;
        8'd119: norm_param = 8'h3f;
        8'd120: norm_param = 8'h3f;
        8'd121: norm_param = 8'h3f;
        8'd122: norm_param = 8'h3f;
        8'd123: norm_param = 8'h3f;
        8'd124: norm_param = 8'h48;
        8'd125: norm_param = 8'h48;
        8'd126: norm_param = 8'h48;
        8'd127: norm_param = 8'h48;
        8'd128: norm_param = 8'h48;
        8'd129: norm_param = 8'h48;
        8'd130: norm_param = 8'h48;
        8'd131: norm_param = 8'h48;
        8'd132: norm_param = 8'h48;
        8'd133: norm_param = 8'h48;
        8'd134: norm_param = 8'h48;
        8'd135: norm_param = 8'h48;
        8'd136: norm_param = 8'h48;
        8'd137: norm_param = 8'h49;
        8'd138: norm_param = 8'h49;
        8'd139: norm_param = 8'h49;
        8'd140: norm_param = 8'h49;
        8'd141: norm_param = 8'h49;
        8'd142: norm_param = 8'h49;
        8'd143: norm_param = 8'h49;
        8'd144: norm_param = 8'h49;
        8'd145: norm_param = 8'h49;
        8'd146: norm_param = 8'h49;
        8'd147: norm_param = 8'h49;
        8'd148: norm_param = 8'h49;
        8'd149: norm_param = 8'h49;
        8'd150: norm_param = 8'h49;
        8'd151: norm_param = 8'h49;
        8'd152: norm_param = 8'h4a;
        8'd153: norm_param = 8'h4a;
        8'd154: norm_param = 8'h4a;
        8'd155: norm_param = 8'h4a;
        8'd156: norm_param = 8'h4a;
        8'd157: norm_param = 8'h4a;
        8'd158: norm_param = 8'h4a;
        8'd159: norm_param = 8'h4a;
        8'd160: norm_param = 8'h4a;
        8'd161: norm_param = 8'h4a;
        8'd162: norm_param = 8'h4a;
        8'd163: norm_param = 8'h4a;
        8'd164: norm_param = 8'h4a;
        8'd165: norm_param = 8'h4a;
        8'd166: norm_param = 8'h4a;
        8'd167: norm_param = 8'h4a;
        8'd168: norm_param = 8'h4a;
        8'd169: norm_param = 8'h4b;
        8'd170: norm_param = 8'h4b;
        8'd171: norm_param = 8'h4b;
        8'd172: norm_param = 8'h4b;
        8'd173: norm_param = 8'h4b;
        8'd174: norm_param = 8'h4b;
        8'd175: norm_param = 8'h4b;
        8'd176: norm_param = 8'h4b;
        8'd177: norm_param = 8'h4b;
        8'd178: norm_param = 8'h4b;
        8'd179: norm_param = 8'h4b;
        8'd180: norm_param = 8'h4b;
        8'd181: norm_param = 8'h4b;
        8'd182: norm_param = 8'h4b;
        8'd183: norm_param = 8'h4b;
        8'd184: norm_param = 8'h4c;
        8'd185: norm_param = 8'h4c;
        8'd186: norm_param = 8'h4c;
        8'd187: norm_param = 8'h4c;
        8'd188: norm_param = 8'h4c;
        8'd189: norm_param = 8'h4c;
        8'd190: norm_param = 8'h4c;
        8'd191: norm_param = 8'h4c;
        8'd192: norm_param = 8'h4c;
        8'd193: norm_param = 8'h4c;
        8'd194: norm_param = 8'h4c;
        8'd195: norm_param = 8'h4c;
        8'd196: norm_param = 8'h4c;
        8'd197: norm_param = 8'h4c;
        8'd198: norm_param = 8'h4c;
        8'd199: norm_param = 8'h4c;
        8'd200: norm_param = 8'h4c;
        8'd201: norm_param = 8'h4d;
        8'd202: norm_param = 8'h4d;
        8'd203: norm_param = 8'h4d;
        8'd204: norm_param = 8'h4d;
        8'd205: norm_param = 8'h4d;
        8'd206: norm_param = 8'h4d;
        8'd207: norm_param = 8'h4d;
        8'd208: norm_param = 8'h4d;
        8'd209: norm_param = 8'h4d;
        8'd210: norm_param = 8'h4d;
        8'd211: norm_param = 8'h4d;
        8'd212: norm_param = 8'h4d;
        8'd213: norm_param = 8'h4d;
        8'd214: norm_param = 8'h4d;
        8'd215: norm_param = 8'h4d;
        8'd216: norm_param = 8'h4e;
        8'd217: norm_param = 8'h4e;
        8'd218: norm_param = 8'h4e;
        8'd219: norm_param = 8'h4e;
        8'd220: norm_param = 8'h4e;
        8'd221: norm_param = 8'h4e;
        8'd222: norm_param = 8'h4e;
        8'd223: norm_param = 8'h4e;
        8'd224: norm_param = 8'h4e;
        8'd225: norm_param = 8'h4e;
        8'd226: norm_param = 8'h4e;
        8'd227: norm_param = 8'h4e;
        8'd228: norm_param = 8'h4e;
        8'd229: norm_param = 8'h4e;
        8'd230: norm_param = 8'h4e;
        8'd231: norm_param = 8'h4e;
        8'd232: norm_param = 8'h4e;
        8'd233: norm_param = 8'h4f;
        8'd234: norm_param = 8'h4f;
        8'd235: norm_param = 8'h4f;
        8'd236: norm_param = 8'h4f;
        8'd237: norm_param = 8'h4f;
        8'd238: norm_param = 8'h4f;
        8'd239: norm_param = 8'h4f;
        8'd240: norm_param = 8'h4f;
        default: norm_param = 8'h00;
      endcase
    end
  endfunction

  function [6:0] norm8;
    input [7:0] sigval;
    input [3:0] base_eff;
    reg [7:0] param;
    reg signed [5:0] exp_calc;
    reg [3:0] sig_round;
    reg [8:0] sub_k;
    begin
      if (sigval == 8'd0) norm8 = 7'h00;
      else begin
        param = norm_param(sigval);
        exp_calc = $signed({{2{param[7]}}, param[7:4]}) + $signed({2'b00, base_eff});
        sig_round = param[3:0];
        if (exp_calc <= 0) begin
          sub_k = {1'b0, sigval} << (base_eff - 4'd1);
          norm8 = (sub_k > 9'd7) ? 7'h07 : sub_k[6:0];
        end else if ((exp_calc > 6'sd15) || ((exp_calc == 6'sd15) && (sig_round >= 4'd15))) begin
          norm8 = 7'h7e;
        end else begin
          norm8 = {exp_calc[3:0], sig_round[2:0]};
        end
      end
    end
  endfunction

  function [6:0] same_grs;
    input [8:0] ext_sum;
    input [3:0] max_eff;
    reg [4:0] exp_out;
    reg [4:0] sig_round;
    reg round_up;
    begin
      if (ext_sum[8]) begin
        exp_out = {1'b0, max_eff} + 5'd1;
        round_up = (ext_sum[4:0] > 5'd16) || ((ext_sum[4:0] == 5'd16) && ext_sum[5]);
        sig_round = {1'b0, ext_sum[8:5]} + {4'd0, round_up};
      end else begin
        exp_out = {1'b0, max_eff};
        round_up = (ext_sum[3:0] > 4'd8) || ((ext_sum[3:0] == 4'd8) && ext_sum[4]);
        sig_round = {1'b0, ext_sum[7:4]} + {4'd0, round_up};
        if (sig_round >= 5'd16) begin
          exp_out = exp_out + 5'd1;
          sig_round = 5'd8;
        end
      end
      if ((exp_out > 5'd15) || ((exp_out == 5'd15) && (sig_round >= 5'd15)))
        same_grs = 7'h7e;
      else if ((exp_out == 5'd1) && (sig_round < 5'd8))
        same_grs = {2'b00, sig_round};
      else
        same_grs = {exp_out[3:0], sig_round[2:0]};
    end
  endfunction

  wire [3:0] max_eff = eff_exp(maxc);
  wire [3:0] min_eff = eff_exp(minc);
  wire [3:0] gap = max_eff - min_eff;
  wire [3:0] max_sig = sig4(maxc);
  wire [3:0] min_sig = sig4(minc);
  wire [8:0] ext_sum = {1'b0, max_sig, 4'b0000} + ({1'b0, min_sig, 4'b0000} >> gap[2:0]);
  wire [6:0] same_mag = (gap >= 4'd5) ? maxc : same_grs(ext_sum, max_eff);
  wire [7:0] diff_sig = ({4'd0, max_sig} << gap[2:0]) - {4'd0, min_sig};
  wire [6:0] diff_norm = norm8(diff_sig, min_eff);
  wire gap5_down = (gap == 4'd5) && (max_sig == 4'd8) && (min_sig >= 4'd9);
  wire [6:0] diff_gap5 = maxc - {6'd0, gap5_down};
  wire [6:0] diff_mag = (maxc == minc) ? 7'h00 : ((gap >= 4'd6) ? maxc : ((gap == 4'd5) ? diff_gap5 : diff_norm));
  wire neg_zero = (am == 7'h00) && (bm == 7'h00) && a[7] && b[7];
  wire diff_sign = (diff_mag == 7'h00) ? 1'b0 : (a_ge_b ? a[7] : b[7]);
  wire out_sign = same_sign ? ((same_mag == 7'h00) ? neg_zero : a[7]) : diff_sign;
  wire [6:0] out_mag = same_sign ? same_mag : diff_mag;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
