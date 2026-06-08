module ex253_semantic_u2_sum8_balanced_laneqcase(in, out);
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
      case (value)
        5'd0: quant_lane_sum = 7'h00;
        5'd1: quant_lane_sum = 7'h30;
        5'd2: quant_lane_sum = 7'h38;
        5'd3: quant_lane_sum = 7'h3c;
        5'd4: quant_lane_sum = 7'h40;
        5'd5: quant_lane_sum = 7'h42;
        5'd6: quant_lane_sum = 7'h44;
        5'd7: quant_lane_sum = 7'h46;
        5'd8: quant_lane_sum = 7'h48;
        5'd9: quant_lane_sum = 7'h49;
        5'd10: quant_lane_sum = 7'h4a;
        5'd11: quant_lane_sum = 7'h4b;
        5'd12: quant_lane_sum = 7'h4c;
        5'd13: quant_lane_sum = 7'h4d;
        5'd14: quant_lane_sum = 7'h4e;
        5'd15: quant_lane_sum = 7'h4f;
        5'd16: quant_lane_sum = 7'h50;
        5'd17: quant_lane_sum = 7'h50;
        5'd18: quant_lane_sum = 7'h51;
        5'd19: quant_lane_sum = 7'h52;
        5'd20: quant_lane_sum = 7'h52;
        5'd21: quant_lane_sum = 7'h52;
        5'd22: quant_lane_sum = 7'h53;
        5'd23: quant_lane_sum = 7'h54;
        5'd24: quant_lane_sum = 7'h54;
        default: quant_lane_sum = 7'h54;
      endcase
    end
  endfunction
  assign out = {1'b0, quant_lane_sum(lane_sum)};
endmodule
