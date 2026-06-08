module ex248_semantic_fmod_periodic_rem(in, out);
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

  function [6:0] norm_table;
    input [7:0] key;
    begin
      case (key)
        8'h09: norm_table = 7'h01;
        8'h0a: norm_table = 7'h02;
        8'h0b: norm_table = 7'h03;
        8'h0c: norm_table = 7'h04;
        8'h0d: norm_table = 7'h05;
        8'h0e: norm_table = 7'h06;
        8'h0f: norm_table = 7'h07;
        8'h11: norm_table = 7'h02;
        8'h12: norm_table = 7'h04;
        8'h13: norm_table = 7'h06;
        8'h14: norm_table = 7'h08;
        8'h15: norm_table = 7'h09;
        8'h16: norm_table = 7'h0a;
        8'h17: norm_table = 7'h0b;
        8'h19: norm_table = 7'h04;
        8'h1a: norm_table = 7'h08;
        8'h1b: norm_table = 7'h0a;
        8'h1c: norm_table = 7'h0c;
        8'h1d: norm_table = 7'h0d;
        8'h1e: norm_table = 7'h0e;
        8'h1f: norm_table = 7'h0f;
        8'h21: norm_table = 7'h08;
        8'h22: norm_table = 7'h0c;
        8'h23: norm_table = 7'h0e;
        8'h24: norm_table = 7'h10;
        8'h25: norm_table = 7'h11;
        8'h26: norm_table = 7'h12;
        8'h27: norm_table = 7'h13;
        8'h29: norm_table = 7'h0c;
        8'h2a: norm_table = 7'h10;
        8'h2b: norm_table = 7'h12;
        8'h2c: norm_table = 7'h14;
        8'h2d: norm_table = 7'h15;
        8'h2e: norm_table = 7'h16;
        8'h2f: norm_table = 7'h17;
        8'h31: norm_table = 7'h10;
        8'h32: norm_table = 7'h14;
        8'h33: norm_table = 7'h16;
        8'h34: norm_table = 7'h18;
        8'h35: norm_table = 7'h19;
        8'h36: norm_table = 7'h1a;
        8'h37: norm_table = 7'h1b;
        8'h39: norm_table = 7'h14;
        8'h3a: norm_table = 7'h18;
        8'h3b: norm_table = 7'h1a;
        8'h3c: norm_table = 7'h1c;
        8'h3d: norm_table = 7'h1d;
        8'h3e: norm_table = 7'h1e;
        8'h3f: norm_table = 7'h1f;
        8'h41: norm_table = 7'h18;
        8'h42: norm_table = 7'h1c;
        8'h43: norm_table = 7'h1e;
        8'h44: norm_table = 7'h20;
        8'h45: norm_table = 7'h21;
        8'h46: norm_table = 7'h22;
        8'h47: norm_table = 7'h23;
        8'h49: norm_table = 7'h1c;
        8'h4a: norm_table = 7'h20;
        8'h4b: norm_table = 7'h22;
        8'h4c: norm_table = 7'h24;
        8'h4d: norm_table = 7'h25;
        8'h4e: norm_table = 7'h26;
        8'h4f: norm_table = 7'h27;
        8'h51: norm_table = 7'h20;
        8'h52: norm_table = 7'h24;
        8'h53: norm_table = 7'h26;
        8'h54: norm_table = 7'h28;
        8'h55: norm_table = 7'h29;
        8'h56: norm_table = 7'h2a;
        8'h57: norm_table = 7'h2b;
        8'h59: norm_table = 7'h24;
        8'h5a: norm_table = 7'h28;
        8'h5b: norm_table = 7'h2a;
        8'h5c: norm_table = 7'h2c;
        8'h5d: norm_table = 7'h2d;
        8'h5e: norm_table = 7'h2e;
        8'h5f: norm_table = 7'h2f;
        8'h61: norm_table = 7'h28;
        8'h62: norm_table = 7'h2c;
        8'h63: norm_table = 7'h2e;
        8'h64: norm_table = 7'h30;
        8'h65: norm_table = 7'h31;
        8'h66: norm_table = 7'h32;
        8'h67: norm_table = 7'h33;
        8'h69: norm_table = 7'h2c;
        8'h6a: norm_table = 7'h30;
        8'h6b: norm_table = 7'h32;
        8'h6c: norm_table = 7'h34;
        8'h6d: norm_table = 7'h35;
        8'h6e: norm_table = 7'h36;
        8'h6f: norm_table = 7'h37;
        8'h71: norm_table = 7'h30;
        8'h72: norm_table = 7'h34;
        8'h73: norm_table = 7'h36;
        8'h74: norm_table = 7'h38;
        8'h75: norm_table = 7'h39;
        8'h76: norm_table = 7'h3a;
        8'h77: norm_table = 7'h3b;
        8'h79: norm_table = 7'h34;
        8'h7a: norm_table = 7'h38;
        8'h7b: norm_table = 7'h3a;
        8'h7c: norm_table = 7'h3c;
        8'h7d: norm_table = 7'h3d;
        8'h7e: norm_table = 7'h3e;
        8'h7f: norm_table = 7'h3f;
        8'h81: norm_table = 7'h38;
        8'h82: norm_table = 7'h3c;
        8'h83: norm_table = 7'h3e;
        8'h84: norm_table = 7'h40;
        8'h85: norm_table = 7'h41;
        8'h86: norm_table = 7'h42;
        8'h87: norm_table = 7'h43;
        8'h89: norm_table = 7'h3c;
        8'h8a: norm_table = 7'h40;
        8'h8b: norm_table = 7'h42;
        8'h8c: norm_table = 7'h44;
        8'h8d: norm_table = 7'h45;
        8'h8e: norm_table = 7'h46;
        8'h8f: norm_table = 7'h47;
        8'h91: norm_table = 7'h40;
        8'h92: norm_table = 7'h44;
        8'h93: norm_table = 7'h46;
        8'h94: norm_table = 7'h48;
        8'h95: norm_table = 7'h49;
        8'h96: norm_table = 7'h4a;
        8'h97: norm_table = 7'h4b;
        8'h99: norm_table = 7'h44;
        8'h9a: norm_table = 7'h48;
        8'h9b: norm_table = 7'h4a;
        8'h9c: norm_table = 7'h4c;
        8'h9d: norm_table = 7'h4d;
        8'h9e: norm_table = 7'h4e;
        8'h9f: norm_table = 7'h4f;
        8'ha1: norm_table = 7'h48;
        8'ha2: norm_table = 7'h4c;
        8'ha3: norm_table = 7'h4e;
        8'ha4: norm_table = 7'h50;
        8'ha5: norm_table = 7'h51;
        8'ha6: norm_table = 7'h52;
        8'ha7: norm_table = 7'h53;
        8'ha9: norm_table = 7'h4c;
        8'haa: norm_table = 7'h50;
        8'hab: norm_table = 7'h52;
        8'hac: norm_table = 7'h54;
        8'had: norm_table = 7'h55;
        8'hae: norm_table = 7'h56;
        8'haf: norm_table = 7'h57;
        8'hb1: norm_table = 7'h50;
        8'hb2: norm_table = 7'h54;
        8'hb3: norm_table = 7'h56;
        8'hb4: norm_table = 7'h58;
        8'hb5: norm_table = 7'h59;
        8'hb6: norm_table = 7'h5a;
        8'hb7: norm_table = 7'h5b;
        8'hb9: norm_table = 7'h54;
        8'hba: norm_table = 7'h58;
        8'hbb: norm_table = 7'h5a;
        8'hbc: norm_table = 7'h5c;
        8'hbd: norm_table = 7'h5d;
        8'hbe: norm_table = 7'h5e;
        8'hbf: norm_table = 7'h5f;
        8'hc1: norm_table = 7'h58;
        8'hc2: norm_table = 7'h5c;
        8'hc3: norm_table = 7'h5e;
        8'hc4: norm_table = 7'h60;
        8'hc5: norm_table = 7'h61;
        8'hc6: norm_table = 7'h62;
        8'hc7: norm_table = 7'h63;
        8'hc9: norm_table = 7'h5c;
        8'hca: norm_table = 7'h60;
        8'hcb: norm_table = 7'h62;
        8'hcc: norm_table = 7'h64;
        8'hcd: norm_table = 7'h65;
        8'hce: norm_table = 7'h66;
        8'hcf: norm_table = 7'h67;
        8'hd1: norm_table = 7'h60;
        8'hd2: norm_table = 7'h64;
        8'hd3: norm_table = 7'h66;
        8'hd4: norm_table = 7'h68;
        8'hd5: norm_table = 7'h69;
        8'hd6: norm_table = 7'h6a;
        8'hd7: norm_table = 7'h6b;
        8'hd9: norm_table = 7'h64;
        8'hda: norm_table = 7'h68;
        8'hdb: norm_table = 7'h6a;
        8'hdc: norm_table = 7'h6c;
        8'hdd: norm_table = 7'h6d;
        8'hde: norm_table = 7'h6e;
        8'hdf: norm_table = 7'h6f;
        8'he1: norm_table = 7'h68;
        8'he2: norm_table = 7'h6c;
        8'he3: norm_table = 7'h6e;
        8'he4: norm_table = 7'h70;
        8'he5: norm_table = 7'h71;
        8'he6: norm_table = 7'h72;
        8'he7: norm_table = 7'h73;
        8'he9: norm_table = 7'h6c;
        8'hea: norm_table = 7'h70;
        8'heb: norm_table = 7'h72;
        8'hec: norm_table = 7'h74;
        8'hed: norm_table = 7'h75;
        8'hee: norm_table = 7'h76;
        8'hef: norm_table = 7'h77;
        8'hf1: norm_table = 7'h70;
        8'hf2: norm_table = 7'h74;
        8'hf3: norm_table = 7'h76;
        8'hf4: norm_table = 7'h78;
        8'hf5: norm_table = 7'h79;
        8'hf6: norm_table = 7'h7a;
        8'hf7: norm_table = 7'h7b;
        8'hf9: norm_table = 7'h74;
        8'hfa: norm_table = 7'h78;
        8'hfb: norm_table = 7'h7a;
        8'hfc: norm_table = 7'h7c;
        8'hfd: norm_table = 7'h7d;
        8'hfe: norm_table = 7'h7e;
        8'hff: norm_table = 7'h7e;
        default: norm_table = 7'h00;
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
  wire [6:0] table_mag = norm_table({eff_d[4:0], rem_sig});
  wire [6:0] out_mag = (delta < 0) ? num : table_mag;
  assign out = (nan || den_zero) ? 8'h7f : {num_sign, out_mag};
endmodule
