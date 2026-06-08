module ex232_fp16_square_exp_formula_hi9_8_low8_nested_hi6(in, out);
  input [15:0] in;
  output [15:0] out;
  wire [4:0] exp = in[14:10];
  wire [9:0] mant = in[9:0];
  wire active_normal = (exp >= 5'd8) && (exp <= 5'd22);
  wire out_exp_carry = mant >= 10'd424;
  wire [5:0] out_exp_wide = {1'b0, exp} + {1'b0, exp} - 6'd15 + {5'b00000, out_exp_carry};
  wire [4:0] out_exp = out_exp_wide[4:0];
  wire [15:0] special_out =
    (exp <= 5'd7) ? 16'h0000 :
    (exp <= 5'd30) ? 16'h7c00 :
    (mant == 10'h000) ? 16'h7c00 : 16'h7e00;
  reg [7:0] mant_low;
  always @* begin
    (* parallel_case, full_case *) case (mant[9:4])
      6'h00: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h00;
          4'h1: mant_low = 8'h02;
          4'h2: mant_low = 8'h04;
          4'h3: mant_low = 8'h06;
          4'h4: mant_low = 8'h08;
          4'h5: mant_low = 8'h0a;
          4'h6: mant_low = 8'h0c;
          4'h7: mant_low = 8'h0e;
          4'h8: mant_low = 8'h10;
          4'h9: mant_low = 8'h12;
          4'ha: mant_low = 8'h14;
          4'hb: mant_low = 8'h16;
          4'hc: mant_low = 8'h18;
          4'hd: mant_low = 8'h1a;
          4'he: mant_low = 8'h1c;
          4'hf: mant_low = 8'h1e;
          default: mant_low = 8'h00;
        endcase
      end
      6'h01: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h20;
          4'h1: mant_low = 8'h22;
          4'h2: mant_low = 8'h24;
          4'h3: mant_low = 8'h26;
          4'h4: mant_low = 8'h28;
          4'h5: mant_low = 8'h2a;
          4'h6: mant_low = 8'h2c;
          4'h7: mant_low = 8'h2f;
          4'h8: mant_low = 8'h31;
          4'h9: mant_low = 8'h33;
          4'ha: mant_low = 8'h35;
          4'hb: mant_low = 8'h37;
          4'hc: mant_low = 8'h39;
          4'hd: mant_low = 8'h3b;
          4'he: mant_low = 8'h3d;
          4'hf: mant_low = 8'h3f;
          default: mant_low = 8'h00;
        endcase
      end
      6'h02: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h41;
          4'h1: mant_low = 8'h43;
          4'h2: mant_low = 8'h45;
          4'h3: mant_low = 8'h47;
          4'h4: mant_low = 8'h49;
          4'h5: mant_low = 8'h4b;
          4'h6: mant_low = 8'h4d;
          4'h7: mant_low = 8'h4f;
          4'h8: mant_low = 8'h52;
          4'h9: mant_low = 8'h54;
          4'ha: mant_low = 8'h56;
          4'hb: mant_low = 8'h58;
          4'hc: mant_low = 8'h5a;
          4'hd: mant_low = 8'h5c;
          4'he: mant_low = 8'h5e;
          4'hf: mant_low = 8'h60;
          default: mant_low = 8'h00;
        endcase
      end
      6'h03: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h62;
          4'h1: mant_low = 8'h64;
          4'h2: mant_low = 8'h66;
          4'h3: mant_low = 8'h69;
          4'h4: mant_low = 8'h6b;
          4'h5: mant_low = 8'h6d;
          4'h6: mant_low = 8'h6f;
          4'h7: mant_low = 8'h71;
          4'h8: mant_low = 8'h73;
          4'h9: mant_low = 8'h75;
          4'ha: mant_low = 8'h77;
          4'hb: mant_low = 8'h79;
          4'hc: mant_low = 8'h7c;
          4'hd: mant_low = 8'h7e;
          4'he: mant_low = 8'h80;
          4'hf: mant_low = 8'h82;
          default: mant_low = 8'h00;
        endcase
      end
      6'h04: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h84;
          4'h1: mant_low = 8'h86;
          4'h2: mant_low = 8'h88;
          4'h3: mant_low = 8'h8a;
          4'h4: mant_low = 8'h8d;
          4'h5: mant_low = 8'h8f;
          4'h6: mant_low = 8'h91;
          4'h7: mant_low = 8'h93;
          4'h8: mant_low = 8'h95;
          4'h9: mant_low = 8'h97;
          4'ha: mant_low = 8'h99;
          4'hb: mant_low = 8'h9b;
          4'hc: mant_low = 8'h9e;
          4'hd: mant_low = 8'ha0;
          4'he: mant_low = 8'ha2;
          4'hf: mant_low = 8'ha4;
          default: mant_low = 8'h00;
        endcase
      end
      6'h05: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'ha6;
          4'h1: mant_low = 8'ha8;
          4'h2: mant_low = 8'hab;
          4'h3: mant_low = 8'had;
          4'h4: mant_low = 8'haf;
          4'h5: mant_low = 8'hb1;
          4'h6: mant_low = 8'hb3;
          4'h7: mant_low = 8'hb5;
          4'h8: mant_low = 8'hb8;
          4'h9: mant_low = 8'hba;
          4'ha: mant_low = 8'hbc;
          4'hb: mant_low = 8'hbe;
          4'hc: mant_low = 8'hc0;
          4'hd: mant_low = 8'hc2;
          4'he: mant_low = 8'hc5;
          4'hf: mant_low = 8'hc7;
          default: mant_low = 8'h00;
        endcase
      end
      6'h06: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'hc9;
          4'h1: mant_low = 8'hcb;
          4'h2: mant_low = 8'hcd;
          4'h3: mant_low = 8'hd0;
          4'h4: mant_low = 8'hd2;
          4'h5: mant_low = 8'hd4;
          4'h6: mant_low = 8'hd6;
          4'h7: mant_low = 8'hd8;
          4'h8: mant_low = 8'hdb;
          4'h9: mant_low = 8'hdd;
          4'ha: mant_low = 8'hdf;
          4'hb: mant_low = 8'he1;
          4'hc: mant_low = 8'he3;
          4'hd: mant_low = 8'he6;
          4'he: mant_low = 8'he8;
          4'hf: mant_low = 8'hea;
          default: mant_low = 8'h00;
        endcase
      end
      6'h07: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'hec;
          4'h1: mant_low = 8'hee;
          4'h2: mant_low = 8'hf1;
          4'h3: mant_low = 8'hf3;
          4'h4: mant_low = 8'hf5;
          4'h5: mant_low = 8'hf7;
          4'h6: mant_low = 8'hfa;
          4'h7: mant_low = 8'hfc;
          4'h8: mant_low = 8'hfe;
          4'h9: mant_low = 8'h00;
          4'ha: mant_low = 8'h03;
          4'hb: mant_low = 8'h05;
          4'hc: mant_low = 8'h07;
          4'hd: mant_low = 8'h09;
          4'he: mant_low = 8'h0c;
          4'hf: mant_low = 8'h0e;
          default: mant_low = 8'h00;
        endcase
      end
      6'h08: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h10;
          4'h1: mant_low = 8'h12;
          4'h2: mant_low = 8'h15;
          4'h3: mant_low = 8'h17;
          4'h4: mant_low = 8'h19;
          4'h5: mant_low = 8'h1b;
          4'h6: mant_low = 8'h1e;
          4'h7: mant_low = 8'h20;
          4'h8: mant_low = 8'h22;
          4'h9: mant_low = 8'h24;
          4'ha: mant_low = 8'h27;
          4'hb: mant_low = 8'h29;
          4'hc: mant_low = 8'h2b;
          4'hd: mant_low = 8'h2d;
          4'he: mant_low = 8'h30;
          4'hf: mant_low = 8'h32;
          default: mant_low = 8'h00;
        endcase
      end
      6'h09: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h34;
          4'h1: mant_low = 8'h37;
          4'h2: mant_low = 8'h39;
          4'h3: mant_low = 8'h3b;
          4'h4: mant_low = 8'h3d;
          4'h5: mant_low = 8'h40;
          4'h6: mant_low = 8'h42;
          4'h7: mant_low = 8'h44;
          4'h8: mant_low = 8'h47;
          4'h9: mant_low = 8'h49;
          4'ha: mant_low = 8'h4b;
          4'hb: mant_low = 8'h4d;
          4'hc: mant_low = 8'h50;
          4'hd: mant_low = 8'h52;
          4'he: mant_low = 8'h54;
          4'hf: mant_low = 8'h57;
          default: mant_low = 8'h00;
        endcase
      end
      6'h0a: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h59;
          4'h1: mant_low = 8'h5b;
          4'h2: mant_low = 8'h5e;
          4'h3: mant_low = 8'h60;
          4'h4: mant_low = 8'h62;
          4'h5: mant_low = 8'h65;
          4'h6: mant_low = 8'h67;
          4'h7: mant_low = 8'h69;
          4'h8: mant_low = 8'h6c;
          4'h9: mant_low = 8'h6e;
          4'ha: mant_low = 8'h70;
          4'hb: mant_low = 8'h73;
          4'hc: mant_low = 8'h75;
          4'hd: mant_low = 8'h77;
          4'he: mant_low = 8'h7a;
          4'hf: mant_low = 8'h7c;
          default: mant_low = 8'h00;
        endcase
      end
      6'h0b: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h7e;
          4'h1: mant_low = 8'h81;
          4'h2: mant_low = 8'h83;
          4'h3: mant_low = 8'h85;
          4'h4: mant_low = 8'h88;
          4'h5: mant_low = 8'h8a;
          4'h6: mant_low = 8'h8c;
          4'h7: mant_low = 8'h8f;
          4'h8: mant_low = 8'h91;
          4'h9: mant_low = 8'h93;
          4'ha: mant_low = 8'h96;
          4'hb: mant_low = 8'h98;
          4'hc: mant_low = 8'h9b;
          4'hd: mant_low = 8'h9d;
          4'he: mant_low = 8'h9f;
          4'hf: mant_low = 8'ha2;
          default: mant_low = 8'h00;
        endcase
      end
      6'h0c: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'ha4;
          4'h1: mant_low = 8'ha6;
          4'h2: mant_low = 8'ha9;
          4'h3: mant_low = 8'hab;
          4'h4: mant_low = 8'hae;
          4'h5: mant_low = 8'hb0;
          4'h6: mant_low = 8'hb2;
          4'h7: mant_low = 8'hb5;
          4'h8: mant_low = 8'hb7;
          4'h9: mant_low = 8'hb9;
          4'ha: mant_low = 8'hbc;
          4'hb: mant_low = 8'hbe;
          4'hc: mant_low = 8'hc1;
          4'hd: mant_low = 8'hc3;
          4'he: mant_low = 8'hc5;
          4'hf: mant_low = 8'hc8;
          default: mant_low = 8'h00;
        endcase
      end
      6'h0d: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'hca;
          4'h1: mant_low = 8'hcd;
          4'h2: mant_low = 8'hcf;
          4'h3: mant_low = 8'hd1;
          4'h4: mant_low = 8'hd4;
          4'h5: mant_low = 8'hd6;
          4'h6: mant_low = 8'hd9;
          4'h7: mant_low = 8'hdb;
          4'h8: mant_low = 8'hde;
          4'h9: mant_low = 8'he0;
          4'ha: mant_low = 8'he2;
          4'hb: mant_low = 8'he5;
          4'hc: mant_low = 8'he7;
          4'hd: mant_low = 8'hea;
          4'he: mant_low = 8'hec;
          4'hf: mant_low = 8'hef;
          default: mant_low = 8'h00;
        endcase
      end
      6'h0e: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'hf1;
          4'h1: mant_low = 8'hf3;
          4'h2: mant_low = 8'hf6;
          4'h3: mant_low = 8'hf8;
          4'h4: mant_low = 8'hfb;
          4'h5: mant_low = 8'hfd;
          4'h6: mant_low = 8'h00;
          4'h7: mant_low = 8'h02;
          4'h8: mant_low = 8'h05;
          4'h9: mant_low = 8'h07;
          4'ha: mant_low = 8'h09;
          4'hb: mant_low = 8'h0c;
          4'hc: mant_low = 8'h0e;
          4'hd: mant_low = 8'h11;
          4'he: mant_low = 8'h13;
          4'hf: mant_low = 8'h16;
          default: mant_low = 8'h00;
        endcase
      end
      6'h0f: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h18;
          4'h1: mant_low = 8'h1b;
          4'h2: mant_low = 8'h1d;
          4'h3: mant_low = 8'h20;
          4'h4: mant_low = 8'h22;
          4'h5: mant_low = 8'h25;
          4'h6: mant_low = 8'h27;
          4'h7: mant_low = 8'h2a;
          4'h8: mant_low = 8'h2c;
          4'h9: mant_low = 8'h2f;
          4'ha: mant_low = 8'h31;
          4'hb: mant_low = 8'h34;
          4'hc: mant_low = 8'h36;
          4'hd: mant_low = 8'h39;
          4'he: mant_low = 8'h3b;
          4'hf: mant_low = 8'h3e;
          default: mant_low = 8'h00;
        endcase
      end
      6'h10: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h40;
          4'h1: mant_low = 8'h43;
          4'h2: mant_low = 8'h45;
          4'h3: mant_low = 8'h48;
          4'h4: mant_low = 8'h4a;
          4'h5: mant_low = 8'h4d;
          4'h6: mant_low = 8'h4f;
          4'h7: mant_low = 8'h52;
          4'h8: mant_low = 8'h54;
          4'h9: mant_low = 8'h57;
          4'ha: mant_low = 8'h59;
          4'hb: mant_low = 8'h5c;
          4'hc: mant_low = 8'h5e;
          4'hd: mant_low = 8'h61;
          4'he: mant_low = 8'h63;
          4'hf: mant_low = 8'h66;
          default: mant_low = 8'h00;
        endcase
      end
      6'h11: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h68;
          4'h1: mant_low = 8'h6b;
          4'h2: mant_low = 8'h6d;
          4'h3: mant_low = 8'h70;
          4'h4: mant_low = 8'h72;
          4'h5: mant_low = 8'h75;
          4'h6: mant_low = 8'h77;
          4'h7: mant_low = 8'h7a;
          4'h8: mant_low = 8'h7d;
          4'h9: mant_low = 8'h7f;
          4'ha: mant_low = 8'h82;
          4'hb: mant_low = 8'h84;
          4'hc: mant_low = 8'h87;
          4'hd: mant_low = 8'h89;
          4'he: mant_low = 8'h8c;
          4'hf: mant_low = 8'h8e;
          default: mant_low = 8'h00;
        endcase
      end
      6'h12: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h91;
          4'h1: mant_low = 8'h94;
          4'h2: mant_low = 8'h96;
          4'h3: mant_low = 8'h99;
          4'h4: mant_low = 8'h9b;
          4'h5: mant_low = 8'h9e;
          4'h6: mant_low = 8'ha0;
          4'h7: mant_low = 8'ha3;
          4'h8: mant_low = 8'ha6;
          4'h9: mant_low = 8'ha8;
          4'ha: mant_low = 8'hab;
          4'hb: mant_low = 8'had;
          4'hc: mant_low = 8'hb0;
          4'hd: mant_low = 8'hb2;
          4'he: mant_low = 8'hb5;
          4'hf: mant_low = 8'hb8;
          default: mant_low = 8'h00;
        endcase
      end
      6'h13: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'hba;
          4'h1: mant_low = 8'hbd;
          4'h2: mant_low = 8'hbf;
          4'h3: mant_low = 8'hc2;
          4'h4: mant_low = 8'hc5;
          4'h5: mant_low = 8'hc7;
          4'h6: mant_low = 8'hca;
          4'h7: mant_low = 8'hcc;
          4'h8: mant_low = 8'hcf;
          4'h9: mant_low = 8'hd2;
          4'ha: mant_low = 8'hd4;
          4'hb: mant_low = 8'hd7;
          4'hc: mant_low = 8'hda;
          4'hd: mant_low = 8'hdc;
          4'he: mant_low = 8'hdf;
          4'hf: mant_low = 8'he1;
          default: mant_low = 8'h00;
        endcase
      end
      6'h14: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'he4;
          4'h1: mant_low = 8'he7;
          4'h2: mant_low = 8'he9;
          4'h3: mant_low = 8'hec;
          4'h4: mant_low = 8'hef;
          4'h5: mant_low = 8'hf1;
          4'h6: mant_low = 8'hf4;
          4'h7: mant_low = 8'hf6;
          4'h8: mant_low = 8'hf9;
          4'h9: mant_low = 8'hfc;
          4'ha: mant_low = 8'hfe;
          4'hb: mant_low = 8'h01;
          4'hc: mant_low = 8'h04;
          4'hd: mant_low = 8'h06;
          4'he: mant_low = 8'h09;
          4'hf: mant_low = 8'h0c;
          default: mant_low = 8'h00;
        endcase
      end
      6'h15: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h0e;
          4'h1: mant_low = 8'h11;
          4'h2: mant_low = 8'h14;
          4'h3: mant_low = 8'h16;
          4'h4: mant_low = 8'h19;
          4'h5: mant_low = 8'h1c;
          4'h6: mant_low = 8'h1e;
          4'h7: mant_low = 8'h21;
          4'h8: mant_low = 8'h24;
          4'h9: mant_low = 8'h26;
          4'ha: mant_low = 8'h29;
          4'hb: mant_low = 8'h2c;
          4'hc: mant_low = 8'h2e;
          4'hd: mant_low = 8'h31;
          4'he: mant_low = 8'h34;
          4'hf: mant_low = 8'h36;
          default: mant_low = 8'h00;
        endcase
      end
      6'h16: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h39;
          4'h1: mant_low = 8'h3c;
          4'h2: mant_low = 8'h3e;
          4'h3: mant_low = 8'h41;
          4'h4: mant_low = 8'h44;
          4'h5: mant_low = 8'h46;
          4'h6: mant_low = 8'h49;
          4'h7: mant_low = 8'h4c;
          4'h8: mant_low = 8'h4f;
          4'h9: mant_low = 8'h51;
          4'ha: mant_low = 8'h54;
          4'hb: mant_low = 8'h57;
          4'hc: mant_low = 8'h59;
          4'hd: mant_low = 8'h5c;
          4'he: mant_low = 8'h5f;
          4'hf: mant_low = 8'h62;
          default: mant_low = 8'h00;
        endcase
      end
      6'h17: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h64;
          4'h1: mant_low = 8'h67;
          4'h2: mant_low = 8'h6a;
          4'h3: mant_low = 8'h6c;
          4'h4: mant_low = 8'h6f;
          4'h5: mant_low = 8'h72;
          4'h6: mant_low = 8'h75;
          4'h7: mant_low = 8'h77;
          4'h8: mant_low = 8'h7a;
          4'h9: mant_low = 8'h7d;
          4'ha: mant_low = 8'h80;
          4'hb: mant_low = 8'h82;
          4'hc: mant_low = 8'h85;
          4'hd: mant_low = 8'h88;
          4'he: mant_low = 8'h8b;
          4'hf: mant_low = 8'h8d;
          default: mant_low = 8'h00;
        endcase
      end
      6'h18: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h90;
          4'h1: mant_low = 8'h93;
          4'h2: mant_low = 8'h96;
          4'h3: mant_low = 8'h98;
          4'h4: mant_low = 8'h9b;
          4'h5: mant_low = 8'h9e;
          4'h6: mant_low = 8'ha1;
          4'h7: mant_low = 8'ha3;
          4'h8: mant_low = 8'ha6;
          4'h9: mant_low = 8'ha9;
          4'ha: mant_low = 8'hac;
          4'hb: mant_low = 8'hae;
          4'hc: mant_low = 8'hb1;
          4'hd: mant_low = 8'hb4;
          4'he: mant_low = 8'hb7;
          4'hf: mant_low = 8'hb9;
          default: mant_low = 8'h00;
        endcase
      end
      6'h19: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'hbc;
          4'h1: mant_low = 8'hbf;
          4'h2: mant_low = 8'hc2;
          4'h3: mant_low = 8'hc5;
          4'h4: mant_low = 8'hc7;
          4'h5: mant_low = 8'hca;
          4'h6: mant_low = 8'hcd;
          4'h7: mant_low = 8'hd0;
          4'h8: mant_low = 8'hd3;
          4'h9: mant_low = 8'hd5;
          4'ha: mant_low = 8'hd8;
          4'hb: mant_low = 8'hdb;
          4'hc: mant_low = 8'hde;
          4'hd: mant_low = 8'he1;
          4'he: mant_low = 8'he3;
          4'hf: mant_low = 8'he6;
          default: mant_low = 8'h00;
        endcase
      end
      6'h1a: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'he9;
          4'h1: mant_low = 8'hec;
          4'h2: mant_low = 8'hef;
          4'h3: mant_low = 8'hf1;
          4'h4: mant_low = 8'hf4;
          4'h5: mant_low = 8'hf7;
          4'h6: mant_low = 8'hfa;
          4'h7: mant_low = 8'hfd;
          4'h8: mant_low = 8'h00;
          4'h9: mant_low = 8'h01;
          4'ha: mant_low = 8'h03;
          4'hb: mant_low = 8'h04;
          4'hc: mant_low = 8'h05;
          4'hd: mant_low = 8'h07;
          4'he: mant_low = 8'h08;
          4'hf: mant_low = 8'h0a;
          default: mant_low = 8'h00;
        endcase
      end
      6'h1b: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h0b;
          4'h1: mant_low = 8'h0d;
          4'h2: mant_low = 8'h0e;
          4'h3: mant_low = 8'h0f;
          4'h4: mant_low = 8'h11;
          4'h5: mant_low = 8'h12;
          4'h6: mant_low = 8'h14;
          4'h7: mant_low = 8'h15;
          4'h8: mant_low = 8'h17;
          4'h9: mant_low = 8'h18;
          4'ha: mant_low = 8'h19;
          4'hb: mant_low = 8'h1b;
          4'hc: mant_low = 8'h1c;
          4'hd: mant_low = 8'h1e;
          4'he: mant_low = 8'h1f;
          4'hf: mant_low = 8'h21;
          default: mant_low = 8'h00;
        endcase
      end
      6'h1c: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h22;
          4'h1: mant_low = 8'h23;
          4'h2: mant_low = 8'h25;
          4'h3: mant_low = 8'h26;
          4'h4: mant_low = 8'h28;
          4'h5: mant_low = 8'h29;
          4'h6: mant_low = 8'h2b;
          4'h7: mant_low = 8'h2c;
          4'h8: mant_low = 8'h2e;
          4'h9: mant_low = 8'h2f;
          4'ha: mant_low = 8'h30;
          4'hb: mant_low = 8'h32;
          4'hc: mant_low = 8'h33;
          4'hd: mant_low = 8'h35;
          4'he: mant_low = 8'h36;
          4'hf: mant_low = 8'h38;
          default: mant_low = 8'h00;
        endcase
      end
      6'h1d: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h39;
          4'h1: mant_low = 8'h3b;
          4'h2: mant_low = 8'h3c;
          4'h3: mant_low = 8'h3d;
          4'h4: mant_low = 8'h3f;
          4'h5: mant_low = 8'h40;
          4'h6: mant_low = 8'h42;
          4'h7: mant_low = 8'h43;
          4'h8: mant_low = 8'h45;
          4'h9: mant_low = 8'h46;
          4'ha: mant_low = 8'h48;
          4'hb: mant_low = 8'h49;
          4'hc: mant_low = 8'h4b;
          4'hd: mant_low = 8'h4c;
          4'he: mant_low = 8'h4e;
          4'hf: mant_low = 8'h4f;
          default: mant_low = 8'h00;
        endcase
      end
      6'h1e: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h50;
          4'h1: mant_low = 8'h52;
          4'h2: mant_low = 8'h53;
          4'h3: mant_low = 8'h55;
          4'h4: mant_low = 8'h56;
          4'h5: mant_low = 8'h58;
          4'h6: mant_low = 8'h59;
          4'h7: mant_low = 8'h5b;
          4'h8: mant_low = 8'h5c;
          4'h9: mant_low = 8'h5e;
          4'ha: mant_low = 8'h5f;
          4'hb: mant_low = 8'h61;
          4'hc: mant_low = 8'h62;
          4'hd: mant_low = 8'h64;
          4'he: mant_low = 8'h65;
          4'hf: mant_low = 8'h67;
          default: mant_low = 8'h00;
        endcase
      end
      6'h1f: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h68;
          4'h1: mant_low = 8'h6a;
          4'h2: mant_low = 8'h6b;
          4'h3: mant_low = 8'h6d;
          4'h4: mant_low = 8'h6e;
          4'h5: mant_low = 8'h70;
          4'h6: mant_low = 8'h71;
          4'h7: mant_low = 8'h73;
          4'h8: mant_low = 8'h74;
          4'h9: mant_low = 8'h76;
          4'ha: mant_low = 8'h77;
          4'hb: mant_low = 8'h79;
          4'hc: mant_low = 8'h7a;
          4'hd: mant_low = 8'h7c;
          4'he: mant_low = 8'h7d;
          4'hf: mant_low = 8'h7f;
          default: mant_low = 8'h00;
        endcase
      end
      6'h20: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h80;
          4'h1: mant_low = 8'h82;
          4'h2: mant_low = 8'h83;
          4'h3: mant_low = 8'h85;
          4'h4: mant_low = 8'h86;
          4'h5: mant_low = 8'h88;
          4'h6: mant_low = 8'h89;
          4'h7: mant_low = 8'h8b;
          4'h8: mant_low = 8'h8c;
          4'h9: mant_low = 8'h8e;
          4'ha: mant_low = 8'h8f;
          4'hb: mant_low = 8'h91;
          4'hc: mant_low = 8'h92;
          4'hd: mant_low = 8'h94;
          4'he: mant_low = 8'h95;
          4'hf: mant_low = 8'h97;
          default: mant_low = 8'h00;
        endcase
      end
      6'h21: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h98;
          4'h1: mant_low = 8'h9a;
          4'h2: mant_low = 8'h9b;
          4'h3: mant_low = 8'h9d;
          4'h4: mant_low = 8'h9e;
          4'h5: mant_low = 8'ha0;
          4'h6: mant_low = 8'ha1;
          4'h7: mant_low = 8'ha3;
          4'h8: mant_low = 8'ha4;
          4'h9: mant_low = 8'ha6;
          4'ha: mant_low = 8'ha7;
          4'hb: mant_low = 8'ha9;
          4'hc: mant_low = 8'haa;
          4'hd: mant_low = 8'hac;
          4'he: mant_low = 8'had;
          4'hf: mant_low = 8'haf;
          default: mant_low = 8'h00;
        endcase
      end
      6'h22: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'hb0;
          4'h1: mant_low = 8'hb2;
          4'h2: mant_low = 8'hb4;
          4'h3: mant_low = 8'hb5;
          4'h4: mant_low = 8'hb7;
          4'h5: mant_low = 8'hb8;
          4'h6: mant_low = 8'hba;
          4'h7: mant_low = 8'hbb;
          4'h8: mant_low = 8'hbd;
          4'h9: mant_low = 8'hbe;
          4'ha: mant_low = 8'hc0;
          4'hb: mant_low = 8'hc1;
          4'hc: mant_low = 8'hc3;
          4'hd: mant_low = 8'hc4;
          4'he: mant_low = 8'hc6;
          4'hf: mant_low = 8'hc8;
          default: mant_low = 8'h00;
        endcase
      end
      6'h23: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'hc9;
          4'h1: mant_low = 8'hcb;
          4'h2: mant_low = 8'hcc;
          4'h3: mant_low = 8'hce;
          4'h4: mant_low = 8'hcf;
          4'h5: mant_low = 8'hd1;
          4'h6: mant_low = 8'hd2;
          4'h7: mant_low = 8'hd4;
          4'h8: mant_low = 8'hd6;
          4'h9: mant_low = 8'hd7;
          4'ha: mant_low = 8'hd9;
          4'hb: mant_low = 8'hda;
          4'hc: mant_low = 8'hdc;
          4'hd: mant_low = 8'hdd;
          4'he: mant_low = 8'hdf;
          4'hf: mant_low = 8'he0;
          default: mant_low = 8'h00;
        endcase
      end
      6'h24: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'he2;
          4'h1: mant_low = 8'he4;
          4'h2: mant_low = 8'he5;
          4'h3: mant_low = 8'he7;
          4'h4: mant_low = 8'he8;
          4'h5: mant_low = 8'hea;
          4'h6: mant_low = 8'heb;
          4'h7: mant_low = 8'hed;
          4'h8: mant_low = 8'hef;
          4'h9: mant_low = 8'hf0;
          4'ha: mant_low = 8'hf2;
          4'hb: mant_low = 8'hf3;
          4'hc: mant_low = 8'hf5;
          4'hd: mant_low = 8'hf6;
          4'he: mant_low = 8'hf8;
          4'hf: mant_low = 8'hfa;
          default: mant_low = 8'h00;
        endcase
      end
      6'h25: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'hfb;
          4'h1: mant_low = 8'hfd;
          4'h2: mant_low = 8'hfe;
          4'h3: mant_low = 8'h00;
          4'h4: mant_low = 8'h01;
          4'h5: mant_low = 8'h03;
          4'h6: mant_low = 8'h05;
          4'h7: mant_low = 8'h06;
          4'h8: mant_low = 8'h08;
          4'h9: mant_low = 8'h09;
          4'ha: mant_low = 8'h0b;
          4'hb: mant_low = 8'h0d;
          4'hc: mant_low = 8'h0e;
          4'hd: mant_low = 8'h10;
          4'he: mant_low = 8'h11;
          4'hf: mant_low = 8'h13;
          default: mant_low = 8'h00;
        endcase
      end
      6'h26: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h14;
          4'h1: mant_low = 8'h16;
          4'h2: mant_low = 8'h18;
          4'h3: mant_low = 8'h19;
          4'h4: mant_low = 8'h1b;
          4'h5: mant_low = 8'h1c;
          4'h6: mant_low = 8'h1e;
          4'h7: mant_low = 8'h20;
          4'h8: mant_low = 8'h21;
          4'h9: mant_low = 8'h23;
          4'ha: mant_low = 8'h24;
          4'hb: mant_low = 8'h26;
          4'hc: mant_low = 8'h28;
          4'hd: mant_low = 8'h29;
          4'he: mant_low = 8'h2b;
          4'hf: mant_low = 8'h2d;
          default: mant_low = 8'h00;
        endcase
      end
      6'h27: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h2e;
          4'h1: mant_low = 8'h30;
          4'h2: mant_low = 8'h31;
          4'h3: mant_low = 8'h33;
          4'h4: mant_low = 8'h35;
          4'h5: mant_low = 8'h36;
          4'h6: mant_low = 8'h38;
          4'h7: mant_low = 8'h39;
          4'h8: mant_low = 8'h3b;
          4'h9: mant_low = 8'h3d;
          4'ha: mant_low = 8'h3e;
          4'hb: mant_low = 8'h40;
          4'hc: mant_low = 8'h42;
          4'hd: mant_low = 8'h43;
          4'he: mant_low = 8'h45;
          4'hf: mant_low = 8'h46;
          default: mant_low = 8'h00;
        endcase
      end
      6'h28: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h48;
          4'h1: mant_low = 8'h4a;
          4'h2: mant_low = 8'h4b;
          4'h3: mant_low = 8'h4d;
          4'h4: mant_low = 8'h4f;
          4'h5: mant_low = 8'h50;
          4'h6: mant_low = 8'h52;
          4'h7: mant_low = 8'h53;
          4'h8: mant_low = 8'h55;
          4'h9: mant_low = 8'h57;
          4'ha: mant_low = 8'h58;
          4'hb: mant_low = 8'h5a;
          4'hc: mant_low = 8'h5c;
          4'hd: mant_low = 8'h5d;
          4'he: mant_low = 8'h5f;
          4'hf: mant_low = 8'h60;
          default: mant_low = 8'h00;
        endcase
      end
      6'h29: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h62;
          4'h1: mant_low = 8'h64;
          4'h2: mant_low = 8'h65;
          4'h3: mant_low = 8'h67;
          4'h4: mant_low = 8'h69;
          4'h5: mant_low = 8'h6a;
          4'h6: mant_low = 8'h6c;
          4'h7: mant_low = 8'h6e;
          4'h8: mant_low = 8'h6f;
          4'h9: mant_low = 8'h71;
          4'ha: mant_low = 8'h73;
          4'hb: mant_low = 8'h74;
          4'hc: mant_low = 8'h76;
          4'hd: mant_low = 8'h78;
          4'he: mant_low = 8'h79;
          4'hf: mant_low = 8'h7b;
          default: mant_low = 8'h00;
        endcase
      end
      6'h2a: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h7c;
          4'h1: mant_low = 8'h7e;
          4'h2: mant_low = 8'h80;
          4'h3: mant_low = 8'h81;
          4'h4: mant_low = 8'h83;
          4'h5: mant_low = 8'h85;
          4'h6: mant_low = 8'h86;
          4'h7: mant_low = 8'h88;
          4'h8: mant_low = 8'h8a;
          4'h9: mant_low = 8'h8b;
          4'ha: mant_low = 8'h8d;
          4'hb: mant_low = 8'h8f;
          4'hc: mant_low = 8'h90;
          4'hd: mant_low = 8'h92;
          4'he: mant_low = 8'h94;
          4'hf: mant_low = 8'h95;
          default: mant_low = 8'h00;
        endcase
      end
      6'h2b: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h97;
          4'h1: mant_low = 8'h99;
          4'h2: mant_low = 8'h9a;
          4'h3: mant_low = 8'h9c;
          4'h4: mant_low = 8'h9e;
          4'h5: mant_low = 8'h9f;
          4'h6: mant_low = 8'ha1;
          4'h7: mant_low = 8'ha3;
          4'h8: mant_low = 8'ha5;
          4'h9: mant_low = 8'ha6;
          4'ha: mant_low = 8'ha8;
          4'hb: mant_low = 8'haa;
          4'hc: mant_low = 8'hab;
          4'hd: mant_low = 8'had;
          4'he: mant_low = 8'haf;
          4'hf: mant_low = 8'hb0;
          default: mant_low = 8'h00;
        endcase
      end
      6'h2c: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'hb2;
          4'h1: mant_low = 8'hb4;
          4'h2: mant_low = 8'hb5;
          4'h3: mant_low = 8'hb7;
          4'h4: mant_low = 8'hb9;
          4'h5: mant_low = 8'hba;
          4'h6: mant_low = 8'hbc;
          4'h7: mant_low = 8'hbe;
          4'h8: mant_low = 8'hc0;
          4'h9: mant_low = 8'hc1;
          4'ha: mant_low = 8'hc3;
          4'hb: mant_low = 8'hc5;
          4'hc: mant_low = 8'hc6;
          4'hd: mant_low = 8'hc8;
          4'he: mant_low = 8'hca;
          4'hf: mant_low = 8'hcb;
          default: mant_low = 8'h00;
        endcase
      end
      6'h2d: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'hcd;
          4'h1: mant_low = 8'hcf;
          4'h2: mant_low = 8'hd1;
          4'h3: mant_low = 8'hd2;
          4'h4: mant_low = 8'hd4;
          4'h5: mant_low = 8'hd6;
          4'h6: mant_low = 8'hd7;
          4'h7: mant_low = 8'hd9;
          4'h8: mant_low = 8'hdb;
          4'h9: mant_low = 8'hdc;
          4'ha: mant_low = 8'hde;
          4'hb: mant_low = 8'he0;
          4'hc: mant_low = 8'he2;
          4'hd: mant_low = 8'he3;
          4'he: mant_low = 8'he5;
          4'hf: mant_low = 8'he7;
          default: mant_low = 8'h00;
        endcase
      end
      6'h2e: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'he8;
          4'h1: mant_low = 8'hea;
          4'h2: mant_low = 8'hec;
          4'h3: mant_low = 8'hee;
          4'h4: mant_low = 8'hef;
          4'h5: mant_low = 8'hf1;
          4'h6: mant_low = 8'hf3;
          4'h7: mant_low = 8'hf5;
          4'h8: mant_low = 8'hf6;
          4'h9: mant_low = 8'hf8;
          4'ha: mant_low = 8'hfa;
          4'hb: mant_low = 8'hfb;
          4'hc: mant_low = 8'hfd;
          4'hd: mant_low = 8'hff;
          4'he: mant_low = 8'h01;
          4'hf: mant_low = 8'h02;
          default: mant_low = 8'h00;
        endcase
      end
      6'h2f: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h04;
          4'h1: mant_low = 8'h06;
          4'h2: mant_low = 8'h08;
          4'h3: mant_low = 8'h09;
          4'h4: mant_low = 8'h0b;
          4'h5: mant_low = 8'h0d;
          4'h6: mant_low = 8'h0f;
          4'h7: mant_low = 8'h10;
          4'h8: mant_low = 8'h12;
          4'h9: mant_low = 8'h14;
          4'ha: mant_low = 8'h16;
          4'hb: mant_low = 8'h17;
          4'hc: mant_low = 8'h19;
          4'hd: mant_low = 8'h1b;
          4'he: mant_low = 8'h1d;
          4'hf: mant_low = 8'h1e;
          default: mant_low = 8'h00;
        endcase
      end
      6'h30: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h20;
          4'h1: mant_low = 8'h22;
          4'h2: mant_low = 8'h24;
          4'h3: mant_low = 8'h25;
          4'h4: mant_low = 8'h27;
          4'h5: mant_low = 8'h29;
          4'h6: mant_low = 8'h2b;
          4'h7: mant_low = 8'h2c;
          4'h8: mant_low = 8'h2e;
          4'h9: mant_low = 8'h30;
          4'ha: mant_low = 8'h32;
          4'hb: mant_low = 8'h33;
          4'hc: mant_low = 8'h35;
          4'hd: mant_low = 8'h37;
          4'he: mant_low = 8'h39;
          4'hf: mant_low = 8'h3a;
          default: mant_low = 8'h00;
        endcase
      end
      6'h31: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h3c;
          4'h1: mant_low = 8'h3e;
          4'h2: mant_low = 8'h40;
          4'h3: mant_low = 8'h41;
          4'h4: mant_low = 8'h43;
          4'h5: mant_low = 8'h45;
          4'h6: mant_low = 8'h47;
          4'h7: mant_low = 8'h49;
          4'h8: mant_low = 8'h4a;
          4'h9: mant_low = 8'h4c;
          4'ha: mant_low = 8'h4e;
          4'hb: mant_low = 8'h50;
          4'hc: mant_low = 8'h51;
          4'hd: mant_low = 8'h53;
          4'he: mant_low = 8'h55;
          4'hf: mant_low = 8'h57;
          default: mant_low = 8'h00;
        endcase
      end
      6'h32: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h58;
          4'h1: mant_low = 8'h5a;
          4'h2: mant_low = 8'h5c;
          4'h3: mant_low = 8'h5e;
          4'h4: mant_low = 8'h60;
          4'h5: mant_low = 8'h61;
          4'h6: mant_low = 8'h63;
          4'h7: mant_low = 8'h65;
          4'h8: mant_low = 8'h67;
          4'h9: mant_low = 8'h69;
          4'ha: mant_low = 8'h6a;
          4'hb: mant_low = 8'h6c;
          4'hc: mant_low = 8'h6e;
          4'hd: mant_low = 8'h70;
          4'he: mant_low = 8'h72;
          4'hf: mant_low = 8'h73;
          default: mant_low = 8'h00;
        endcase
      end
      6'h33: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h75;
          4'h1: mant_low = 8'h77;
          4'h2: mant_low = 8'h79;
          4'h3: mant_low = 8'h7b;
          4'h4: mant_low = 8'h7c;
          4'h5: mant_low = 8'h7e;
          4'h6: mant_low = 8'h80;
          4'h7: mant_low = 8'h82;
          4'h8: mant_low = 8'h84;
          4'h9: mant_low = 8'h85;
          4'ha: mant_low = 8'h87;
          4'hb: mant_low = 8'h89;
          4'hc: mant_low = 8'h8b;
          4'hd: mant_low = 8'h8d;
          4'he: mant_low = 8'h8e;
          4'hf: mant_low = 8'h90;
          default: mant_low = 8'h00;
        endcase
      end
      6'h34: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h92;
          4'h1: mant_low = 8'h94;
          4'h2: mant_low = 8'h96;
          4'h3: mant_low = 8'h97;
          4'h4: mant_low = 8'h99;
          4'h5: mant_low = 8'h9b;
          4'h6: mant_low = 8'h9d;
          4'h7: mant_low = 8'h9f;
          4'h8: mant_low = 8'ha1;
          4'h9: mant_low = 8'ha2;
          4'ha: mant_low = 8'ha4;
          4'hb: mant_low = 8'ha6;
          4'hc: mant_low = 8'ha8;
          4'hd: mant_low = 8'haa;
          4'he: mant_low = 8'hab;
          4'hf: mant_low = 8'had;
          default: mant_low = 8'h00;
        endcase
      end
      6'h35: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'haf;
          4'h1: mant_low = 8'hb1;
          4'h2: mant_low = 8'hb3;
          4'h3: mant_low = 8'hb5;
          4'h4: mant_low = 8'hb6;
          4'h5: mant_low = 8'hb8;
          4'h6: mant_low = 8'hba;
          4'h7: mant_low = 8'hbc;
          4'h8: mant_low = 8'hbe;
          4'h9: mant_low = 8'hc0;
          4'ha: mant_low = 8'hc1;
          4'hb: mant_low = 8'hc3;
          4'hc: mant_low = 8'hc5;
          4'hd: mant_low = 8'hc7;
          4'he: mant_low = 8'hc9;
          4'hf: mant_low = 8'hcb;
          default: mant_low = 8'h00;
        endcase
      end
      6'h36: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'hcc;
          4'h1: mant_low = 8'hce;
          4'h2: mant_low = 8'hd0;
          4'h3: mant_low = 8'hd2;
          4'h4: mant_low = 8'hd4;
          4'h5: mant_low = 8'hd6;
          4'h6: mant_low = 8'hd8;
          4'h7: mant_low = 8'hd9;
          4'h8: mant_low = 8'hdb;
          4'h9: mant_low = 8'hdd;
          4'ha: mant_low = 8'hdf;
          4'hb: mant_low = 8'he1;
          4'hc: mant_low = 8'he3;
          4'hd: mant_low = 8'he5;
          4'he: mant_low = 8'he6;
          4'hf: mant_low = 8'he8;
          default: mant_low = 8'h00;
        endcase
      end
      6'h37: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'hea;
          4'h1: mant_low = 8'hec;
          4'h2: mant_low = 8'hee;
          4'h3: mant_low = 8'hf0;
          4'h4: mant_low = 8'hf2;
          4'h5: mant_low = 8'hf3;
          4'h6: mant_low = 8'hf5;
          4'h7: mant_low = 8'hf7;
          4'h8: mant_low = 8'hf9;
          4'h9: mant_low = 8'hfb;
          4'ha: mant_low = 8'hfd;
          4'hb: mant_low = 8'hff;
          4'hc: mant_low = 8'h01;
          4'hd: mant_low = 8'h02;
          4'he: mant_low = 8'h04;
          4'hf: mant_low = 8'h06;
          default: mant_low = 8'h00;
        endcase
      end
      6'h38: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h08;
          4'h1: mant_low = 8'h0a;
          4'h2: mant_low = 8'h0c;
          4'h3: mant_low = 8'h0e;
          4'h4: mant_low = 8'h10;
          4'h5: mant_low = 8'h11;
          4'h6: mant_low = 8'h13;
          4'h7: mant_low = 8'h15;
          4'h8: mant_low = 8'h17;
          4'h9: mant_low = 8'h19;
          4'ha: mant_low = 8'h1b;
          4'hb: mant_low = 8'h1d;
          4'hc: mant_low = 8'h1f;
          4'hd: mant_low = 8'h20;
          4'he: mant_low = 8'h22;
          4'hf: mant_low = 8'h24;
          default: mant_low = 8'h00;
        endcase
      end
      6'h39: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h26;
          4'h1: mant_low = 8'h28;
          4'h2: mant_low = 8'h2a;
          4'h3: mant_low = 8'h2c;
          4'h4: mant_low = 8'h2e;
          4'h5: mant_low = 8'h30;
          4'h6: mant_low = 8'h31;
          4'h7: mant_low = 8'h33;
          4'h8: mant_low = 8'h35;
          4'h9: mant_low = 8'h37;
          4'ha: mant_low = 8'h39;
          4'hb: mant_low = 8'h3b;
          4'hc: mant_low = 8'h3d;
          4'hd: mant_low = 8'h3f;
          4'he: mant_low = 8'h41;
          4'hf: mant_low = 8'h43;
          default: mant_low = 8'h00;
        endcase
      end
      6'h3a: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h44;
          4'h1: mant_low = 8'h46;
          4'h2: mant_low = 8'h48;
          4'h3: mant_low = 8'h4a;
          4'h4: mant_low = 8'h4c;
          4'h5: mant_low = 8'h4e;
          4'h6: mant_low = 8'h50;
          4'h7: mant_low = 8'h52;
          4'h8: mant_low = 8'h54;
          4'h9: mant_low = 8'h56;
          4'ha: mant_low = 8'h58;
          4'hb: mant_low = 8'h5a;
          4'hc: mant_low = 8'h5b;
          4'hd: mant_low = 8'h5d;
          4'he: mant_low = 8'h5f;
          4'hf: mant_low = 8'h61;
          default: mant_low = 8'h00;
        endcase
      end
      6'h3b: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h63;
          4'h1: mant_low = 8'h65;
          4'h2: mant_low = 8'h67;
          4'h3: mant_low = 8'h69;
          4'h4: mant_low = 8'h6b;
          4'h5: mant_low = 8'h6d;
          4'h6: mant_low = 8'h6f;
          4'h7: mant_low = 8'h71;
          4'h8: mant_low = 8'h73;
          4'h9: mant_low = 8'h74;
          4'ha: mant_low = 8'h76;
          4'hb: mant_low = 8'h78;
          4'hc: mant_low = 8'h7a;
          4'hd: mant_low = 8'h7c;
          4'he: mant_low = 8'h7e;
          4'hf: mant_low = 8'h80;
          default: mant_low = 8'h00;
        endcase
      end
      6'h3c: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'h82;
          4'h1: mant_low = 8'h84;
          4'h2: mant_low = 8'h86;
          4'h3: mant_low = 8'h88;
          4'h4: mant_low = 8'h8a;
          4'h5: mant_low = 8'h8c;
          4'h6: mant_low = 8'h8e;
          4'h7: mant_low = 8'h90;
          4'h8: mant_low = 8'h92;
          4'h9: mant_low = 8'h93;
          4'ha: mant_low = 8'h95;
          4'hb: mant_low = 8'h97;
          4'hc: mant_low = 8'h99;
          4'hd: mant_low = 8'h9b;
          4'he: mant_low = 8'h9d;
          4'hf: mant_low = 8'h9f;
          default: mant_low = 8'h00;
        endcase
      end
      6'h3d: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'ha1;
          4'h1: mant_low = 8'ha3;
          4'h2: mant_low = 8'ha5;
          4'h3: mant_low = 8'ha7;
          4'h4: mant_low = 8'ha9;
          4'h5: mant_low = 8'hab;
          4'h6: mant_low = 8'had;
          4'h7: mant_low = 8'haf;
          4'h8: mant_low = 8'hb1;
          4'h9: mant_low = 8'hb3;
          4'ha: mant_low = 8'hb5;
          4'hb: mant_low = 8'hb7;
          4'hc: mant_low = 8'hb9;
          4'hd: mant_low = 8'hbb;
          4'he: mant_low = 8'hbd;
          4'hf: mant_low = 8'hbf;
          default: mant_low = 8'h00;
        endcase
      end
      6'h3e: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'hc0;
          4'h1: mant_low = 8'hc2;
          4'h2: mant_low = 8'hc4;
          4'h3: mant_low = 8'hc6;
          4'h4: mant_low = 8'hc8;
          4'h5: mant_low = 8'hca;
          4'h6: mant_low = 8'hcc;
          4'h7: mant_low = 8'hce;
          4'h8: mant_low = 8'hd0;
          4'h9: mant_low = 8'hd2;
          4'ha: mant_low = 8'hd4;
          4'hb: mant_low = 8'hd6;
          4'hc: mant_low = 8'hd8;
          4'hd: mant_low = 8'hda;
          4'he: mant_low = 8'hdc;
          4'hf: mant_low = 8'hde;
          default: mant_low = 8'h00;
        endcase
      end
      6'h3f: begin
        (* parallel_case, full_case *) case (mant[3:0])
          4'h0: mant_low = 8'he0;
          4'h1: mant_low = 8'he2;
          4'h2: mant_low = 8'he4;
          4'h3: mant_low = 8'he6;
          4'h4: mant_low = 8'he8;
          4'h5: mant_low = 8'hea;
          4'h6: mant_low = 8'hec;
          4'h7: mant_low = 8'hee;
          4'h8: mant_low = 8'hf0;
          4'h9: mant_low = 8'hf2;
          4'ha: mant_low = 8'hf4;
          4'hb: mant_low = 8'hf6;
          4'hc: mant_low = 8'hf8;
          4'hd: mant_low = 8'hfa;
          4'he: mant_low = 8'hfc;
          4'hf: mant_low = 8'hfe;
          default: mant_low = 8'h00;
        endcase
      end
      default: mant_low = 8'h00;
    endcase
  end
  reg mant_b9;
  always @* begin
    if (mant <= 10'h1a7) begin
      if (mant <= 10'h0e5) begin
        mant_b9 = 0;
      end else begin
        mant_b9 = 1;
      end
    end else begin
      if (mant <= 10'h2ed) begin
        mant_b9 = 0;
      end else begin
        mant_b9 = 1;
      end
    end
  end
  reg mant_b8;
  always @* begin
    if (mant <= 10'h1a7) begin
      if (mant <= 10'h0e5) begin
        if (mant <= 10'h078) begin
          mant_b8 = 0;
        end else begin
          mant_b8 = 1;
        end
      end else begin
        if (mant <= 10'h14a) begin
          mant_b8 = 0;
        end else begin
          mant_b8 = 1;
        end
      end
    end else begin
      if (mant <= 10'h2ed) begin
        if (mant <= 10'h252) begin
          mant_b8 = 0;
        end else begin
          mant_b8 = 1;
        end
      end else begin
        if (mant <= 10'h37b) begin
          mant_b8 = 0;
        end else begin
          mant_b8 = 1;
        end
      end
    end
  end
  wire [9:0] out_mant = {mant_b9, mant_b8, mant_low};
  assign out = active_normal ? {1'b0, out_exp, out_mant} : special_out;
endmodule
