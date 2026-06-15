module ex277_isqrt_prefix4_bitwise(in, out);
  input [11:0] in;
  output [5:0] out;
  wire [3:0] hi = in[11:8];
  wire [7:0] lo = in[7:0];
  reg [5:0] out_r;
  always @* begin
    out_r = 6'b0;
    case (hi)
      4'd0: begin
        out_r[0] = (((((lo >= 8'd1) & (lo <= 8'd3)) | ((lo >= 8'd9) & (lo <= 8'd15))) | (((lo >= 8'd25) & (lo <= 8'd35)) | ((lo >= 8'd49) & (lo <= 8'd63)))) | ((((lo >= 8'd81) & (lo <= 8'd99)) | ((lo >= 8'd121) & (lo <= 8'd143))) | (((lo >= 8'd169) & (lo <= 8'd195)) | (lo >= 8'd225))));
        out_r[1] = ((((lo >= 8'd4) & (lo <= 8'd15)) | ((lo >= 8'd36) & (lo <= 8'd63))) | (((lo >= 8'd100) & (lo <= 8'd143)) | (lo >= 8'd196)));
        out_r[2] = (((lo >= 8'd16) & (lo <= 8'd63)) | (lo >= 8'd144));
        out_r[3] = (lo >= 8'd64);
        out_r[4] = 1'b0;
        out_r[5] = 1'b0;
      end
      4'd1: begin
        out_r[0] = ((((lo >= 8'd33) & (lo <= 8'd67)) | ((lo >= 8'd105) & (lo <= 8'd143))) | ((lo >= 8'd185) & (lo <= 8'd227)));
        out_r[1] = (((lo >= 8'd68) & (lo <= 8'd143)) | (lo >= 8'd228));
        out_r[2] = (lo >= 8'd144);
        out_r[3] = 1'b0;
        out_r[4] = 1'b1;
        out_r[5] = 1'b0;
      end
      4'd2: begin
        out_r[0] = ((((lo >= 8'd17) & (lo <= 8'd63)) | ((lo >= 8'd113) & (lo <= 8'd163))) | (lo >= 8'd217));
        out_r[1] = ((lo <= 8'd63) | (lo >= 8'd164));
        out_r[2] = (lo <= 8'd63);
        out_r[3] = (lo >= 8'd64);
        out_r[4] = 1'b1;
        out_r[5] = 1'b0;
      end
      4'd3: begin
        out_r[0] = (((lo <= 8'd15) | ((lo >= 8'd73) & (lo <= 8'd131))) | (lo >= 8'd193));
        out_r[1] = ((lo <= 8'd15) | (lo >= 8'd132));
        out_r[2] = (lo >= 8'd16);
        out_r[3] = 1'b1;
        out_r[4] = 1'b1;
        out_r[5] = 1'b0;
      end
      4'd4: begin
        out_r[0] = (((lo >= 8'd65) & (lo <= 8'd131)) | (lo >= 8'd201));
        out_r[1] = (lo >= 8'd132);
        out_r[2] = 1'b0;
        out_r[3] = 1'b0;
        out_r[4] = 1'b0;
        out_r[5] = 1'b1;
      end
      4'd5: begin
        out_r[0] = (((lo <= 8'd15) | ((lo >= 8'd89) & (lo <= 8'd163))) | (lo >= 8'd241));
        out_r[1] = ((lo <= 8'd15) | (lo >= 8'd164));
        out_r[2] = (lo >= 8'd16);
        out_r[3] = 1'b0;
        out_r[4] = 1'b0;
        out_r[5] = 1'b1;
      end
      4'd6: begin
        out_r[0] = ((lo <= 8'd63) | ((lo >= 8'd145) & (lo <= 8'd227)));
        out_r[1] = ((lo <= 8'd63) | (lo >= 8'd228));
        out_r[2] = (lo <= 8'd63);
        out_r[3] = (lo >= 8'd64);
        out_r[4] = 1'b0;
        out_r[5] = 1'b1;
      end
      4'd7: begin
        out_r[0] = (((lo >= 8'd57) & (lo <= 8'd143)) | (lo >= 8'd233));
        out_r[1] = (lo <= 8'd143);
        out_r[2] = (lo >= 8'd144);
        out_r[3] = 1'b1;
        out_r[4] = 1'b0;
        out_r[5] = 1'b1;
      end
      4'd8: begin
        out_r[0] = ((lo <= 8'd67) | (lo >= 8'd161));
        out_r[1] = (lo >= 8'd68);
        out_r[2] = 1'b1;
        out_r[3] = 1'b1;
        out_r[4] = 1'b0;
        out_r[5] = 1'b1;
      end
      4'd9: begin
        out_r[0] = ((lo >= 8'd97) & (lo <= 8'd195));
        out_r[1] = (lo >= 8'd196);
        out_r[2] = 1'b0;
        out_r[3] = 1'b0;
        out_r[4] = 1'b1;
        out_r[5] = 1'b1;
      end
      4'd10: begin
        out_r[0] = (((lo >= 8'd41) & (lo <= 8'd143)) | (lo >= 8'd249));
        out_r[1] = (lo <= 8'd143);
        out_r[2] = (lo >= 8'd144);
        out_r[3] = 1'b0;
        out_r[4] = 1'b1;
        out_r[5] = 1'b1;
      end
      4'd11: begin
        out_r[0] = ((lo <= 8'd99) | (lo >= 8'd209));
        out_r[1] = (lo >= 8'd100);
        out_r[2] = 1'b1;
        out_r[3] = 1'b0;
        out_r[4] = 1'b1;
        out_r[5] = 1'b1;
      end
      4'd12: begin
        out_r[0] = ((lo <= 8'd63) | (lo >= 8'd177));
        out_r[1] = (lo <= 8'd63);
        out_r[2] = (lo <= 8'd63);
        out_r[3] = (lo >= 8'd64);
        out_r[4] = 1'b1;
        out_r[5] = 1'b1;
      end
      4'd13: begin
        out_r[0] = ((lo <= 8'd35) | (lo >= 8'd153));
        out_r[1] = (lo >= 8'd36);
        out_r[2] = 1'b0;
        out_r[3] = 1'b1;
        out_r[4] = 1'b1;
        out_r[5] = 1'b1;
      end
      4'd14: begin
        out_r[0] = ((lo <= 8'd15) | (lo >= 8'd137));
        out_r[1] = (lo <= 8'd15);
        out_r[2] = (lo >= 8'd16);
        out_r[3] = 1'b1;
        out_r[4] = 1'b1;
        out_r[5] = 1'b1;
      end
      4'd15: begin
        out_r[0] = ((lo <= 8'd3) | (lo >= 8'd129));
        out_r[1] = (lo >= 8'd4);
        out_r[2] = 1'b1;
        out_r[3] = 1'b1;
        out_r[4] = 1'b1;
        out_r[5] = 1'b1;
      end
      default: out_r = 6'b0;
    endcase
  end
  assign out = out_r;
endmodule
