module ex240_semantic_add_norm(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire nan_a = (a[6:3] == 4'd15) && (a[2:0] == 3'd7);
  wire nan_b = (b[6:3] == 4'd15) && (b[2:0] == 3'd7);
  function [17:0] fp8_mag;
    input [7:0] v;
    reg [3:0] e;
    reg [2:0] m;
    begin
      e = v[6:3];
      m = v[2:0];
      if (e == 4'd15 && m == 3'd7) begin
        fp8_mag = 18'd0;
      end else if (e == 4'd0) begin
        fp8_mag = {15'd0, m};
      end else begin
        fp8_mag = ({11'd0, 1'b1, m}) << (e - 4'd1);
      end
    end
  endfunction

  function [7:0] quant_int_norm;
    input [18:0] mag;
    input sign;
    input neg_zero;
    reg [4:0] exp;
    reg [4:0] shift;
    reg [4:0] base;
    reg [4:0] sig;
    reg [18:0] rem;
    reg [18:0] half;
    reg round_up;
    begin
      if (mag == 19'd0) begin
        quant_int_norm = neg_zero ? 8'h80 : 8'h00;
      end else if (mag <= 19'd7) begin
        quant_int_norm = {sign, 4'd0, mag[2:0]};
      end else begin
        if (mag[18]) begin exp = 5'd16; shift = 5'd15; end
        else if (mag[17]) begin exp = 5'd15; shift = 5'd14; end
        else if (mag[16]) begin exp = 5'd14; shift = 5'd13; end
        else if (mag[15]) begin exp = 5'd13; shift = 5'd12; end
        else if (mag[14]) begin exp = 5'd12; shift = 5'd11; end
        else if (mag[13]) begin exp = 5'd11; shift = 5'd10; end
        else if (mag[12]) begin exp = 5'd10; shift = 5'd9; end
        else if (mag[11]) begin exp = 5'd9; shift = 5'd8; end
        else if (mag[10]) begin exp = 5'd8; shift = 5'd7; end
        else if (mag[9]) begin exp = 5'd7; shift = 5'd6; end
        else if (mag[8]) begin exp = 5'd6; shift = 5'd5; end
        else if (mag[7]) begin exp = 5'd5; shift = 5'd4; end
        else if (mag[6]) begin exp = 5'd4; shift = 5'd3; end
        else if (mag[5]) begin exp = 5'd3; shift = 5'd2; end
        else if (mag[4]) begin exp = 5'd2; shift = 5'd1; end
        else begin exp = 5'd1; shift = 5'd0; end

        base = mag >> shift;
        if (shift == 5'd0) begin
          round_up = 1'b0;
        end else begin
          rem = mag - ({14'd0, base} << shift);
          half = 19'd1 << (shift - 5'd1);
          round_up = (rem > half) || ((rem == half) && base[0]);
        end
        sig = base + {4'd0, round_up};
        if (sig >= 5'd16) begin
          exp = exp + 5'd1;
          sig = 5'd8;
        end
        if ((exp > 5'd15) || ((exp == 5'd15) && (sig >= 5'd15))) begin
          quant_int_norm = {sign, 7'h7e};
        end else begin
          quant_int_norm = {sign, exp[3:0], sig[2:0]};
        end
      end
    end
  endfunction

  wire [17:0] mag_a = fp8_mag(a);
  wire [17:0] mag_b = fp8_mag(b);
  wire signed [19:0] sval_a = a[7] ? -$signed({2'b00, mag_a}) : $signed({2'b00, mag_a});
  wire signed [19:0] sval_b = b[7] ? -$signed({2'b00, mag_b}) : $signed({2'b00, mag_b});
  wire signed [19:0] sum = sval_a + sval_b;
  wire sign = sum[19];
  wire [18:0] abs_sum = sign ? -sum[18:0] : sum[18:0];
  wire neg_zero = (mag_a == 18'd0) && (mag_b == 18'd0) && a[7] && b[7];
  assign out = (nan_a || nan_b) ? 8'h7f : quant_int_norm(abs_sum, sign, neg_zero);
endmodule
