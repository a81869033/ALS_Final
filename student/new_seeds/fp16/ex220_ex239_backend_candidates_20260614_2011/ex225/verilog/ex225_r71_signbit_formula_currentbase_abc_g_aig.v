`include "/home/b10507053/ALS_Final_Project/student/work/ex200_ex299_frontend_refgap_round2_20260612_1512/unary-agent/ex225/verilog/ex225_log_sparse_residual_low14_hi5.v"

module ex225_r71_signbit_formula_currentbase(in, out);
  input [15:0] in;
  output [15:0] out;
  wire [15:0] base_out;
  wire sign = in[15];
  wire [4:0] exp = in[14:10];
  wire exact_sign = (exp == 5'd0) || (!sign && (exp < 5'd15));
  ex225_log_sparse_residual_low14_hi5 u_base(.in(in), .out(base_out));
  assign out = {exact_sign, base_out[14:0]};
endmodule
