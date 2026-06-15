module ex253_semantic_u2_sum8_popcount_threshold_fields(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] lo_bits = {in[14], in[12], in[10], in[8], in[6], in[4], in[2], in[0]};
  wire [7:0] hi_bits = {in[15], in[13], in[11], in[9], in[7], in[5], in[3], in[1]};

  wire [1:0] lo01 = {1'b0, lo_bits[0]} + {1'b0, lo_bits[1]};
  wire [1:0] lo23 = {1'b0, lo_bits[2]} + {1'b0, lo_bits[3]};
  wire [1:0] lo45 = {1'b0, lo_bits[4]} + {1'b0, lo_bits[5]};
  wire [1:0] lo67 = {1'b0, lo_bits[6]} + {1'b0, lo_bits[7]};
  wire [2:0] lo0123 = {1'b0, lo01} + {1'b0, lo23};
  wire [2:0] lo4567 = {1'b0, lo45} + {1'b0, lo67};
  wire [3:0] lo_count = {1'b0, lo0123} + {1'b0, lo4567};

  wire [1:0] hi01 = {1'b0, hi_bits[0]} + {1'b0, hi_bits[1]};
  wire [1:0] hi23 = {1'b0, hi_bits[2]} + {1'b0, hi_bits[3]};
  wire [1:0] hi45 = {1'b0, hi_bits[4]} + {1'b0, hi_bits[5]};
  wire [1:0] hi67 = {1'b0, hi_bits[6]} + {1'b0, hi_bits[7]};
  wire [2:0] hi0123 = {1'b0, hi01} + {1'b0, hi23};
  wire [2:0] hi4567 = {1'b0, hi45} + {1'b0, hi67};
  wire [3:0] hi_count = {1'b0, hi0123} + {1'b0, hi4567};

  wire [4:0] lane_sum = {1'b0, lo_count} + {hi_count, 1'b0};
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
