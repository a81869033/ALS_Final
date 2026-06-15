module ex268_udiv_direct_safe(in, out);
  input [13:0] in;
  output [6:0] out;
  wire [6:0] a = in[6:0];
  wire [6:0] b = in[13:7];
  wire dbz = (b == 7'b0);
  wire [6:0] safe_b = dbz ? 7'd1 : b;
  wire [6:0] q = a / safe_b;
  assign out = dbz ? 7'h7f : q;
endmodule
