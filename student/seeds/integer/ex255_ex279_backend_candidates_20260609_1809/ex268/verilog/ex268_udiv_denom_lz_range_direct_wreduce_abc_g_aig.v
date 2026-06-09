module ex268_udiv_denom_lz_range_direct(in, out);
  input [13:0] in;
  output [6:0] out;
  wire [6:0] a = in[6:0];
  wire [6:0] b = in[13:7];
  wire dbz = (b == 7'b0);
  wire [6:0] safe_b = dbz ? 7'd1 : b;
  wire [0:0] q_ge_6 = a / safe_b;
  wire [1:0] q_ge_5 = a / safe_b;
  wire [2:0] q_ge_4 = a / safe_b;
  wire [3:0] q_ge_3 = a / safe_b;
  wire [2:0] b_low = b[2:0];
  wire [2:0] safe_b_low = (b_low == 3'b0) ? 3'd1 : b_low;
  wire [6:0] q_low = a / safe_b_low;
  reg [6:0] q;
  always @* begin
    if (dbz) begin
      q = 7'h7f;
    end else if (b > a) begin
      q = 7'b0;
    end
    else if (b[6]) begin q = {6'b0, q_ge_6}; end
    else if (b[5]) begin q = {5'b0, q_ge_5}; end
    else if (b[4]) begin q = {4'b0, q_ge_4}; end
    else if (b[3]) begin q = {3'b0, q_ge_3}; end
    else begin q = q_low; end
  end
  assign out = q;
endmodule
