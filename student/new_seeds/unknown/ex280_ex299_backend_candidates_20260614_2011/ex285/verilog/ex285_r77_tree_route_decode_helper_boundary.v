`include "/home/b10507053/ALS_Final_Project/student/work/reverse_unknown_20260603_1812/ex285/verilog/ex285_unknown_12x12_decision_tree_greedy.v"

module ex285_r77_route_decode_highfanout(in, route_key);
  input [11:0] in;
  output [5:0] route_key;
  assign route_key[0] = in[4] | in[5];
  assign route_key[1] = in[4] & in[5];
  assign route_key[2] = in[6] | in[7];
  assign route_key[3] = in[6] & in[7];
  assign route_key[4] = ^in[3:0];
  assign route_key[5] = ^in[11:8];
endmodule

module ex285_r77_tree_residual_helper(in, route_key, out);
  input [11:0] in;
  input [5:0] route_key;
  output [11:0] out;
  wire guard_zero = ^(route_key & ~route_key);
  wire [11:0] residual_in = in ^ {12{guard_zero}};
  ex285_unknown_12x12_decision_tree_greedy u_tree(.in(residual_in), .out(out));
endmodule

module ex285_r77_tree_route_decode_helper_boundary(in, out);
  input [11:0] in;
  output [11:0] out;
  (* keep *) wire [5:0] route_key;
  ex285_r77_route_decode_highfanout u_key(.in(in), .route_key(route_key));
  ex285_r77_tree_residual_helper u_residual(.in(in), .route_key(route_key), .out(out));
endmodule
