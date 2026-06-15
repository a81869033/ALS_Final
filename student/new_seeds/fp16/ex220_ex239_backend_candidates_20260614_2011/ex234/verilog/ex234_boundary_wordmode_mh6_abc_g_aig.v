module ex234_boundary_wordmode_mh6(in, out);
  input [15:0] in;
  output [15:0] out;
  wire [4:0] exp = in[14:10];
  wire [9:0] mant = in[9:0];
  wire active_core = (exp >= 5'd8) && (exp <= 5'd21);
  wire boundary = (exp == 5'd7) || (exp == 5'd22);
  wire mant_nonzero = |mant;
  wire mant_hi = mant >= 10'd425;
  wire [6:0] out_exp_wide = 7'd45 - ({2'b00, exp} << 1) - {6'b000000, mant_nonzero} - {6'b000000, mant_hi};
  wire [4:0] out_exp = out_exp_wide[4:0];
  reg core_mant_b9;
  always @* begin
    if (mant <= 10'h09e) begin
      if (mant <= 10'h000) begin
        core_mant_b9 = 0;
      end else begin
        core_mant_b9 = 1;
      end
    end else begin
      if (mant <= 10'h1a8) begin
        core_mant_b9 = 0;
      end else begin
        if (mant <= 10'h288) begin
          core_mant_b9 = 1;
        end else begin
          core_mant_b9 = 0;
        end
      end
    end
  end
  reg core_mant_b8;
  always @* begin
    if (mant <= 10'h10f) begin
      if (mant <= 10'h046) begin
        if (mant <= 10'h000) begin
          core_mant_b8 = 0;
        end else begin
          core_mant_b8 = 1;
        end
      end else begin
        if (mant <= 10'h09e) begin
          core_mant_b8 = 0;
        end else begin
          core_mant_b8 = 1;
        end
      end
    end else begin
      if (mant <= 10'h20c) begin
        if (mant <= 10'h1a8) begin
          core_mant_b8 = 0;
        end else begin
          core_mant_b8 = 1;
        end
      end else begin
        if (mant <= 10'h288) begin
          core_mant_b8 = 0;
        end else begin
          if (mant <= 10'h328) begin
            core_mant_b8 = 1;
          end else begin
            core_mant_b8 = 0;
          end
        end
      end
    end
  end
  reg [7:0] core_mant_low;
  always @* begin
    case (mant[9:5])
      5'h00: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h00;
          5'h01: core_mant_low = 8'hfc;
          5'h02: core_mant_low = 8'hf8;
          5'h03: core_mant_low = 8'hf4;
          5'h04: core_mant_low = 8'hf0;
          5'h05: core_mant_low = 8'hec;
          5'h06: core_mant_low = 8'he8;
          5'h07: core_mant_low = 8'he4;
          5'h08: core_mant_low = 8'he0;
          5'h09: core_mant_low = 8'hdc;
          5'h0a: core_mant_low = 8'hd9;
          5'h0b: core_mant_low = 8'hd5;
          5'h0c: core_mant_low = 8'hd1;
          5'h0d: core_mant_low = 8'hcd;
          5'h0e: core_mant_low = 8'hc9;
          5'h0f: core_mant_low = 8'hc5;
          5'h10: core_mant_low = 8'hc1;
          5'h11: core_mant_low = 8'hbe;
          5'h12: core_mant_low = 8'hba;
          5'h13: core_mant_low = 8'hb6;
          5'h14: core_mant_low = 8'hb2;
          5'h15: core_mant_low = 8'haf;
          5'h16: core_mant_low = 8'hab;
          5'h17: core_mant_low = 8'ha7;
          5'h18: core_mant_low = 8'ha3;
          5'h19: core_mant_low = 8'ha0;
          5'h1a: core_mant_low = 8'h9c;
          5'h1b: core_mant_low = 8'h98;
          5'h1c: core_mant_low = 8'h94;
          5'h1d: core_mant_low = 8'h91;
          5'h1e: core_mant_low = 8'h8d;
          5'h1f: core_mant_low = 8'h89;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h01: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h86;
          5'h01: core_mant_low = 8'h82;
          5'h02: core_mant_low = 8'h7e;
          5'h03: core_mant_low = 8'h7b;
          5'h04: core_mant_low = 8'h77;
          5'h05: core_mant_low = 8'h74;
          5'h06: core_mant_low = 8'h70;
          5'h07: core_mant_low = 8'h6c;
          5'h08: core_mant_low = 8'h69;
          5'h09: core_mant_low = 8'h65;
          5'h0a: core_mant_low = 8'h62;
          5'h0b: core_mant_low = 8'h5e;
          5'h0c: core_mant_low = 8'h5b;
          5'h0d: core_mant_low = 8'h57;
          5'h0e: core_mant_low = 8'h54;
          5'h0f: core_mant_low = 8'h50;
          5'h10: core_mant_low = 8'h4d;
          5'h11: core_mant_low = 8'h49;
          5'h12: core_mant_low = 8'h46;
          5'h13: core_mant_low = 8'h42;
          5'h14: core_mant_low = 8'h3f;
          5'h15: core_mant_low = 8'h3b;
          5'h16: core_mant_low = 8'h38;
          5'h17: core_mant_low = 8'h35;
          5'h18: core_mant_low = 8'h31;
          5'h19: core_mant_low = 8'h2e;
          5'h1a: core_mant_low = 8'h2a;
          5'h1b: core_mant_low = 8'h27;
          5'h1c: core_mant_low = 8'h24;
          5'h1d: core_mant_low = 8'h20;
          5'h1e: core_mant_low = 8'h1d;
          5'h1f: core_mant_low = 8'h19;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h02: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h16;
          5'h01: core_mant_low = 8'h13;
          5'h02: core_mant_low = 8'h0f;
          5'h03: core_mant_low = 8'h0c;
          5'h04: core_mant_low = 8'h09;
          5'h05: core_mant_low = 8'h06;
          5'h06: core_mant_low = 8'h02;
          5'h07: core_mant_low = 8'hff;
          5'h08: core_mant_low = 8'hfc;
          5'h09: core_mant_low = 8'hf9;
          5'h0a: core_mant_low = 8'hf5;
          5'h0b: core_mant_low = 8'hf2;
          5'h0c: core_mant_low = 8'hef;
          5'h0d: core_mant_low = 8'hec;
          5'h0e: core_mant_low = 8'he8;
          5'h0f: core_mant_low = 8'he5;
          5'h10: core_mant_low = 8'he2;
          5'h11: core_mant_low = 8'hdf;
          5'h12: core_mant_low = 8'hdc;
          5'h13: core_mant_low = 8'hd8;
          5'h14: core_mant_low = 8'hd5;
          5'h15: core_mant_low = 8'hd2;
          5'h16: core_mant_low = 8'hcf;
          5'h17: core_mant_low = 8'hcc;
          5'h18: core_mant_low = 8'hc9;
          5'h19: core_mant_low = 8'hc6;
          5'h1a: core_mant_low = 8'hc2;
          5'h1b: core_mant_low = 8'hbf;
          5'h1c: core_mant_low = 8'hbc;
          5'h1d: core_mant_low = 8'hb9;
          5'h1e: core_mant_low = 8'hb6;
          5'h1f: core_mant_low = 8'hb3;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h03: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'hb0;
          5'h01: core_mant_low = 8'had;
          5'h02: core_mant_low = 8'haa;
          5'h03: core_mant_low = 8'ha7;
          5'h04: core_mant_low = 8'ha4;
          5'h05: core_mant_low = 8'ha1;
          5'h06: core_mant_low = 8'h9e;
          5'h07: core_mant_low = 8'h9b;
          5'h08: core_mant_low = 8'h98;
          5'h09: core_mant_low = 8'h95;
          5'h0a: core_mant_low = 8'h92;
          5'h0b: core_mant_low = 8'h8f;
          5'h0c: core_mant_low = 8'h8c;
          5'h0d: core_mant_low = 8'h89;
          5'h0e: core_mant_low = 8'h86;
          5'h0f: core_mant_low = 8'h83;
          5'h10: core_mant_low = 8'h80;
          5'h11: core_mant_low = 8'h7d;
          5'h12: core_mant_low = 8'h7a;
          5'h13: core_mant_low = 8'h77;
          5'h14: core_mant_low = 8'h74;
          5'h15: core_mant_low = 8'h72;
          5'h16: core_mant_low = 8'h6f;
          5'h17: core_mant_low = 8'h6c;
          5'h18: core_mant_low = 8'h69;
          5'h19: core_mant_low = 8'h66;
          5'h1a: core_mant_low = 8'h63;
          5'h1b: core_mant_low = 8'h60;
          5'h1c: core_mant_low = 8'h5d;
          5'h1d: core_mant_low = 8'h5b;
          5'h1e: core_mant_low = 8'h58;
          5'h1f: core_mant_low = 8'h55;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h04: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h52;
          5'h01: core_mant_low = 8'h4f;
          5'h02: core_mant_low = 8'h4d;
          5'h03: core_mant_low = 8'h4a;
          5'h04: core_mant_low = 8'h47;
          5'h05: core_mant_low = 8'h44;
          5'h06: core_mant_low = 8'h41;
          5'h07: core_mant_low = 8'h3f;
          5'h08: core_mant_low = 8'h3c;
          5'h09: core_mant_low = 8'h39;
          5'h0a: core_mant_low = 8'h36;
          5'h0b: core_mant_low = 8'h34;
          5'h0c: core_mant_low = 8'h31;
          5'h0d: core_mant_low = 8'h2e;
          5'h0e: core_mant_low = 8'h2c;
          5'h0f: core_mant_low = 8'h29;
          5'h10: core_mant_low = 8'h26;
          5'h11: core_mant_low = 8'h23;
          5'h12: core_mant_low = 8'h21;
          5'h13: core_mant_low = 8'h1e;
          5'h14: core_mant_low = 8'h1b;
          5'h15: core_mant_low = 8'h19;
          5'h16: core_mant_low = 8'h16;
          5'h17: core_mant_low = 8'h13;
          5'h18: core_mant_low = 8'h11;
          5'h19: core_mant_low = 8'h0e;
          5'h1a: core_mant_low = 8'h0c;
          5'h1b: core_mant_low = 8'h09;
          5'h1c: core_mant_low = 8'h06;
          5'h1d: core_mant_low = 8'h04;
          5'h1e: core_mant_low = 8'h01;
          5'h1f: core_mant_low = 8'hfe;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h05: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'hfc;
          5'h01: core_mant_low = 8'hf9;
          5'h02: core_mant_low = 8'hf7;
          5'h03: core_mant_low = 8'hf4;
          5'h04: core_mant_low = 8'hf2;
          5'h05: core_mant_low = 8'hef;
          5'h06: core_mant_low = 8'hec;
          5'h07: core_mant_low = 8'hea;
          5'h08: core_mant_low = 8'he7;
          5'h09: core_mant_low = 8'he5;
          5'h0a: core_mant_low = 8'he2;
          5'h0b: core_mant_low = 8'he0;
          5'h0c: core_mant_low = 8'hdd;
          5'h0d: core_mant_low = 8'hdb;
          5'h0e: core_mant_low = 8'hd8;
          5'h0f: core_mant_low = 8'hd6;
          5'h10: core_mant_low = 8'hd3;
          5'h11: core_mant_low = 8'hd1;
          5'h12: core_mant_low = 8'hce;
          5'h13: core_mant_low = 8'hcc;
          5'h14: core_mant_low = 8'hc9;
          5'h15: core_mant_low = 8'hc7;
          5'h16: core_mant_low = 8'hc5;
          5'h17: core_mant_low = 8'hc2;
          5'h18: core_mant_low = 8'hc0;
          5'h19: core_mant_low = 8'hbd;
          5'h1a: core_mant_low = 8'hbb;
          5'h1b: core_mant_low = 8'hb8;
          5'h1c: core_mant_low = 8'hb6;
          5'h1d: core_mant_low = 8'hb4;
          5'h1e: core_mant_low = 8'hb1;
          5'h1f: core_mant_low = 8'haf;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h06: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'hac;
          5'h01: core_mant_low = 8'haa;
          5'h02: core_mant_low = 8'ha8;
          5'h03: core_mant_low = 8'ha5;
          5'h04: core_mant_low = 8'ha3;
          5'h05: core_mant_low = 8'ha0;
          5'h06: core_mant_low = 8'h9e;
          5'h07: core_mant_low = 8'h9c;
          5'h08: core_mant_low = 8'h99;
          5'h09: core_mant_low = 8'h97;
          5'h0a: core_mant_low = 8'h95;
          5'h0b: core_mant_low = 8'h92;
          5'h0c: core_mant_low = 8'h90;
          5'h0d: core_mant_low = 8'h8e;
          5'h0e: core_mant_low = 8'h8b;
          5'h0f: core_mant_low = 8'h89;
          5'h10: core_mant_low = 8'h87;
          5'h11: core_mant_low = 8'h85;
          5'h12: core_mant_low = 8'h82;
          5'h13: core_mant_low = 8'h80;
          5'h14: core_mant_low = 8'h7e;
          5'h15: core_mant_low = 8'h7b;
          5'h16: core_mant_low = 8'h79;
          5'h17: core_mant_low = 8'h77;
          5'h18: core_mant_low = 8'h75;
          5'h19: core_mant_low = 8'h72;
          5'h1a: core_mant_low = 8'h70;
          5'h1b: core_mant_low = 8'h6e;
          5'h1c: core_mant_low = 8'h6c;
          5'h1d: core_mant_low = 8'h69;
          5'h1e: core_mant_low = 8'h67;
          5'h1f: core_mant_low = 8'h65;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h07: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h63;
          5'h01: core_mant_low = 8'h61;
          5'h02: core_mant_low = 8'h5e;
          5'h03: core_mant_low = 8'h5c;
          5'h04: core_mant_low = 8'h5a;
          5'h05: core_mant_low = 8'h58;
          5'h06: core_mant_low = 8'h56;
          5'h07: core_mant_low = 8'h53;
          5'h08: core_mant_low = 8'h51;
          5'h09: core_mant_low = 8'h4f;
          5'h0a: core_mant_low = 8'h4d;
          5'h0b: core_mant_low = 8'h4b;
          5'h0c: core_mant_low = 8'h49;
          5'h0d: core_mant_low = 8'h47;
          5'h0e: core_mant_low = 8'h44;
          5'h0f: core_mant_low = 8'h42;
          5'h10: core_mant_low = 8'h40;
          5'h11: core_mant_low = 8'h3e;
          5'h12: core_mant_low = 8'h3c;
          5'h13: core_mant_low = 8'h3a;
          5'h14: core_mant_low = 8'h38;
          5'h15: core_mant_low = 8'h36;
          5'h16: core_mant_low = 8'h33;
          5'h17: core_mant_low = 8'h31;
          5'h18: core_mant_low = 8'h2f;
          5'h19: core_mant_low = 8'h2d;
          5'h1a: core_mant_low = 8'h2b;
          5'h1b: core_mant_low = 8'h29;
          5'h1c: core_mant_low = 8'h27;
          5'h1d: core_mant_low = 8'h25;
          5'h1e: core_mant_low = 8'h23;
          5'h1f: core_mant_low = 8'h21;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h08: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h1f;
          5'h01: core_mant_low = 8'h1d;
          5'h02: core_mant_low = 8'h1b;
          5'h03: core_mant_low = 8'h19;
          5'h04: core_mant_low = 8'h17;
          5'h05: core_mant_low = 8'h15;
          5'h06: core_mant_low = 8'h13;
          5'h07: core_mant_low = 8'h11;
          5'h08: core_mant_low = 8'h0e;
          5'h09: core_mant_low = 8'h0c;
          5'h0a: core_mant_low = 8'h0a;
          5'h0b: core_mant_low = 8'h08;
          5'h0c: core_mant_low = 8'h06;
          5'h0d: core_mant_low = 8'h04;
          5'h0e: core_mant_low = 8'h03;
          5'h0f: core_mant_low = 8'h01;
          5'h10: core_mant_low = 8'hff;
          5'h11: core_mant_low = 8'hfd;
          5'h12: core_mant_low = 8'hfb;
          5'h13: core_mant_low = 8'hf9;
          5'h14: core_mant_low = 8'hf7;
          5'h15: core_mant_low = 8'hf5;
          5'h16: core_mant_low = 8'hf3;
          5'h17: core_mant_low = 8'hf1;
          5'h18: core_mant_low = 8'hef;
          5'h19: core_mant_low = 8'hed;
          5'h1a: core_mant_low = 8'heb;
          5'h1b: core_mant_low = 8'he9;
          5'h1c: core_mant_low = 8'he7;
          5'h1d: core_mant_low = 8'he5;
          5'h1e: core_mant_low = 8'he3;
          5'h1f: core_mant_low = 8'he1;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h09: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'he0;
          5'h01: core_mant_low = 8'hde;
          5'h02: core_mant_low = 8'hdc;
          5'h03: core_mant_low = 8'hda;
          5'h04: core_mant_low = 8'hd8;
          5'h05: core_mant_low = 8'hd6;
          5'h06: core_mant_low = 8'hd4;
          5'h07: core_mant_low = 8'hd2;
          5'h08: core_mant_low = 8'hd0;
          5'h09: core_mant_low = 8'hcf;
          5'h0a: core_mant_low = 8'hcd;
          5'h0b: core_mant_low = 8'hcb;
          5'h0c: core_mant_low = 8'hc9;
          5'h0d: core_mant_low = 8'hc7;
          5'h0e: core_mant_low = 8'hc5;
          5'h0f: core_mant_low = 8'hc4;
          5'h10: core_mant_low = 8'hc2;
          5'h11: core_mant_low = 8'hc0;
          5'h12: core_mant_low = 8'hbe;
          5'h13: core_mant_low = 8'hbc;
          5'h14: core_mant_low = 8'hba;
          5'h15: core_mant_low = 8'hb9;
          5'h16: core_mant_low = 8'hb7;
          5'h17: core_mant_low = 8'hb5;
          5'h18: core_mant_low = 8'hb3;
          5'h19: core_mant_low = 8'hb1;
          5'h1a: core_mant_low = 8'hb0;
          5'h1b: core_mant_low = 8'hae;
          5'h1c: core_mant_low = 8'hac;
          5'h1d: core_mant_low = 8'haa;
          5'h1e: core_mant_low = 8'ha8;
          5'h1f: core_mant_low = 8'ha7;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h0a: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'ha5;
          5'h01: core_mant_low = 8'ha3;
          5'h02: core_mant_low = 8'ha1;
          5'h03: core_mant_low = 8'ha0;
          5'h04: core_mant_low = 8'h9e;
          5'h05: core_mant_low = 8'h9c;
          5'h06: core_mant_low = 8'h9a;
          5'h07: core_mant_low = 8'h99;
          5'h08: core_mant_low = 8'h97;
          5'h09: core_mant_low = 8'h95;
          5'h0a: core_mant_low = 8'h93;
          5'h0b: core_mant_low = 8'h92;
          5'h0c: core_mant_low = 8'h90;
          5'h0d: core_mant_low = 8'h8e;
          5'h0e: core_mant_low = 8'h8c;
          5'h0f: core_mant_low = 8'h8b;
          5'h10: core_mant_low = 8'h89;
          5'h11: core_mant_low = 8'h87;
          5'h12: core_mant_low = 8'h86;
          5'h13: core_mant_low = 8'h84;
          5'h14: core_mant_low = 8'h82;
          5'h15: core_mant_low = 8'h81;
          5'h16: core_mant_low = 8'h7f;
          5'h17: core_mant_low = 8'h7d;
          5'h18: core_mant_low = 8'h7c;
          5'h19: core_mant_low = 8'h7a;
          5'h1a: core_mant_low = 8'h78;
          5'h1b: core_mant_low = 8'h76;
          5'h1c: core_mant_low = 8'h75;
          5'h1d: core_mant_low = 8'h73;
          5'h1e: core_mant_low = 8'h72;
          5'h1f: core_mant_low = 8'h70;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h0b: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h6e;
          5'h01: core_mant_low = 8'h6d;
          5'h02: core_mant_low = 8'h6b;
          5'h03: core_mant_low = 8'h69;
          5'h04: core_mant_low = 8'h68;
          5'h05: core_mant_low = 8'h66;
          5'h06: core_mant_low = 8'h64;
          5'h07: core_mant_low = 8'h63;
          5'h08: core_mant_low = 8'h61;
          5'h09: core_mant_low = 8'h60;
          5'h0a: core_mant_low = 8'h5e;
          5'h0b: core_mant_low = 8'h5c;
          5'h0c: core_mant_low = 8'h5b;
          5'h0d: core_mant_low = 8'h59;
          5'h0e: core_mant_low = 8'h57;
          5'h0f: core_mant_low = 8'h56;
          5'h10: core_mant_low = 8'h54;
          5'h11: core_mant_low = 8'h53;
          5'h12: core_mant_low = 8'h51;
          5'h13: core_mant_low = 8'h50;
          5'h14: core_mant_low = 8'h4e;
          5'h15: core_mant_low = 8'h4c;
          5'h16: core_mant_low = 8'h4b;
          5'h17: core_mant_low = 8'h49;
          5'h18: core_mant_low = 8'h48;
          5'h19: core_mant_low = 8'h46;
          5'h1a: core_mant_low = 8'h45;
          5'h1b: core_mant_low = 8'h43;
          5'h1c: core_mant_low = 8'h41;
          5'h1d: core_mant_low = 8'h40;
          5'h1e: core_mant_low = 8'h3e;
          5'h1f: core_mant_low = 8'h3d;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h0c: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h3b;
          5'h01: core_mant_low = 8'h3a;
          5'h02: core_mant_low = 8'h38;
          5'h03: core_mant_low = 8'h37;
          5'h04: core_mant_low = 8'h35;
          5'h05: core_mant_low = 8'h34;
          5'h06: core_mant_low = 8'h32;
          5'h07: core_mant_low = 8'h31;
          5'h08: core_mant_low = 8'h2f;
          5'h09: core_mant_low = 8'h2e;
          5'h0a: core_mant_low = 8'h2c;
          5'h0b: core_mant_low = 8'h2b;
          5'h0c: core_mant_low = 8'h29;
          5'h0d: core_mant_low = 8'h28;
          5'h0e: core_mant_low = 8'h26;
          5'h0f: core_mant_low = 8'h25;
          5'h10: core_mant_low = 8'h23;
          5'h11: core_mant_low = 8'h22;
          5'h12: core_mant_low = 8'h20;
          5'h13: core_mant_low = 8'h1f;
          5'h14: core_mant_low = 8'h1d;
          5'h15: core_mant_low = 8'h1c;
          5'h16: core_mant_low = 8'h1a;
          5'h17: core_mant_low = 8'h19;
          5'h18: core_mant_low = 8'h17;
          5'h19: core_mant_low = 8'h16;
          5'h1a: core_mant_low = 8'h14;
          5'h1b: core_mant_low = 8'h13;
          5'h1c: core_mant_low = 8'h11;
          5'h1d: core_mant_low = 8'h10;
          5'h1e: core_mant_low = 8'h0f;
          5'h1f: core_mant_low = 8'h0d;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h0d: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h0c;
          5'h01: core_mant_low = 8'h0a;
          5'h02: core_mant_low = 8'h09;
          5'h03: core_mant_low = 8'h07;
          5'h04: core_mant_low = 8'h06;
          5'h05: core_mant_low = 8'h04;
          5'h06: core_mant_low = 8'h03;
          5'h07: core_mant_low = 8'h02;
          5'h08: core_mant_low = 8'h00;
          5'h09: core_mant_low = 8'hfe;
          5'h0a: core_mant_low = 8'hfb;
          5'h0b: core_mant_low = 8'hf8;
          5'h0c: core_mant_low = 8'hf5;
          5'h0d: core_mant_low = 8'hf2;
          5'h0e: core_mant_low = 8'hf0;
          5'h0f: core_mant_low = 8'hed;
          5'h10: core_mant_low = 8'hea;
          5'h11: core_mant_low = 8'he7;
          5'h12: core_mant_low = 8'he4;
          5'h13: core_mant_low = 8'he2;
          5'h14: core_mant_low = 8'hdf;
          5'h15: core_mant_low = 8'hdc;
          5'h16: core_mant_low = 8'hd9;
          5'h17: core_mant_low = 8'hd7;
          5'h18: core_mant_low = 8'hd4;
          5'h19: core_mant_low = 8'hd1;
          5'h1a: core_mant_low = 8'hce;
          5'h1b: core_mant_low = 8'hcc;
          5'h1c: core_mant_low = 8'hc9;
          5'h1d: core_mant_low = 8'hc6;
          5'h1e: core_mant_low = 8'hc4;
          5'h1f: core_mant_low = 8'hc1;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h0e: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'hbe;
          5'h01: core_mant_low = 8'hbb;
          5'h02: core_mant_low = 8'hb9;
          5'h03: core_mant_low = 8'hb6;
          5'h04: core_mant_low = 8'hb3;
          5'h05: core_mant_low = 8'hb1;
          5'h06: core_mant_low = 8'hae;
          5'h07: core_mant_low = 8'hab;
          5'h08: core_mant_low = 8'ha9;
          5'h09: core_mant_low = 8'ha6;
          5'h0a: core_mant_low = 8'ha4;
          5'h0b: core_mant_low = 8'ha1;
          5'h0c: core_mant_low = 8'h9e;
          5'h0d: core_mant_low = 8'h9c;
          5'h0e: core_mant_low = 8'h99;
          5'h0f: core_mant_low = 8'h96;
          5'h10: core_mant_low = 8'h94;
          5'h11: core_mant_low = 8'h91;
          5'h12: core_mant_low = 8'h8f;
          5'h13: core_mant_low = 8'h8c;
          5'h14: core_mant_low = 8'h89;
          5'h15: core_mant_low = 8'h87;
          5'h16: core_mant_low = 8'h84;
          5'h17: core_mant_low = 8'h82;
          5'h18: core_mant_low = 8'h7f;
          5'h19: core_mant_low = 8'h7d;
          5'h1a: core_mant_low = 8'h7a;
          5'h1b: core_mant_low = 8'h77;
          5'h1c: core_mant_low = 8'h75;
          5'h1d: core_mant_low = 8'h72;
          5'h1e: core_mant_low = 8'h70;
          5'h1f: core_mant_low = 8'h6d;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h0f: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h6b;
          5'h01: core_mant_low = 8'h68;
          5'h02: core_mant_low = 8'h66;
          5'h03: core_mant_low = 8'h63;
          5'h04: core_mant_low = 8'h61;
          5'h05: core_mant_low = 8'h5e;
          5'h06: core_mant_low = 8'h5c;
          5'h07: core_mant_low = 8'h59;
          5'h08: core_mant_low = 8'h57;
          5'h09: core_mant_low = 8'h54;
          5'h0a: core_mant_low = 8'h52;
          5'h0b: core_mant_low = 8'h4f;
          5'h0c: core_mant_low = 8'h4d;
          5'h0d: core_mant_low = 8'h4a;
          5'h0e: core_mant_low = 8'h48;
          5'h0f: core_mant_low = 8'h45;
          5'h10: core_mant_low = 8'h43;
          5'h11: core_mant_low = 8'h41;
          5'h12: core_mant_low = 8'h3e;
          5'h13: core_mant_low = 8'h3c;
          5'h14: core_mant_low = 8'h39;
          5'h15: core_mant_low = 8'h37;
          5'h16: core_mant_low = 8'h34;
          5'h17: core_mant_low = 8'h32;
          5'h18: core_mant_low = 8'h30;
          5'h19: core_mant_low = 8'h2d;
          5'h1a: core_mant_low = 8'h2b;
          5'h1b: core_mant_low = 8'h28;
          5'h1c: core_mant_low = 8'h26;
          5'h1d: core_mant_low = 8'h24;
          5'h1e: core_mant_low = 8'h21;
          5'h1f: core_mant_low = 8'h1f;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h10: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h1c;
          5'h01: core_mant_low = 8'h1a;
          5'h02: core_mant_low = 8'h18;
          5'h03: core_mant_low = 8'h15;
          5'h04: core_mant_low = 8'h13;
          5'h05: core_mant_low = 8'h11;
          5'h06: core_mant_low = 8'h0e;
          5'h07: core_mant_low = 8'h0c;
          5'h08: core_mant_low = 8'h0a;
          5'h09: core_mant_low = 8'h07;
          5'h0a: core_mant_low = 8'h05;
          5'h0b: core_mant_low = 8'h03;
          5'h0c: core_mant_low = 8'h00;
          5'h0d: core_mant_low = 8'hfe;
          5'h0e: core_mant_low = 8'hfc;
          5'h0f: core_mant_low = 8'hf9;
          5'h10: core_mant_low = 8'hf7;
          5'h11: core_mant_low = 8'hf5;
          5'h12: core_mant_low = 8'hf3;
          5'h13: core_mant_low = 8'hf0;
          5'h14: core_mant_low = 8'hee;
          5'h15: core_mant_low = 8'hec;
          5'h16: core_mant_low = 8'he9;
          5'h17: core_mant_low = 8'he7;
          5'h18: core_mant_low = 8'he5;
          5'h19: core_mant_low = 8'he3;
          5'h1a: core_mant_low = 8'he0;
          5'h1b: core_mant_low = 8'hde;
          5'h1c: core_mant_low = 8'hdc;
          5'h1d: core_mant_low = 8'hda;
          5'h1e: core_mant_low = 8'hd7;
          5'h1f: core_mant_low = 8'hd5;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h11: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'hd3;
          5'h01: core_mant_low = 8'hd1;
          5'h02: core_mant_low = 8'hce;
          5'h03: core_mant_low = 8'hcc;
          5'h04: core_mant_low = 8'hca;
          5'h05: core_mant_low = 8'hc8;
          5'h06: core_mant_low = 8'hc6;
          5'h07: core_mant_low = 8'hc3;
          5'h08: core_mant_low = 8'hc1;
          5'h09: core_mant_low = 8'hbf;
          5'h0a: core_mant_low = 8'hbd;
          5'h0b: core_mant_low = 8'hbb;
          5'h0c: core_mant_low = 8'hb8;
          5'h0d: core_mant_low = 8'hb6;
          5'h0e: core_mant_low = 8'hb4;
          5'h0f: core_mant_low = 8'hb2;
          5'h10: core_mant_low = 8'hb0;
          5'h11: core_mant_low = 8'hae;
          5'h12: core_mant_low = 8'hab;
          5'h13: core_mant_low = 8'ha9;
          5'h14: core_mant_low = 8'ha7;
          5'h15: core_mant_low = 8'ha5;
          5'h16: core_mant_low = 8'ha3;
          5'h17: core_mant_low = 8'ha1;
          5'h18: core_mant_low = 8'h9f;
          5'h19: core_mant_low = 8'h9c;
          5'h1a: core_mant_low = 8'h9a;
          5'h1b: core_mant_low = 8'h98;
          5'h1c: core_mant_low = 8'h96;
          5'h1d: core_mant_low = 8'h94;
          5'h1e: core_mant_low = 8'h92;
          5'h1f: core_mant_low = 8'h90;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h12: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h8e;
          5'h01: core_mant_low = 8'h8c;
          5'h02: core_mant_low = 8'h8a;
          5'h03: core_mant_low = 8'h87;
          5'h04: core_mant_low = 8'h85;
          5'h05: core_mant_low = 8'h83;
          5'h06: core_mant_low = 8'h81;
          5'h07: core_mant_low = 8'h7f;
          5'h08: core_mant_low = 8'h7d;
          5'h09: core_mant_low = 8'h7b;
          5'h0a: core_mant_low = 8'h79;
          5'h0b: core_mant_low = 8'h77;
          5'h0c: core_mant_low = 8'h75;
          5'h0d: core_mant_low = 8'h73;
          5'h0e: core_mant_low = 8'h71;
          5'h0f: core_mant_low = 8'h6f;
          5'h10: core_mant_low = 8'h6d;
          5'h11: core_mant_low = 8'h6b;
          5'h12: core_mant_low = 8'h69;
          5'h13: core_mant_low = 8'h67;
          5'h14: core_mant_low = 8'h65;
          5'h15: core_mant_low = 8'h63;
          5'h16: core_mant_low = 8'h61;
          5'h17: core_mant_low = 8'h5f;
          5'h18: core_mant_low = 8'h5d;
          5'h19: core_mant_low = 8'h5a;
          5'h1a: core_mant_low = 8'h58;
          5'h1b: core_mant_low = 8'h57;
          5'h1c: core_mant_low = 8'h55;
          5'h1d: core_mant_low = 8'h53;
          5'h1e: core_mant_low = 8'h51;
          5'h1f: core_mant_low = 8'h4f;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h13: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h4d;
          5'h01: core_mant_low = 8'h4b;
          5'h02: core_mant_low = 8'h49;
          5'h03: core_mant_low = 8'h47;
          5'h04: core_mant_low = 8'h45;
          5'h05: core_mant_low = 8'h43;
          5'h06: core_mant_low = 8'h41;
          5'h07: core_mant_low = 8'h3f;
          5'h08: core_mant_low = 8'h3d;
          5'h09: core_mant_low = 8'h3b;
          5'h0a: core_mant_low = 8'h39;
          5'h0b: core_mant_low = 8'h37;
          5'h0c: core_mant_low = 8'h35;
          5'h0d: core_mant_low = 8'h33;
          5'h0e: core_mant_low = 8'h31;
          5'h0f: core_mant_low = 8'h2f;
          5'h10: core_mant_low = 8'h2d;
          5'h11: core_mant_low = 8'h2b;
          5'h12: core_mant_low = 8'h2a;
          5'h13: core_mant_low = 8'h28;
          5'h14: core_mant_low = 8'h26;
          5'h15: core_mant_low = 8'h24;
          5'h16: core_mant_low = 8'h22;
          5'h17: core_mant_low = 8'h20;
          5'h18: core_mant_low = 8'h1e;
          5'h19: core_mant_low = 8'h1c;
          5'h1a: core_mant_low = 8'h1a;
          5'h1b: core_mant_low = 8'h19;
          5'h1c: core_mant_low = 8'h17;
          5'h1d: core_mant_low = 8'h15;
          5'h1e: core_mant_low = 8'h13;
          5'h1f: core_mant_low = 8'h11;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h14: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h0f;
          5'h01: core_mant_low = 8'h0d;
          5'h02: core_mant_low = 8'h0b;
          5'h03: core_mant_low = 8'h0a;
          5'h04: core_mant_low = 8'h08;
          5'h05: core_mant_low = 8'h06;
          5'h06: core_mant_low = 8'h04;
          5'h07: core_mant_low = 8'h02;
          5'h08: core_mant_low = 8'h00;
          5'h09: core_mant_low = 8'hff;
          5'h0a: core_mant_low = 8'hfd;
          5'h0b: core_mant_low = 8'hfb;
          5'h0c: core_mant_low = 8'hf9;
          5'h0d: core_mant_low = 8'hf7;
          5'h0e: core_mant_low = 8'hf5;
          5'h0f: core_mant_low = 8'hf4;
          5'h10: core_mant_low = 8'hf2;
          5'h11: core_mant_low = 8'hf0;
          5'h12: core_mant_low = 8'hee;
          5'h13: core_mant_low = 8'hec;
          5'h14: core_mant_low = 8'heb;
          5'h15: core_mant_low = 8'he9;
          5'h16: core_mant_low = 8'he7;
          5'h17: core_mant_low = 8'he5;
          5'h18: core_mant_low = 8'he3;
          5'h19: core_mant_low = 8'he2;
          5'h1a: core_mant_low = 8'he0;
          5'h1b: core_mant_low = 8'hde;
          5'h1c: core_mant_low = 8'hdc;
          5'h1d: core_mant_low = 8'hda;
          5'h1e: core_mant_low = 8'hd9;
          5'h1f: core_mant_low = 8'hd7;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h15: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'hd5;
          5'h01: core_mant_low = 8'hd3;
          5'h02: core_mant_low = 8'hd2;
          5'h03: core_mant_low = 8'hd0;
          5'h04: core_mant_low = 8'hce;
          5'h05: core_mant_low = 8'hcc;
          5'h06: core_mant_low = 8'hcb;
          5'h07: core_mant_low = 8'hc9;
          5'h08: core_mant_low = 8'hc7;
          5'h09: core_mant_low = 8'hc5;
          5'h0a: core_mant_low = 8'hc4;
          5'h0b: core_mant_low = 8'hc2;
          5'h0c: core_mant_low = 8'hc0;
          5'h0d: core_mant_low = 8'hbf;
          5'h0e: core_mant_low = 8'hbd;
          5'h0f: core_mant_low = 8'hbb;
          5'h10: core_mant_low = 8'hb9;
          5'h11: core_mant_low = 8'hb8;
          5'h12: core_mant_low = 8'hb6;
          5'h13: core_mant_low = 8'hb4;
          5'h14: core_mant_low = 8'hb3;
          5'h15: core_mant_low = 8'hb1;
          5'h16: core_mant_low = 8'haf;
          5'h17: core_mant_low = 8'had;
          5'h18: core_mant_low = 8'hac;
          5'h19: core_mant_low = 8'haa;
          5'h1a: core_mant_low = 8'ha8;
          5'h1b: core_mant_low = 8'ha7;
          5'h1c: core_mant_low = 8'ha5;
          5'h1d: core_mant_low = 8'ha3;
          5'h1e: core_mant_low = 8'ha2;
          5'h1f: core_mant_low = 8'ha0;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h16: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h9e;
          5'h01: core_mant_low = 8'h9d;
          5'h02: core_mant_low = 8'h9b;
          5'h03: core_mant_low = 8'h99;
          5'h04: core_mant_low = 8'h98;
          5'h05: core_mant_low = 8'h96;
          5'h06: core_mant_low = 8'h94;
          5'h07: core_mant_low = 8'h93;
          5'h08: core_mant_low = 8'h91;
          5'h09: core_mant_low = 8'h90;
          5'h0a: core_mant_low = 8'h8e;
          5'h0b: core_mant_low = 8'h8c;
          5'h0c: core_mant_low = 8'h8b;
          5'h0d: core_mant_low = 8'h89;
          5'h0e: core_mant_low = 8'h87;
          5'h0f: core_mant_low = 8'h86;
          5'h10: core_mant_low = 8'h84;
          5'h11: core_mant_low = 8'h82;
          5'h12: core_mant_low = 8'h81;
          5'h13: core_mant_low = 8'h7f;
          5'h14: core_mant_low = 8'h7e;
          5'h15: core_mant_low = 8'h7c;
          5'h16: core_mant_low = 8'h7a;
          5'h17: core_mant_low = 8'h79;
          5'h18: core_mant_low = 8'h77;
          5'h19: core_mant_low = 8'h76;
          5'h1a: core_mant_low = 8'h74;
          5'h1b: core_mant_low = 8'h72;
          5'h1c: core_mant_low = 8'h71;
          5'h1d: core_mant_low = 8'h6f;
          5'h1e: core_mant_low = 8'h6e;
          5'h1f: core_mant_low = 8'h6c;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h17: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h6b;
          5'h01: core_mant_low = 8'h69;
          5'h02: core_mant_low = 8'h67;
          5'h03: core_mant_low = 8'h66;
          5'h04: core_mant_low = 8'h64;
          5'h05: core_mant_low = 8'h63;
          5'h06: core_mant_low = 8'h61;
          5'h07: core_mant_low = 8'h60;
          5'h08: core_mant_low = 8'h5e;
          5'h09: core_mant_low = 8'h5c;
          5'h0a: core_mant_low = 8'h5b;
          5'h0b: core_mant_low = 8'h59;
          5'h0c: core_mant_low = 8'h58;
          5'h0d: core_mant_low = 8'h56;
          5'h0e: core_mant_low = 8'h55;
          5'h0f: core_mant_low = 8'h53;
          5'h10: core_mant_low = 8'h52;
          5'h11: core_mant_low = 8'h50;
          5'h12: core_mant_low = 8'h4f;
          5'h13: core_mant_low = 8'h4d;
          5'h14: core_mant_low = 8'h4c;
          5'h15: core_mant_low = 8'h4a;
          5'h16: core_mant_low = 8'h49;
          5'h17: core_mant_low = 8'h47;
          5'h18: core_mant_low = 8'h45;
          5'h19: core_mant_low = 8'h44;
          5'h1a: core_mant_low = 8'h42;
          5'h1b: core_mant_low = 8'h41;
          5'h1c: core_mant_low = 8'h3f;
          5'h1d: core_mant_low = 8'h3e;
          5'h1e: core_mant_low = 8'h3c;
          5'h1f: core_mant_low = 8'h3b;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h18: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h39;
          5'h01: core_mant_low = 8'h38;
          5'h02: core_mant_low = 8'h36;
          5'h03: core_mant_low = 8'h35;
          5'h04: core_mant_low = 8'h34;
          5'h05: core_mant_low = 8'h32;
          5'h06: core_mant_low = 8'h31;
          5'h07: core_mant_low = 8'h2f;
          5'h08: core_mant_low = 8'h2e;
          5'h09: core_mant_low = 8'h2c;
          5'h0a: core_mant_low = 8'h2b;
          5'h0b: core_mant_low = 8'h29;
          5'h0c: core_mant_low = 8'h28;
          5'h0d: core_mant_low = 8'h26;
          5'h0e: core_mant_low = 8'h25;
          5'h0f: core_mant_low = 8'h23;
          5'h10: core_mant_low = 8'h22;
          5'h11: core_mant_low = 8'h20;
          5'h12: core_mant_low = 8'h1f;
          5'h13: core_mant_low = 8'h1e;
          5'h14: core_mant_low = 8'h1c;
          5'h15: core_mant_low = 8'h1b;
          5'h16: core_mant_low = 8'h19;
          5'h17: core_mant_low = 8'h18;
          5'h18: core_mant_low = 8'h16;
          5'h19: core_mant_low = 8'h15;
          5'h1a: core_mant_low = 8'h13;
          5'h1b: core_mant_low = 8'h12;
          5'h1c: core_mant_low = 8'h11;
          5'h1d: core_mant_low = 8'h0f;
          5'h1e: core_mant_low = 8'h0e;
          5'h1f: core_mant_low = 8'h0c;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h19: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h0b;
          5'h01: core_mant_low = 8'h0a;
          5'h02: core_mant_low = 8'h08;
          5'h03: core_mant_low = 8'h07;
          5'h04: core_mant_low = 8'h05;
          5'h05: core_mant_low = 8'h04;
          5'h06: core_mant_low = 8'h03;
          5'h07: core_mant_low = 8'h01;
          5'h08: core_mant_low = 8'h00;
          5'h09: core_mant_low = 8'hfe;
          5'h0a: core_mant_low = 8'hfd;
          5'h0b: core_mant_low = 8'hfc;
          5'h0c: core_mant_low = 8'hfa;
          5'h0d: core_mant_low = 8'hf9;
          5'h0e: core_mant_low = 8'hf7;
          5'h0f: core_mant_low = 8'hf6;
          5'h10: core_mant_low = 8'hf5;
          5'h11: core_mant_low = 8'hf3;
          5'h12: core_mant_low = 8'hf2;
          5'h13: core_mant_low = 8'hf0;
          5'h14: core_mant_low = 8'hef;
          5'h15: core_mant_low = 8'hee;
          5'h16: core_mant_low = 8'hec;
          5'h17: core_mant_low = 8'heb;
          5'h18: core_mant_low = 8'hea;
          5'h19: core_mant_low = 8'he8;
          5'h1a: core_mant_low = 8'he7;
          5'h1b: core_mant_low = 8'he6;
          5'h1c: core_mant_low = 8'he4;
          5'h1d: core_mant_low = 8'he3;
          5'h1e: core_mant_low = 8'he2;
          5'h1f: core_mant_low = 8'he0;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h1a: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'hdf;
          5'h01: core_mant_low = 8'hdd;
          5'h02: core_mant_low = 8'hdc;
          5'h03: core_mant_low = 8'hdb;
          5'h04: core_mant_low = 8'hd9;
          5'h05: core_mant_low = 8'hd8;
          5'h06: core_mant_low = 8'hd7;
          5'h07: core_mant_low = 8'hd5;
          5'h08: core_mant_low = 8'hd4;
          5'h09: core_mant_low = 8'hd3;
          5'h0a: core_mant_low = 8'hd1;
          5'h0b: core_mant_low = 8'hd0;
          5'h0c: core_mant_low = 8'hcf;
          5'h0d: core_mant_low = 8'hce;
          5'h0e: core_mant_low = 8'hcc;
          5'h0f: core_mant_low = 8'hcb;
          5'h10: core_mant_low = 8'hca;
          5'h11: core_mant_low = 8'hc8;
          5'h12: core_mant_low = 8'hc7;
          5'h13: core_mant_low = 8'hc6;
          5'h14: core_mant_low = 8'hc4;
          5'h15: core_mant_low = 8'hc3;
          5'h16: core_mant_low = 8'hc2;
          5'h17: core_mant_low = 8'hc0;
          5'h18: core_mant_low = 8'hbf;
          5'h19: core_mant_low = 8'hbe;
          5'h1a: core_mant_low = 8'hbd;
          5'h1b: core_mant_low = 8'hbb;
          5'h1c: core_mant_low = 8'hba;
          5'h1d: core_mant_low = 8'hb9;
          5'h1e: core_mant_low = 8'hb7;
          5'h1f: core_mant_low = 8'hb6;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h1b: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'hb5;
          5'h01: core_mant_low = 8'hb4;
          5'h02: core_mant_low = 8'hb2;
          5'h03: core_mant_low = 8'hb1;
          5'h04: core_mant_low = 8'hb0;
          5'h05: core_mant_low = 8'haf;
          5'h06: core_mant_low = 8'had;
          5'h07: core_mant_low = 8'hac;
          5'h08: core_mant_low = 8'hab;
          5'h09: core_mant_low = 8'haa;
          5'h0a: core_mant_low = 8'ha8;
          5'h0b: core_mant_low = 8'ha7;
          5'h0c: core_mant_low = 8'ha6;
          5'h0d: core_mant_low = 8'ha4;
          5'h0e: core_mant_low = 8'ha3;
          5'h0f: core_mant_low = 8'ha2;
          5'h10: core_mant_low = 8'ha1;
          5'h11: core_mant_low = 8'ha0;
          5'h12: core_mant_low = 8'h9e;
          5'h13: core_mant_low = 8'h9d;
          5'h14: core_mant_low = 8'h9c;
          5'h15: core_mant_low = 8'h9b;
          5'h16: core_mant_low = 8'h99;
          5'h17: core_mant_low = 8'h98;
          5'h18: core_mant_low = 8'h97;
          5'h19: core_mant_low = 8'h96;
          5'h1a: core_mant_low = 8'h94;
          5'h1b: core_mant_low = 8'h93;
          5'h1c: core_mant_low = 8'h92;
          5'h1d: core_mant_low = 8'h91;
          5'h1e: core_mant_low = 8'h90;
          5'h1f: core_mant_low = 8'h8e;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h1c: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h8d;
          5'h01: core_mant_low = 8'h8c;
          5'h02: core_mant_low = 8'h8b;
          5'h03: core_mant_low = 8'h89;
          5'h04: core_mant_low = 8'h88;
          5'h05: core_mant_low = 8'h87;
          5'h06: core_mant_low = 8'h86;
          5'h07: core_mant_low = 8'h85;
          5'h08: core_mant_low = 8'h83;
          5'h09: core_mant_low = 8'h82;
          5'h0a: core_mant_low = 8'h81;
          5'h0b: core_mant_low = 8'h80;
          5'h0c: core_mant_low = 8'h7f;
          5'h0d: core_mant_low = 8'h7d;
          5'h0e: core_mant_low = 8'h7c;
          5'h0f: core_mant_low = 8'h7b;
          5'h10: core_mant_low = 8'h7a;
          5'h11: core_mant_low = 8'h79;
          5'h12: core_mant_low = 8'h78;
          5'h13: core_mant_low = 8'h76;
          5'h14: core_mant_low = 8'h75;
          5'h15: core_mant_low = 8'h74;
          5'h16: core_mant_low = 8'h73;
          5'h17: core_mant_low = 8'h72;
          5'h18: core_mant_low = 8'h70;
          5'h19: core_mant_low = 8'h6f;
          5'h1a: core_mant_low = 8'h6e;
          5'h1b: core_mant_low = 8'h6d;
          5'h1c: core_mant_low = 8'h6c;
          5'h1d: core_mant_low = 8'h6b;
          5'h1e: core_mant_low = 8'h6a;
          5'h1f: core_mant_low = 8'h68;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h1d: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h67;
          5'h01: core_mant_low = 8'h66;
          5'h02: core_mant_low = 8'h65;
          5'h03: core_mant_low = 8'h64;
          5'h04: core_mant_low = 8'h63;
          5'h05: core_mant_low = 8'h61;
          5'h06: core_mant_low = 8'h60;
          5'h07: core_mant_low = 8'h5f;
          5'h08: core_mant_low = 8'h5e;
          5'h09: core_mant_low = 8'h5d;
          5'h0a: core_mant_low = 8'h5c;
          5'h0b: core_mant_low = 8'h5b;
          5'h0c: core_mant_low = 8'h59;
          5'h0d: core_mant_low = 8'h58;
          5'h0e: core_mant_low = 8'h57;
          5'h0f: core_mant_low = 8'h56;
          5'h10: core_mant_low = 8'h55;
          5'h11: core_mant_low = 8'h54;
          5'h12: core_mant_low = 8'h53;
          5'h13: core_mant_low = 8'h52;
          5'h14: core_mant_low = 8'h50;
          5'h15: core_mant_low = 8'h4f;
          5'h16: core_mant_low = 8'h4e;
          5'h17: core_mant_low = 8'h4d;
          5'h18: core_mant_low = 8'h4c;
          5'h19: core_mant_low = 8'h4b;
          5'h1a: core_mant_low = 8'h4a;
          5'h1b: core_mant_low = 8'h49;
          5'h1c: core_mant_low = 8'h48;
          5'h1d: core_mant_low = 8'h46;
          5'h1e: core_mant_low = 8'h45;
          5'h1f: core_mant_low = 8'h44;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h1e: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h43;
          5'h01: core_mant_low = 8'h42;
          5'h02: core_mant_low = 8'h41;
          5'h03: core_mant_low = 8'h40;
          5'h04: core_mant_low = 8'h3f;
          5'h05: core_mant_low = 8'h3e;
          5'h06: core_mant_low = 8'h3d;
          5'h07: core_mant_low = 8'h3b;
          5'h08: core_mant_low = 8'h3a;
          5'h09: core_mant_low = 8'h39;
          5'h0a: core_mant_low = 8'h38;
          5'h0b: core_mant_low = 8'h37;
          5'h0c: core_mant_low = 8'h36;
          5'h0d: core_mant_low = 8'h35;
          5'h0e: core_mant_low = 8'h34;
          5'h0f: core_mant_low = 8'h33;
          5'h10: core_mant_low = 8'h32;
          5'h11: core_mant_low = 8'h31;
          5'h12: core_mant_low = 8'h30;
          5'h13: core_mant_low = 8'h2f;
          5'h14: core_mant_low = 8'h2d;
          5'h15: core_mant_low = 8'h2c;
          5'h16: core_mant_low = 8'h2b;
          5'h17: core_mant_low = 8'h2a;
          5'h18: core_mant_low = 8'h29;
          5'h19: core_mant_low = 8'h28;
          5'h1a: core_mant_low = 8'h27;
          5'h1b: core_mant_low = 8'h26;
          5'h1c: core_mant_low = 8'h25;
          5'h1d: core_mant_low = 8'h24;
          5'h1e: core_mant_low = 8'h23;
          5'h1f: core_mant_low = 8'h22;
          default: core_mant_low = 8'h00;
        endcase
      end
      5'h1f: begin
        case (mant[4:0])
          5'h00: core_mant_low = 8'h21;
          5'h01: core_mant_low = 8'h20;
          5'h02: core_mant_low = 8'h1f;
          5'h03: core_mant_low = 8'h1e;
          5'h04: core_mant_low = 8'h1d;
          5'h05: core_mant_low = 8'h1c;
          5'h06: core_mant_low = 8'h1b;
          5'h07: core_mant_low = 8'h19;
          5'h08: core_mant_low = 8'h18;
          5'h09: core_mant_low = 8'h17;
          5'h0a: core_mant_low = 8'h16;
          5'h0b: core_mant_low = 8'h15;
          5'h0c: core_mant_low = 8'h14;
          5'h0d: core_mant_low = 8'h13;
          5'h0e: core_mant_low = 8'h12;
          5'h0f: core_mant_low = 8'h11;
          5'h10: core_mant_low = 8'h10;
          5'h11: core_mant_low = 8'h0f;
          5'h12: core_mant_low = 8'h0e;
          5'h13: core_mant_low = 8'h0d;
          5'h14: core_mant_low = 8'h0c;
          5'h15: core_mant_low = 8'h0b;
          5'h16: core_mant_low = 8'h0a;
          5'h17: core_mant_low = 8'h09;
          5'h18: core_mant_low = 8'h08;
          5'h19: core_mant_low = 8'h07;
          5'h1a: core_mant_low = 8'h06;
          5'h1b: core_mant_low = 8'h05;
          5'h1c: core_mant_low = 8'h04;
          5'h1d: core_mant_low = 8'h03;
          5'h1e: core_mant_low = 8'h02;
          5'h1f: core_mant_low = 8'h01;
          default: core_mant_low = 8'h00;
        endcase
      end
      default: core_mant_low = 8'h00;
    endcase
  end
  wire [9:0] core_out_mant = {core_mant_b9, core_mant_b8, core_mant_low};
  wire [15:0] core_out = {1'b0, out_exp, core_out_mant};
  reg [15:0] special_out;
  always @* begin
    special_out = 16'h0000;
    case (exp)
      5'h00: special_out = 16'h7c00;
      5'h01: special_out = 16'h7c00;
      5'h02: special_out = 16'h7c00;
      5'h03: special_out = 16'h7c00;
      5'h04: special_out = 16'h7c00;
      5'h05: special_out = 16'h7c00;
      5'h06: special_out = 16'h7c00;
      5'h17: special_out = 16'h0000;
      5'h18: special_out = 16'h0000;
      5'h19: special_out = 16'h0000;
      5'h1a: special_out = 16'h0000;
      5'h1b: special_out = 16'h0000;
      5'h1c: special_out = 16'h0000;
      5'h1d: special_out = 16'h0000;
      5'h1e: special_out = 16'h0000;
      5'h1f: begin
        case (mant)
          10'h000: special_out = 16'h0000;
          10'h001: special_out = 16'h7e00;
          10'h002: special_out = 16'h7e00;
          10'h003: special_out = 16'h7e00;
          10'h004: special_out = 16'h7e00;
          10'h005: special_out = 16'h7e00;
          10'h006: special_out = 16'h7e00;
          10'h007: special_out = 16'h7e00;
          10'h008: special_out = 16'h7e00;
          10'h009: special_out = 16'h7e00;
          10'h00a: special_out = 16'h7e00;
          10'h00b: special_out = 16'h7e00;
          10'h00c: special_out = 16'h7e00;
          10'h00d: special_out = 16'h7e00;
          10'h00e: special_out = 16'h7e00;
          10'h00f: special_out = 16'h7e00;
          10'h010: special_out = 16'h7e00;
          10'h011: special_out = 16'h7e00;
          10'h012: special_out = 16'h7e00;
          10'h013: special_out = 16'h7e00;
          10'h014: special_out = 16'h7e00;
          10'h015: special_out = 16'h7e00;
          10'h016: special_out = 16'h7e00;
          10'h017: special_out = 16'h7e00;
          10'h018: special_out = 16'h7e00;
          10'h019: special_out = 16'h7e00;
          10'h01a: special_out = 16'h7e00;
          10'h01b: special_out = 16'h7e00;
          10'h01c: special_out = 16'h7e00;
          10'h01d: special_out = 16'h7e00;
          10'h01e: special_out = 16'h7e00;
          10'h01f: special_out = 16'h7e00;
          10'h020: special_out = 16'h7e00;
          10'h021: special_out = 16'h7e00;
          10'h022: special_out = 16'h7e00;
          10'h023: special_out = 16'h7e00;
          10'h024: special_out = 16'h7e00;
          10'h025: special_out = 16'h7e00;
          10'h026: special_out = 16'h7e00;
          10'h027: special_out = 16'h7e00;
          10'h028: special_out = 16'h7e00;
          10'h029: special_out = 16'h7e00;
          10'h02a: special_out = 16'h7e00;
          10'h02b: special_out = 16'h7e00;
          10'h02c: special_out = 16'h7e00;
          10'h02d: special_out = 16'h7e00;
          10'h02e: special_out = 16'h7e00;
          10'h02f: special_out = 16'h7e00;
          10'h030: special_out = 16'h7e00;
          10'h031: special_out = 16'h7e00;
          10'h032: special_out = 16'h7e00;
          10'h033: special_out = 16'h7e00;
          10'h034: special_out = 16'h7e00;
          10'h035: special_out = 16'h7e00;
          10'h036: special_out = 16'h7e00;
          10'h037: special_out = 16'h7e00;
          10'h038: special_out = 16'h7e00;
          10'h039: special_out = 16'h7e00;
          10'h03a: special_out = 16'h7e00;
          10'h03b: special_out = 16'h7e00;
          10'h03c: special_out = 16'h7e00;
          10'h03d: special_out = 16'h7e00;
          10'h03e: special_out = 16'h7e00;
          10'h03f: special_out = 16'h7e00;
          10'h040: special_out = 16'h7e00;
          10'h041: special_out = 16'h7e00;
          10'h042: special_out = 16'h7e00;
          10'h043: special_out = 16'h7e00;
          10'h044: special_out = 16'h7e00;
          10'h045: special_out = 16'h7e00;
          10'h046: special_out = 16'h7e00;
          10'h047: special_out = 16'h7e00;
          10'h048: special_out = 16'h7e00;
          10'h049: special_out = 16'h7e00;
          10'h04a: special_out = 16'h7e00;
          10'h04b: special_out = 16'h7e00;
          10'h04c: special_out = 16'h7e00;
          10'h04d: special_out = 16'h7e00;
          10'h04e: special_out = 16'h7e00;
          10'h04f: special_out = 16'h7e00;
          10'h050: special_out = 16'h7e00;
          10'h051: special_out = 16'h7e00;
          10'h052: special_out = 16'h7e00;
          10'h053: special_out = 16'h7e00;
          10'h054: special_out = 16'h7e00;
          10'h055: special_out = 16'h7e00;
          10'h056: special_out = 16'h7e00;
          10'h057: special_out = 16'h7e00;
          10'h058: special_out = 16'h7e00;
          10'h059: special_out = 16'h7e00;
          10'h05a: special_out = 16'h7e00;
          10'h05b: special_out = 16'h7e00;
          10'h05c: special_out = 16'h7e00;
          10'h05d: special_out = 16'h7e00;
          10'h05e: special_out = 16'h7e00;
          10'h05f: special_out = 16'h7e00;
          10'h060: special_out = 16'h7e00;
          10'h061: special_out = 16'h7e00;
          10'h062: special_out = 16'h7e00;
          10'h063: special_out = 16'h7e00;
          10'h064: special_out = 16'h7e00;
          10'h065: special_out = 16'h7e00;
          10'h066: special_out = 16'h7e00;
          10'h067: special_out = 16'h7e00;
          10'h068: special_out = 16'h7e00;
          10'h069: special_out = 16'h7e00;
          10'h06a: special_out = 16'h7e00;
          10'h06b: special_out = 16'h7e00;
          10'h06c: special_out = 16'h7e00;
          10'h06d: special_out = 16'h7e00;
          10'h06e: special_out = 16'h7e00;
          10'h06f: special_out = 16'h7e00;
          10'h070: special_out = 16'h7e00;
          10'h071: special_out = 16'h7e00;
          10'h072: special_out = 16'h7e00;
          10'h073: special_out = 16'h7e00;
          10'h074: special_out = 16'h7e00;
          10'h075: special_out = 16'h7e00;
          10'h076: special_out = 16'h7e00;
          10'h077: special_out = 16'h7e00;
          10'h078: special_out = 16'h7e00;
          10'h079: special_out = 16'h7e00;
          10'h07a: special_out = 16'h7e00;
          10'h07b: special_out = 16'h7e00;
          10'h07c: special_out = 16'h7e00;
          10'h07d: special_out = 16'h7e00;
          10'h07e: special_out = 16'h7e00;
          10'h07f: special_out = 16'h7e00;
          10'h080: special_out = 16'h7e00;
          10'h081: special_out = 16'h7e00;
          10'h082: special_out = 16'h7e00;
          10'h083: special_out = 16'h7e00;
          10'h084: special_out = 16'h7e00;
          10'h085: special_out = 16'h7e00;
          10'h086: special_out = 16'h7e00;
          10'h087: special_out = 16'h7e00;
          10'h088: special_out = 16'h7e00;
          10'h089: special_out = 16'h7e00;
          10'h08a: special_out = 16'h7e00;
          10'h08b: special_out = 16'h7e00;
          10'h08c: special_out = 16'h7e00;
          10'h08d: special_out = 16'h7e00;
          10'h08e: special_out = 16'h7e00;
          10'h08f: special_out = 16'h7e00;
          10'h090: special_out = 16'h7e00;
          10'h091: special_out = 16'h7e00;
          10'h092: special_out = 16'h7e00;
          10'h093: special_out = 16'h7e00;
          10'h094: special_out = 16'h7e00;
          10'h095: special_out = 16'h7e00;
          10'h096: special_out = 16'h7e00;
          10'h097: special_out = 16'h7e00;
          10'h098: special_out = 16'h7e00;
          10'h099: special_out = 16'h7e00;
          10'h09a: special_out = 16'h7e00;
          10'h09b: special_out = 16'h7e00;
          10'h09c: special_out = 16'h7e00;
          10'h09d: special_out = 16'h7e00;
          10'h09e: special_out = 16'h7e00;
          10'h09f: special_out = 16'h7e00;
          10'h0a0: special_out = 16'h7e00;
          10'h0a1: special_out = 16'h7e00;
          10'h0a2: special_out = 16'h7e00;
          10'h0a3: special_out = 16'h7e00;
          10'h0a4: special_out = 16'h7e00;
          10'h0a5: special_out = 16'h7e00;
          10'h0a6: special_out = 16'h7e00;
          10'h0a7: special_out = 16'h7e00;
          10'h0a8: special_out = 16'h7e00;
          10'h0a9: special_out = 16'h7e00;
          10'h0aa: special_out = 16'h7e00;
          10'h0ab: special_out = 16'h7e00;
          10'h0ac: special_out = 16'h7e00;
          10'h0ad: special_out = 16'h7e00;
          10'h0ae: special_out = 16'h7e00;
          10'h0af: special_out = 16'h7e00;
          10'h0b0: special_out = 16'h7e00;
          10'h0b1: special_out = 16'h7e00;
          10'h0b2: special_out = 16'h7e00;
          10'h0b3: special_out = 16'h7e00;
          10'h0b4: special_out = 16'h7e00;
          10'h0b5: special_out = 16'h7e00;
          10'h0b6: special_out = 16'h7e00;
          10'h0b7: special_out = 16'h7e00;
          10'h0b8: special_out = 16'h7e00;
          10'h0b9: special_out = 16'h7e00;
          10'h0ba: special_out = 16'h7e00;
          10'h0bb: special_out = 16'h7e00;
          10'h0bc: special_out = 16'h7e00;
          10'h0bd: special_out = 16'h7e00;
          10'h0be: special_out = 16'h7e00;
          10'h0bf: special_out = 16'h7e00;
          10'h0c0: special_out = 16'h7e00;
          10'h0c1: special_out = 16'h7e00;
          10'h0c2: special_out = 16'h7e00;
          10'h0c3: special_out = 16'h7e00;
          10'h0c4: special_out = 16'h7e00;
          10'h0c5: special_out = 16'h7e00;
          10'h0c6: special_out = 16'h7e00;
          10'h0c7: special_out = 16'h7e00;
          10'h0c8: special_out = 16'h7e00;
          10'h0c9: special_out = 16'h7e00;
          10'h0ca: special_out = 16'h7e00;
          10'h0cb: special_out = 16'h7e00;
          10'h0cc: special_out = 16'h7e00;
          10'h0cd: special_out = 16'h7e00;
          10'h0ce: special_out = 16'h7e00;
          10'h0cf: special_out = 16'h7e00;
          10'h0d0: special_out = 16'h7e00;
          10'h0d1: special_out = 16'h7e00;
          10'h0d2: special_out = 16'h7e00;
          10'h0d3: special_out = 16'h7e00;
          10'h0d4: special_out = 16'h7e00;
          10'h0d5: special_out = 16'h7e00;
          10'h0d6: special_out = 16'h7e00;
          10'h0d7: special_out = 16'h7e00;
          10'h0d8: special_out = 16'h7e00;
          10'h0d9: special_out = 16'h7e00;
          10'h0da: special_out = 16'h7e00;
          10'h0db: special_out = 16'h7e00;
          10'h0dc: special_out = 16'h7e00;
          10'h0dd: special_out = 16'h7e00;
          10'h0de: special_out = 16'h7e00;
          10'h0df: special_out = 16'h7e00;
          10'h0e0: special_out = 16'h7e00;
          10'h0e1: special_out = 16'h7e00;
          10'h0e2: special_out = 16'h7e00;
          10'h0e3: special_out = 16'h7e00;
          10'h0e4: special_out = 16'h7e00;
          10'h0e5: special_out = 16'h7e00;
          10'h0e6: special_out = 16'h7e00;
          10'h0e7: special_out = 16'h7e00;
          10'h0e8: special_out = 16'h7e00;
          10'h0e9: special_out = 16'h7e00;
          10'h0ea: special_out = 16'h7e00;
          10'h0eb: special_out = 16'h7e00;
          10'h0ec: special_out = 16'h7e00;
          10'h0ed: special_out = 16'h7e00;
          10'h0ee: special_out = 16'h7e00;
          10'h0ef: special_out = 16'h7e00;
          10'h0f0: special_out = 16'h7e00;
          10'h0f1: special_out = 16'h7e00;
          10'h0f2: special_out = 16'h7e00;
          10'h0f3: special_out = 16'h7e00;
          10'h0f4: special_out = 16'h7e00;
          10'h0f5: special_out = 16'h7e00;
          10'h0f6: special_out = 16'h7e00;
          10'h0f7: special_out = 16'h7e00;
          10'h0f8: special_out = 16'h7e00;
          10'h0f9: special_out = 16'h7e00;
          10'h0fa: special_out = 16'h7e00;
          10'h0fb: special_out = 16'h7e00;
          10'h0fc: special_out = 16'h7e00;
          10'h0fd: special_out = 16'h7e00;
          10'h0fe: special_out = 16'h7e00;
          10'h0ff: special_out = 16'h7e00;
          10'h100: special_out = 16'h7e00;
          10'h101: special_out = 16'h7e00;
          10'h102: special_out = 16'h7e00;
          10'h103: special_out = 16'h7e00;
          10'h104: special_out = 16'h7e00;
          10'h105: special_out = 16'h7e00;
          10'h106: special_out = 16'h7e00;
          10'h107: special_out = 16'h7e00;
          10'h108: special_out = 16'h7e00;
          10'h109: special_out = 16'h7e00;
          10'h10a: special_out = 16'h7e00;
          10'h10b: special_out = 16'h7e00;
          10'h10c: special_out = 16'h7e00;
          10'h10d: special_out = 16'h7e00;
          10'h10e: special_out = 16'h7e00;
          10'h10f: special_out = 16'h7e00;
          10'h110: special_out = 16'h7e00;
          10'h111: special_out = 16'h7e00;
          10'h112: special_out = 16'h7e00;
          10'h113: special_out = 16'h7e00;
          10'h114: special_out = 16'h7e00;
          10'h115: special_out = 16'h7e00;
          10'h116: special_out = 16'h7e00;
          10'h117: special_out = 16'h7e00;
          10'h118: special_out = 16'h7e00;
          10'h119: special_out = 16'h7e00;
          10'h11a: special_out = 16'h7e00;
          10'h11b: special_out = 16'h7e00;
          10'h11c: special_out = 16'h7e00;
          10'h11d: special_out = 16'h7e00;
          10'h11e: special_out = 16'h7e00;
          10'h11f: special_out = 16'h7e00;
          10'h120: special_out = 16'h7e00;
          10'h121: special_out = 16'h7e00;
          10'h122: special_out = 16'h7e00;
          10'h123: special_out = 16'h7e00;
          10'h124: special_out = 16'h7e00;
          10'h125: special_out = 16'h7e00;
          10'h126: special_out = 16'h7e00;
          10'h127: special_out = 16'h7e00;
          10'h128: special_out = 16'h7e00;
          10'h129: special_out = 16'h7e00;
          10'h12a: special_out = 16'h7e00;
          10'h12b: special_out = 16'h7e00;
          10'h12c: special_out = 16'h7e00;
          10'h12d: special_out = 16'h7e00;
          10'h12e: special_out = 16'h7e00;
          10'h12f: special_out = 16'h7e00;
          10'h130: special_out = 16'h7e00;
          10'h131: special_out = 16'h7e00;
          10'h132: special_out = 16'h7e00;
          10'h133: special_out = 16'h7e00;
          10'h134: special_out = 16'h7e00;
          10'h135: special_out = 16'h7e00;
          10'h136: special_out = 16'h7e00;
          10'h137: special_out = 16'h7e00;
          10'h138: special_out = 16'h7e00;
          10'h139: special_out = 16'h7e00;
          10'h13a: special_out = 16'h7e00;
          10'h13b: special_out = 16'h7e00;
          10'h13c: special_out = 16'h7e00;
          10'h13d: special_out = 16'h7e00;
          10'h13e: special_out = 16'h7e00;
          10'h13f: special_out = 16'h7e00;
          10'h140: special_out = 16'h7e00;
          10'h141: special_out = 16'h7e00;
          10'h142: special_out = 16'h7e00;
          10'h143: special_out = 16'h7e00;
          10'h144: special_out = 16'h7e00;
          10'h145: special_out = 16'h7e00;
          10'h146: special_out = 16'h7e00;
          10'h147: special_out = 16'h7e00;
          10'h148: special_out = 16'h7e00;
          10'h149: special_out = 16'h7e00;
          10'h14a: special_out = 16'h7e00;
          10'h14b: special_out = 16'h7e00;
          10'h14c: special_out = 16'h7e00;
          10'h14d: special_out = 16'h7e00;
          10'h14e: special_out = 16'h7e00;
          10'h14f: special_out = 16'h7e00;
          10'h150: special_out = 16'h7e00;
          10'h151: special_out = 16'h7e00;
          10'h152: special_out = 16'h7e00;
          10'h153: special_out = 16'h7e00;
          10'h154: special_out = 16'h7e00;
          10'h155: special_out = 16'h7e00;
          10'h156: special_out = 16'h7e00;
          10'h157: special_out = 16'h7e00;
          10'h158: special_out = 16'h7e00;
          10'h159: special_out = 16'h7e00;
          10'h15a: special_out = 16'h7e00;
          10'h15b: special_out = 16'h7e00;
          10'h15c: special_out = 16'h7e00;
          10'h15d: special_out = 16'h7e00;
          10'h15e: special_out = 16'h7e00;
          10'h15f: special_out = 16'h7e00;
          10'h160: special_out = 16'h7e00;
          10'h161: special_out = 16'h7e00;
          10'h162: special_out = 16'h7e00;
          10'h163: special_out = 16'h7e00;
          10'h164: special_out = 16'h7e00;
          10'h165: special_out = 16'h7e00;
          10'h166: special_out = 16'h7e00;
          10'h167: special_out = 16'h7e00;
          10'h168: special_out = 16'h7e00;
          10'h169: special_out = 16'h7e00;
          10'h16a: special_out = 16'h7e00;
          10'h16b: special_out = 16'h7e00;
          10'h16c: special_out = 16'h7e00;
          10'h16d: special_out = 16'h7e00;
          10'h16e: special_out = 16'h7e00;
          10'h16f: special_out = 16'h7e00;
          10'h170: special_out = 16'h7e00;
          10'h171: special_out = 16'h7e00;
          10'h172: special_out = 16'h7e00;
          10'h173: special_out = 16'h7e00;
          10'h174: special_out = 16'h7e00;
          10'h175: special_out = 16'h7e00;
          10'h176: special_out = 16'h7e00;
          10'h177: special_out = 16'h7e00;
          10'h178: special_out = 16'h7e00;
          10'h179: special_out = 16'h7e00;
          10'h17a: special_out = 16'h7e00;
          10'h17b: special_out = 16'h7e00;
          10'h17c: special_out = 16'h7e00;
          10'h17d: special_out = 16'h7e00;
          10'h17e: special_out = 16'h7e00;
          10'h17f: special_out = 16'h7e00;
          10'h180: special_out = 16'h7e00;
          10'h181: special_out = 16'h7e00;
          10'h182: special_out = 16'h7e00;
          10'h183: special_out = 16'h7e00;
          10'h184: special_out = 16'h7e00;
          10'h185: special_out = 16'h7e00;
          10'h186: special_out = 16'h7e00;
          10'h187: special_out = 16'h7e00;
          10'h188: special_out = 16'h7e00;
          10'h189: special_out = 16'h7e00;
          10'h18a: special_out = 16'h7e00;
          10'h18b: special_out = 16'h7e00;
          10'h18c: special_out = 16'h7e00;
          10'h18d: special_out = 16'h7e00;
          10'h18e: special_out = 16'h7e00;
          10'h18f: special_out = 16'h7e00;
          10'h190: special_out = 16'h7e00;
          10'h191: special_out = 16'h7e00;
          10'h192: special_out = 16'h7e00;
          10'h193: special_out = 16'h7e00;
          10'h194: special_out = 16'h7e00;
          10'h195: special_out = 16'h7e00;
          10'h196: special_out = 16'h7e00;
          10'h197: special_out = 16'h7e00;
          10'h198: special_out = 16'h7e00;
          10'h199: special_out = 16'h7e00;
          10'h19a: special_out = 16'h7e00;
          10'h19b: special_out = 16'h7e00;
          10'h19c: special_out = 16'h7e00;
          10'h19d: special_out = 16'h7e00;
          10'h19e: special_out = 16'h7e00;
          10'h19f: special_out = 16'h7e00;
          10'h1a0: special_out = 16'h7e00;
          10'h1a1: special_out = 16'h7e00;
          10'h1a2: special_out = 16'h7e00;
          10'h1a3: special_out = 16'h7e00;
          10'h1a4: special_out = 16'h7e00;
          10'h1a5: special_out = 16'h7e00;
          10'h1a6: special_out = 16'h7e00;
          10'h1a7: special_out = 16'h7e00;
          10'h1a8: special_out = 16'h7e00;
          10'h1a9: special_out = 16'h7e00;
          10'h1aa: special_out = 16'h7e00;
          10'h1ab: special_out = 16'h7e00;
          10'h1ac: special_out = 16'h7e00;
          10'h1ad: special_out = 16'h7e00;
          10'h1ae: special_out = 16'h7e00;
          10'h1af: special_out = 16'h7e00;
          10'h1b0: special_out = 16'h7e00;
          10'h1b1: special_out = 16'h7e00;
          10'h1b2: special_out = 16'h7e00;
          10'h1b3: special_out = 16'h7e00;
          10'h1b4: special_out = 16'h7e00;
          10'h1b5: special_out = 16'h7e00;
          10'h1b6: special_out = 16'h7e00;
          10'h1b7: special_out = 16'h7e00;
          10'h1b8: special_out = 16'h7e00;
          10'h1b9: special_out = 16'h7e00;
          10'h1ba: special_out = 16'h7e00;
          10'h1bb: special_out = 16'h7e00;
          10'h1bc: special_out = 16'h7e00;
          10'h1bd: special_out = 16'h7e00;
          10'h1be: special_out = 16'h7e00;
          10'h1bf: special_out = 16'h7e00;
          10'h1c0: special_out = 16'h7e00;
          10'h1c1: special_out = 16'h7e00;
          10'h1c2: special_out = 16'h7e00;
          10'h1c3: special_out = 16'h7e00;
          10'h1c4: special_out = 16'h7e00;
          10'h1c5: special_out = 16'h7e00;
          10'h1c6: special_out = 16'h7e00;
          10'h1c7: special_out = 16'h7e00;
          10'h1c8: special_out = 16'h7e00;
          10'h1c9: special_out = 16'h7e00;
          10'h1ca: special_out = 16'h7e00;
          10'h1cb: special_out = 16'h7e00;
          10'h1cc: special_out = 16'h7e00;
          10'h1cd: special_out = 16'h7e00;
          10'h1ce: special_out = 16'h7e00;
          10'h1cf: special_out = 16'h7e00;
          10'h1d0: special_out = 16'h7e00;
          10'h1d1: special_out = 16'h7e00;
          10'h1d2: special_out = 16'h7e00;
          10'h1d3: special_out = 16'h7e00;
          10'h1d4: special_out = 16'h7e00;
          10'h1d5: special_out = 16'h7e00;
          10'h1d6: special_out = 16'h7e00;
          10'h1d7: special_out = 16'h7e00;
          10'h1d8: special_out = 16'h7e00;
          10'h1d9: special_out = 16'h7e00;
          10'h1da: special_out = 16'h7e00;
          10'h1db: special_out = 16'h7e00;
          10'h1dc: special_out = 16'h7e00;
          10'h1dd: special_out = 16'h7e00;
          10'h1de: special_out = 16'h7e00;
          10'h1df: special_out = 16'h7e00;
          10'h1e0: special_out = 16'h7e00;
          10'h1e1: special_out = 16'h7e00;
          10'h1e2: special_out = 16'h7e00;
          10'h1e3: special_out = 16'h7e00;
          10'h1e4: special_out = 16'h7e00;
          10'h1e5: special_out = 16'h7e00;
          10'h1e6: special_out = 16'h7e00;
          10'h1e7: special_out = 16'h7e00;
          10'h1e8: special_out = 16'h7e00;
          10'h1e9: special_out = 16'h7e00;
          10'h1ea: special_out = 16'h7e00;
          10'h1eb: special_out = 16'h7e00;
          10'h1ec: special_out = 16'h7e00;
          10'h1ed: special_out = 16'h7e00;
          10'h1ee: special_out = 16'h7e00;
          10'h1ef: special_out = 16'h7e00;
          10'h1f0: special_out = 16'h7e00;
          10'h1f1: special_out = 16'h7e00;
          10'h1f2: special_out = 16'h7e00;
          10'h1f3: special_out = 16'h7e00;
          10'h1f4: special_out = 16'h7e00;
          10'h1f5: special_out = 16'h7e00;
          10'h1f6: special_out = 16'h7e00;
          10'h1f7: special_out = 16'h7e00;
          10'h1f8: special_out = 16'h7e00;
          10'h1f9: special_out = 16'h7e00;
          10'h1fa: special_out = 16'h7e00;
          10'h1fb: special_out = 16'h7e00;
          10'h1fc: special_out = 16'h7e00;
          10'h1fd: special_out = 16'h7e00;
          10'h1fe: special_out = 16'h7e00;
          10'h1ff: special_out = 16'h7e00;
          10'h200: special_out = 16'h7e00;
          10'h201: special_out = 16'h7e00;
          10'h202: special_out = 16'h7e00;
          10'h203: special_out = 16'h7e00;
          10'h204: special_out = 16'h7e00;
          10'h205: special_out = 16'h7e00;
          10'h206: special_out = 16'h7e00;
          10'h207: special_out = 16'h7e00;
          10'h208: special_out = 16'h7e00;
          10'h209: special_out = 16'h7e00;
          10'h20a: special_out = 16'h7e00;
          10'h20b: special_out = 16'h7e00;
          10'h20c: special_out = 16'h7e00;
          10'h20d: special_out = 16'h7e00;
          10'h20e: special_out = 16'h7e00;
          10'h20f: special_out = 16'h7e00;
          10'h210: special_out = 16'h7e00;
          10'h211: special_out = 16'h7e00;
          10'h212: special_out = 16'h7e00;
          10'h213: special_out = 16'h7e00;
          10'h214: special_out = 16'h7e00;
          10'h215: special_out = 16'h7e00;
          10'h216: special_out = 16'h7e00;
          10'h217: special_out = 16'h7e00;
          10'h218: special_out = 16'h7e00;
          10'h219: special_out = 16'h7e00;
          10'h21a: special_out = 16'h7e00;
          10'h21b: special_out = 16'h7e00;
          10'h21c: special_out = 16'h7e00;
          10'h21d: special_out = 16'h7e00;
          10'h21e: special_out = 16'h7e00;
          10'h21f: special_out = 16'h7e00;
          10'h220: special_out = 16'h7e00;
          10'h221: special_out = 16'h7e00;
          10'h222: special_out = 16'h7e00;
          10'h223: special_out = 16'h7e00;
          10'h224: special_out = 16'h7e00;
          10'h225: special_out = 16'h7e00;
          10'h226: special_out = 16'h7e00;
          10'h227: special_out = 16'h7e00;
          10'h228: special_out = 16'h7e00;
          10'h229: special_out = 16'h7e00;
          10'h22a: special_out = 16'h7e00;
          10'h22b: special_out = 16'h7e00;
          10'h22c: special_out = 16'h7e00;
          10'h22d: special_out = 16'h7e00;
          10'h22e: special_out = 16'h7e00;
          10'h22f: special_out = 16'h7e00;
          10'h230: special_out = 16'h7e00;
          10'h231: special_out = 16'h7e00;
          10'h232: special_out = 16'h7e00;
          10'h233: special_out = 16'h7e00;
          10'h234: special_out = 16'h7e00;
          10'h235: special_out = 16'h7e00;
          10'h236: special_out = 16'h7e00;
          10'h237: special_out = 16'h7e00;
          10'h238: special_out = 16'h7e00;
          10'h239: special_out = 16'h7e00;
          10'h23a: special_out = 16'h7e00;
          10'h23b: special_out = 16'h7e00;
          10'h23c: special_out = 16'h7e00;
          10'h23d: special_out = 16'h7e00;
          10'h23e: special_out = 16'h7e00;
          10'h23f: special_out = 16'h7e00;
          10'h240: special_out = 16'h7e00;
          10'h241: special_out = 16'h7e00;
          10'h242: special_out = 16'h7e00;
          10'h243: special_out = 16'h7e00;
          10'h244: special_out = 16'h7e00;
          10'h245: special_out = 16'h7e00;
          10'h246: special_out = 16'h7e00;
          10'h247: special_out = 16'h7e00;
          10'h248: special_out = 16'h7e00;
          10'h249: special_out = 16'h7e00;
          10'h24a: special_out = 16'h7e00;
          10'h24b: special_out = 16'h7e00;
          10'h24c: special_out = 16'h7e00;
          10'h24d: special_out = 16'h7e00;
          10'h24e: special_out = 16'h7e00;
          10'h24f: special_out = 16'h7e00;
          10'h250: special_out = 16'h7e00;
          10'h251: special_out = 16'h7e00;
          10'h252: special_out = 16'h7e00;
          10'h253: special_out = 16'h7e00;
          10'h254: special_out = 16'h7e00;
          10'h255: special_out = 16'h7e00;
          10'h256: special_out = 16'h7e00;
          10'h257: special_out = 16'h7e00;
          10'h258: special_out = 16'h7e00;
          10'h259: special_out = 16'h7e00;
          10'h25a: special_out = 16'h7e00;
          10'h25b: special_out = 16'h7e00;
          10'h25c: special_out = 16'h7e00;
          10'h25d: special_out = 16'h7e00;
          10'h25e: special_out = 16'h7e00;
          10'h25f: special_out = 16'h7e00;
          10'h260: special_out = 16'h7e00;
          10'h261: special_out = 16'h7e00;
          10'h262: special_out = 16'h7e00;
          10'h263: special_out = 16'h7e00;
          10'h264: special_out = 16'h7e00;
          10'h265: special_out = 16'h7e00;
          10'h266: special_out = 16'h7e00;
          10'h267: special_out = 16'h7e00;
          10'h268: special_out = 16'h7e00;
          10'h269: special_out = 16'h7e00;
          10'h26a: special_out = 16'h7e00;
          10'h26b: special_out = 16'h7e00;
          10'h26c: special_out = 16'h7e00;
          10'h26d: special_out = 16'h7e00;
          10'h26e: special_out = 16'h7e00;
          10'h26f: special_out = 16'h7e00;
          10'h270: special_out = 16'h7e00;
          10'h271: special_out = 16'h7e00;
          10'h272: special_out = 16'h7e00;
          10'h273: special_out = 16'h7e00;
          10'h274: special_out = 16'h7e00;
          10'h275: special_out = 16'h7e00;
          10'h276: special_out = 16'h7e00;
          10'h277: special_out = 16'h7e00;
          10'h278: special_out = 16'h7e00;
          10'h279: special_out = 16'h7e00;
          10'h27a: special_out = 16'h7e00;
          10'h27b: special_out = 16'h7e00;
          10'h27c: special_out = 16'h7e00;
          10'h27d: special_out = 16'h7e00;
          10'h27e: special_out = 16'h7e00;
          10'h27f: special_out = 16'h7e00;
          10'h280: special_out = 16'h7e00;
          10'h281: special_out = 16'h7e00;
          10'h282: special_out = 16'h7e00;
          10'h283: special_out = 16'h7e00;
          10'h284: special_out = 16'h7e00;
          10'h285: special_out = 16'h7e00;
          10'h286: special_out = 16'h7e00;
          10'h287: special_out = 16'h7e00;
          10'h288: special_out = 16'h7e00;
          10'h289: special_out = 16'h7e00;
          10'h28a: special_out = 16'h7e00;
          10'h28b: special_out = 16'h7e00;
          10'h28c: special_out = 16'h7e00;
          10'h28d: special_out = 16'h7e00;
          10'h28e: special_out = 16'h7e00;
          10'h28f: special_out = 16'h7e00;
          10'h290: special_out = 16'h7e00;
          10'h291: special_out = 16'h7e00;
          10'h292: special_out = 16'h7e00;
          10'h293: special_out = 16'h7e00;
          10'h294: special_out = 16'h7e00;
          10'h295: special_out = 16'h7e00;
          10'h296: special_out = 16'h7e00;
          10'h297: special_out = 16'h7e00;
          10'h298: special_out = 16'h7e00;
          10'h299: special_out = 16'h7e00;
          10'h29a: special_out = 16'h7e00;
          10'h29b: special_out = 16'h7e00;
          10'h29c: special_out = 16'h7e00;
          10'h29d: special_out = 16'h7e00;
          10'h29e: special_out = 16'h7e00;
          10'h29f: special_out = 16'h7e00;
          10'h2a0: special_out = 16'h7e00;
          10'h2a1: special_out = 16'h7e00;
          10'h2a2: special_out = 16'h7e00;
          10'h2a3: special_out = 16'h7e00;
          10'h2a4: special_out = 16'h7e00;
          10'h2a5: special_out = 16'h7e00;
          10'h2a6: special_out = 16'h7e00;
          10'h2a7: special_out = 16'h7e00;
          10'h2a8: special_out = 16'h7e00;
          10'h2a9: special_out = 16'h7e00;
          10'h2aa: special_out = 16'h7e00;
          10'h2ab: special_out = 16'h7e00;
          10'h2ac: special_out = 16'h7e00;
          10'h2ad: special_out = 16'h7e00;
          10'h2ae: special_out = 16'h7e00;
          10'h2af: special_out = 16'h7e00;
          10'h2b0: special_out = 16'h7e00;
          10'h2b1: special_out = 16'h7e00;
          10'h2b2: special_out = 16'h7e00;
          10'h2b3: special_out = 16'h7e00;
          10'h2b4: special_out = 16'h7e00;
          10'h2b5: special_out = 16'h7e00;
          10'h2b6: special_out = 16'h7e00;
          10'h2b7: special_out = 16'h7e00;
          10'h2b8: special_out = 16'h7e00;
          10'h2b9: special_out = 16'h7e00;
          10'h2ba: special_out = 16'h7e00;
          10'h2bb: special_out = 16'h7e00;
          10'h2bc: special_out = 16'h7e00;
          10'h2bd: special_out = 16'h7e00;
          10'h2be: special_out = 16'h7e00;
          10'h2bf: special_out = 16'h7e00;
          10'h2c0: special_out = 16'h7e00;
          10'h2c1: special_out = 16'h7e00;
          10'h2c2: special_out = 16'h7e00;
          10'h2c3: special_out = 16'h7e00;
          10'h2c4: special_out = 16'h7e00;
          10'h2c5: special_out = 16'h7e00;
          10'h2c6: special_out = 16'h7e00;
          10'h2c7: special_out = 16'h7e00;
          10'h2c8: special_out = 16'h7e00;
          10'h2c9: special_out = 16'h7e00;
          10'h2ca: special_out = 16'h7e00;
          10'h2cb: special_out = 16'h7e00;
          10'h2cc: special_out = 16'h7e00;
          10'h2cd: special_out = 16'h7e00;
          10'h2ce: special_out = 16'h7e00;
          10'h2cf: special_out = 16'h7e00;
          10'h2d0: special_out = 16'h7e00;
          10'h2d1: special_out = 16'h7e00;
          10'h2d2: special_out = 16'h7e00;
          10'h2d3: special_out = 16'h7e00;
          10'h2d4: special_out = 16'h7e00;
          10'h2d5: special_out = 16'h7e00;
          10'h2d6: special_out = 16'h7e00;
          10'h2d7: special_out = 16'h7e00;
          10'h2d8: special_out = 16'h7e00;
          10'h2d9: special_out = 16'h7e00;
          10'h2da: special_out = 16'h7e00;
          10'h2db: special_out = 16'h7e00;
          10'h2dc: special_out = 16'h7e00;
          10'h2dd: special_out = 16'h7e00;
          10'h2de: special_out = 16'h7e00;
          10'h2df: special_out = 16'h7e00;
          10'h2e0: special_out = 16'h7e00;
          10'h2e1: special_out = 16'h7e00;
          10'h2e2: special_out = 16'h7e00;
          10'h2e3: special_out = 16'h7e00;
          10'h2e4: special_out = 16'h7e00;
          10'h2e5: special_out = 16'h7e00;
          10'h2e6: special_out = 16'h7e00;
          10'h2e7: special_out = 16'h7e00;
          10'h2e8: special_out = 16'h7e00;
          10'h2e9: special_out = 16'h7e00;
          10'h2ea: special_out = 16'h7e00;
          10'h2eb: special_out = 16'h7e00;
          10'h2ec: special_out = 16'h7e00;
          10'h2ed: special_out = 16'h7e00;
          10'h2ee: special_out = 16'h7e00;
          10'h2ef: special_out = 16'h7e00;
          10'h2f0: special_out = 16'h7e00;
          10'h2f1: special_out = 16'h7e00;
          10'h2f2: special_out = 16'h7e00;
          10'h2f3: special_out = 16'h7e00;
          10'h2f4: special_out = 16'h7e00;
          10'h2f5: special_out = 16'h7e00;
          10'h2f6: special_out = 16'h7e00;
          10'h2f7: special_out = 16'h7e00;
          10'h2f8: special_out = 16'h7e00;
          10'h2f9: special_out = 16'h7e00;
          10'h2fa: special_out = 16'h7e00;
          10'h2fb: special_out = 16'h7e00;
          10'h2fc: special_out = 16'h7e00;
          10'h2fd: special_out = 16'h7e00;
          10'h2fe: special_out = 16'h7e00;
          10'h2ff: special_out = 16'h7e00;
          10'h300: special_out = 16'h7e00;
          10'h301: special_out = 16'h7e00;
          10'h302: special_out = 16'h7e00;
          10'h303: special_out = 16'h7e00;
          10'h304: special_out = 16'h7e00;
          10'h305: special_out = 16'h7e00;
          10'h306: special_out = 16'h7e00;
          10'h307: special_out = 16'h7e00;
          10'h308: special_out = 16'h7e00;
          10'h309: special_out = 16'h7e00;
          10'h30a: special_out = 16'h7e00;
          10'h30b: special_out = 16'h7e00;
          10'h30c: special_out = 16'h7e00;
          10'h30d: special_out = 16'h7e00;
          10'h30e: special_out = 16'h7e00;
          10'h30f: special_out = 16'h7e00;
          10'h310: special_out = 16'h7e00;
          10'h311: special_out = 16'h7e00;
          10'h312: special_out = 16'h7e00;
          10'h313: special_out = 16'h7e00;
          10'h314: special_out = 16'h7e00;
          10'h315: special_out = 16'h7e00;
          10'h316: special_out = 16'h7e00;
          10'h317: special_out = 16'h7e00;
          10'h318: special_out = 16'h7e00;
          10'h319: special_out = 16'h7e00;
          10'h31a: special_out = 16'h7e00;
          10'h31b: special_out = 16'h7e00;
          10'h31c: special_out = 16'h7e00;
          10'h31d: special_out = 16'h7e00;
          10'h31e: special_out = 16'h7e00;
          10'h31f: special_out = 16'h7e00;
          10'h320: special_out = 16'h7e00;
          10'h321: special_out = 16'h7e00;
          10'h322: special_out = 16'h7e00;
          10'h323: special_out = 16'h7e00;
          10'h324: special_out = 16'h7e00;
          10'h325: special_out = 16'h7e00;
          10'h326: special_out = 16'h7e00;
          10'h327: special_out = 16'h7e00;
          10'h328: special_out = 16'h7e00;
          10'h329: special_out = 16'h7e00;
          10'h32a: special_out = 16'h7e00;
          10'h32b: special_out = 16'h7e00;
          10'h32c: special_out = 16'h7e00;
          10'h32d: special_out = 16'h7e00;
          10'h32e: special_out = 16'h7e00;
          10'h32f: special_out = 16'h7e00;
          10'h330: special_out = 16'h7e00;
          10'h331: special_out = 16'h7e00;
          10'h332: special_out = 16'h7e00;
          10'h333: special_out = 16'h7e00;
          10'h334: special_out = 16'h7e00;
          10'h335: special_out = 16'h7e00;
          10'h336: special_out = 16'h7e00;
          10'h337: special_out = 16'h7e00;
          10'h338: special_out = 16'h7e00;
          10'h339: special_out = 16'h7e00;
          10'h33a: special_out = 16'h7e00;
          10'h33b: special_out = 16'h7e00;
          10'h33c: special_out = 16'h7e00;
          10'h33d: special_out = 16'h7e00;
          10'h33e: special_out = 16'h7e00;
          10'h33f: special_out = 16'h7e00;
          10'h340: special_out = 16'h7e00;
          10'h341: special_out = 16'h7e00;
          10'h342: special_out = 16'h7e00;
          10'h343: special_out = 16'h7e00;
          10'h344: special_out = 16'h7e00;
          10'h345: special_out = 16'h7e00;
          10'h346: special_out = 16'h7e00;
          10'h347: special_out = 16'h7e00;
          10'h348: special_out = 16'h7e00;
          10'h349: special_out = 16'h7e00;
          10'h34a: special_out = 16'h7e00;
          10'h34b: special_out = 16'h7e00;
          10'h34c: special_out = 16'h7e00;
          10'h34d: special_out = 16'h7e00;
          10'h34e: special_out = 16'h7e00;
          10'h34f: special_out = 16'h7e00;
          10'h350: special_out = 16'h7e00;
          10'h351: special_out = 16'h7e00;
          10'h352: special_out = 16'h7e00;
          10'h353: special_out = 16'h7e00;
          10'h354: special_out = 16'h7e00;
          10'h355: special_out = 16'h7e00;
          10'h356: special_out = 16'h7e00;
          10'h357: special_out = 16'h7e00;
          10'h358: special_out = 16'h7e00;
          10'h359: special_out = 16'h7e00;
          10'h35a: special_out = 16'h7e00;
          10'h35b: special_out = 16'h7e00;
          10'h35c: special_out = 16'h7e00;
          10'h35d: special_out = 16'h7e00;
          10'h35e: special_out = 16'h7e00;
          10'h35f: special_out = 16'h7e00;
          10'h360: special_out = 16'h7e00;
          10'h361: special_out = 16'h7e00;
          10'h362: special_out = 16'h7e00;
          10'h363: special_out = 16'h7e00;
          10'h364: special_out = 16'h7e00;
          10'h365: special_out = 16'h7e00;
          10'h366: special_out = 16'h7e00;
          10'h367: special_out = 16'h7e00;
          10'h368: special_out = 16'h7e00;
          10'h369: special_out = 16'h7e00;
          10'h36a: special_out = 16'h7e00;
          10'h36b: special_out = 16'h7e00;
          10'h36c: special_out = 16'h7e00;
          10'h36d: special_out = 16'h7e00;
          10'h36e: special_out = 16'h7e00;
          10'h36f: special_out = 16'h7e00;
          10'h370: special_out = 16'h7e00;
          10'h371: special_out = 16'h7e00;
          10'h372: special_out = 16'h7e00;
          10'h373: special_out = 16'h7e00;
          10'h374: special_out = 16'h7e00;
          10'h375: special_out = 16'h7e00;
          10'h376: special_out = 16'h7e00;
          10'h377: special_out = 16'h7e00;
          10'h378: special_out = 16'h7e00;
          10'h379: special_out = 16'h7e00;
          10'h37a: special_out = 16'h7e00;
          10'h37b: special_out = 16'h7e00;
          10'h37c: special_out = 16'h7e00;
          10'h37d: special_out = 16'h7e00;
          10'h37e: special_out = 16'h7e00;
          10'h37f: special_out = 16'h7e00;
          10'h380: special_out = 16'h7e00;
          10'h381: special_out = 16'h7e00;
          10'h382: special_out = 16'h7e00;
          10'h383: special_out = 16'h7e00;
          10'h384: special_out = 16'h7e00;
          10'h385: special_out = 16'h7e00;
          10'h386: special_out = 16'h7e00;
          10'h387: special_out = 16'h7e00;
          10'h388: special_out = 16'h7e00;
          10'h389: special_out = 16'h7e00;
          10'h38a: special_out = 16'h7e00;
          10'h38b: special_out = 16'h7e00;
          10'h38c: special_out = 16'h7e00;
          10'h38d: special_out = 16'h7e00;
          10'h38e: special_out = 16'h7e00;
          10'h38f: special_out = 16'h7e00;
          10'h390: special_out = 16'h7e00;
          10'h391: special_out = 16'h7e00;
          10'h392: special_out = 16'h7e00;
          10'h393: special_out = 16'h7e00;
          10'h394: special_out = 16'h7e00;
          10'h395: special_out = 16'h7e00;
          10'h396: special_out = 16'h7e00;
          10'h397: special_out = 16'h7e00;
          10'h398: special_out = 16'h7e00;
          10'h399: special_out = 16'h7e00;
          10'h39a: special_out = 16'h7e00;
          10'h39b: special_out = 16'h7e00;
          10'h39c: special_out = 16'h7e00;
          10'h39d: special_out = 16'h7e00;
          10'h39e: special_out = 16'h7e00;
          10'h39f: special_out = 16'h7e00;
          10'h3a0: special_out = 16'h7e00;
          10'h3a1: special_out = 16'h7e00;
          10'h3a2: special_out = 16'h7e00;
          10'h3a3: special_out = 16'h7e00;
          10'h3a4: special_out = 16'h7e00;
          10'h3a5: special_out = 16'h7e00;
          10'h3a6: special_out = 16'h7e00;
          10'h3a7: special_out = 16'h7e00;
          10'h3a8: special_out = 16'h7e00;
          10'h3a9: special_out = 16'h7e00;
          10'h3aa: special_out = 16'h7e00;
          10'h3ab: special_out = 16'h7e00;
          10'h3ac: special_out = 16'h7e00;
          10'h3ad: special_out = 16'h7e00;
          10'h3ae: special_out = 16'h7e00;
          10'h3af: special_out = 16'h7e00;
          10'h3b0: special_out = 16'h7e00;
          10'h3b1: special_out = 16'h7e00;
          10'h3b2: special_out = 16'h7e00;
          10'h3b3: special_out = 16'h7e00;
          10'h3b4: special_out = 16'h7e00;
          10'h3b5: special_out = 16'h7e00;
          10'h3b6: special_out = 16'h7e00;
          10'h3b7: special_out = 16'h7e00;
          10'h3b8: special_out = 16'h7e00;
          10'h3b9: special_out = 16'h7e00;
          10'h3ba: special_out = 16'h7e00;
          10'h3bb: special_out = 16'h7e00;
          10'h3bc: special_out = 16'h7e00;
          10'h3bd: special_out = 16'h7e00;
          10'h3be: special_out = 16'h7e00;
          10'h3bf: special_out = 16'h7e00;
          10'h3c0: special_out = 16'h7e00;
          10'h3c1: special_out = 16'h7e00;
          10'h3c2: special_out = 16'h7e00;
          10'h3c3: special_out = 16'h7e00;
          10'h3c4: special_out = 16'h7e00;
          10'h3c5: special_out = 16'h7e00;
          10'h3c6: special_out = 16'h7e00;
          10'h3c7: special_out = 16'h7e00;
          10'h3c8: special_out = 16'h7e00;
          10'h3c9: special_out = 16'h7e00;
          10'h3ca: special_out = 16'h7e00;
          10'h3cb: special_out = 16'h7e00;
          10'h3cc: special_out = 16'h7e00;
          10'h3cd: special_out = 16'h7e00;
          10'h3ce: special_out = 16'h7e00;
          10'h3cf: special_out = 16'h7e00;
          10'h3d0: special_out = 16'h7e00;
          10'h3d1: special_out = 16'h7e00;
          10'h3d2: special_out = 16'h7e00;
          10'h3d3: special_out = 16'h7e00;
          10'h3d4: special_out = 16'h7e00;
          10'h3d5: special_out = 16'h7e00;
          10'h3d6: special_out = 16'h7e00;
          10'h3d7: special_out = 16'h7e00;
          10'h3d8: special_out = 16'h7e00;
          10'h3d9: special_out = 16'h7e00;
          10'h3da: special_out = 16'h7e00;
          10'h3db: special_out = 16'h7e00;
          10'h3dc: special_out = 16'h7e00;
          10'h3dd: special_out = 16'h7e00;
          10'h3de: special_out = 16'h7e00;
          10'h3df: special_out = 16'h7e00;
          10'h3e0: special_out = 16'h7e00;
          10'h3e1: special_out = 16'h7e00;
          10'h3e2: special_out = 16'h7e00;
          10'h3e3: special_out = 16'h7e00;
          10'h3e4: special_out = 16'h7e00;
          10'h3e5: special_out = 16'h7e00;
          10'h3e6: special_out = 16'h7e00;
          10'h3e7: special_out = 16'h7e00;
          10'h3e8: special_out = 16'h7e00;
          10'h3e9: special_out = 16'h7e00;
          10'h3ea: special_out = 16'h7e00;
          10'h3eb: special_out = 16'h7e00;
          10'h3ec: special_out = 16'h7e00;
          10'h3ed: special_out = 16'h7e00;
          10'h3ee: special_out = 16'h7e00;
          10'h3ef: special_out = 16'h7e00;
          10'h3f0: special_out = 16'h7e00;
          10'h3f1: special_out = 16'h7e00;
          10'h3f2: special_out = 16'h7e00;
          10'h3f3: special_out = 16'h7e00;
          10'h3f4: special_out = 16'h7e00;
          10'h3f5: special_out = 16'h7e00;
          10'h3f6: special_out = 16'h7e00;
          10'h3f7: special_out = 16'h7e00;
          10'h3f8: special_out = 16'h7e00;
          10'h3f9: special_out = 16'h7e00;
          10'h3fa: special_out = 16'h7e00;
          10'h3fb: special_out = 16'h7e00;
          10'h3fc: special_out = 16'h7e00;
          10'h3fd: special_out = 16'h7e00;
          10'h3fe: special_out = 16'h7e00;
          10'h3ff: special_out = 16'h7e00;
          default: special_out = 16'h0000;
        endcase
      end
      default: begin end
    endcase
  end
  reg [15:0] boundary_word;
  always @* begin
    boundary_word = 16'h0000;
    case (exp)
      5'h07: begin
        case (mant[9:4])
          6'h00: begin
            boundary_word = 16'h7bc5;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7c00;
              4'h1: boundary_word = 16'h7bfc;
              4'h2: boundary_word = 16'h7bf8;
              4'h3: boundary_word = 16'h7bf4;
              4'h4: boundary_word = 16'h7bf0;
              4'h5: boundary_word = 16'h7bec;
              4'h6: boundary_word = 16'h7be8;
              4'h7: boundary_word = 16'h7be4;
              4'h8: boundary_word = 16'h7be0;
              4'h9: boundary_word = 16'h7bdc;
              4'ha: boundary_word = 16'h7bd9;
              4'hb: boundary_word = 16'h7bd5;
              4'hc: boundary_word = 16'h7bd1;
              4'hd: boundary_word = 16'h7bcd;
              4'he: boundary_word = 16'h7bc9;
              default: begin end
            endcase
          end
          6'h01: begin
            boundary_word = 16'h7b89;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7bc1;
              4'h1: boundary_word = 16'h7bbe;
              4'h2: boundary_word = 16'h7bba;
              4'h3: boundary_word = 16'h7bb6;
              4'h4: boundary_word = 16'h7bb2;
              4'h5: boundary_word = 16'h7baf;
              4'h6: boundary_word = 16'h7bab;
              4'h7: boundary_word = 16'h7ba7;
              4'h8: boundary_word = 16'h7ba3;
              4'h9: boundary_word = 16'h7ba0;
              4'ha: boundary_word = 16'h7b9c;
              4'hb: boundary_word = 16'h7b98;
              4'hc: boundary_word = 16'h7b94;
              4'hd: boundary_word = 16'h7b91;
              4'he: boundary_word = 16'h7b8d;
              default: begin end
            endcase
          end
          6'h02: begin
            boundary_word = 16'h7b50;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7b86;
              4'h1: boundary_word = 16'h7b82;
              4'h2: boundary_word = 16'h7b7e;
              4'h3: boundary_word = 16'h7b7b;
              4'h4: boundary_word = 16'h7b77;
              4'h5: boundary_word = 16'h7b74;
              4'h6: boundary_word = 16'h7b70;
              4'h7: boundary_word = 16'h7b6c;
              4'h8: boundary_word = 16'h7b69;
              4'h9: boundary_word = 16'h7b65;
              4'ha: boundary_word = 16'h7b62;
              4'hb: boundary_word = 16'h7b5e;
              4'hc: boundary_word = 16'h7b5b;
              4'hd: boundary_word = 16'h7b57;
              4'he: boundary_word = 16'h7b54;
              default: begin end
            endcase
          end
          6'h03: begin
            boundary_word = 16'h7b19;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7b4d;
              4'h1: boundary_word = 16'h7b49;
              4'h2: boundary_word = 16'h7b46;
              4'h3: boundary_word = 16'h7b42;
              4'h4: boundary_word = 16'h7b3f;
              4'h5: boundary_word = 16'h7b3b;
              4'h6: boundary_word = 16'h7b38;
              4'h7: boundary_word = 16'h7b35;
              4'h8: boundary_word = 16'h7b31;
              4'h9: boundary_word = 16'h7b2e;
              4'ha: boundary_word = 16'h7b2a;
              4'hb: boundary_word = 16'h7b27;
              4'hc: boundary_word = 16'h7b24;
              4'hd: boundary_word = 16'h7b20;
              4'he: boundary_word = 16'h7b1d;
              default: begin end
            endcase
          end
          6'h04: begin
            boundary_word = 16'h7ae5;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7b16;
              4'h1: boundary_word = 16'h7b13;
              4'h2: boundary_word = 16'h7b0f;
              4'h3: boundary_word = 16'h7b0c;
              4'h4: boundary_word = 16'h7b09;
              4'h5: boundary_word = 16'h7b06;
              4'h6: boundary_word = 16'h7b02;
              4'h7: boundary_word = 16'h7aff;
              4'h8: boundary_word = 16'h7afc;
              4'h9: boundary_word = 16'h7af9;
              4'ha: boundary_word = 16'h7af5;
              4'hb: boundary_word = 16'h7af2;
              4'hc: boundary_word = 16'h7aef;
              4'hd: boundary_word = 16'h7aec;
              4'he: boundary_word = 16'h7ae8;
              default: begin end
            endcase
          end
          6'h05: begin
            boundary_word = 16'h7ab3;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7ae2;
              4'h1: boundary_word = 16'h7adf;
              4'h2: boundary_word = 16'h7adc;
              4'h3: boundary_word = 16'h7ad8;
              4'h4: boundary_word = 16'h7ad5;
              4'h5: boundary_word = 16'h7ad2;
              4'h6: boundary_word = 16'h7acf;
              4'h7: boundary_word = 16'h7acc;
              4'h8: boundary_word = 16'h7ac9;
              4'h9: boundary_word = 16'h7ac6;
              4'ha: boundary_word = 16'h7ac2;
              4'hb: boundary_word = 16'h7abf;
              4'hc: boundary_word = 16'h7abc;
              4'hd: boundary_word = 16'h7ab9;
              4'he: boundary_word = 16'h7ab6;
              default: begin end
            endcase
          end
          6'h06: begin
            boundary_word = 16'h7a83;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7ab0;
              4'h1: boundary_word = 16'h7aad;
              4'h2: boundary_word = 16'h7aaa;
              4'h3: boundary_word = 16'h7aa7;
              4'h4: boundary_word = 16'h7aa4;
              4'h5: boundary_word = 16'h7aa1;
              4'h6: boundary_word = 16'h7a9e;
              4'h7: boundary_word = 16'h7a9b;
              4'h8: boundary_word = 16'h7a98;
              4'h9: boundary_word = 16'h7a95;
              4'ha: boundary_word = 16'h7a92;
              4'hb: boundary_word = 16'h7a8f;
              4'hc: boundary_word = 16'h7a8c;
              4'hd: boundary_word = 16'h7a89;
              4'he: boundary_word = 16'h7a86;
              default: begin end
            endcase
          end
          6'h07: begin
            boundary_word = 16'h7a55;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7a80;
              4'h1: boundary_word = 16'h7a7d;
              4'h2: boundary_word = 16'h7a7a;
              4'h3: boundary_word = 16'h7a77;
              4'h4: boundary_word = 16'h7a74;
              4'h5: boundary_word = 16'h7a72;
              4'h6: boundary_word = 16'h7a6f;
              4'h7: boundary_word = 16'h7a6c;
              4'h8: boundary_word = 16'h7a69;
              4'h9: boundary_word = 16'h7a66;
              4'ha: boundary_word = 16'h7a63;
              4'hb: boundary_word = 16'h7a60;
              4'hc: boundary_word = 16'h7a5d;
              4'hd: boundary_word = 16'h7a5b;
              4'he: boundary_word = 16'h7a58;
              default: begin end
            endcase
          end
          6'h08: begin
            boundary_word = 16'h7a29;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7a52;
              4'h1: boundary_word = 16'h7a4f;
              4'h2: boundary_word = 16'h7a4d;
              4'h3: boundary_word = 16'h7a4a;
              4'h4: boundary_word = 16'h7a47;
              4'h5: boundary_word = 16'h7a44;
              4'h6: boundary_word = 16'h7a41;
              4'h7: boundary_word = 16'h7a3f;
              4'h8: boundary_word = 16'h7a3c;
              4'h9: boundary_word = 16'h7a39;
              4'ha: boundary_word = 16'h7a36;
              4'hb: boundary_word = 16'h7a34;
              4'hc: boundary_word = 16'h7a31;
              4'hd: boundary_word = 16'h7a2e;
              4'he: boundary_word = 16'h7a2c;
              default: begin end
            endcase
          end
          6'h09: begin
            boundary_word = 16'h79fe;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7a26;
              4'h1: boundary_word = 16'h7a23;
              4'h2: boundary_word = 16'h7a21;
              4'h3: boundary_word = 16'h7a1e;
              4'h4: boundary_word = 16'h7a1b;
              4'h5: boundary_word = 16'h7a19;
              4'h6: boundary_word = 16'h7a16;
              4'h7: boundary_word = 16'h7a13;
              4'h8: boundary_word = 16'h7a11;
              4'h9: boundary_word = 16'h7a0e;
              4'ha: boundary_word = 16'h7a0c;
              4'hb: boundary_word = 16'h7a09;
              4'hc: boundary_word = 16'h7a06;
              4'hd: boundary_word = 16'h7a04;
              4'he: boundary_word = 16'h7a01;
              default: begin end
            endcase
          end
          6'h0a: begin
            boundary_word = 16'h79d6;
            case (mant[3:0])
              4'h0: boundary_word = 16'h79fc;
              4'h1: boundary_word = 16'h79f9;
              4'h2: boundary_word = 16'h79f7;
              4'h3: boundary_word = 16'h79f4;
              4'h4: boundary_word = 16'h79f2;
              4'h5: boundary_word = 16'h79ef;
              4'h6: boundary_word = 16'h79ec;
              4'h7: boundary_word = 16'h79ea;
              4'h8: boundary_word = 16'h79e7;
              4'h9: boundary_word = 16'h79e5;
              4'ha: boundary_word = 16'h79e2;
              4'hb: boundary_word = 16'h79e0;
              4'hc: boundary_word = 16'h79dd;
              4'hd: boundary_word = 16'h79db;
              4'he: boundary_word = 16'h79d8;
              default: begin end
            endcase
          end
          6'h0b: begin
            boundary_word = 16'h79af;
            case (mant[3:0])
              4'h0: boundary_word = 16'h79d3;
              4'h1: boundary_word = 16'h79d1;
              4'h2: boundary_word = 16'h79ce;
              4'h3: boundary_word = 16'h79cc;
              4'h4: boundary_word = 16'h79c9;
              4'h5: boundary_word = 16'h79c7;
              4'h6: boundary_word = 16'h79c5;
              4'h7: boundary_word = 16'h79c2;
              4'h8: boundary_word = 16'h79c0;
              4'h9: boundary_word = 16'h79bd;
              4'ha: boundary_word = 16'h79bb;
              4'hb: boundary_word = 16'h79b8;
              4'hc: boundary_word = 16'h79b6;
              4'hd: boundary_word = 16'h79b4;
              4'he: boundary_word = 16'h79b1;
              default: begin end
            endcase
          end
          6'h0c: begin
            boundary_word = 16'h7989;
            case (mant[3:0])
              4'h0: boundary_word = 16'h79ac;
              4'h1: boundary_word = 16'h79aa;
              4'h2: boundary_word = 16'h79a8;
              4'h3: boundary_word = 16'h79a5;
              4'h4: boundary_word = 16'h79a3;
              4'h5: boundary_word = 16'h79a0;
              4'h6: boundary_word = 16'h799e;
              4'h7: boundary_word = 16'h799c;
              4'h8: boundary_word = 16'h7999;
              4'h9: boundary_word = 16'h7997;
              4'ha: boundary_word = 16'h7995;
              4'hb: boundary_word = 16'h7992;
              4'hc: boundary_word = 16'h7990;
              4'hd: boundary_word = 16'h798e;
              4'he: boundary_word = 16'h798b;
              default: begin end
            endcase
          end
          6'h0d: begin
            boundary_word = 16'h7965;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7987;
              4'h1: boundary_word = 16'h7985;
              4'h2: boundary_word = 16'h7982;
              4'h3: boundary_word = 16'h7980;
              4'h4: boundary_word = 16'h797e;
              4'h5: boundary_word = 16'h797b;
              4'h6: boundary_word = 16'h7979;
              4'h7: boundary_word = 16'h7977;
              4'h8: boundary_word = 16'h7975;
              4'h9: boundary_word = 16'h7972;
              4'ha: boundary_word = 16'h7970;
              4'hb: boundary_word = 16'h796e;
              4'hc: boundary_word = 16'h796c;
              4'hd: boundary_word = 16'h7969;
              4'he: boundary_word = 16'h7967;
              default: begin end
            endcase
          end
          6'h0e: begin
            boundary_word = 16'h7942;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7963;
              4'h1: boundary_word = 16'h7961;
              4'h2: boundary_word = 16'h795e;
              4'h3: boundary_word = 16'h795c;
              4'h4: boundary_word = 16'h795a;
              4'h5: boundary_word = 16'h7958;
              4'h6: boundary_word = 16'h7956;
              4'h7: boundary_word = 16'h7953;
              4'h8: boundary_word = 16'h7951;
              4'h9: boundary_word = 16'h794f;
              4'ha: boundary_word = 16'h794d;
              4'hb: boundary_word = 16'h794b;
              4'hc: boundary_word = 16'h7949;
              4'hd: boundary_word = 16'h7947;
              4'he: boundary_word = 16'h7944;
              default: begin end
            endcase
          end
          6'h0f: begin
            boundary_word = 16'h7921;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7940;
              4'h1: boundary_word = 16'h793e;
              4'h2: boundary_word = 16'h793c;
              4'h3: boundary_word = 16'h793a;
              4'h4: boundary_word = 16'h7938;
              4'h5: boundary_word = 16'h7936;
              4'h6: boundary_word = 16'h7933;
              4'h7: boundary_word = 16'h7931;
              4'h8: boundary_word = 16'h792f;
              4'h9: boundary_word = 16'h792d;
              4'ha: boundary_word = 16'h792b;
              4'hb: boundary_word = 16'h7929;
              4'hc: boundary_word = 16'h7927;
              4'hd: boundary_word = 16'h7925;
              4'he: boundary_word = 16'h7923;
              default: begin end
            endcase
          end
          6'h10: begin
            boundary_word = 16'h7901;
            case (mant[3:0])
              4'h0: boundary_word = 16'h791f;
              4'h1: boundary_word = 16'h791d;
              4'h2: boundary_word = 16'h791b;
              4'h3: boundary_word = 16'h7919;
              4'h4: boundary_word = 16'h7917;
              4'h5: boundary_word = 16'h7915;
              4'h6: boundary_word = 16'h7913;
              4'h7: boundary_word = 16'h7911;
              4'h8: boundary_word = 16'h790e;
              4'h9: boundary_word = 16'h790c;
              4'ha: boundary_word = 16'h790a;
              4'hb: boundary_word = 16'h7908;
              4'hc: boundary_word = 16'h7906;
              4'hd: boundary_word = 16'h7904;
              4'he: boundary_word = 16'h7903;
              default: begin end
            endcase
          end
          6'h11: begin
            boundary_word = 16'h78e1;
            case (mant[3:0])
              4'h0: boundary_word = 16'h78ff;
              4'h1: boundary_word = 16'h78fd;
              4'h2: boundary_word = 16'h78fb;
              4'h3: boundary_word = 16'h78f9;
              4'h4: boundary_word = 16'h78f7;
              4'h5: boundary_word = 16'h78f5;
              4'h6: boundary_word = 16'h78f3;
              4'h7: boundary_word = 16'h78f1;
              4'h8: boundary_word = 16'h78ef;
              4'h9: boundary_word = 16'h78ed;
              4'ha: boundary_word = 16'h78eb;
              4'hb: boundary_word = 16'h78e9;
              4'hc: boundary_word = 16'h78e7;
              4'hd: boundary_word = 16'h78e5;
              4'he: boundary_word = 16'h78e3;
              default: begin end
            endcase
          end
          6'h12: begin
            boundary_word = 16'h78c4;
            case (mant[3:0])
              4'h0: boundary_word = 16'h78e0;
              4'h1: boundary_word = 16'h78de;
              4'h2: boundary_word = 16'h78dc;
              4'h3: boundary_word = 16'h78da;
              4'h4: boundary_word = 16'h78d8;
              4'h5: boundary_word = 16'h78d6;
              4'h6: boundary_word = 16'h78d4;
              4'h7: boundary_word = 16'h78d2;
              4'h8: boundary_word = 16'h78d0;
              4'h9: boundary_word = 16'h78cf;
              4'ha: boundary_word = 16'h78cd;
              4'hb: boundary_word = 16'h78cb;
              4'hc: boundary_word = 16'h78c9;
              4'hd: boundary_word = 16'h78c7;
              4'he: boundary_word = 16'h78c5;
              default: begin end
            endcase
          end
          6'h13: begin
            boundary_word = 16'h78a7;
            case (mant[3:0])
              4'h0: boundary_word = 16'h78c2;
              4'h1: boundary_word = 16'h78c0;
              4'h2: boundary_word = 16'h78be;
              4'h3: boundary_word = 16'h78bc;
              4'h4: boundary_word = 16'h78ba;
              4'h5: boundary_word = 16'h78b9;
              4'h6: boundary_word = 16'h78b7;
              4'h7: boundary_word = 16'h78b5;
              4'h8: boundary_word = 16'h78b3;
              4'h9: boundary_word = 16'h78b1;
              4'ha: boundary_word = 16'h78b0;
              4'hb: boundary_word = 16'h78ae;
              4'hc: boundary_word = 16'h78ac;
              4'hd: boundary_word = 16'h78aa;
              4'he: boundary_word = 16'h78a8;
              default: begin end
            endcase
          end
          6'h14: begin
            boundary_word = 16'h788b;
            case (mant[3:0])
              4'h0: boundary_word = 16'h78a5;
              4'h1: boundary_word = 16'h78a3;
              4'h2: boundary_word = 16'h78a1;
              4'h3: boundary_word = 16'h78a0;
              4'h4: boundary_word = 16'h789e;
              4'h5: boundary_word = 16'h789c;
              4'h6: boundary_word = 16'h789a;
              4'h7: boundary_word = 16'h7899;
              4'h8: boundary_word = 16'h7897;
              4'h9: boundary_word = 16'h7895;
              4'ha: boundary_word = 16'h7893;
              4'hb: boundary_word = 16'h7892;
              4'hc: boundary_word = 16'h7890;
              4'hd: boundary_word = 16'h788e;
              4'he: boundary_word = 16'h788c;
              default: begin end
            endcase
          end
          6'h15: begin
            boundary_word = 16'h7870;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7889;
              4'h1: boundary_word = 16'h7887;
              4'h2: boundary_word = 16'h7886;
              4'h3: boundary_word = 16'h7884;
              4'h4: boundary_word = 16'h7882;
              4'h5: boundary_word = 16'h7881;
              4'h6: boundary_word = 16'h787f;
              4'h7: boundary_word = 16'h787d;
              4'h8: boundary_word = 16'h787c;
              4'h9: boundary_word = 16'h787a;
              4'ha: boundary_word = 16'h7878;
              4'hb: boundary_word = 16'h7876;
              4'hc: boundary_word = 16'h7875;
              4'hd: boundary_word = 16'h7873;
              4'he: boundary_word = 16'h7872;
              default: begin end
            endcase
          end
          6'h16: begin
            boundary_word = 16'h7856;
            case (mant[3:0])
              4'h0: boundary_word = 16'h786e;
              4'h1: boundary_word = 16'h786d;
              4'h2: boundary_word = 16'h786b;
              4'h3: boundary_word = 16'h7869;
              4'h4: boundary_word = 16'h7868;
              4'h5: boundary_word = 16'h7866;
              4'h6: boundary_word = 16'h7864;
              4'h7: boundary_word = 16'h7863;
              4'h8: boundary_word = 16'h7861;
              4'h9: boundary_word = 16'h7860;
              4'ha: boundary_word = 16'h785e;
              4'hb: boundary_word = 16'h785c;
              4'hc: boundary_word = 16'h785b;
              4'hd: boundary_word = 16'h7859;
              4'he: boundary_word = 16'h7857;
              default: begin end
            endcase
          end
          6'h17: begin
            boundary_word = 16'h783d;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7854;
              4'h1: boundary_word = 16'h7853;
              4'h2: boundary_word = 16'h7851;
              4'h3: boundary_word = 16'h7850;
              4'h4: boundary_word = 16'h784e;
              4'h5: boundary_word = 16'h784c;
              4'h6: boundary_word = 16'h784b;
              4'h7: boundary_word = 16'h7849;
              4'h8: boundary_word = 16'h7848;
              4'h9: boundary_word = 16'h7846;
              4'ha: boundary_word = 16'h7845;
              4'hb: boundary_word = 16'h7843;
              4'hc: boundary_word = 16'h7841;
              4'hd: boundary_word = 16'h7840;
              4'he: boundary_word = 16'h783e;
              default: begin end
            endcase
          end
          6'h18: begin
            boundary_word = 16'h7825;
            case (mant[3:0])
              4'h0: boundary_word = 16'h783b;
              4'h1: boundary_word = 16'h783a;
              4'h2: boundary_word = 16'h7838;
              4'h3: boundary_word = 16'h7837;
              4'h4: boundary_word = 16'h7835;
              4'h5: boundary_word = 16'h7834;
              4'h6: boundary_word = 16'h7832;
              4'h7: boundary_word = 16'h7831;
              4'h8: boundary_word = 16'h782f;
              4'h9: boundary_word = 16'h782e;
              4'ha: boundary_word = 16'h782c;
              4'hb: boundary_word = 16'h782b;
              4'hc: boundary_word = 16'h7829;
              4'hd: boundary_word = 16'h7828;
              4'he: boundary_word = 16'h7826;
              default: begin end
            endcase
          end
          6'h19: begin
            boundary_word = 16'h780d;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7823;
              4'h1: boundary_word = 16'h7822;
              4'h2: boundary_word = 16'h7820;
              4'h3: boundary_word = 16'h781f;
              4'h4: boundary_word = 16'h781d;
              4'h5: boundary_word = 16'h781c;
              4'h6: boundary_word = 16'h781a;
              4'h7: boundary_word = 16'h7819;
              4'h8: boundary_word = 16'h7817;
              4'h9: boundary_word = 16'h7816;
              4'ha: boundary_word = 16'h7814;
              4'hb: boundary_word = 16'h7813;
              4'hc: boundary_word = 16'h7811;
              4'hd: boundary_word = 16'h7810;
              4'he: boundary_word = 16'h780f;
              default: begin end
            endcase
          end
          6'h1a: begin
            boundary_word = 16'h77ed;
            case (mant[3:0])
              4'h0: boundary_word = 16'h780c;
              4'h1: boundary_word = 16'h780a;
              4'h2: boundary_word = 16'h7809;
              4'h3: boundary_word = 16'h7807;
              4'h4: boundary_word = 16'h7806;
              4'h5: boundary_word = 16'h7804;
              4'h6: boundary_word = 16'h7803;
              4'h7: boundary_word = 16'h7802;
              4'h8: boundary_word = 16'h7800;
              4'h9: boundary_word = 16'h77fe;
              4'ha: boundary_word = 16'h77fb;
              4'hb: boundary_word = 16'h77f8;
              4'hc: boundary_word = 16'h77f5;
              4'hd: boundary_word = 16'h77f2;
              4'he: boundary_word = 16'h77f0;
              default: begin end
            endcase
          end
          6'h1b: begin
            boundary_word = 16'h77c1;
            case (mant[3:0])
              4'h0: boundary_word = 16'h77ea;
              4'h1: boundary_word = 16'h77e7;
              4'h2: boundary_word = 16'h77e4;
              4'h3: boundary_word = 16'h77e2;
              4'h4: boundary_word = 16'h77df;
              4'h5: boundary_word = 16'h77dc;
              4'h6: boundary_word = 16'h77d9;
              4'h7: boundary_word = 16'h77d7;
              4'h8: boundary_word = 16'h77d4;
              4'h9: boundary_word = 16'h77d1;
              4'ha: boundary_word = 16'h77ce;
              4'hb: boundary_word = 16'h77cc;
              4'hc: boundary_word = 16'h77c9;
              4'hd: boundary_word = 16'h77c6;
              4'he: boundary_word = 16'h77c4;
              default: begin end
            endcase
          end
          6'h1c: begin
            boundary_word = 16'h7796;
            case (mant[3:0])
              4'h0: boundary_word = 16'h77be;
              4'h1: boundary_word = 16'h77bb;
              4'h2: boundary_word = 16'h77b9;
              4'h3: boundary_word = 16'h77b6;
              4'h4: boundary_word = 16'h77b3;
              4'h5: boundary_word = 16'h77b1;
              4'h6: boundary_word = 16'h77ae;
              4'h7: boundary_word = 16'h77ab;
              4'h8: boundary_word = 16'h77a9;
              4'h9: boundary_word = 16'h77a6;
              4'ha: boundary_word = 16'h77a4;
              4'hb: boundary_word = 16'h77a1;
              4'hc: boundary_word = 16'h779e;
              4'hd: boundary_word = 16'h779c;
              4'he: boundary_word = 16'h7799;
              default: begin end
            endcase
          end
          6'h1d: begin
            boundary_word = 16'h776d;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7794;
              4'h1: boundary_word = 16'h7791;
              4'h2: boundary_word = 16'h778f;
              4'h3: boundary_word = 16'h778c;
              4'h4: boundary_word = 16'h7789;
              4'h5: boundary_word = 16'h7787;
              4'h6: boundary_word = 16'h7784;
              4'h7: boundary_word = 16'h7782;
              4'h8: boundary_word = 16'h777f;
              4'h9: boundary_word = 16'h777d;
              4'ha: boundary_word = 16'h777a;
              4'hb: boundary_word = 16'h7777;
              4'hc: boundary_word = 16'h7775;
              4'hd: boundary_word = 16'h7772;
              4'he: boundary_word = 16'h7770;
              default: begin end
            endcase
          end
          6'h1e: begin
            boundary_word = 16'h7745;
            case (mant[3:0])
              4'h0: boundary_word = 16'h776b;
              4'h1: boundary_word = 16'h7768;
              4'h2: boundary_word = 16'h7766;
              4'h3: boundary_word = 16'h7763;
              4'h4: boundary_word = 16'h7761;
              4'h5: boundary_word = 16'h775e;
              4'h6: boundary_word = 16'h775c;
              4'h7: boundary_word = 16'h7759;
              4'h8: boundary_word = 16'h7757;
              4'h9: boundary_word = 16'h7754;
              4'ha: boundary_word = 16'h7752;
              4'hb: boundary_word = 16'h774f;
              4'hc: boundary_word = 16'h774d;
              4'hd: boundary_word = 16'h774a;
              4'he: boundary_word = 16'h7748;
              default: begin end
            endcase
          end
          6'h1f: begin
            boundary_word = 16'h771f;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7743;
              4'h1: boundary_word = 16'h7741;
              4'h2: boundary_word = 16'h773e;
              4'h3: boundary_word = 16'h773c;
              4'h4: boundary_word = 16'h7739;
              4'h5: boundary_word = 16'h7737;
              4'h6: boundary_word = 16'h7734;
              4'h7: boundary_word = 16'h7732;
              4'h8: boundary_word = 16'h7730;
              4'h9: boundary_word = 16'h772d;
              4'ha: boundary_word = 16'h772b;
              4'hb: boundary_word = 16'h7728;
              4'hc: boundary_word = 16'h7726;
              4'hd: boundary_word = 16'h7724;
              4'he: boundary_word = 16'h7721;
              default: begin end
            endcase
          end
          6'h20: begin
            boundary_word = 16'h76f9;
            case (mant[3:0])
              4'h0: boundary_word = 16'h771c;
              4'h1: boundary_word = 16'h771a;
              4'h2: boundary_word = 16'h7718;
              4'h3: boundary_word = 16'h7715;
              4'h4: boundary_word = 16'h7713;
              4'h5: boundary_word = 16'h7711;
              4'h6: boundary_word = 16'h770e;
              4'h7: boundary_word = 16'h770c;
              4'h8: boundary_word = 16'h770a;
              4'h9: boundary_word = 16'h7707;
              4'ha: boundary_word = 16'h7705;
              4'hb: boundary_word = 16'h7703;
              4'hc: boundary_word = 16'h7700;
              4'hd: boundary_word = 16'h76fe;
              4'he: boundary_word = 16'h76fc;
              default: begin end
            endcase
          end
          6'h21: begin
            boundary_word = 16'h76d5;
            case (mant[3:0])
              4'h0: boundary_word = 16'h76f7;
              4'h1: boundary_word = 16'h76f5;
              4'h2: boundary_word = 16'h76f3;
              4'h3: boundary_word = 16'h76f0;
              4'h4: boundary_word = 16'h76ee;
              4'h5: boundary_word = 16'h76ec;
              4'h6: boundary_word = 16'h76e9;
              4'h7: boundary_word = 16'h76e7;
              4'h8: boundary_word = 16'h76e5;
              4'h9: boundary_word = 16'h76e3;
              4'ha: boundary_word = 16'h76e0;
              4'hb: boundary_word = 16'h76de;
              4'hc: boundary_word = 16'h76dc;
              4'hd: boundary_word = 16'h76da;
              4'he: boundary_word = 16'h76d7;
              default: begin end
            endcase
          end
          6'h22: begin
            boundary_word = 16'h76b2;
            case (mant[3:0])
              4'h0: boundary_word = 16'h76d3;
              4'h1: boundary_word = 16'h76d1;
              4'h2: boundary_word = 16'h76ce;
              4'h3: boundary_word = 16'h76cc;
              4'h4: boundary_word = 16'h76ca;
              4'h5: boundary_word = 16'h76c8;
              4'h6: boundary_word = 16'h76c6;
              4'h7: boundary_word = 16'h76c3;
              4'h8: boundary_word = 16'h76c1;
              4'h9: boundary_word = 16'h76bf;
              4'ha: boundary_word = 16'h76bd;
              4'hb: boundary_word = 16'h76bb;
              4'hc: boundary_word = 16'h76b8;
              4'hd: boundary_word = 16'h76b6;
              4'he: boundary_word = 16'h76b4;
              default: begin end
            endcase
          end
          6'h23: begin
            boundary_word = 16'h7690;
            case (mant[3:0])
              4'h0: boundary_word = 16'h76b0;
              4'h1: boundary_word = 16'h76ae;
              4'h2: boundary_word = 16'h76ab;
              4'h3: boundary_word = 16'h76a9;
              4'h4: boundary_word = 16'h76a7;
              4'h5: boundary_word = 16'h76a5;
              4'h6: boundary_word = 16'h76a3;
              4'h7: boundary_word = 16'h76a1;
              4'h8: boundary_word = 16'h769f;
              4'h9: boundary_word = 16'h769c;
              4'ha: boundary_word = 16'h769a;
              4'hb: boundary_word = 16'h7698;
              4'hc: boundary_word = 16'h7696;
              4'hd: boundary_word = 16'h7694;
              4'he: boundary_word = 16'h7692;
              default: begin end
            endcase
          end
          6'h24: begin
            boundary_word = 16'h766f;
            case (mant[3:0])
              4'h0: boundary_word = 16'h768e;
              4'h1: boundary_word = 16'h768c;
              4'h2: boundary_word = 16'h768a;
              4'h3: boundary_word = 16'h7687;
              4'h4: boundary_word = 16'h7685;
              4'h5: boundary_word = 16'h7683;
              4'h6: boundary_word = 16'h7681;
              4'h7: boundary_word = 16'h767f;
              4'h8: boundary_word = 16'h767d;
              4'h9: boundary_word = 16'h767b;
              4'ha: boundary_word = 16'h7679;
              4'hb: boundary_word = 16'h7677;
              4'hc: boundary_word = 16'h7675;
              4'hd: boundary_word = 16'h7673;
              4'he: boundary_word = 16'h7671;
              default: begin end
            endcase
          end
          6'h25: begin
            boundary_word = 16'h764f;
            case (mant[3:0])
              4'h0: boundary_word = 16'h766d;
              4'h1: boundary_word = 16'h766b;
              4'h2: boundary_word = 16'h7669;
              4'h3: boundary_word = 16'h7667;
              4'h4: boundary_word = 16'h7665;
              4'h5: boundary_word = 16'h7663;
              4'h6: boundary_word = 16'h7661;
              4'h7: boundary_word = 16'h765f;
              4'h8: boundary_word = 16'h765d;
              4'h9: boundary_word = 16'h765a;
              4'ha: boundary_word = 16'h7658;
              4'hb: boundary_word = 16'h7657;
              4'hc: boundary_word = 16'h7655;
              4'hd: boundary_word = 16'h7653;
              4'he: boundary_word = 16'h7651;
              default: begin end
            endcase
          end
          6'h26: begin
            boundary_word = 16'h762f;
            case (mant[3:0])
              4'h0: boundary_word = 16'h764d;
              4'h1: boundary_word = 16'h764b;
              4'h2: boundary_word = 16'h7649;
              4'h3: boundary_word = 16'h7647;
              4'h4: boundary_word = 16'h7645;
              4'h5: boundary_word = 16'h7643;
              4'h6: boundary_word = 16'h7641;
              4'h7: boundary_word = 16'h763f;
              4'h8: boundary_word = 16'h763d;
              4'h9: boundary_word = 16'h763b;
              4'ha: boundary_word = 16'h7639;
              4'hb: boundary_word = 16'h7637;
              4'hc: boundary_word = 16'h7635;
              4'hd: boundary_word = 16'h7633;
              4'he: boundary_word = 16'h7631;
              default: begin end
            endcase
          end
          6'h27: begin
            boundary_word = 16'h7611;
            case (mant[3:0])
              4'h0: boundary_word = 16'h762d;
              4'h1: boundary_word = 16'h762b;
              4'h2: boundary_word = 16'h762a;
              4'h3: boundary_word = 16'h7628;
              4'h4: boundary_word = 16'h7626;
              4'h5: boundary_word = 16'h7624;
              4'h6: boundary_word = 16'h7622;
              4'h7: boundary_word = 16'h7620;
              4'h8: boundary_word = 16'h761e;
              4'h9: boundary_word = 16'h761c;
              4'ha: boundary_word = 16'h761a;
              4'hb: boundary_word = 16'h7619;
              4'hc: boundary_word = 16'h7617;
              4'hd: boundary_word = 16'h7615;
              4'he: boundary_word = 16'h7613;
              default: begin end
            endcase
          end
          6'h28: begin
            boundary_word = 16'h75f4;
            case (mant[3:0])
              4'h0: boundary_word = 16'h760f;
              4'h1: boundary_word = 16'h760d;
              4'h2: boundary_word = 16'h760b;
              4'h3: boundary_word = 16'h760a;
              4'h4: boundary_word = 16'h7608;
              4'h5: boundary_word = 16'h7606;
              4'h6: boundary_word = 16'h7604;
              4'h7: boundary_word = 16'h7602;
              4'h8: boundary_word = 16'h7600;
              4'h9: boundary_word = 16'h75ff;
              4'ha: boundary_word = 16'h75fd;
              4'hb: boundary_word = 16'h75fb;
              4'hc: boundary_word = 16'h75f9;
              4'hd: boundary_word = 16'h75f7;
              4'he: boundary_word = 16'h75f5;
              default: begin end
            endcase
          end
          6'h29: begin
            boundary_word = 16'h75d7;
            case (mant[3:0])
              4'h0: boundary_word = 16'h75f2;
              4'h1: boundary_word = 16'h75f0;
              4'h2: boundary_word = 16'h75ee;
              4'h3: boundary_word = 16'h75ec;
              4'h4: boundary_word = 16'h75eb;
              4'h5: boundary_word = 16'h75e9;
              4'h6: boundary_word = 16'h75e7;
              4'h7: boundary_word = 16'h75e5;
              4'h8: boundary_word = 16'h75e3;
              4'h9: boundary_word = 16'h75e2;
              4'ha: boundary_word = 16'h75e0;
              4'hb: boundary_word = 16'h75de;
              4'hc: boundary_word = 16'h75dc;
              4'hd: boundary_word = 16'h75da;
              4'he: boundary_word = 16'h75d9;
              default: begin end
            endcase
          end
          6'h2a: begin
            boundary_word = 16'h75bb;
            case (mant[3:0])
              4'h0: boundary_word = 16'h75d5;
              4'h1: boundary_word = 16'h75d3;
              4'h2: boundary_word = 16'h75d2;
              4'h3: boundary_word = 16'h75d0;
              4'h4: boundary_word = 16'h75ce;
              4'h5: boundary_word = 16'h75cc;
              4'h6: boundary_word = 16'h75cb;
              4'h7: boundary_word = 16'h75c9;
              4'h8: boundary_word = 16'h75c7;
              4'h9: boundary_word = 16'h75c5;
              4'ha: boundary_word = 16'h75c4;
              4'hb: boundary_word = 16'h75c2;
              4'hc: boundary_word = 16'h75c0;
              4'hd: boundary_word = 16'h75bf;
              4'he: boundary_word = 16'h75bd;
              default: begin end
            endcase
          end
          6'h2b: begin
            boundary_word = 16'h75a0;
            case (mant[3:0])
              4'h0: boundary_word = 16'h75b9;
              4'h1: boundary_word = 16'h75b8;
              4'h2: boundary_word = 16'h75b6;
              4'h3: boundary_word = 16'h75b4;
              4'h4: boundary_word = 16'h75b3;
              4'h5: boundary_word = 16'h75b1;
              4'h6: boundary_word = 16'h75af;
              4'h7: boundary_word = 16'h75ad;
              4'h8: boundary_word = 16'h75ac;
              4'h9: boundary_word = 16'h75aa;
              4'ha: boundary_word = 16'h75a8;
              4'hb: boundary_word = 16'h75a7;
              4'hc: boundary_word = 16'h75a5;
              4'hd: boundary_word = 16'h75a3;
              4'he: boundary_word = 16'h75a2;
              default: begin end
            endcase
          end
          6'h2c: begin
            boundary_word = 16'h7586;
            case (mant[3:0])
              4'h0: boundary_word = 16'h759e;
              4'h1: boundary_word = 16'h759d;
              4'h2: boundary_word = 16'h759b;
              4'h3: boundary_word = 16'h7599;
              4'h4: boundary_word = 16'h7598;
              4'h5: boundary_word = 16'h7596;
              4'h6: boundary_word = 16'h7594;
              4'h7: boundary_word = 16'h7593;
              4'h8: boundary_word = 16'h7591;
              4'h9: boundary_word = 16'h7590;
              4'ha: boundary_word = 16'h758e;
              4'hb: boundary_word = 16'h758c;
              4'hc: boundary_word = 16'h758b;
              4'hd: boundary_word = 16'h7589;
              4'he: boundary_word = 16'h7587;
              default: begin end
            endcase
          end
          6'h2d: begin
            boundary_word = 16'h756c;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7584;
              4'h1: boundary_word = 16'h7582;
              4'h2: boundary_word = 16'h7581;
              4'h3: boundary_word = 16'h757f;
              4'h4: boundary_word = 16'h757e;
              4'h5: boundary_word = 16'h757c;
              4'h6: boundary_word = 16'h757a;
              4'h7: boundary_word = 16'h7579;
              4'h8: boundary_word = 16'h7577;
              4'h9: boundary_word = 16'h7576;
              4'ha: boundary_word = 16'h7574;
              4'hb: boundary_word = 16'h7572;
              4'hc: boundary_word = 16'h7571;
              4'hd: boundary_word = 16'h756f;
              4'he: boundary_word = 16'h756e;
              default: begin end
            endcase
          end
          6'h2e: begin
            boundary_word = 16'h7553;
            case (mant[3:0])
              4'h0: boundary_word = 16'h756b;
              4'h1: boundary_word = 16'h7569;
              4'h2: boundary_word = 16'h7567;
              4'h3: boundary_word = 16'h7566;
              4'h4: boundary_word = 16'h7564;
              4'h5: boundary_word = 16'h7563;
              4'h6: boundary_word = 16'h7561;
              4'h7: boundary_word = 16'h7560;
              4'h8: boundary_word = 16'h755e;
              4'h9: boundary_word = 16'h755c;
              4'ha: boundary_word = 16'h755b;
              4'hb: boundary_word = 16'h7559;
              4'hc: boundary_word = 16'h7558;
              4'hd: boundary_word = 16'h7556;
              4'he: boundary_word = 16'h7555;
              default: begin end
            endcase
          end
          6'h2f: begin
            boundary_word = 16'h753b;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7552;
              4'h1: boundary_word = 16'h7550;
              4'h2: boundary_word = 16'h754f;
              4'h3: boundary_word = 16'h754d;
              4'h4: boundary_word = 16'h754c;
              4'h5: boundary_word = 16'h754a;
              4'h6: boundary_word = 16'h7549;
              4'h7: boundary_word = 16'h7547;
              4'h8: boundary_word = 16'h7545;
              4'h9: boundary_word = 16'h7544;
              4'ha: boundary_word = 16'h7542;
              4'hb: boundary_word = 16'h7541;
              4'hc: boundary_word = 16'h753f;
              4'hd: boundary_word = 16'h753e;
              4'he: boundary_word = 16'h753c;
              default: begin end
            endcase
          end
          6'h30: begin
            boundary_word = 16'h7523;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7539;
              4'h1: boundary_word = 16'h7538;
              4'h2: boundary_word = 16'h7536;
              4'h3: boundary_word = 16'h7535;
              4'h4: boundary_word = 16'h7534;
              4'h5: boundary_word = 16'h7532;
              4'h6: boundary_word = 16'h7531;
              4'h7: boundary_word = 16'h752f;
              4'h8: boundary_word = 16'h752e;
              4'h9: boundary_word = 16'h752c;
              4'ha: boundary_word = 16'h752b;
              4'hb: boundary_word = 16'h7529;
              4'hc: boundary_word = 16'h7528;
              4'hd: boundary_word = 16'h7526;
              4'he: boundary_word = 16'h7525;
              default: begin end
            endcase
          end
          6'h31: begin
            boundary_word = 16'h750c;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7522;
              4'h1: boundary_word = 16'h7520;
              4'h2: boundary_word = 16'h751f;
              4'h3: boundary_word = 16'h751e;
              4'h4: boundary_word = 16'h751c;
              4'h5: boundary_word = 16'h751b;
              4'h6: boundary_word = 16'h7519;
              4'h7: boundary_word = 16'h7518;
              4'h8: boundary_word = 16'h7516;
              4'h9: boundary_word = 16'h7515;
              4'ha: boundary_word = 16'h7513;
              4'hb: boundary_word = 16'h7512;
              4'hc: boundary_word = 16'h7511;
              4'hd: boundary_word = 16'h750f;
              4'he: boundary_word = 16'h750e;
              default: begin end
            endcase
          end
          6'h32: begin
            boundary_word = 16'h74f6;
            case (mant[3:0])
              4'h0: boundary_word = 16'h750b;
              4'h1: boundary_word = 16'h750a;
              4'h2: boundary_word = 16'h7508;
              4'h3: boundary_word = 16'h7507;
              4'h4: boundary_word = 16'h7505;
              4'h5: boundary_word = 16'h7504;
              4'h6: boundary_word = 16'h7503;
              4'h7: boundary_word = 16'h7501;
              4'h8: boundary_word = 16'h7500;
              4'h9: boundary_word = 16'h74fe;
              4'ha: boundary_word = 16'h74fd;
              4'hb: boundary_word = 16'h74fc;
              4'hc: boundary_word = 16'h74fa;
              4'hd: boundary_word = 16'h74f9;
              4'he: boundary_word = 16'h74f7;
              default: begin end
            endcase
          end
          6'h33: begin
            boundary_word = 16'h74e0;
            case (mant[3:0])
              4'h0: boundary_word = 16'h74f5;
              4'h1: boundary_word = 16'h74f3;
              4'h2: boundary_word = 16'h74f2;
              4'h3: boundary_word = 16'h74f0;
              4'h4: boundary_word = 16'h74ef;
              4'h5: boundary_word = 16'h74ee;
              4'h6: boundary_word = 16'h74ec;
              4'h7: boundary_word = 16'h74eb;
              4'h8: boundary_word = 16'h74ea;
              4'h9: boundary_word = 16'h74e8;
              4'ha: boundary_word = 16'h74e7;
              4'hb: boundary_word = 16'h74e6;
              4'hc: boundary_word = 16'h74e4;
              4'hd: boundary_word = 16'h74e3;
              4'he: boundary_word = 16'h74e2;
              default: begin end
            endcase
          end
          6'h34: begin
            boundary_word = 16'h74cb;
            case (mant[3:0])
              4'h0: boundary_word = 16'h74df;
              4'h1: boundary_word = 16'h74dd;
              4'h2: boundary_word = 16'h74dc;
              4'h3: boundary_word = 16'h74db;
              4'h4: boundary_word = 16'h74d9;
              4'h5: boundary_word = 16'h74d8;
              4'h6: boundary_word = 16'h74d7;
              4'h7: boundary_word = 16'h74d5;
              4'h8: boundary_word = 16'h74d4;
              4'h9: boundary_word = 16'h74d3;
              4'ha: boundary_word = 16'h74d1;
              4'hb: boundary_word = 16'h74d0;
              4'hc: boundary_word = 16'h74cf;
              4'hd: boundary_word = 16'h74ce;
              4'he: boundary_word = 16'h74cc;
              default: begin end
            endcase
          end
          6'h35: begin
            boundary_word = 16'h74b6;
            case (mant[3:0])
              4'h0: boundary_word = 16'h74ca;
              4'h1: boundary_word = 16'h74c8;
              4'h2: boundary_word = 16'h74c7;
              4'h3: boundary_word = 16'h74c6;
              4'h4: boundary_word = 16'h74c4;
              4'h5: boundary_word = 16'h74c3;
              4'h6: boundary_word = 16'h74c2;
              4'h7: boundary_word = 16'h74c0;
              4'h8: boundary_word = 16'h74bf;
              4'h9: boundary_word = 16'h74be;
              4'ha: boundary_word = 16'h74bd;
              4'hb: boundary_word = 16'h74bb;
              4'hc: boundary_word = 16'h74ba;
              4'hd: boundary_word = 16'h74b9;
              4'he: boundary_word = 16'h74b7;
              default: begin end
            endcase
          end
          6'h36: begin
            boundary_word = 16'h74a2;
            case (mant[3:0])
              4'h0: boundary_word = 16'h74b5;
              4'h1: boundary_word = 16'h74b4;
              4'h2: boundary_word = 16'h74b2;
              4'h3: boundary_word = 16'h74b1;
              4'h4: boundary_word = 16'h74b0;
              4'h5: boundary_word = 16'h74af;
              4'h6: boundary_word = 16'h74ad;
              4'h7: boundary_word = 16'h74ac;
              4'h8: boundary_word = 16'h74ab;
              4'h9: boundary_word = 16'h74aa;
              4'ha: boundary_word = 16'h74a8;
              4'hb: boundary_word = 16'h74a7;
              4'hc: boundary_word = 16'h74a6;
              4'hd: boundary_word = 16'h74a4;
              4'he: boundary_word = 16'h74a3;
              default: begin end
            endcase
          end
          6'h37: begin
            boundary_word = 16'h748e;
            case (mant[3:0])
              4'h0: boundary_word = 16'h74a1;
              4'h1: boundary_word = 16'h74a0;
              4'h2: boundary_word = 16'h749e;
              4'h3: boundary_word = 16'h749d;
              4'h4: boundary_word = 16'h749c;
              4'h5: boundary_word = 16'h749b;
              4'h6: boundary_word = 16'h7499;
              4'h7: boundary_word = 16'h7498;
              4'h8: boundary_word = 16'h7497;
              4'h9: boundary_word = 16'h7496;
              4'ha: boundary_word = 16'h7494;
              4'hb: boundary_word = 16'h7493;
              4'hc: boundary_word = 16'h7492;
              4'hd: boundary_word = 16'h7491;
              4'he: boundary_word = 16'h7490;
              default: begin end
            endcase
          end
          6'h38: begin
            boundary_word = 16'h747b;
            case (mant[3:0])
              4'h0: boundary_word = 16'h748d;
              4'h1: boundary_word = 16'h748c;
              4'h2: boundary_word = 16'h748b;
              4'h3: boundary_word = 16'h7489;
              4'h4: boundary_word = 16'h7488;
              4'h5: boundary_word = 16'h7487;
              4'h6: boundary_word = 16'h7486;
              4'h7: boundary_word = 16'h7485;
              4'h8: boundary_word = 16'h7483;
              4'h9: boundary_word = 16'h7482;
              4'ha: boundary_word = 16'h7481;
              4'hb: boundary_word = 16'h7480;
              4'hc: boundary_word = 16'h747f;
              4'hd: boundary_word = 16'h747d;
              4'he: boundary_word = 16'h747c;
              default: begin end
            endcase
          end
          6'h39: begin
            boundary_word = 16'h7468;
            case (mant[3:0])
              4'h0: boundary_word = 16'h747a;
              4'h1: boundary_word = 16'h7479;
              4'h2: boundary_word = 16'h7478;
              4'h3: boundary_word = 16'h7476;
              4'h4: boundary_word = 16'h7475;
              4'h5: boundary_word = 16'h7474;
              4'h6: boundary_word = 16'h7473;
              4'h7: boundary_word = 16'h7472;
              4'h8: boundary_word = 16'h7470;
              4'h9: boundary_word = 16'h746f;
              4'ha: boundary_word = 16'h746e;
              4'hb: boundary_word = 16'h746d;
              4'hc: boundary_word = 16'h746c;
              4'hd: boundary_word = 16'h746b;
              4'he: boundary_word = 16'h746a;
              default: begin end
            endcase
          end
          6'h3a: begin
            boundary_word = 16'h7456;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7467;
              4'h1: boundary_word = 16'h7466;
              4'h2: boundary_word = 16'h7465;
              4'h3: boundary_word = 16'h7464;
              4'h4: boundary_word = 16'h7463;
              4'h5: boundary_word = 16'h7461;
              4'h6: boundary_word = 16'h7460;
              4'h7: boundary_word = 16'h745f;
              4'h8: boundary_word = 16'h745e;
              4'h9: boundary_word = 16'h745d;
              4'ha: boundary_word = 16'h745c;
              4'hb: boundary_word = 16'h745b;
              4'hc: boundary_word = 16'h7459;
              4'hd: boundary_word = 16'h7458;
              4'he: boundary_word = 16'h7457;
              default: begin end
            endcase
          end
          6'h3b: begin
            boundary_word = 16'h7444;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7455;
              4'h1: boundary_word = 16'h7454;
              4'h2: boundary_word = 16'h7453;
              4'h3: boundary_word = 16'h7452;
              4'h4: boundary_word = 16'h7450;
              4'h5: boundary_word = 16'h744f;
              4'h6: boundary_word = 16'h744e;
              4'h7: boundary_word = 16'h744d;
              4'h8: boundary_word = 16'h744c;
              4'h9: boundary_word = 16'h744b;
              4'ha: boundary_word = 16'h744a;
              4'hb: boundary_word = 16'h7449;
              4'hc: boundary_word = 16'h7448;
              4'hd: boundary_word = 16'h7446;
              4'he: boundary_word = 16'h7445;
              default: begin end
            endcase
          end
          6'h3c: begin
            boundary_word = 16'h7433;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7443;
              4'h1: boundary_word = 16'h7442;
              4'h2: boundary_word = 16'h7441;
              4'h3: boundary_word = 16'h7440;
              4'h4: boundary_word = 16'h743f;
              4'h5: boundary_word = 16'h743e;
              4'h6: boundary_word = 16'h743d;
              4'h7: boundary_word = 16'h743b;
              4'h8: boundary_word = 16'h743a;
              4'h9: boundary_word = 16'h7439;
              4'ha: boundary_word = 16'h7438;
              4'hb: boundary_word = 16'h7437;
              4'hc: boundary_word = 16'h7436;
              4'hd: boundary_word = 16'h7435;
              4'he: boundary_word = 16'h7434;
              default: begin end
            endcase
          end
          6'h3d: begin
            boundary_word = 16'h7422;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7432;
              4'h1: boundary_word = 16'h7431;
              4'h2: boundary_word = 16'h7430;
              4'h3: boundary_word = 16'h742f;
              4'h4: boundary_word = 16'h742d;
              4'h5: boundary_word = 16'h742c;
              4'h6: boundary_word = 16'h742b;
              4'h7: boundary_word = 16'h742a;
              4'h8: boundary_word = 16'h7429;
              4'h9: boundary_word = 16'h7428;
              4'ha: boundary_word = 16'h7427;
              4'hb: boundary_word = 16'h7426;
              4'hc: boundary_word = 16'h7425;
              4'hd: boundary_word = 16'h7424;
              4'he: boundary_word = 16'h7423;
              default: begin end
            endcase
          end
          6'h3e: begin
            boundary_word = 16'h7411;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7421;
              4'h1: boundary_word = 16'h7420;
              4'h2: boundary_word = 16'h741f;
              4'h3: boundary_word = 16'h741e;
              4'h4: boundary_word = 16'h741d;
              4'h5: boundary_word = 16'h741c;
              4'h6: boundary_word = 16'h741b;
              4'h7: boundary_word = 16'h7419;
              4'h8: boundary_word = 16'h7418;
              4'h9: boundary_word = 16'h7417;
              4'ha: boundary_word = 16'h7416;
              4'hb: boundary_word = 16'h7415;
              4'hc: boundary_word = 16'h7414;
              4'hd: boundary_word = 16'h7413;
              4'he: boundary_word = 16'h7412;
              default: begin end
            endcase
          end
          6'h3f: begin
            boundary_word = 16'h7401;
            case (mant[3:0])
              4'h0: boundary_word = 16'h7410;
              4'h1: boundary_word = 16'h740f;
              4'h2: boundary_word = 16'h740e;
              4'h3: boundary_word = 16'h740d;
              4'h4: boundary_word = 16'h740c;
              4'h5: boundary_word = 16'h740b;
              4'h6: boundary_word = 16'h740a;
              4'h7: boundary_word = 16'h7409;
              4'h8: boundary_word = 16'h7408;
              4'h9: boundary_word = 16'h7407;
              4'ha: boundary_word = 16'h7406;
              4'hb: boundary_word = 16'h7405;
              4'hc: boundary_word = 16'h7404;
              4'hd: boundary_word = 16'h7403;
              4'he: boundary_word = 16'h7402;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h16: begin
        case (mant[9:4])
          6'h00: begin
            boundary_word = 16'h0000;
            case (mant[3:0])
              4'h0: boundary_word = 16'h0400;
              default: begin end
            endcase
          end
          6'h01: boundary_word = 16'h0000;
          6'h02: boundary_word = 16'h0000;
          6'h03: boundary_word = 16'h0000;
          6'h04: boundary_word = 16'h0000;
          6'h05: boundary_word = 16'h0000;
          6'h06: boundary_word = 16'h0000;
          6'h07: boundary_word = 16'h0000;
          6'h08: boundary_word = 16'h0000;
          6'h09: boundary_word = 16'h0000;
          6'h0a: boundary_word = 16'h0000;
          6'h0b: boundary_word = 16'h0000;
          6'h0c: boundary_word = 16'h0000;
          6'h0d: boundary_word = 16'h0000;
          6'h0e: boundary_word = 16'h0000;
          6'h0f: boundary_word = 16'h0000;
          6'h10: boundary_word = 16'h0000;
          6'h11: boundary_word = 16'h0000;
          6'h12: boundary_word = 16'h0000;
          6'h13: boundary_word = 16'h0000;
          6'h14: boundary_word = 16'h0000;
          6'h15: boundary_word = 16'h0000;
          6'h16: boundary_word = 16'h0000;
          6'h17: boundary_word = 16'h0000;
          6'h18: boundary_word = 16'h0000;
          6'h19: boundary_word = 16'h0000;
          6'h1a: boundary_word = 16'h0000;
          6'h1b: boundary_word = 16'h0000;
          6'h1c: boundary_word = 16'h0000;
          6'h1d: boundary_word = 16'h0000;
          6'h1e: boundary_word = 16'h0000;
          6'h1f: boundary_word = 16'h0000;
          6'h20: boundary_word = 16'h0000;
          6'h21: boundary_word = 16'h0000;
          6'h22: boundary_word = 16'h0000;
          6'h23: boundary_word = 16'h0000;
          6'h24: boundary_word = 16'h0000;
          6'h25: boundary_word = 16'h0000;
          6'h26: boundary_word = 16'h0000;
          6'h27: boundary_word = 16'h0000;
          6'h28: boundary_word = 16'h0000;
          6'h29: boundary_word = 16'h0000;
          6'h2a: boundary_word = 16'h0000;
          6'h2b: boundary_word = 16'h0000;
          6'h2c: boundary_word = 16'h0000;
          6'h2d: boundary_word = 16'h0000;
          6'h2e: boundary_word = 16'h0000;
          6'h2f: boundary_word = 16'h0000;
          6'h30: boundary_word = 16'h0000;
          6'h31: boundary_word = 16'h0000;
          6'h32: boundary_word = 16'h0000;
          6'h33: boundary_word = 16'h0000;
          6'h34: boundary_word = 16'h0000;
          6'h35: boundary_word = 16'h0000;
          6'h36: boundary_word = 16'h0000;
          6'h37: boundary_word = 16'h0000;
          6'h38: boundary_word = 16'h0000;
          6'h39: boundary_word = 16'h0000;
          6'h3a: boundary_word = 16'h0000;
          6'h3b: boundary_word = 16'h0000;
          6'h3c: boundary_word = 16'h0000;
          6'h3d: boundary_word = 16'h0000;
          6'h3e: boundary_word = 16'h0000;
          6'h3f: boundary_word = 16'h0000;
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  assign out = active_core ? core_out : (boundary ? boundary_word : special_out);
endmodule
