module ex253_semantic_u2_sum8_popcount_bitformula(in, out);
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
  wire s0 = lane_sum[0];
  wire s1 = lane_sum[1];
  wire s2 = lane_sum[2];
  wire s3 = lane_sum[3];
  wire s4 = lane_sum[4];
  wire [6:0] mag;
  assign mag[0] = (s4 & s1 & ~s0) | (s3 & s0);
  assign mag[1] = (~s4 & ~s3 & s2 & s0) | (s4 & ~s2 & s1 & s0) | (s4 & s2 & ~s1) | (s4 & s2 & ~s0) | (s3 & s1);
  assign mag[2] = (~s4 & ~s3 & s1 & s0) | (~s4 & s2 & s1) | (s2 & s1 & s0) | (s3 & s2) | (s4 & s3);
  assign mag[3] = (~s4 & ~s2 & s1) | (~s4 & s3);
  assign mag[4] = (~s3 & ~s2 & s0) | (~s3 & ~s2 & s1) | s4;
  assign mag[5] = (~s4 & ~s3 & ~s2 & s0) | (~s4 & ~s3 & ~s2 & s1);
  assign mag[6] = s2 | s3 | s4;
  assign out = {1'b0, mag};
endmodule
