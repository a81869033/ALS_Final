module ex248_r26r_fmod_norm_by_rem(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] den = in[14:8];
  wire [6:0] num = in[6:0];
  wire num_sign = in[7];
  wire nan = (den == 7'h7f) || (num == 7'h7f);
  wire den_zero = (den == 7'h00);
  function [2:0] sig3;
    input [6:0] v;
    begin
      sig3 = (v[6:2] == 5'd0) ? {1'b0, v[1:0]} : {1'b1, v[1:0]};
    end
  endfunction

  function [5:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:2] == 5'd0) ? 6'd1 : {1'b0, v[6:2]};
    end
  endfunction

  function [2:0] rem_d3;
    input [4:0] key;
    begin
      case (key)
        5'h01: rem_d3 = 3'd1;
        5'h02: rem_d3 = 3'd2;
        5'h04: rem_d3 = 3'd1;
        5'h05: rem_d3 = 3'd2;
        5'h07: rem_d3 = 3'd1;
        5'h09: rem_d3 = 3'd2;
        5'h0a: rem_d3 = 3'd1;
        5'h0c: rem_d3 = 3'd2;
        5'h0d: rem_d3 = 3'd1;
        5'h0f: rem_d3 = 3'd2;
        default: rem_d3 = 3'd0;
      endcase
    end
  endfunction

  function [2:0] rem_d5;
    input [4:0] key;
    begin
      case (key)
        5'h01: rem_d5 = 3'd1;
        5'h02: rem_d5 = 3'd2;
        5'h03: rem_d5 = 3'd3;
        5'h04: rem_d5 = 3'd4;
        5'h06: rem_d5 = 3'd1;
        5'h07: rem_d5 = 3'd2;
        5'h09: rem_d5 = 3'd2;
        5'h0a: rem_d5 = 3'd4;
        5'h0b: rem_d5 = 3'd1;
        5'h0c: rem_d5 = 3'd3;
        5'h0e: rem_d5 = 3'd2;
        5'h0f: rem_d5 = 3'd4;
        5'h11: rem_d5 = 3'd4;
        5'h12: rem_d5 = 3'd3;
        5'h13: rem_d5 = 3'd2;
        5'h14: rem_d5 = 3'd1;
        5'h16: rem_d5 = 3'd4;
        5'h17: rem_d5 = 3'd3;
        5'h19: rem_d5 = 3'd3;
        5'h1a: rem_d5 = 3'd1;
        5'h1b: rem_d5 = 3'd4;
        5'h1c: rem_d5 = 3'd2;
        5'h1e: rem_d5 = 3'd3;
        5'h1f: rem_d5 = 3'd1;
        default: rem_d5 = 3'd0;
      endcase
    end
  endfunction

  function [2:0] rem_d6;
    input [4:0] key;
    begin
      case (key)
        5'h01: rem_d6 = 3'd1;
        5'h02: rem_d6 = 3'd2;
        5'h03: rem_d6 = 3'd3;
        5'h04: rem_d6 = 3'd4;
        5'h05: rem_d6 = 3'd5;
        5'h07: rem_d6 = 3'd1;
        5'h09: rem_d6 = 3'd2;
        5'h0a: rem_d6 = 3'd4;
        5'h0c: rem_d6 = 3'd2;
        5'h0d: rem_d6 = 3'd4;
        5'h0f: rem_d6 = 3'd2;
        5'h11: rem_d6 = 3'd4;
        5'h12: rem_d6 = 3'd2;
        5'h14: rem_d6 = 3'd4;
        5'h15: rem_d6 = 3'd2;
        5'h17: rem_d6 = 3'd4;
        default: rem_d6 = 3'd0;
      endcase
    end
  endfunction

  function [2:0] rem_d7;
    input [4:0] key;
    begin
      case (key)
        5'h01: rem_d7 = 3'd1;
        5'h02: rem_d7 = 3'd2;
        5'h03: rem_d7 = 3'd3;
        5'h04: rem_d7 = 3'd4;
        5'h05: rem_d7 = 3'd5;
        5'h06: rem_d7 = 3'd6;
        5'h09: rem_d7 = 3'd2;
        5'h0a: rem_d7 = 3'd4;
        5'h0b: rem_d7 = 3'd6;
        5'h0c: rem_d7 = 3'd1;
        5'h0d: rem_d7 = 3'd3;
        5'h0e: rem_d7 = 3'd5;
        5'h11: rem_d7 = 3'd4;
        5'h12: rem_d7 = 3'd1;
        5'h13: rem_d7 = 3'd5;
        5'h14: rem_d7 = 3'd2;
        5'h15: rem_d7 = 3'd6;
        5'h16: rem_d7 = 3'd3;
        default: rem_d7 = 3'd0;
      endcase
    end
  endfunction

  function [1:0] delta_mod3;
    input [4:0] d;
    begin
      case (d)
        5'd0, 5'd3, 5'd6, 5'd9, 5'd12, 5'd15, 5'd18, 5'd21, 5'd24, 5'd27, 5'd30: delta_mod3 = 2'd0;
        5'd1, 5'd4, 5'd7, 5'd10, 5'd13, 5'd16, 5'd19, 5'd22, 5'd25, 5'd28: delta_mod3 = 2'd1;
        default: delta_mod3 = 2'd2;
      endcase
    end
  endfunction

  function [6:0] norm_by_rem;
    input [2:0] rem;
    input [4:0] eff;
    begin
      case (rem)
        3'd1: begin
          case (eff)
          5'd1: norm_by_rem = 7'h01;
          5'd2: norm_by_rem = 7'h02;
          5'd3: norm_by_rem = 7'h04;
          5'd4: norm_by_rem = 7'h08;
          5'd5: norm_by_rem = 7'h0c;
          5'd6: norm_by_rem = 7'h10;
          5'd7: norm_by_rem = 7'h14;
          5'd8: norm_by_rem = 7'h18;
          5'd9: norm_by_rem = 7'h1c;
          5'd10: norm_by_rem = 7'h20;
          5'd11: norm_by_rem = 7'h24;
          5'd12: norm_by_rem = 7'h28;
          5'd13: norm_by_rem = 7'h2c;
          5'd14: norm_by_rem = 7'h30;
          5'd15: norm_by_rem = 7'h34;
          5'd16: norm_by_rem = 7'h38;
          5'd17: norm_by_rem = 7'h3c;
          5'd18: norm_by_rem = 7'h40;
          5'd19: norm_by_rem = 7'h44;
          5'd20: norm_by_rem = 7'h48;
          5'd21: norm_by_rem = 7'h4c;
          5'd22: norm_by_rem = 7'h50;
          5'd23: norm_by_rem = 7'h54;
          5'd24: norm_by_rem = 7'h58;
          5'd25: norm_by_rem = 7'h5c;
          5'd26: norm_by_rem = 7'h60;
          5'd27: norm_by_rem = 7'h64;
          5'd28: norm_by_rem = 7'h68;
          5'd29: norm_by_rem = 7'h6c;
          5'd30: norm_by_rem = 7'h70;
          5'd31: norm_by_rem = 7'h74;
            default: norm_by_rem = 7'h00;
          endcase
        end
        3'd2: begin
          case (eff)
          5'd1: norm_by_rem = 7'h02;
          5'd2: norm_by_rem = 7'h04;
          5'd3: norm_by_rem = 7'h08;
          5'd4: norm_by_rem = 7'h0c;
          5'd5: norm_by_rem = 7'h10;
          5'd6: norm_by_rem = 7'h14;
          5'd7: norm_by_rem = 7'h18;
          5'd8: norm_by_rem = 7'h1c;
          5'd9: norm_by_rem = 7'h20;
          5'd10: norm_by_rem = 7'h24;
          5'd11: norm_by_rem = 7'h28;
          5'd12: norm_by_rem = 7'h2c;
          5'd13: norm_by_rem = 7'h30;
          5'd14: norm_by_rem = 7'h34;
          5'd15: norm_by_rem = 7'h38;
          5'd16: norm_by_rem = 7'h3c;
          5'd17: norm_by_rem = 7'h40;
          5'd18: norm_by_rem = 7'h44;
          5'd19: norm_by_rem = 7'h48;
          5'd20: norm_by_rem = 7'h4c;
          5'd21: norm_by_rem = 7'h50;
          5'd22: norm_by_rem = 7'h54;
          5'd23: norm_by_rem = 7'h58;
          5'd24: norm_by_rem = 7'h5c;
          5'd25: norm_by_rem = 7'h60;
          5'd26: norm_by_rem = 7'h64;
          5'd27: norm_by_rem = 7'h68;
          5'd28: norm_by_rem = 7'h6c;
          5'd29: norm_by_rem = 7'h70;
          5'd30: norm_by_rem = 7'h74;
          5'd31: norm_by_rem = 7'h78;
            default: norm_by_rem = 7'h00;
          endcase
        end
        3'd3: begin
          case (eff)
          5'd1: norm_by_rem = 7'h03;
          5'd2: norm_by_rem = 7'h06;
          5'd3: norm_by_rem = 7'h0a;
          5'd4: norm_by_rem = 7'h0e;
          5'd5: norm_by_rem = 7'h12;
          5'd6: norm_by_rem = 7'h16;
          5'd7: norm_by_rem = 7'h1a;
          5'd8: norm_by_rem = 7'h1e;
          5'd9: norm_by_rem = 7'h22;
          5'd10: norm_by_rem = 7'h26;
          5'd11: norm_by_rem = 7'h2a;
          5'd12: norm_by_rem = 7'h2e;
          5'd13: norm_by_rem = 7'h32;
          5'd14: norm_by_rem = 7'h36;
          5'd15: norm_by_rem = 7'h3a;
          5'd16: norm_by_rem = 7'h3e;
          5'd17: norm_by_rem = 7'h42;
          5'd18: norm_by_rem = 7'h46;
          5'd19: norm_by_rem = 7'h4a;
          5'd20: norm_by_rem = 7'h4e;
          5'd21: norm_by_rem = 7'h52;
          5'd22: norm_by_rem = 7'h56;
          5'd23: norm_by_rem = 7'h5a;
          5'd24: norm_by_rem = 7'h5e;
          5'd25: norm_by_rem = 7'h62;
          5'd26: norm_by_rem = 7'h66;
          5'd27: norm_by_rem = 7'h6a;
          5'd28: norm_by_rem = 7'h6e;
          5'd29: norm_by_rem = 7'h72;
          5'd30: norm_by_rem = 7'h76;
          5'd31: norm_by_rem = 7'h7a;
            default: norm_by_rem = 7'h00;
          endcase
        end
        3'd4: begin
          case (eff)
          5'd1: norm_by_rem = 7'h04;
          5'd2: norm_by_rem = 7'h08;
          5'd3: norm_by_rem = 7'h0c;
          5'd4: norm_by_rem = 7'h10;
          5'd5: norm_by_rem = 7'h14;
          5'd6: norm_by_rem = 7'h18;
          5'd7: norm_by_rem = 7'h1c;
          5'd8: norm_by_rem = 7'h20;
          5'd9: norm_by_rem = 7'h24;
          5'd10: norm_by_rem = 7'h28;
          5'd11: norm_by_rem = 7'h2c;
          5'd12: norm_by_rem = 7'h30;
          5'd13: norm_by_rem = 7'h34;
          5'd14: norm_by_rem = 7'h38;
          5'd15: norm_by_rem = 7'h3c;
          5'd16: norm_by_rem = 7'h40;
          5'd17: norm_by_rem = 7'h44;
          5'd18: norm_by_rem = 7'h48;
          5'd19: norm_by_rem = 7'h4c;
          5'd20: norm_by_rem = 7'h50;
          5'd21: norm_by_rem = 7'h54;
          5'd22: norm_by_rem = 7'h58;
          5'd23: norm_by_rem = 7'h5c;
          5'd24: norm_by_rem = 7'h60;
          5'd25: norm_by_rem = 7'h64;
          5'd26: norm_by_rem = 7'h68;
          5'd27: norm_by_rem = 7'h6c;
          5'd28: norm_by_rem = 7'h70;
          5'd29: norm_by_rem = 7'h74;
          5'd30: norm_by_rem = 7'h78;
          5'd31: norm_by_rem = 7'h7c;
            default: norm_by_rem = 7'h00;
          endcase
        end
        3'd5: begin
          case (eff)
          5'd1: norm_by_rem = 7'h05;
          5'd2: norm_by_rem = 7'h09;
          5'd3: norm_by_rem = 7'h0d;
          5'd4: norm_by_rem = 7'h11;
          5'd5: norm_by_rem = 7'h15;
          5'd6: norm_by_rem = 7'h19;
          5'd7: norm_by_rem = 7'h1d;
          5'd8: norm_by_rem = 7'h21;
          5'd9: norm_by_rem = 7'h25;
          5'd10: norm_by_rem = 7'h29;
          5'd11: norm_by_rem = 7'h2d;
          5'd12: norm_by_rem = 7'h31;
          5'd13: norm_by_rem = 7'h35;
          5'd14: norm_by_rem = 7'h39;
          5'd15: norm_by_rem = 7'h3d;
          5'd16: norm_by_rem = 7'h41;
          5'd17: norm_by_rem = 7'h45;
          5'd18: norm_by_rem = 7'h49;
          5'd19: norm_by_rem = 7'h4d;
          5'd20: norm_by_rem = 7'h51;
          5'd21: norm_by_rem = 7'h55;
          5'd22: norm_by_rem = 7'h59;
          5'd23: norm_by_rem = 7'h5d;
          5'd24: norm_by_rem = 7'h61;
          5'd25: norm_by_rem = 7'h65;
          5'd26: norm_by_rem = 7'h69;
          5'd27: norm_by_rem = 7'h6d;
          5'd28: norm_by_rem = 7'h71;
          5'd29: norm_by_rem = 7'h75;
          5'd30: norm_by_rem = 7'h79;
          5'd31: norm_by_rem = 7'h7d;
            default: norm_by_rem = 7'h00;
          endcase
        end
        3'd6: begin
          case (eff)
          5'd1: norm_by_rem = 7'h06;
          5'd2: norm_by_rem = 7'h0a;
          5'd3: norm_by_rem = 7'h0e;
          5'd4: norm_by_rem = 7'h12;
          5'd5: norm_by_rem = 7'h16;
          5'd6: norm_by_rem = 7'h1a;
          5'd7: norm_by_rem = 7'h1e;
          5'd8: norm_by_rem = 7'h22;
          5'd9: norm_by_rem = 7'h26;
          5'd10: norm_by_rem = 7'h2a;
          5'd11: norm_by_rem = 7'h2e;
          5'd12: norm_by_rem = 7'h32;
          5'd13: norm_by_rem = 7'h36;
          5'd14: norm_by_rem = 7'h3a;
          5'd15: norm_by_rem = 7'h3e;
          5'd16: norm_by_rem = 7'h42;
          5'd17: norm_by_rem = 7'h46;
          5'd18: norm_by_rem = 7'h4a;
          5'd19: norm_by_rem = 7'h4e;
          5'd20: norm_by_rem = 7'h52;
          5'd21: norm_by_rem = 7'h56;
          5'd22: norm_by_rem = 7'h5a;
          5'd23: norm_by_rem = 7'h5e;
          5'd24: norm_by_rem = 7'h62;
          5'd25: norm_by_rem = 7'h66;
          5'd26: norm_by_rem = 7'h6a;
          5'd27: norm_by_rem = 7'h6e;
          5'd28: norm_by_rem = 7'h72;
          5'd29: norm_by_rem = 7'h76;
          5'd30: norm_by_rem = 7'h7a;
          5'd31: norm_by_rem = 7'h7e;
            default: norm_by_rem = 7'h00;
          endcase
        end
        3'd7: begin
          case (eff)
          5'd1: norm_by_rem = 7'h07;
          5'd2: norm_by_rem = 7'h0b;
          5'd3: norm_by_rem = 7'h0f;
          5'd4: norm_by_rem = 7'h13;
          5'd5: norm_by_rem = 7'h17;
          5'd6: norm_by_rem = 7'h1b;
          5'd7: norm_by_rem = 7'h1f;
          5'd8: norm_by_rem = 7'h23;
          5'd9: norm_by_rem = 7'h27;
          5'd10: norm_by_rem = 7'h2b;
          5'd11: norm_by_rem = 7'h2f;
          5'd12: norm_by_rem = 7'h33;
          5'd13: norm_by_rem = 7'h37;
          5'd14: norm_by_rem = 7'h3b;
          5'd15: norm_by_rem = 7'h3f;
          5'd16: norm_by_rem = 7'h43;
          5'd17: norm_by_rem = 7'h47;
          5'd18: norm_by_rem = 7'h4b;
          5'd19: norm_by_rem = 7'h4f;
          5'd20: norm_by_rem = 7'h53;
          5'd21: norm_by_rem = 7'h57;
          5'd22: norm_by_rem = 7'h5b;
          5'd23: norm_by_rem = 7'h5f;
          5'd24: norm_by_rem = 7'h63;
          5'd25: norm_by_rem = 7'h67;
          5'd26: norm_by_rem = 7'h6b;
          5'd27: norm_by_rem = 7'h6f;
          5'd28: norm_by_rem = 7'h73;
          5'd29: norm_by_rem = 7'h77;
          5'd30: norm_by_rem = 7'h7b;
          5'd31: norm_by_rem = 7'h7e;
            default: norm_by_rem = 7'h00;
          endcase
        end
        default: norm_by_rem = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(num);
  wire [2:0] sig_d = sig3(den);
  wire [5:0] eff_n = eff_exp(num);
  wire [5:0] eff_d = eff_exp(den);
  wire signed [6:0] delta = $signed({1'b0, eff_n}) - $signed({1'b0, eff_d});
  wire [4:0] d = delta[4:0];
  wire [2:0] rem_d2 = (d == 5'd0) ? {2'd0, sig_n[0]} : 3'd0;
  wire [2:0] rem_d4 = (d == 5'd0) ? {1'd0, sig_n[1:0]} : ((d == 5'd1) ? {1'd0, sig_n[0], 1'b0} : 3'd0);
  wire [2:0] rem3 = rem_d3({d[0], sig_n});
  wire [2:0] rem5 = rem_d5({d[1:0], sig_n});
  wire [1:0] d6_mod = (d == 5'd0) ? 2'd0 : (d[0] ? 2'd1 : 2'd2);
  wire [2:0] rem6 = rem_d6({d6_mod, sig_n});
  wire [2:0] rem7 = rem_d7({delta_mod3(d), sig_n});
  reg [2:0] rem_sig;
  always @* begin
    case (sig_d)
      3'd0: rem_sig = 3'd0;
      3'd1: rem_sig = 3'd0;
      3'd2: rem_sig = rem_d2;
      3'd3: rem_sig = rem3;
      3'd4: rem_sig = rem_d4;
      3'd5: rem_sig = rem5;
      3'd6: rem_sig = rem6;
      default: rem_sig = rem7;
    endcase
  end
  wire [6:0] table_mag = norm_by_rem(rem_sig, eff_d[4:0]);
  wire [6:0] out_mag = (delta < 0) ? num : table_mag;
  assign out = (nan || den_zero) ? 8'h7f : {num_sign, out_mag};
endmodule
