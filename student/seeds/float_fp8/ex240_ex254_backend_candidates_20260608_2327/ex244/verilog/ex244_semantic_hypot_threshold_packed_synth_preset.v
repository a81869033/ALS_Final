module ex244_semantic_hypot_threshold_packed(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] ah = in[14:8];
  wire [6:0] bl = in[6:0];
  wire nan = (ah == 7'h7f) || (bl == 7'h7f);
  wire a_ge_b = (ah >= bl);
  wire [6:0] maxc = a_ge_b ? ah : bl;
  wire [6:0] minc = a_ge_b ? bl : ah;

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

  function [24:0] threshold_pack;
    input [5:0] key;
    begin
      case (key)
        6'h02: threshold_pack = 25'h0000041;
        6'h03: threshold_pack = 25'h0000041;
        6'h04: threshold_pack = 25'h0000863;
        6'h05: threshold_pack = 25'h0000a63;
        6'h06: threshold_pack = 25'h0000a63;
        6'h07: threshold_pack = 25'h000ea67;
        6'h08: threshold_pack = 25'h000ec67;
        6'h09: threshold_pack = 25'h0130c8f;
        6'h0a: threshold_pack = 25'h0150c8f;
        6'h0b: threshold_pack = 25'h1750c9f;
        6'h0c: threshold_pack = 25'h0152e8f;
        6'h0d: threshold_pack = 25'h0172e8f;
        6'h0e: threshold_pack = 25'h01b4e8f;
        6'h0f: threshold_pack = 25'h01f928f;
        6'h18: threshold_pack = 25'h001d6c7;
        6'h19: threshold_pack = 25'h001f6e7;
        6'h1a: threshold_pack = 25'h00018e3;
        6'h1b: threshold_pack = 25'h00018e3;
        6'h1c: threshold_pack = 25'h0001b03;
        6'h1d: threshold_pack = 25'h0001b03;
        6'h1e: threshold_pack = 25'h0001d03;
        6'h1f: threshold_pack = 25'h0000101;
        6'h28: threshold_pack = 25'h0000181;
        6'h29: threshold_pack = 25'h00001a1;
        6'h2a: threshold_pack = 25'h00001a1;
        6'h2b: threshold_pack = 25'h00001c1;
        6'h2c: threshold_pack = 25'h00001e1;
        6'h2d: threshold_pack = 25'h00001e1;
        default: threshold_pack = 25'h0;
      endcase
    end
  endfunction

  wire [3:0] max_eff = eff_exp(maxc);
  wire [3:0] min_eff = eff_exp(minc);
  wire [3:0] gap_full = max_eff - min_eff;
  wire [1:0] gap = gap_full[1:0];
  wire [3:0] max_sig = sig4(maxc);
  wire [3:0] min_sig = sig4(minc);
  wire [24:0] pack = threshold_pack({gap, max_sig});
  wire c1 = pack[0] && (min_sig >= pack[8:5]);
  wire c2 = pack[1] && (min_sig >= pack[12:9]);
  wire c3 = pack[2] && (min_sig >= pack[16:13]);
  wire c4 = pack[3] && (min_sig >= pack[20:17]);
  wire c5 = pack[4] && (min_sig >= pack[24:21]);
  wire [2:0] delta = (gap_full < 4'd3) ? ({2'd0,c1} + {2'd0,c2} + {2'd0,c3} + {2'd0,c4} + {2'd0,c5}) : 3'd0;
  wire [7:0] raw = {1'b0, maxc} + {5'd0, delta};
  wire [6:0] out_mag = (raw >= 8'h7e) ? 7'h7e : raw[6:0];
  assign out = nan ? 8'h7f : {1'b0, out_mag};
endmodule
