module ex252_semantic_u2_dot4_handmul_balanced_qcase(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [1:0] a0 = in[9:8];
  wire [1:0] a1 = in[11:10];
  wire [1:0] a2 = in[13:12];
  wire [1:0] a3 = in[15:14];
  wire [1:0] b0 = in[1:0];
  wire [1:0] b1 = in[3:2];
  wire [1:0] b2 = in[5:4];
  wire [1:0] b3 = in[7:6];

  function [3:0] u2_product;
    input [1:0] a;
    input [1:0] b;
    reg pp0;
    reg pp1a;
    reg pp1b;
    reg pp2;
    reg [1:0] mid;
    reg [1:0] high;
    begin
      pp0 = a[0] & b[0];
      pp1a = a[1] & b[0];
      pp1b = a[0] & b[1];
      pp2 = a[1] & b[1];
      mid = {1'b0, pp1a} + {1'b0, pp1b};
      high = {1'b0, pp2} + {1'b0, mid[1]};
      u2_product = {high[1], high[0], mid[0], pp0};
    end
  endfunction

  wire [3:0] p0 = u2_product(a0, b0);
  wire [3:0] p1 = u2_product(a1, b1);
  wire [3:0] p2 = u2_product(a2, b2);
  wire [3:0] p3 = u2_product(a3, b3);
  wire [4:0] s01 = {1'b0, p0} + {1'b0, p1};
  wire [4:0] s23 = {1'b0, p2} + {1'b0, p3};
  wire [5:0] dot_sum = {1'b0, s01} + {1'b0, s23};
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
        default: quant_scaled = 7'h7e;
      endcase
    end
  endfunction

  assign out = {1'b0, quant_scaled({4'd0, dot_sum})};
endmodule
