module ex244_semantic_hypot_sig_gap_threshold(in, out);
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

  wire [3:0] max_exp = eff_exp(maxc);
  wire [3:0] min_exp = eff_exp(minc);
  wire [3:0] gap_full = max_exp - min_exp;
  wire [1:0] gap = gap_full[1:0];
  wire [3:0] max_sig = sig4(maxc);
  wire [3:0] min_sig = sig4(minc);

  reg [2:0] delta_threshold;
  always @* begin
    delta_threshold = 3'd0;
    if (gap_full < 4'd3) begin
      case ({gap, max_sig})
        6'h02: begin
          if (min_sig == 4'd2) delta_threshold = 3'd1;
        end
        6'h03: begin
          if (min_sig >= 4'd2 && min_sig <= 4'd3) delta_threshold = 3'd1;
        end
        6'h04: begin
          if (min_sig == 4'd3) delta_threshold = 3'd1;
          if (min_sig == 4'd4) delta_threshold = 3'd2;
        end
        6'h05: begin
          if (min_sig >= 4'd3 && min_sig <= 4'd4) delta_threshold = 3'd1;
          if (min_sig == 4'd5) delta_threshold = 3'd2;
        end
        6'h06: begin
          if (min_sig >= 4'd3 && min_sig <= 4'd4) delta_threshold = 3'd1;
          if (min_sig >= 4'd5 && min_sig <= 4'd6) delta_threshold = 3'd2;
        end
        6'h07: begin
          if (min_sig >= 4'd3 && min_sig <= 4'd4) delta_threshold = 3'd1;
          if (min_sig >= 4'd5 && min_sig <= 4'd6) delta_threshold = 3'd2;
          if (min_sig == 4'd7) delta_threshold = 3'd3;
        end
        6'h08: begin
          if (min_sig >= 4'd3 && min_sig <= 4'd5) delta_threshold = 3'd1;
          if (min_sig == 4'd6) delta_threshold = 3'd2;
          if (min_sig >= 4'd7 && min_sig <= 4'd8) delta_threshold = 3'd3;
        end
        6'h09: begin
          if (min_sig >= 4'd4 && min_sig <= 4'd5) delta_threshold = 3'd1;
          if (min_sig >= 4'd6 && min_sig <= 4'd7) delta_threshold = 3'd2;
          if (min_sig == 4'd8) delta_threshold = 3'd3;
          if (min_sig == 4'd9) delta_threshold = 3'd4;
        end
        6'h0a: begin
          if (min_sig >= 4'd4 && min_sig <= 4'd5) delta_threshold = 3'd1;
          if (min_sig >= 4'd6 && min_sig <= 4'd7) delta_threshold = 3'd2;
          if (min_sig >= 4'd8 && min_sig <= 4'd9) delta_threshold = 3'd3;
          if (min_sig == 4'd10) delta_threshold = 3'd4;
        end
        6'h0b: begin
          if (min_sig >= 4'd4 && min_sig <= 4'd5) delta_threshold = 3'd1;
          if (min_sig >= 4'd6 && min_sig <= 4'd7) delta_threshold = 3'd2;
          if (min_sig >= 4'd8 && min_sig <= 4'd9) delta_threshold = 3'd3;
          if (min_sig == 4'd10) delta_threshold = 3'd4;
          if (min_sig == 4'd11) delta_threshold = 3'd5;
        end
        6'h0c: begin
          if (min_sig >= 4'd4 && min_sig <= 4'd6) delta_threshold = 3'd1;
          if (min_sig >= 4'd7 && min_sig <= 4'd8) delta_threshold = 3'd2;
          if (min_sig == 4'd9) delta_threshold = 3'd3;
          if (min_sig >= 4'd10 && min_sig <= 4'd12) delta_threshold = 3'd4;
        end
        6'h0d: begin
          if (min_sig >= 4'd4 && min_sig <= 4'd6) delta_threshold = 3'd1;
          if (min_sig >= 4'd7 && min_sig <= 4'd8) delta_threshold = 3'd2;
          if (min_sig >= 4'd9 && min_sig <= 4'd10) delta_threshold = 3'd3;
          if (min_sig >= 4'd11 && min_sig <= 4'd13) delta_threshold = 3'd4;
        end
        6'h0e: begin
          if (min_sig >= 4'd4 && min_sig <= 4'd6) delta_threshold = 3'd1;
          if (min_sig >= 4'd7 && min_sig <= 4'd9) delta_threshold = 3'd2;
          if (min_sig >= 4'd10 && min_sig <= 4'd12) delta_threshold = 3'd3;
          if (min_sig >= 4'd13 && min_sig <= 4'd14) delta_threshold = 3'd4;
        end
        6'h0f: begin
          if (min_sig >= 4'd4 && min_sig <= 4'd8) delta_threshold = 3'd1;
          if (min_sig >= 4'd9 && min_sig <= 4'd11) delta_threshold = 3'd2;
          if (min_sig >= 4'd12 && min_sig <= 4'd14) delta_threshold = 3'd3;
          if (min_sig >= 4'd15) delta_threshold = 3'd4;
        end
        6'h18: begin
          if (min_sig >= 4'd6 && min_sig <= 4'd10) delta_threshold = 3'd1;
          if (min_sig >= 4'd11 && min_sig <= 4'd13) delta_threshold = 3'd2;
          if (min_sig >= 4'd14) delta_threshold = 3'd3;
        end
        6'h19: begin
          if (min_sig >= 4'd7 && min_sig <= 4'd10) delta_threshold = 3'd1;
          if (min_sig >= 4'd11 && min_sig <= 4'd14) delta_threshold = 3'd2;
          if (min_sig >= 4'd15) delta_threshold = 3'd3;
        end
        6'h1a: begin
          if (min_sig >= 4'd7 && min_sig <= 4'd11) delta_threshold = 3'd1;
          if (min_sig >= 4'd12) delta_threshold = 3'd2;
        end
        6'h1b: begin
          if (min_sig >= 4'd7 && min_sig <= 4'd11) delta_threshold = 3'd1;
          if (min_sig >= 4'd12) delta_threshold = 3'd2;
        end
        6'h1c: begin
          if (min_sig >= 4'd8 && min_sig <= 4'd12) delta_threshold = 3'd1;
          if (min_sig >= 4'd13) delta_threshold = 3'd2;
        end
        6'h1d: begin
          if (min_sig >= 4'd8 && min_sig <= 4'd12) delta_threshold = 3'd1;
          if (min_sig >= 4'd13) delta_threshold = 3'd2;
        end
        6'h1e: begin
          if (min_sig >= 4'd8 && min_sig <= 4'd13) delta_threshold = 3'd1;
          if (min_sig >= 4'd14) delta_threshold = 3'd2;
        end
        6'h1f: begin
          if (min_sig >= 4'd8) delta_threshold = 3'd1;
        end
        6'h28: begin
          if (min_sig >= 4'd12) delta_threshold = 3'd1;
        end
        6'h29: begin
          if (min_sig >= 4'd13) delta_threshold = 3'd1;
        end
        6'h2a: begin
          if (min_sig >= 4'd13) delta_threshold = 3'd1;
        end
        6'h2b: begin
          if (min_sig >= 4'd14) delta_threshold = 3'd1;
        end
        6'h2c: begin
          if (min_sig >= 4'd15) delta_threshold = 3'd1;
        end
        6'h2d: begin
          if (min_sig >= 4'd15) delta_threshold = 3'd1;
        end
        default: delta_threshold = 3'd0;
      endcase
    end
  end

  wire [7:0] raw = {1'b0, maxc} + {5'd0, delta_threshold};
  wire [6:0] out_mag = (raw >= 8'h7e) ? 7'h7e : raw[6:0];
  assign out = nan ? 8'h7f : {1'b0, out_mag};
endmodule
