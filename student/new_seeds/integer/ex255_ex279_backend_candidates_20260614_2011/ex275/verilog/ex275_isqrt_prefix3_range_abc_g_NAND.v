module ex275_isqrt_prefix3_range(in, out);
  input [7:0] in;
  output [3:0] out;
  wire [2:0] hi = in[7:5];
  wire [4:0] lo = in[4:0];
  reg [3:0] out_r;
  always @* begin
    case (hi)
      3'd0: out_r = (lo >= 5'd9 ? (lo >= 5'd16 ? (lo >= 5'd25 ? 4'd5 : 4'd4) : 4'd3) : (lo >= 5'd1 ? (lo >= 5'd4 ? 4'd2 : 4'd1) : 4'd0));
      3'd1: out_r = (lo >= 5'd4 ? (lo >= 5'd17 ? 4'd7 : 4'd6) : 4'd5);
      3'd2: out_r = (lo >= 5'd17 ? 4'd9 : 4'd8);
      3'd3: out_r = (lo >= 5'd4 ? (lo >= 5'd25 ? 4'd11 : 4'd10) : 4'd9);
      3'd4: out_r = (lo >= 5'd16 ? 4'd12 : 4'd11);
      3'd5: out_r = (lo >= 5'd9 ? 4'd13 : 4'd12);
      3'd6: out_r = (lo >= 5'd4 ? 4'd14 : 4'd13);
      3'd7: out_r = (lo >= 5'd1 ? 4'd15 : 4'd14);
      default: out_r = 4'b0;
    endcase
  end
  assign out = out_r;
endmodule
