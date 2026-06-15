module ex277_isqrt_prefix5_range(in, out);
  input [11:0] in;
  output [5:0] out;
  wire [4:0] hi = in[11:7];
  wire [6:0] lo = in[6:0];
  reg [5:0] out_r;
  always @* begin
    case (hi)
      5'd0: out_r = (lo >= 7'd36 ? (lo >= 7'd81 ? (lo >= 7'd100 ? (lo >= 7'd121 ? 6'd11 : 6'd10) : 6'd9) : (lo >= 7'd49 ? (lo >= 7'd64 ? 6'd8 : 6'd7) : 6'd6)) : (lo >= 7'd9 ? (lo >= 7'd16 ? (lo >= 7'd25 ? 6'd5 : 6'd4) : 6'd3) : (lo >= 7'd1 ? (lo >= 7'd4 ? 6'd2 : 6'd1) : 6'd0)));
      5'd1: out_r = (lo >= 7'd41 ? (lo >= 7'd68 ? (lo >= 7'd97 ? 6'd15 : 6'd14) : 6'd13) : (lo >= 7'd16 ? 6'd12 : 6'd11));
      5'd2: out_r = (lo >= 7'd68 ? (lo >= 7'd105 ? 6'd19 : 6'd18) : (lo >= 7'd33 ? 6'd17 : 6'd16));
      5'd3: out_r = (lo >= 7'd57 ? (lo >= 7'd100 ? 6'd22 : 6'd21) : (lo >= 7'd16 ? 6'd20 : 6'd19));
      5'd4: out_r = (lo >= 7'd64 ? (lo >= 7'd113 ? 6'd25 : 6'd24) : (lo >= 7'd17 ? 6'd23 : 6'd22));
      5'd5: out_r = (lo >= 7'd36 ? (lo >= 7'd89 ? 6'd27 : 6'd26) : 6'd25);
      5'd6: out_r = (lo >= 7'd16 ? (lo >= 7'd73 ? 6'd29 : 6'd28) : 6'd27);
      5'd7: out_r = (lo >= 7'd4 ? (lo >= 7'd65 ? 6'd31 : 6'd30) : 6'd29);
      5'd8: out_r = (lo >= 7'd65 ? 6'd33 : 6'd32);
      5'd9: out_r = (lo >= 7'd4 ? (lo >= 7'd73 ? 6'd35 : 6'd34) : 6'd33);
      5'd10: out_r = (lo >= 7'd16 ? (lo >= 7'd89 ? 6'd37 : 6'd36) : 6'd35);
      5'd11: out_r = (lo >= 7'd36 ? (lo >= 7'd113 ? 6'd39 : 6'd38) : 6'd37);
      5'd12: out_r = (lo >= 7'd64 ? 6'd40 : 6'd39);
      5'd13: out_r = (lo >= 7'd17 ? (lo >= 7'd100 ? 6'd42 : 6'd41) : 6'd40);
      5'd14: out_r = (lo >= 7'd57 ? 6'd43 : 6'd42);
      5'd15: out_r = (lo >= 7'd16 ? (lo >= 7'd105 ? 6'd45 : 6'd44) : 6'd43);
      5'd16: out_r = (lo >= 7'd68 ? 6'd46 : 6'd45);
      5'd17: out_r = (lo >= 7'd33 ? 6'd47 : 6'd46);
      5'd18: out_r = (lo >= 7'd97 ? 6'd49 : 6'd48);
      5'd19: out_r = (lo >= 7'd68 ? 6'd50 : 6'd49);
      5'd20: out_r = (lo >= 7'd41 ? 6'd51 : 6'd50);
      5'd21: out_r = (lo >= 7'd16 ? (lo >= 7'd121 ? 6'd53 : 6'd52) : 6'd51);
      5'd22: out_r = (lo >= 7'd100 ? 6'd54 : 6'd53);
      5'd23: out_r = (lo >= 7'd81 ? 6'd55 : 6'd54);
      5'd24: out_r = (lo >= 7'd64 ? 6'd56 : 6'd55);
      5'd25: out_r = (lo >= 7'd49 ? 6'd57 : 6'd56);
      5'd26: out_r = (lo >= 7'd36 ? 6'd58 : 6'd57);
      5'd27: out_r = (lo >= 7'd25 ? 6'd59 : 6'd58);
      5'd28: out_r = (lo >= 7'd16 ? 6'd60 : 6'd59);
      5'd29: out_r = (lo >= 7'd9 ? 6'd61 : 6'd60);
      5'd30: out_r = (lo >= 7'd4 ? 6'd62 : 6'd61);
      5'd31: out_r = (lo >= 7'd1 ? 6'd63 : 6'd62);
      default: out_r = 6'b0;
    endcase
  end
  assign out = out_r;
endmodule
