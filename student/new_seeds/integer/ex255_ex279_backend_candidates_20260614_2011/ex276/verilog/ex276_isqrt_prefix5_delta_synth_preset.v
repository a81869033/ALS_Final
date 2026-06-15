module ex276_isqrt_prefix5_delta(in, out);
  input [9:0] in;
  output [4:0] out;
  wire [4:0] hi = in[9:5];
  wire [4:0] lo = in[4:0];
  reg [4:0] out_r;
  always @* begin
    case (hi)
      5'd0: out_r = ((({4'b0, (lo >= 5'd1)} + {4'b0, (lo >= 5'd4)}) + ({4'b0, (lo >= 5'd9)} + {4'b0, (lo >= 5'd16)})) + {4'b0, (lo >= 5'd25)});
      5'd1: out_r = (5'd5 + ({4'b0, (lo >= 5'd4)} + {4'b0, (lo >= 5'd17)}));
      5'd2: out_r = (5'd8 + {4'b0, (lo >= 5'd17)});
      5'd3: out_r = (5'd9 + ({4'b0, (lo >= 5'd4)} + {4'b0, (lo >= 5'd25)}));
      5'd4: out_r = (5'd11 + {4'b0, (lo >= 5'd16)});
      5'd5: out_r = (5'd12 + {4'b0, (lo >= 5'd9)});
      5'd6: out_r = (5'd13 + {4'b0, (lo >= 5'd4)});
      5'd7: out_r = (5'd14 + {4'b0, (lo >= 5'd1)});
      5'd8: out_r = 5'd16;
      5'd9: out_r = (5'd16 + {4'b0, (lo >= 5'd1)});
      5'd10: out_r = (5'd17 + {4'b0, (lo >= 5'd4)});
      5'd11: out_r = (5'd18 + {4'b0, (lo >= 5'd9)});
      5'd12: out_r = (5'd19 + {4'b0, (lo >= 5'd16)});
      5'd13: out_r = (5'd20 + {4'b0, (lo >= 5'd25)});
      5'd14: out_r = 5'd21;
      5'd15: out_r = (5'd21 + {4'b0, (lo >= 5'd4)});
      5'd16: out_r = (5'd22 + {4'b0, (lo >= 5'd17)});
      5'd17: out_r = 5'd23;
      5'd18: out_r = 5'd24;
      5'd19: out_r = (5'd24 + {4'b0, (lo >= 5'd17)});
      5'd20: out_r = 5'd25;
      5'd21: out_r = (5'd25 + {4'b0, (lo >= 5'd4)});
      5'd22: out_r = (5'd26 + {4'b0, (lo >= 5'd25)});
      5'd23: out_r = 5'd27;
      5'd24: out_r = (5'd27 + {4'b0, (lo >= 5'd16)});
      5'd25: out_r = 5'd28;
      5'd26: out_r = (5'd28 + {4'b0, (lo >= 5'd9)});
      5'd27: out_r = 5'd29;
      5'd28: out_r = (5'd29 + {4'b0, (lo >= 5'd4)});
      5'd29: out_r = 5'd30;
      5'd30: out_r = (5'd30 + {4'b0, (lo >= 5'd1)});
      5'd31: out_r = 5'd31;
      default: out_r = 5'b0;
    endcase
  end
  assign out = out_r;
endmodule
