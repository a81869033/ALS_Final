module ex268_udiv_small_divisor_fast_direct(in, out);
  input [13:0] in;
  output [6:0] out;
  wire [6:0] a = in[6:0];
  wire [6:0] b = in[13:7];
  wire dbz = (b == 7'b0);
  reg [6:0] q;
  always @* begin
    if (dbz) begin
      q = 7'h7f;
    end else if (b > a) begin
      q = 7'b0;
    end
    else if (b == 7'd1) begin q = a; end
    else if (b == 7'd2) begin q = {1'b0, a[6:1]}; end
    else if (b == 7'd4) begin q = {2'b0, a[6:2]}; end
    else if (b == 7'd8) begin q = {3'b0, a[6:3]}; end
    else if (b == 7'd16) begin q = {4'b0, a[6:4]}; end
    else if (b == 7'd32) begin q = {5'b0, a[6:5]}; end
    else if (b == 7'd64) begin q = {6'b0, a[6:6]}; end
    else begin q = a / b; end
  end
  assign out = q;
endmodule
