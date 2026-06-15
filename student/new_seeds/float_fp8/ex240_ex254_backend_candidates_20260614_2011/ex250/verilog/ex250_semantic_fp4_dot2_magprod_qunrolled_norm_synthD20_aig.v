module ex250_semantic_fp4_dot2_magprod_qunrolled_norm(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [3:0] ah = in[15:12];
  wire [3:0] al = in[11:8];
  wire [3:0] bh = in[7:4];
  wire [3:0] bl = in[3:0];

  function [7:0] fp4_mag_product;
    input [2:0] a;
    input [2:0] b;
    begin
      case ({a, b})
        6'h00: fp4_mag_product = 8'd0;
        6'h01: fp4_mag_product = 8'd0;
        6'h02: fp4_mag_product = 8'd0;
        6'h03: fp4_mag_product = 8'd0;
        6'h04: fp4_mag_product = 8'd0;
        6'h05: fp4_mag_product = 8'd0;
        6'h06: fp4_mag_product = 8'd0;
        6'h07: fp4_mag_product = 8'd0;
        6'h08: fp4_mag_product = 8'd0;
        6'h09: fp4_mag_product = 8'd1;
        6'h0a: fp4_mag_product = 8'd2;
        6'h0b: fp4_mag_product = 8'd3;
        6'h0c: fp4_mag_product = 8'd4;
        6'h0d: fp4_mag_product = 8'd6;
        6'h0e: fp4_mag_product = 8'd8;
        6'h0f: fp4_mag_product = 8'd12;
        6'h10: fp4_mag_product = 8'd0;
        6'h11: fp4_mag_product = 8'd2;
        6'h12: fp4_mag_product = 8'd4;
        6'h13: fp4_mag_product = 8'd6;
        6'h14: fp4_mag_product = 8'd8;
        6'h15: fp4_mag_product = 8'd12;
        6'h16: fp4_mag_product = 8'd16;
        6'h17: fp4_mag_product = 8'd24;
        6'h18: fp4_mag_product = 8'd0;
        6'h19: fp4_mag_product = 8'd3;
        6'h1a: fp4_mag_product = 8'd6;
        6'h1b: fp4_mag_product = 8'd9;
        6'h1c: fp4_mag_product = 8'd12;
        6'h1d: fp4_mag_product = 8'd18;
        6'h1e: fp4_mag_product = 8'd24;
        6'h1f: fp4_mag_product = 8'd36;
        6'h20: fp4_mag_product = 8'd0;
        6'h21: fp4_mag_product = 8'd4;
        6'h22: fp4_mag_product = 8'd8;
        6'h23: fp4_mag_product = 8'd12;
        6'h24: fp4_mag_product = 8'd16;
        6'h25: fp4_mag_product = 8'd24;
        6'h26: fp4_mag_product = 8'd32;
        6'h27: fp4_mag_product = 8'd48;
        6'h28: fp4_mag_product = 8'd0;
        6'h29: fp4_mag_product = 8'd6;
        6'h2a: fp4_mag_product = 8'd12;
        6'h2b: fp4_mag_product = 8'd18;
        6'h2c: fp4_mag_product = 8'd24;
        6'h2d: fp4_mag_product = 8'd36;
        6'h2e: fp4_mag_product = 8'd48;
        6'h2f: fp4_mag_product = 8'd72;
        6'h30: fp4_mag_product = 8'd0;
        6'h31: fp4_mag_product = 8'd8;
        6'h32: fp4_mag_product = 8'd16;
        6'h33: fp4_mag_product = 8'd24;
        6'h34: fp4_mag_product = 8'd32;
        6'h35: fp4_mag_product = 8'd48;
        6'h36: fp4_mag_product = 8'd64;
        6'h37: fp4_mag_product = 8'd96;
        6'h38: fp4_mag_product = 8'd0;
        6'h39: fp4_mag_product = 8'd12;
        6'h3a: fp4_mag_product = 8'd24;
        6'h3b: fp4_mag_product = 8'd36;
        6'h3c: fp4_mag_product = 8'd48;
        6'h3d: fp4_mag_product = 8'd72;
        6'h3e: fp4_mag_product = 8'd96;
        6'h3f: fp4_mag_product = 8'd144;
        default: fp4_mag_product = 8'd0;
      endcase
    end
  endfunction

  function signed [10:0] signed_product;
    input [3:0] a;
    input [3:0] b;
    reg [7:0] mag_product;
    begin
      mag_product = fp4_mag_product(a[2:0], b[2:0]);
      signed_product = (a[3] ^ b[3]) ? -$signed({3'd0, mag_product}) : $signed({3'd0, mag_product});
    end
  endfunction

  function fp4_neg_zero_product;
    input [3:0] a;
    input [3:0] b;
    begin
      fp4_neg_zero_product = ((a[2:0] == 3'd0) || (b[2:0] == 3'd0)) && (a[3] ^ b[3]);
    end
  endfunction

  function [6:0] quant_scaled;
    input [9:0] value;
    reg [3:0] exp;
    reg [4:0] sig;
    reg round_up;
    begin
      if (value == 10'd0) begin
        quant_scaled = 7'h00;
      end else if (value < 10'd2) begin
        quant_scaled = 7'h28;
      end else if (value < 10'd4) begin
        quant_scaled = value[0] ? 7'h34 : 7'h30;
      end else if (value < 10'd8) begin
        quant_scaled = 7'h38 | {4'd0, value[1:0], 1'b0};
      end else if (value < 10'd16) begin
        quant_scaled = 7'h40 | {4'd0, value[2:0]};
      end else begin
        if (value < 10'd32) begin
          exp = 4'd9;
          round_up = value[0] && value[1];
          sig = {1'b0, value[4:1]} + {4'd0, round_up};
        end else if (value < 10'd64) begin
          exp = 4'd10;
          round_up = (value[1:0] > 2'd2) || ((value[1:0] == 2'd2) && value[2]);
          sig = {1'b0, value[5:2]} + {4'd0, round_up};
        end else if (value < 10'd128) begin
          exp = 4'd11;
          round_up = (value[2:0] > 3'd4) || ((value[2:0] == 3'd4) && value[3]);
          sig = {1'b0, value[6:3]} + {4'd0, round_up};
        end else if (value < 10'd256) begin
          exp = 4'd12;
          round_up = (value[3:0] > 4'd8) || ((value[3:0] == 4'd8) && value[4]);
          sig = {1'b0, value[7:4]} + {4'd0, round_up};
        end else begin
          exp = 4'd13;
          round_up = (value[4:0] > 5'd16) || ((value[4:0] == 5'd16) && value[5]);
          sig = {1'b0, value[8:5]} + {4'd0, round_up};
        end
        if (sig[4]) begin
          quant_scaled = {exp + 4'd1, 3'd0};
        end else begin
          quant_scaled = {exp, sig[2:0]};
        end
      end
    end
  endfunction

  wire signed [10:0] prod_hi = signed_product(ah, bh);
  wire signed [10:0] prod_lo = signed_product(al, bl);
  wire signed [10:0] sum = prod_hi + prod_lo;
  wire negative = sum < 0;
  wire signed [10:0] neg_sum = -sum;
  wire [9:0] abs_sum = negative ? neg_sum[9:0] : sum[9:0];
  wire neg_zero = (sum == 11'sd0) && fp4_neg_zero_product(ah, bh) && fp4_neg_zero_product(al, bl);
  assign out = {negative || neg_zero, quant_scaled(abs_sum)};
endmodule
