module ex253_semantic_u2_sum8_balanced_threshold_fields(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [2:0] s0 = {1'b0, in[1:0]} + {1'b0, in[3:2]};
  wire [2:0] s1 = {1'b0, in[5:4]} + {1'b0, in[7:6]};
  wire [2:0] s2 = {1'b0, in[9:8]} + {1'b0, in[11:10]};
  wire [2:0] s3 = {1'b0, in[13:12]} + {1'b0, in[15:14]};
  wire [3:0] s01 = {1'b0, s0} + {1'b0, s1};
  wire [3:0] s23 = {1'b0, s2} + {1'b0, s3};
  wire [4:0] lane_sum = {1'b0, s01} + {1'b0, s23};

  function [6:0] quant_lane_sum;
    input [4:0] value;
    begin
      if (value == 5'd0) begin
        quant_lane_sum = 7'h00;
      end else if (value == 5'd1) begin
        quant_lane_sum = 7'h30;
      end else if (value == 5'd2) begin
        quant_lane_sum = 7'h38;
      end else if (value == 5'd3) begin
        quant_lane_sum = 7'h3c;
      end else if (value < 5'd8) begin
        quant_lane_sum = 7'h40 | {4'd0, value[1:0], 1'b0};
      end else if (value < 5'd16) begin
        quant_lane_sum = 7'h48 | {4'd0, value[2:0]};
      end else begin
        case (value)
          5'd16: quant_lane_sum = 7'h50;
          5'd17: quant_lane_sum = 7'h50;
          5'd18: quant_lane_sum = 7'h51;
          5'd19: quant_lane_sum = 7'h52;
          5'd20: quant_lane_sum = 7'h52;
          5'd21: quant_lane_sum = 7'h52;
          5'd22: quant_lane_sum = 7'h53;
          5'd23: quant_lane_sum = 7'h54;
          default: quant_lane_sum = 7'h54;
        endcase
      end
    end
  endfunction

  assign out = {1'b0, quant_lane_sum(lane_sum)};
endmodule
