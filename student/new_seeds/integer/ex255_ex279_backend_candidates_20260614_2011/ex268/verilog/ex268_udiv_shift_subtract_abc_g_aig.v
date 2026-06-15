module ex268_udiv_shift_subtract(in, out);
  input [13:0] in;
  output [6:0] out;
  wire [6:0] a = in[6:0];
  wire [6:0] b = in[13:7];
  wire dbz = (b == 7'b0);
  reg [6:0] q;
  reg [13:0] rem;
  reg [13:0] denom_shift;
  integer i;
  always @* begin
    q = 7'b0;
    rem = {7'b0, a};
    denom_shift = 14'b0;
    if (dbz) begin
      q = 7'h7f;
    end
    else begin
      for (i = 6; i >= 0; i = i - 1) begin
        denom_shift = {7'b0, b} << i;
        if (rem >= denom_shift) begin
          rem = rem - denom_shift;
          q[i] = 1'b1;
        end
      end
    end
  end
  assign out = q;
endmodule
