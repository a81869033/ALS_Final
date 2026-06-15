module ex245_r8_active_decision(in, out);
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

  function [6:0] active_mag;
    input [9:0] decision_key;
    input [5:0] base_eff;
    begin
      case (decision_key)
        10'h000: begin
          active_mag = 7'h00;
        end
        10'h001: begin
          active_mag = 7'h00;
        end
        10'h002: begin
          active_mag = 7'h00;
        end
        10'h003: begin
          active_mag = 7'h00;
        end
        10'h004: begin
          active_mag = 7'h00;
        end
        10'h005: begin
          active_mag = 7'h00;
        end
        10'h006: begin
          active_mag = 7'h00;
        end
        10'h007: begin
          active_mag = 7'h00;
        end
        10'h008: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h009: begin
          active_mag = 7'h00;
        end
        10'h00a: begin
          active_mag = 7'h00;
        end
        10'h00b: begin
          active_mag = 7'h00;
        end
        10'h00c: begin
          active_mag = 7'h00;
        end
        10'h00d: begin
          active_mag = 7'h00;
        end
        10'h00e: begin
          active_mag = 7'h00;
        end
        10'h00f: begin
          active_mag = 7'h00;
        end
        10'h010: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h011: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h012: begin
          active_mag = 7'h00;
        end
        10'h013: begin
          active_mag = 7'h00;
        end
        10'h014: begin
          active_mag = 7'h00;
        end
        10'h015: begin
          active_mag = 7'h00;
        end
        10'h016: begin
          active_mag = 7'h00;
        end
        10'h017: begin
          active_mag = 7'h00;
        end
        10'h018: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h019: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h01a: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h01b: begin
          active_mag = 7'h00;
        end
        10'h01c: begin
          active_mag = 7'h00;
        end
        10'h01d: begin
          active_mag = 7'h00;
        end
        10'h01e: begin
          active_mag = 7'h00;
        end
        10'h01f: begin
          active_mag = 7'h00;
        end
        10'h020: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h021: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h022: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h023: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h024: begin
          active_mag = 7'h00;
        end
        10'h025: begin
          active_mag = 7'h00;
        end
        10'h026: begin
          active_mag = 7'h00;
        end
        10'h027: begin
          active_mag = 7'h00;
        end
        10'h028: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h029: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h02a: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h02b: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h02c: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h02d: begin
          active_mag = 7'h00;
        end
        10'h02e: begin
          active_mag = 7'h00;
        end
        10'h02f: begin
          active_mag = 7'h00;
        end
        10'h030: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h031: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h032: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h033: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h034: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h035: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h036: begin
          active_mag = 7'h00;
        end
        10'h037: begin
          active_mag = 7'h00;
        end
        10'h038: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h039: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h03a: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h03b: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h03c: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h03d: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h03e: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h03f: begin
          active_mag = 7'h00;
        end
        10'h040: begin
          active_mag = 7'h00;
        end
        10'h041: begin
          active_mag = 7'h00;
        end
        10'h042: begin
          active_mag = 7'h00;
        end
        10'h043: begin
          active_mag = 7'h00;
        end
        10'h044: begin
          active_mag = 7'h00;
        end
        10'h045: begin
          active_mag = 7'h00;
        end
        10'h046: begin
          active_mag = 7'h00;
        end
        10'h047: begin
          active_mag = 7'h00;
        end
        10'h048: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h049: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h04a: begin
          active_mag = 7'h00;
        end
        10'h04b: begin
          active_mag = 7'h00;
        end
        10'h04c: begin
          active_mag = 7'h00;
        end
        10'h04d: begin
          active_mag = 7'h00;
        end
        10'h04e: begin
          active_mag = 7'h00;
        end
        10'h04f: begin
          active_mag = 7'h00;
        end
        10'h050: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h051: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h052: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h053: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h054: begin
          active_mag = 7'h00;
        end
        10'h055: begin
          active_mag = 7'h00;
        end
        10'h056: begin
          active_mag = 7'h00;
        end
        10'h057: begin
          active_mag = 7'h00;
        end
        10'h058: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h059: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h05a: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h05b: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h05c: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h05d: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h05e: begin
          active_mag = 7'h00;
        end
        10'h05f: begin
          active_mag = 7'h00;
        end
        10'h060: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h061: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h062: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h063: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h064: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h065: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h066: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h067: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h068: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h069: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h06a: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h06b: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h06c: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h06d: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h06e: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h06f: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h070: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h071: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h072: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h073: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h074: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h075: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h076: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h077: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h078: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        10'h079: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h07a: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h07b: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h07c: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h07d: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h07e: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h07f: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h080: begin
          active_mag = 7'h00;
        end
        10'h081: begin
          active_mag = 7'h00;
        end
        10'h082: begin
          active_mag = 7'h00;
        end
        10'h083: begin
          active_mag = 7'h00;
        end
        10'h084: begin
          active_mag = 7'h00;
        end
        10'h085: begin
          active_mag = 7'h00;
        end
        10'h086: begin
          active_mag = 7'h00;
        end
        10'h087: begin
          active_mag = 7'h00;
        end
        10'h088: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h089: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h08a: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h08b: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h08c: begin
          active_mag = 7'h00;
        end
        10'h08d: begin
          active_mag = 7'h00;
        end
        10'h08e: begin
          active_mag = 7'h00;
        end
        10'h08f: begin
          active_mag = 7'h00;
        end
        10'h090: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h091: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h092: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h093: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h094: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h095: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h096: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h097: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h098: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h099: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h09a: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h09b: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h09c: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h09d: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h09e: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h09f: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h0a0: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h0a1: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h0a2: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        10'h0a3: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h0a4: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h0a5: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h0a6: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h0a7: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h0a8: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h0a9: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h0aa: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h0ab: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h0ac: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h0ad: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h0ae: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        10'h0af: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h0b0: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h0b1: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h0b2: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h0b3: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h0b4: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h0b5: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h0b6: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h0b7: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h0b8: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h0b9: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h0ba: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h0bb: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h0bc: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h0bd: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h0be: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h0bf: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h0c0: begin
          active_mag = 7'h00;
        end
        10'h0c1: begin
          active_mag = 7'h00;
        end
        10'h0c2: begin
          active_mag = 7'h00;
        end
        10'h0c3: begin
          active_mag = 7'h00;
        end
        10'h0c4: begin
          active_mag = 7'h00;
        end
        10'h0c5: begin
          active_mag = 7'h00;
        end
        10'h0c6: begin
          active_mag = 7'h00;
        end
        10'h0c7: begin
          active_mag = 7'h00;
        end
        10'h0c8: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h0c9: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h0ca: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h0cb: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h0cc: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h0cd: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h0ce: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h0cf: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h0d0: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h0d1: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h0d2: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        10'h0d3: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h0d4: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h0d5: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h0d6: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h0d7: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h0d8: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h0d9: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h0da: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h0db: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h0dc: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h0dd: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h0de: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h0df: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h0e0: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h0e1: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h0e2: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h0e3: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h0e4: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h0e5: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h0e6: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h0e7: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h0e8: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h0e9: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h0ea: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h0eb: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h0ec: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h0ed: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h0ee: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h0ef: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h0f0: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h0f1: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h0f2: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h0f3: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h0f4: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h0f5: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h0f6: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h0f7: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h0f8: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        10'h0f9: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        10'h0fa: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        10'h0fb: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        10'h0fc: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h0fd: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h0fe: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h0ff: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h100: begin
          active_mag = 7'h00;
        end
        10'h101: begin
          active_mag = 7'h00;
        end
        10'h102: begin
          active_mag = 7'h00;
        end
        10'h103: begin
          active_mag = 7'h00;
        end
        10'h104: begin
          active_mag = 7'h00;
        end
        10'h105: begin
          active_mag = 7'h00;
        end
        10'h106: begin
          active_mag = 7'h00;
        end
        10'h107: begin
          active_mag = 7'h00;
        end
        10'h108: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h109: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h10a: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        10'h10b: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h10c: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h10d: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h10e: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h10f: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h110: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h111: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h112: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h113: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h114: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h115: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h116: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h117: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h118: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h119: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h11a: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h11b: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h11c: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h11d: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h11e: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h11f: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h120: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        10'h121: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        10'h122: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        10'h123: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        10'h124: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        10'h125: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        10'h126: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        10'h127: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        10'h128: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd1);
        end
        10'h129: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd1);
        end
        10'h12a: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd1);
        end
        10'h12b: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd1);
        end
        10'h12c: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd1);
        end
        10'h12d: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd1);
        end
        10'h12e: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd1);
        end
        10'h12f: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd1);
        end
        10'h130: begin
          if (base_eff >= 6'd27) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd2);
        end
        10'h131: begin
          if (base_eff >= 6'd27) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd2);
        end
        10'h132: begin
          if (base_eff >= 6'd27) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd2);
        end
        10'h133: begin
          if (base_eff >= 6'd27) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd2);
        end
        10'h134: begin
          if (base_eff >= 6'd27) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd2);
        end
        10'h135: begin
          if (base_eff >= 6'd27) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd2);
        end
        10'h136: begin
          if (base_eff >= 6'd27) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd2);
        end
        10'h137: begin
          if (base_eff >= 6'd27) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd2);
        end
        10'h138: begin
          if (base_eff >= 6'd27) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd3);
        end
        10'h139: begin
          if (base_eff >= 6'd27) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd3);
        end
        10'h13a: begin
          if (base_eff >= 6'd27) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd3);
        end
        10'h13b: begin
          if (base_eff >= 6'd27) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd3);
        end
        10'h13c: begin
          if (base_eff >= 6'd27) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd3);
        end
        10'h13d: begin
          if (base_eff >= 6'd27) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd3);
        end
        10'h13e: begin
          if (base_eff >= 6'd27) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd3);
        end
        10'h13f: begin
          if (base_eff >= 6'd27) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd3);
        end
        10'h200: begin
          active_mag = 7'h00;
        end
        10'h201: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h202: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h203: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h204: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h205: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h206: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h207: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h208: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h209: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h20a: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h20b: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h20c: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h20d: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h20e: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h20f: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h210: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h211: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h212: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h213: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h214: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h215: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h216: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h217: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h218: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h219: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h21a: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h21b: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h21c: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h21d: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h21e: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h21f: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h220: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h221: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h222: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h223: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h224: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h225: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h226: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h227: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h228: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h229: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h22a: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h22b: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h22c: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h22d: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h22e: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h22f: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h230: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h231: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h232: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h233: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h234: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h235: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h236: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h237: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h238: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h239: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h23a: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h23b: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h23c: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h23d: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h23e: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h23f: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        10'h240: begin
          active_mag = 7'h00;
        end
        10'h241: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h242: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h243: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h244: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h245: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h246: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h247: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h248: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h249: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h24a: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h24b: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h24c: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h24d: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h24e: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h24f: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h250: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h251: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h252: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h253: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h254: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h255: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h256: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h257: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h258: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h259: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h25a: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h25b: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h25c: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h25d: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h25e: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h25f: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h260: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h261: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h262: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h263: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h264: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h265: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h266: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        10'h267: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h268: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h269: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h26a: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h26b: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h26c: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        10'h26d: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h26e: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h26f: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h270: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h271: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h272: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        10'h273: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h274: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h275: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h276: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h277: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h278: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        10'h279: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h27a: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h27b: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h27c: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h27d: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h27e: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h27f: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h280: begin
          active_mag = 7'h00;
        end
        10'h281: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h282: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h283: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h284: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h285: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h286: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h287: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h288: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h289: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h28a: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h28b: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h28c: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h28d: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h28e: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h28f: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h290: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h291: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h292: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h293: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h294: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h295: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h296: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        10'h297: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h298: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h299: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h29a: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        10'h29b: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h29c: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h29d: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h29e: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h29f: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h2a0: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h2a1: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h2a2: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h2a3: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h2a4: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h2a5: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h2a6: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h2a7: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h2a8: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h2a9: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h2aa: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h2ab: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h2ac: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h2ad: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h2ae: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h2af: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h2b0: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h2b1: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h2b2: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h2b3: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h2b4: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h2b5: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h2b6: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h2b7: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h2b8: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h2b9: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h2ba: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h2bb: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h2bc: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h2bd: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h2be: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h2bf: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h2c0: begin
          active_mag = 7'h00;
        end
        10'h2c1: begin
          if (base_eff == 6'd1) active_mag = 7'h01;
          else if (base_eff == 6'd2) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd2) << 2) | 7'd0);
        end
        10'h2c2: begin
          if (base_eff == 6'd1) active_mag = 7'h02;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd0);
        end
        10'h2c3: begin
          if (base_eff == 6'd1) active_mag = 7'h03;
          else if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff - 6'd1) << 2) | 7'd2);
        end
        10'h2c4: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd0);
        end
        10'h2c5: begin
          if (base_eff >= 6'd32) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd1);
        end
        10'h2c6: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd2);
        end
        10'h2c7: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd0) << 2) | 7'd3);
        end
        10'h2c8: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h2c9: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd0);
        end
        10'h2ca: begin
          if (base_eff >= 6'd31) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd1);
        end
        10'h2cb: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h2cc: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h2cd: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd2);
        end
        10'h2ce: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd1) << 2) | 7'd3);
        end
        10'h2cf: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h2d0: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h2d1: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h2d2: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd0);
        end
        10'h2d3: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h2d4: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h2d5: begin
          if (base_eff >= 6'd30) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd1);
        end
        10'h2d6: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h2d7: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h2d8: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h2d9: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h2da: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd2);
        end
        10'h2db: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h2dc: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h2dd: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd2) << 2) | 7'd3);
        end
        10'h2de: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h2df: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h2e0: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h2e1: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h2e2: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h2e3: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h2e4: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd0);
        end
        10'h2e5: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h2e6: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h2e7: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h2e8: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h2e9: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h2ea: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h2eb: begin
          if (base_eff >= 6'd29) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd1);
        end
        10'h2ec: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h2ed: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h2ee: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h2ef: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h2f0: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h2f1: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h2f2: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h2f3: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h2f4: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd2);
        end
        10'h2f5: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        10'h2f6: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        10'h2f7: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        10'h2f8: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        10'h2f9: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        10'h2fa: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        10'h2fb: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd3) << 2) | 7'd3);
        end
        10'h2fc: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        10'h2fd: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        10'h2fe: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        10'h2ff: begin
          if (base_eff >= 6'd28) active_mag = 7'h7e;
          else active_mag = (((base_eff + 6'd4) << 2) | 7'd0);
        end
        default: active_mag = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] max_sig = sig3(maxc);
  wire [2:0] min_sig = sig3(minc);
  wire [5:0] max_eff = eff_exp(maxc);
  wire [5:0] min_eff = eff_exp(minc);
  wire [5:0] gap_full = max_eff - min_eff;
  wire same_active = same_sign && (gap_full <= 6'd3);
  wire diff_active = (!same_sign) && (gap_full <= 6'd4);
  wire [2:0] gap_key = gap_full[2:0];
  wire [9:0] decision_key = {same_sign, gap_key, max_sig, min_sig};
  wire [6:0] residual_mag = active_mag(decision_key, min_eff);
  wire [6:0] out_mag = (same_active || diff_active) ? residual_mag : maxc;
  wire diff_sign = (maxc == minc) ? 1'b0 : max_sign;
  wire out_sign = same_sign ? a[7] : diff_sign;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
