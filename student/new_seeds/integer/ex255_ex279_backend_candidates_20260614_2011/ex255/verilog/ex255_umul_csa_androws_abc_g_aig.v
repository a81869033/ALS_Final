module ex255_umul_csa_androws(in, out);
  input [7:0] in;
  output [7:0] out;
  wire [3:0] a = in[3:0];
  wire [3:0] b = in[7:4];
  wire [7:0] row0 = ({8{b[0]}} & {4'b0, a});
  wire [7:0] row1 = ({8{b[1]}} & ({4'b0, a} << 1));
  wire [7:0] row2 = ({8{b[2]}} & ({4'b0, a} << 2));
  wire [7:0] row3 = ({8{b[3]}} & ({4'b0, a} << 3));
  wire [7:0] s0_0 = row0 ^ row1 ^ row2;
  wire [7:0] c0_0 = ((row0 & row1) | (row0 & row2) | (row1 & row2)) << 1;
  wire [7:0] s1_0 = s0_0 ^ c0_0 ^ row3;
  wire [7:0] c1_0 = ((s0_0 & c0_0) | (s0_0 & row3) | (c0_0 & row3)) << 1;
  assign out = s1_0 + c1_0;
endmodule
