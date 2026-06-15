module ex251_semantic_int3_dot2_arith_qcase(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [3:0] ah = in[15:12];
  wire [3:0] al = in[11:8];
  wire [3:0] bh = in[7:4];
  wire [3:0] bl = in[3:0];
  function signed [3:0] int3_value;
    input [3:0] x;
    reg signed [3:0] value;
    begin
      value = {1'b0, x[2:0]};
      int3_value = x[3] ? -value : value;
    end
  endfunction

  function int3_neg_zero_product;
    input [3:0] a;
    input [3:0] b;
    begin
      int3_neg_zero_product = ((a[2:0] == 3'd0) || (b[2:0] == 3'd0)) && (a[3] ^ b[3]);
    end
  endfunction


  function [6:0] quant_scaled;
    input [9:0] value;
    begin
      case (value)
        10'd0: quant_scaled = 7'h00;
        10'd1: quant_scaled = 7'h28;
        10'd2: quant_scaled = 7'h30;
        10'd3: quant_scaled = 7'h34;
        10'd4: quant_scaled = 7'h38;
        10'd5: quant_scaled = 7'h3a;
        10'd6: quant_scaled = 7'h3c;
        10'd7: quant_scaled = 7'h3e;
        10'd8: quant_scaled = 7'h40;
        10'd9: quant_scaled = 7'h41;
        10'd10: quant_scaled = 7'h42;
        10'd11: quant_scaled = 7'h43;
        10'd12: quant_scaled = 7'h44;
        10'd13: quant_scaled = 7'h45;
        10'd14: quant_scaled = 7'h46;
        10'd15: quant_scaled = 7'h47;
        10'd16: quant_scaled = 7'h48;
        10'd17: quant_scaled = 7'h48;
        10'd18: quant_scaled = 7'h49;
        10'd19: quant_scaled = 7'h4a;
        10'd20: quant_scaled = 7'h4a;
        10'd21: quant_scaled = 7'h4a;
        10'd22: quant_scaled = 7'h4b;
        10'd23: quant_scaled = 7'h4c;
        10'd24: quant_scaled = 7'h4c;
        10'd25: quant_scaled = 7'h4c;
        10'd26: quant_scaled = 7'h4d;
        10'd27: quant_scaled = 7'h4e;
        10'd28: quant_scaled = 7'h4e;
        10'd29: quant_scaled = 7'h4e;
        10'd30: quant_scaled = 7'h4f;
        10'd31: quant_scaled = 7'h50;
        10'd32: quant_scaled = 7'h50;
        10'd33: quant_scaled = 7'h50;
        10'd34: quant_scaled = 7'h50;
        10'd35: quant_scaled = 7'h51;
        10'd36: quant_scaled = 7'h51;
        10'd37: quant_scaled = 7'h51;
        10'd38: quant_scaled = 7'h52;
        10'd39: quant_scaled = 7'h52;
        10'd40: quant_scaled = 7'h52;
        10'd41: quant_scaled = 7'h52;
        10'd42: quant_scaled = 7'h52;
        10'd43: quant_scaled = 7'h53;
        10'd44: quant_scaled = 7'h53;
        10'd45: quant_scaled = 7'h53;
        10'd46: quant_scaled = 7'h54;
        10'd47: quant_scaled = 7'h54;
        10'd48: quant_scaled = 7'h54;
        10'd49: quant_scaled = 7'h54;
        10'd50: quant_scaled = 7'h54;
        10'd51: quant_scaled = 7'h55;
        10'd52: quant_scaled = 7'h55;
        10'd53: quant_scaled = 7'h55;
        10'd54: quant_scaled = 7'h56;
        10'd55: quant_scaled = 7'h56;
        10'd56: quant_scaled = 7'h56;
        10'd57: quant_scaled = 7'h56;
        10'd58: quant_scaled = 7'h56;
        10'd59: quant_scaled = 7'h57;
        10'd60: quant_scaled = 7'h57;
        10'd61: quant_scaled = 7'h57;
        10'd62: quant_scaled = 7'h58;
        10'd63: quant_scaled = 7'h58;
        10'd64: quant_scaled = 7'h58;
        10'd65: quant_scaled = 7'h58;
        10'd66: quant_scaled = 7'h58;
        10'd67: quant_scaled = 7'h58;
        10'd68: quant_scaled = 7'h58;
        10'd69: quant_scaled = 7'h59;
        10'd70: quant_scaled = 7'h59;
        10'd71: quant_scaled = 7'h59;
        10'd72: quant_scaled = 7'h59;
        10'd73: quant_scaled = 7'h59;
        10'd74: quant_scaled = 7'h59;
        10'd75: quant_scaled = 7'h59;
        10'd76: quant_scaled = 7'h5a;
        10'd77: quant_scaled = 7'h5a;
        10'd78: quant_scaled = 7'h5a;
        10'd79: quant_scaled = 7'h5a;
        10'd80: quant_scaled = 7'h5a;
        10'd81: quant_scaled = 7'h5a;
        10'd82: quant_scaled = 7'h5a;
        10'd83: quant_scaled = 7'h5a;
        10'd84: quant_scaled = 7'h5a;
        10'd85: quant_scaled = 7'h5b;
        10'd86: quant_scaled = 7'h5b;
        10'd87: quant_scaled = 7'h5b;
        10'd88: quant_scaled = 7'h5b;
        10'd89: quant_scaled = 7'h5b;
        10'd90: quant_scaled = 7'h5b;
        10'd91: quant_scaled = 7'h5b;
        10'd92: quant_scaled = 7'h5c;
        10'd93: quant_scaled = 7'h5c;
        10'd94: quant_scaled = 7'h5c;
        10'd95: quant_scaled = 7'h5c;
        10'd96: quant_scaled = 7'h5c;
        10'd97: quant_scaled = 7'h5c;
        10'd98: quant_scaled = 7'h5c;
        default: quant_scaled = 7'h7e;
      endcase
    end
  endfunction

  wire signed [10:0] prod_hi = $signed(int3_value(ah)) * $signed(int3_value(bh));
  wire signed [10:0] prod_lo = $signed(int3_value(al)) * $signed(int3_value(bl));
  wire signed [10:0] sum = prod_hi + prod_lo;
  wire negative = sum < 0;
  wire signed [10:0] neg_sum = -sum;
  wire [9:0] abs_sum = negative ? neg_sum[9:0] : sum[9:0];
  wire neg_zero = (sum == 11'sd0) && int3_neg_zero_product(ah, bh) && int3_neg_zero_product(al, bl);
  assign out = {negative || neg_zero, quant_scaled(abs_sum)};
endmodule
