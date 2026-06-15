module ex275_isqrt_prefix4_bitwise(in, out);
  input [7:0] in;
  output [3:0] out;
  wire [3:0] hi = in[7:4];
  wire [3:0] lo = in[3:0];
  reg [3:0] out_r;
  always @* begin
    out_r = 4'b0;
    case (hi)
      4'd0: begin
        out_r[0] = (((lo >= 4'd1) & (lo <= 4'd3)) | (lo >= 4'd9));
        out_r[1] = (lo >= 4'd4);
        out_r[2] = 1'b0;
        out_r[3] = 1'b0;
      end
      4'd1: begin
        out_r[0] = (lo >= 4'd9);
        out_r[1] = 1'b0;
        out_r[2] = 1'b1;
        out_r[3] = 1'b0;
      end
      4'd2: begin
        out_r[0] = (lo <= 4'd3);
        out_r[1] = (lo >= 4'd4);
        out_r[2] = 1'b1;
        out_r[3] = 1'b0;
      end
      4'd3: begin
        out_r[0] = (lo >= 4'd1);
        out_r[1] = 1'b1;
        out_r[2] = 1'b1;
        out_r[3] = 1'b0;
      end
      4'd4: begin
        out_r[0] = 1'b0;
        out_r[1] = 1'b0;
        out_r[2] = 1'b0;
        out_r[3] = 1'b1;
      end
      4'd5: begin
        out_r[0] = (lo >= 4'd1);
        out_r[1] = 1'b0;
        out_r[2] = 1'b0;
        out_r[3] = 1'b1;
      end
      4'd6: begin
        out_r[0] = (lo <= 4'd3);
        out_r[1] = (lo >= 4'd4);
        out_r[2] = 1'b0;
        out_r[3] = 1'b1;
      end
      4'd7: begin
        out_r[0] = (lo >= 4'd9);
        out_r[1] = 1'b1;
        out_r[2] = 1'b0;
        out_r[3] = 1'b1;
      end
      4'd8: begin
        out_r[0] = 1'b1;
        out_r[1] = 1'b1;
        out_r[2] = 1'b0;
        out_r[3] = 1'b1;
      end
      4'd9: begin
        out_r[0] = 1'b0;
        out_r[1] = 1'b0;
        out_r[2] = 1'b1;
        out_r[3] = 1'b1;
      end
      4'd10: begin
        out_r[0] = (lo >= 4'd9);
        out_r[1] = 1'b0;
        out_r[2] = 1'b1;
        out_r[3] = 1'b1;
      end
      4'd11: begin
        out_r[0] = 1'b1;
        out_r[1] = 1'b0;
        out_r[2] = 1'b1;
        out_r[3] = 1'b1;
      end
      4'd12: begin
        out_r[0] = (lo <= 4'd3);
        out_r[1] = (lo >= 4'd4);
        out_r[2] = 1'b1;
        out_r[3] = 1'b1;
      end
      4'd13: begin
        out_r[0] = 1'b0;
        out_r[1] = 1'b1;
        out_r[2] = 1'b1;
        out_r[3] = 1'b1;
      end
      4'd14: begin
        out_r[0] = (lo >= 4'd1);
        out_r[1] = 1'b1;
        out_r[2] = 1'b1;
        out_r[3] = 1'b1;
      end
      4'd15: begin
        out_r[0] = 1'b1;
        out_r[1] = 1'b1;
        out_r[2] = 1'b1;
        out_r[3] = 1'b1;
      end
      default: out_r = 4'b0;
    endcase
  end
  assign out = out_r;
endmodule
