module ex268_udiv_denom_split_direct(in, out);
  input [13:0] in;
  output [6:0] out;
  wire [6:0] a = in[6:0];
  wire [6:0] b = in[13:7];
  wire dbz = (b == 7'b0);
  wire high_denom = |b[6:3];
  wire [2:0] b_low = b[2:0];
  wire [3:0] q_high = a / b;
  wire [6:0] q_low = a / b_low;
  assign out = dbz ? 7'h7f : (high_denom ? {3'b0, q_high} : q_low);
endmodule
