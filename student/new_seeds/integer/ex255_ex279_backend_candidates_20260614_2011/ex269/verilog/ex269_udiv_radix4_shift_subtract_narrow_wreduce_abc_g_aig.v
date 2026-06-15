module ex269_udiv_radix4_shift_subtract_narrow(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[7:0];
  wire [7:0] b = in[15:8];
  wire dbz = (b == 8'b0);
  reg [7:0] q;
  reg [7:0] rem;
  reg [17:0] denom1;
  reg [17:0] denom2;
  reg [17:0] denom3;
  always @* begin
    q = 8'b0;
    rem = a;
    denom1 = 18'b0;
    denom2 = 18'b0;
    denom3 = 18'b0;
    if (dbz) begin
      q = 8'hff;
    end
    else begin
      denom1 = {10'b0, b} << 6;
      denom2 = denom1 << 1;
      denom3 = denom1 + (denom1 << 1);
      if ((denom3[17:8] == 10'b0) && (rem >= denom3[7:0])) begin
        rem = rem - denom3[7:0];
        q[7:6] = 2'd3;
      end
      else if ((denom2[17:8] == 10'b0) && (rem >= denom2[7:0])) begin
        rem = rem - denom2[7:0];
        q[7:6] = 2'd2;
      end
      else if ((denom1[17:8] == 10'b0) && (rem >= denom1[7:0])) begin
        rem = rem - denom1[7:0];
        q[7:6] = 2'd1;
      end
      denom1 = {10'b0, b} << 4;
      denom2 = denom1 << 1;
      denom3 = denom1 + (denom1 << 1);
      if ((denom3[17:8] == 10'b0) && (rem >= denom3[7:0])) begin
        rem = rem - denom3[7:0];
        q[5:4] = 2'd3;
      end
      else if ((denom2[17:8] == 10'b0) && (rem >= denom2[7:0])) begin
        rem = rem - denom2[7:0];
        q[5:4] = 2'd2;
      end
      else if ((denom1[17:8] == 10'b0) && (rem >= denom1[7:0])) begin
        rem = rem - denom1[7:0];
        q[5:4] = 2'd1;
      end
      denom1 = {10'b0, b} << 2;
      denom2 = denom1 << 1;
      denom3 = denom1 + (denom1 << 1);
      if ((denom3[17:8] == 10'b0) && (rem >= denom3[7:0])) begin
        rem = rem - denom3[7:0];
        q[3:2] = 2'd3;
      end
      else if ((denom2[17:8] == 10'b0) && (rem >= denom2[7:0])) begin
        rem = rem - denom2[7:0];
        q[3:2] = 2'd2;
      end
      else if ((denom1[17:8] == 10'b0) && (rem >= denom1[7:0])) begin
        rem = rem - denom1[7:0];
        q[3:2] = 2'd1;
      end
      denom1 = {10'b0, b} << 0;
      denom2 = denom1 << 1;
      denom3 = denom1 + (denom1 << 1);
      if ((denom3[17:8] == 10'b0) && (rem >= denom3[7:0])) begin
        rem = rem - denom3[7:0];
        q[1:0] = 2'd3;
      end
      else if ((denom2[17:8] == 10'b0) && (rem >= denom2[7:0])) begin
        rem = rem - denom2[7:0];
        q[1:0] = 2'd2;
      end
      else if ((denom1[17:8] == 10'b0) && (rem >= denom1[7:0])) begin
        rem = rem - denom1[7:0];
        q[1:0] = 2'd1;
      end
    end
  end
  assign out = q;
endmodule
