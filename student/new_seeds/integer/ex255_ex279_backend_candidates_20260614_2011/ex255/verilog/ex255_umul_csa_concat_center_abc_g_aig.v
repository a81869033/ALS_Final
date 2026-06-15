module ex255_umul_csa_concat_center(in, out);
  input [7:0] in;
  output [7:0] out;
  wire [3:0] a = in[3:0];
  wire [3:0] b = in[7:4];
  wire [7:0] row0 = {{3{1'b0}}, (a & {4{b[1]}}), {1{1'b0}}};
  wire [7:0] row1 = {{2{1'b0}}, (a & {4{b[2]}}), {2{1'b0}}};
  wire [7:0] row2 = {{4{1'b0}}, (a & {4{b[0]}})};
  wire [7:0] row3 = {{1{1'b0}}, (a & {4{b[3]}}), {3{1'b0}}};
  wire [7:0] s0_0 = row0 ^ row1 ^ row2;
  wire [7:0] c0_0 = ((row0 & row1) | (row0 & row2) | (row1 & row2)) << 1;
  wire [7:0] s1_0 = s0_0 ^ c0_0 ^ row3;
  wire [7:0] c1_0 = ((s0_0 & c0_0) | (s0_0 & row3) | (c0_0 & row3)) << 1;
  assign out = s1_0 + c1_0;
endmodule
