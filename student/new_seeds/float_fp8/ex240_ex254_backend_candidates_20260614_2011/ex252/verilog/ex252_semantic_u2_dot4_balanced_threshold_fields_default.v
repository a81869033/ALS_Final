module ex252_semantic_u2_dot4_balanced_threshold_fields(in, out);
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
  wire [3:0] p0 = a0 * b0;
  wire [3:0] p1 = a1 * b1;
  wire [3:0] p2 = a2 * b2;
  wire [3:0] p3 = a3 * b3;
  wire [4:0] s01 = {1'b0, p0} + {1'b0, p1};
  wire [4:0] s23 = {1'b0, p2} + {1'b0, p3};
  wire [5:0] dot_sum = {1'b0, s01} + {1'b0, s23};

  function [6:0] quant_dot_sum;
    input [5:0] value;
    begin
      if (value == 6'd0) begin
        quant_dot_sum = 7'h00;
      end else if (value == 6'd1) begin
        quant_dot_sum = 7'h28;
      end else if (value < 6'd4) begin
        quant_dot_sum = value[0] ? 7'h34 : 7'h30;
      end else if (value < 6'd8) begin
        quant_dot_sum = 7'h38 | {4'd0, value[1:0], 1'b0};
      end else if (value < 6'd16) begin
        quant_dot_sum = 7'h40 | {4'd0, value[2:0]};
      end else begin
        case (value)
          6'd16: quant_dot_sum = 7'h48;
          6'd17: quant_dot_sum = 7'h48;
          6'd18: quant_dot_sum = 7'h49;
          6'd19: quant_dot_sum = 7'h4a;
          6'd20: quant_dot_sum = 7'h4a;
          6'd21: quant_dot_sum = 7'h4a;
          6'd22: quant_dot_sum = 7'h4b;
          6'd23: quant_dot_sum = 7'h4c;
          6'd24: quant_dot_sum = 7'h4c;
          6'd25: quant_dot_sum = 7'h4c;
          6'd26: quant_dot_sum = 7'h4d;
          6'd27: quant_dot_sum = 7'h4e;
          6'd28: quant_dot_sum = 7'h4e;
          6'd29: quant_dot_sum = 7'h4e;
          6'd30: quant_dot_sum = 7'h4f;
          6'd31: quant_dot_sum = 7'h50;
          6'd32: quant_dot_sum = 7'h50;
          6'd33: quant_dot_sum = 7'h50;
          6'd34: quant_dot_sum = 7'h50;
          6'd35: quant_dot_sum = 7'h51;
          default: quant_dot_sum = 7'h51;
        endcase
      end
    end
  endfunction

  assign out = {1'b0, quant_dot_sum(dot_sum)};
endmodule
