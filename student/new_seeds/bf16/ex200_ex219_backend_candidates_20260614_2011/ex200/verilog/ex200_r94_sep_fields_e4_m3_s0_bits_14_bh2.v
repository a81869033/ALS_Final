module ex200_r94_sep_fields_e4_m3_s0_bits_14_bh2(in, out);
  input [15:0] in;
  output [15:0] out;
  wire [8:0] sign_exp = in[15:7];
  wire [6:0] mant = in[6:0];
  wire mant_hi1 = mant[6];
  wire [5:0] mant_lo6 = mant[5:0];
  wire [1:0] mant_hi2 = mant[6:5];
  wire [4:0] mant_lo5 = mant[4:0];
  wire [2:0] mant_hi3 = mant[6:4];
  wire [3:0] mant_lo4 = mant[3:0];
  wire [3:0] mant_hi4 = mant[6:3];
  wire [2:0] mant_lo3 = mant[2:0];
  wire [4:0] mant_hi5 = mant[6:2];
  wire [1:0] mant_lo2 = mant[1:0];
  wire [5:0] mant_hi6 = mant[6:1];
  wire mant_lo1 = mant[0];
  reg out_sign;
  reg [7:0] out_exp;
  reg [6:0] out_mant;
  always @* begin
    out_sign = 1'h0;
    casez (sign_exp)
      default: begin end
    endcase
  end
  always @* begin
    out_exp = 8'h7f;
    casez (sign_exp)
      9'b11000011?: out_exp = 8'h00;
      9'b110001???: out_exp = 8'h00;
      9'b11001????: out_exp = 8'h00;
      9'b1101?????: out_exp = 8'h00;
      9'b1110?????: out_exp = 8'h00;
      9'b11110????: out_exp = 8'h00;
      9'b111110???: out_exp = 8'h00;
      9'b1111110??: out_exp = 8'h00;
      9'b11111110?: out_exp = 8'h00;
      9'b111111110: out_exp = 8'h00;
      9'b101110111: out_exp = 8'h7e;
      9'b1011110??: out_exp = 8'h7e;
      9'b10111110?: out_exp = 8'h7e;
      9'b01000011?: out_exp = 8'hff;
      9'b010001???: out_exp = 8'hff;
      9'b01001????: out_exp = 8'hff;
      9'b0101?????: out_exp = 8'hff;
      9'b011??????: out_exp = 8'hff;
      9'h07e: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'h7f;
          end
          4'h1: begin
            out_exp = 8'h7f;
          end
          4'h2: begin
            out_exp = 8'h7f;
          end
          4'h3: begin
            out_exp = 8'h7f;
          end
          4'h4: begin
            out_exp = 8'h7f;
          end
          4'h5: begin
            out_exp = 8'h7f;
          end
          4'h6: begin
            out_exp = 8'h80;
            case (mant_lo3)
              3'h0: out_exp = 8'h7f;
              default: begin end
            endcase
          end
          4'h7: begin
            out_exp = 8'h80;
          end
          4'h8: begin
            out_exp = 8'h80;
          end
          4'h9: begin
            out_exp = 8'h80;
          end
          4'ha: begin
            out_exp = 8'h80;
          end
          4'hb: begin
            out_exp = 8'h80;
          end
          4'hc: begin
            out_exp = 8'h80;
          end
          4'hd: begin
            out_exp = 8'h80;
          end
          4'he: begin
            out_exp = 8'h80;
          end
          4'hf: begin
            out_exp = 8'h80;
          end
          default: begin end
        endcase
      end
      9'h07f: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'h80;
          end
          4'h1: begin
            out_exp = 8'h80;
          end
          4'h2: begin
            out_exp = 8'h80;
          end
          4'h3: begin
            out_exp = 8'h80;
          end
          4'h4: begin
            out_exp = 8'h80;
          end
          4'h5: begin
            out_exp = 8'h80;
          end
          4'h6: begin
            out_exp = 8'h81;
            case (mant_lo3)
              3'h0: out_exp = 8'h80;
              3'h1: out_exp = 8'h80;
              default: begin end
            endcase
          end
          4'h7: begin
            out_exp = 8'h81;
          end
          4'h8: begin
            out_exp = 8'h81;
          end
          4'h9: begin
            out_exp = 8'h81;
          end
          4'ha: begin
            out_exp = 8'h81;
          end
          4'hb: begin
            out_exp = 8'h81;
          end
          4'hc: begin
            out_exp = 8'h81;
          end
          4'hd: begin
            out_exp = 8'h81;
          end
          4'he: begin
            out_exp = 8'h81;
          end
          4'hf: begin
            out_exp = 8'h81;
          end
          default: begin end
        endcase
      end
      9'h080: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'h81;
            case (mant_lo3)
              3'h5: out_exp = 8'h82;
              3'h6: out_exp = 8'h82;
              3'h7: out_exp = 8'h82;
              default: begin end
            endcase
          end
          4'h1: begin
            out_exp = 8'h82;
          end
          4'h2: begin
            out_exp = 8'h82;
          end
          4'h3: begin
            out_exp = 8'h82;
          end
          4'h4: begin
            out_exp = 8'h82;
          end
          4'h5: begin
            out_exp = 8'h82;
          end
          4'h6: begin
            out_exp = 8'h83;
            case (mant_lo3)
              3'h0: out_exp = 8'h82;
              3'h1: out_exp = 8'h82;
              default: begin end
            endcase
          end
          4'h7: begin
            out_exp = 8'h83;
          end
          4'h8: begin
            out_exp = 8'h83;
          end
          4'h9: begin
            out_exp = 8'h83;
          end
          4'ha: begin
            out_exp = 8'h83;
          end
          4'hb: begin
            out_exp = 8'h83;
            case (mant_lo3)
              3'h6: out_exp = 8'h84;
              3'h7: out_exp = 8'h84;
              default: begin end
            endcase
          end
          4'hc: begin
            out_exp = 8'h84;
          end
          4'hd: begin
            out_exp = 8'h84;
          end
          4'he: begin
            out_exp = 8'h84;
          end
          4'hf: begin
            out_exp = 8'h84;
          end
          default: begin end
        endcase
      end
      9'h081: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'h84;
            case (mant_lo3)
              3'h6: out_exp = 8'h85;
              3'h7: out_exp = 8'h85;
              default: begin end
            endcase
          end
          4'h1: begin
            out_exp = 8'h85;
          end
          4'h2: begin
            out_exp = 8'h85;
          end
          4'h3: begin
            out_exp = 8'h85;
            case (mant_lo3)
              3'h4: out_exp = 8'h86;
              3'h5: out_exp = 8'h86;
              3'h6: out_exp = 8'h86;
              3'h7: out_exp = 8'h86;
              default: begin end
            endcase
          end
          4'h4: begin
            out_exp = 8'h86;
          end
          4'h5: begin
            out_exp = 8'h86;
          end
          4'h6: begin
            out_exp = 8'h87;
            case (mant_lo3)
              3'h0: out_exp = 8'h86;
              3'h1: out_exp = 8'h86;
              default: begin end
            endcase
          end
          4'h7: begin
            out_exp = 8'h87;
          end
          4'h8: begin
            out_exp = 8'h87;
          end
          4'h9: begin
            out_exp = 8'h88;
          end
          4'ha: begin
            out_exp = 8'h88;
          end
          4'hb: begin
            out_exp = 8'h88;
            case (mant_lo3)
              3'h6: out_exp = 8'h89;
              3'h7: out_exp = 8'h89;
              default: begin end
            endcase
          end
          4'hc: begin
            out_exp = 8'h89;
          end
          4'hd: begin
            out_exp = 8'h89;
          end
          4'he: begin
            out_exp = 8'h89;
            case (mant_lo3)
              3'h4: out_exp = 8'h8a;
              3'h5: out_exp = 8'h8a;
              3'h6: out_exp = 8'h8a;
              3'h7: out_exp = 8'h8a;
              default: begin end
            endcase
          end
          4'hf: begin
            out_exp = 8'h8a;
          end
          default: begin end
        endcase
      end
      9'h082: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'h8a;
            case (mant_lo3)
              3'h6: out_exp = 8'h8b;
              3'h7: out_exp = 8'h8b;
              default: begin end
            endcase
          end
          4'h1: begin
            out_exp = 8'h8b;
          end
          4'h2: begin
            out_exp = 8'h8c;
            case (mant_lo3)
              3'h0: out_exp = 8'h8b;
              default: begin end
            endcase
          end
          4'h3: begin
            out_exp = 8'h8c;
            case (mant_lo3)
              3'h4: out_exp = 8'h8d;
              3'h5: out_exp = 8'h8d;
              3'h6: out_exp = 8'h8d;
              3'h7: out_exp = 8'h8d;
              default: begin end
            endcase
          end
          4'h4: begin
            out_exp = 8'h8d;
            case (mant_lo3)
              3'h7: out_exp = 8'h8e;
              default: begin end
            endcase
          end
          4'h5: begin
            out_exp = 8'h8e;
          end
          4'h6: begin
            out_exp = 8'h8f;
            case (mant_lo3)
              3'h0: out_exp = 8'h8e;
              3'h1: out_exp = 8'h8e;
              default: begin end
            endcase
          end
          4'h7: begin
            out_exp = 8'h8f;
            case (mant_lo3)
              3'h5: out_exp = 8'h90;
              3'h6: out_exp = 8'h90;
              3'h7: out_exp = 8'h90;
              default: begin end
            endcase
          end
          4'h8: begin
            out_exp = 8'h90;
          end
          4'h9: begin
            out_exp = 8'h91;
          end
          4'ha: begin
            out_exp = 8'h92;
            case (mant_lo3)
              3'h0: out_exp = 8'h91;
              3'h1: out_exp = 8'h91;
              3'h2: out_exp = 8'h91;
              default: begin end
            endcase
          end
          4'hb: begin
            out_exp = 8'h92;
            case (mant_lo3)
              3'h6: out_exp = 8'h93;
              3'h7: out_exp = 8'h93;
              default: begin end
            endcase
          end
          4'hc: begin
            out_exp = 8'h93;
          end
          4'hd: begin
            out_exp = 8'h94;
            case (mant_lo3)
              3'h0: out_exp = 8'h93;
              default: begin end
            endcase
          end
          4'he: begin
            out_exp = 8'h94;
            case (mant_lo3)
              3'h4: out_exp = 8'h95;
              3'h5: out_exp = 8'h95;
              3'h6: out_exp = 8'h95;
              3'h7: out_exp = 8'h95;
              default: begin end
            endcase
          end
          4'hf: begin
            out_exp = 8'h95;
          end
          default: begin end
        endcase
      end
      9'h083: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'h96;
            case (mant_lo3)
              3'h6: out_exp = 8'h97;
              3'h7: out_exp = 8'h97;
              default: begin end
            endcase
          end
          4'h1: begin
            out_exp = 8'h98;
            case (mant_lo3)
              3'h0: out_exp = 8'h97;
              3'h1: out_exp = 8'h97;
              3'h2: out_exp = 8'h97;
              default: begin end
            endcase
          end
          4'h2: begin
            out_exp = 8'h99;
            case (mant_lo3)
              3'h0: out_exp = 8'h98;
              3'h6: out_exp = 8'h9a;
              3'h7: out_exp = 8'h9a;
              default: begin end
            endcase
          end
          4'h3: begin
            out_exp = 8'h9a;
            case (mant_lo3)
              3'h4: out_exp = 8'h9b;
              3'h5: out_exp = 8'h9b;
              3'h6: out_exp = 8'h9b;
              3'h7: out_exp = 8'h9b;
              default: begin end
            endcase
          end
          4'h4: begin
            out_exp = 8'h9c;
            case (mant_lo3)
              3'h0: out_exp = 8'h9b;
              3'h7: out_exp = 8'h9d;
              default: begin end
            endcase
          end
          4'h5: begin
            out_exp = 8'h9d;
            case (mant_lo3)
              3'h4: out_exp = 8'h9e;
              3'h5: out_exp = 8'h9e;
              3'h6: out_exp = 8'h9e;
              3'h7: out_exp = 8'h9e;
              default: begin end
            endcase
          end
          4'h6: begin
            out_exp = 8'h9f;
            case (mant_lo3)
              3'h0: out_exp = 8'h9e;
              3'h1: out_exp = 8'h9e;
              3'h7: out_exp = 8'ha0;
              default: begin end
            endcase
          end
          4'h7: begin
            out_exp = 8'ha0;
            case (mant_lo3)
              3'h5: out_exp = 8'ha1;
              3'h6: out_exp = 8'ha1;
              3'h7: out_exp = 8'ha1;
              default: begin end
            endcase
          end
          4'h8: begin
            out_exp = 8'ha2;
            case (mant_lo3)
              3'h0: out_exp = 8'ha1;
              3'h1: out_exp = 8'ha1;
              3'h2: out_exp = 8'ha1;
              default: begin end
            endcase
          end
          4'h9: begin
            out_exp = 8'ha3;
            case (mant_lo3)
              3'h6: out_exp = 8'ha4;
              3'h7: out_exp = 8'ha4;
              default: begin end
            endcase
          end
          4'ha: begin
            out_exp = 8'ha5;
            case (mant_lo3)
              3'h0: out_exp = 8'ha4;
              3'h1: out_exp = 8'ha4;
              3'h2: out_exp = 8'ha4;
              default: begin end
            endcase
          end
          4'hb: begin
            out_exp = 8'ha6;
            case (mant_lo3)
              3'h0: out_exp = 8'ha5;
              3'h6: out_exp = 8'ha7;
              3'h7: out_exp = 8'ha7;
              default: begin end
            endcase
          end
          4'hc: begin
            out_exp = 8'ha7;
            case (mant_lo3)
              3'h4: out_exp = 8'ha8;
              3'h5: out_exp = 8'ha8;
              3'h6: out_exp = 8'ha8;
              3'h7: out_exp = 8'ha8;
              default: begin end
            endcase
          end
          4'hd: begin
            out_exp = 8'ha9;
            case (mant_lo3)
              3'h0: out_exp = 8'ha8;
              3'h7: out_exp = 8'haa;
              default: begin end
            endcase
          end
          4'he: begin
            out_exp = 8'haa;
            case (mant_lo3)
              3'h4: out_exp = 8'hab;
              3'h5: out_exp = 8'hab;
              3'h6: out_exp = 8'hab;
              3'h7: out_exp = 8'hab;
              default: begin end
            endcase
          end
          4'hf: begin
            out_exp = 8'hac;
            case (mant_lo3)
              3'h0: out_exp = 8'hab;
              3'h1: out_exp = 8'hab;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h084: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'had;
            case (mant_lo3)
              3'h3: out_exp = 8'hae;
              3'h4: out_exp = 8'hae;
              3'h5: out_exp = 8'hae;
              3'h6: out_exp = 8'haf;
              3'h7: out_exp = 8'haf;
              default: begin end
            endcase
          end
          4'h1: begin
            out_exp = 8'hb0;
            case (mant_lo3)
              3'h3: out_exp = 8'hb1;
              3'h4: out_exp = 8'hb1;
              3'h5: out_exp = 8'hb1;
              3'h6: out_exp = 8'hb2;
              3'h7: out_exp = 8'hb2;
              default: begin end
            endcase
          end
          4'h2: begin
            out_exp = 8'hb4;
            case (mant_lo3)
              3'h0: out_exp = 8'hb2;
              3'h1: out_exp = 8'hb3;
              3'h2: out_exp = 8'hb3;
              3'h6: out_exp = 8'hb5;
              3'h7: out_exp = 8'hb5;
              default: begin end
            endcase
          end
          4'h3: begin
            out_exp = 8'hb6;
            case (mant_lo3)
              3'h0: out_exp = 8'hb5;
              3'h4: out_exp = 8'hb7;
              3'h5: out_exp = 8'hb7;
              3'h6: out_exp = 8'hb7;
              3'h7: out_exp = 8'hb8;
              default: begin end
            endcase
          end
          4'h4: begin
            out_exp = 8'hb9;
            case (mant_lo3)
              3'h0: out_exp = 8'hb8;
              3'h4: out_exp = 8'hba;
              3'h5: out_exp = 8'hba;
              3'h6: out_exp = 8'hba;
              3'h7: out_exp = 8'hbb;
              default: begin end
            endcase
          end
          4'h5: begin
            out_exp = 8'hbd;
            case (mant_lo3)
              3'h0: out_exp = 8'hbb;
              3'h1: out_exp = 8'hbb;
              3'h2: out_exp = 8'hbc;
              3'h3: out_exp = 8'hbc;
              3'h7: out_exp = 8'hbe;
              default: begin end
            endcase
          end
          4'h6: begin
            out_exp = 8'hbf;
            case (mant_lo3)
              3'h0: out_exp = 8'hbe;
              3'h1: out_exp = 8'hbe;
              3'h5: out_exp = 8'hc0;
              3'h6: out_exp = 8'hc0;
              3'h7: out_exp = 8'hc1;
              default: begin end
            endcase
          end
          4'h7: begin
            out_exp = 8'hc2;
            case (mant_lo3)
              3'h0: out_exp = 8'hc1;
              3'h1: out_exp = 8'hc1;
              3'h5: out_exp = 8'hc3;
              3'h6: out_exp = 8'hc3;
              3'h7: out_exp = 8'hc3;
              default: begin end
            endcase
          end
          4'h8: begin
            out_exp = 8'hc4;
            case (mant_lo3)
              3'h3: out_exp = 8'hc5;
              3'h4: out_exp = 8'hc5;
              3'h5: out_exp = 8'hc6;
              3'h6: out_exp = 8'hc6;
              3'h7: out_exp = 8'hc6;
              default: begin end
            endcase
          end
          4'h9: begin
            out_exp = 8'hc7;
            case (mant_lo3)
              3'h3: out_exp = 8'hc8;
              3'h4: out_exp = 8'hc8;
              3'h5: out_exp = 8'hc8;
              3'h6: out_exp = 8'hc9;
              3'h7: out_exp = 8'hc9;
              default: begin end
            endcase
          end
          4'ha: begin
            out_exp = 8'hca;
            case (mant_lo3)
              3'h3: out_exp = 8'hcb;
              3'h4: out_exp = 8'hcb;
              3'h5: out_exp = 8'hcb;
              3'h6: out_exp = 8'hcc;
              3'h7: out_exp = 8'hcc;
              default: begin end
            endcase
          end
          4'hb: begin
            out_exp = 8'hcd;
            case (mant_lo3)
              3'h0: out_exp = 8'hcc;
              3'h4: out_exp = 8'hce;
              3'h5: out_exp = 8'hce;
              3'h6: out_exp = 8'hcf;
              3'h7: out_exp = 8'hcf;
              default: begin end
            endcase
          end
          4'hc: begin
            out_exp = 8'hd0;
            case (mant_lo3)
              3'h0: out_exp = 8'hcf;
              3'h4: out_exp = 8'hd1;
              3'h5: out_exp = 8'hd1;
              3'h6: out_exp = 8'hd1;
              3'h7: out_exp = 8'hd2;
              default: begin end
            endcase
          end
          4'hd: begin
            out_exp = 8'hd3;
            case (mant_lo3)
              3'h0: out_exp = 8'hd2;
              3'h4: out_exp = 8'hd4;
              3'h5: out_exp = 8'hd4;
              3'h6: out_exp = 8'hd4;
              3'h7: out_exp = 8'hd5;
              default: begin end
            endcase
          end
          4'he: begin
            out_exp = 8'hd7;
            case (mant_lo3)
              3'h0: out_exp = 8'hd5;
              3'h1: out_exp = 8'hd5;
              3'h2: out_exp = 8'hd6;
              3'h3: out_exp = 8'hd6;
              3'h7: out_exp = 8'hd8;
              default: begin end
            endcase
          end
          4'hf: begin
            out_exp = 8'hd9;
            case (mant_lo3)
              3'h0: out_exp = 8'hd8;
              3'h1: out_exp = 8'hd8;
              3'h5: out_exp = 8'hda;
              3'h6: out_exp = 8'hda;
              3'h7: out_exp = 8'hda;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h085: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'hdc;
            case (mant_lo3)
              3'h0: out_exp = 8'hdb;
              3'h3: out_exp = 8'hdd;
              3'h4: out_exp = 8'hde;
              3'h5: out_exp = 8'hde;
              3'h6: out_exp = 8'hdf;
              3'h7: out_exp = 8'he0;
              default: begin end
            endcase
          end
          4'h1: begin
            out_exp = 8'he1;
            case (mant_lo3)
              3'h2: out_exp = 8'he2;
              3'h3: out_exp = 8'he3;
              3'h4: out_exp = 8'he3;
              3'h5: out_exp = 8'he4;
              3'h6: out_exp = 8'he5;
              3'h7: out_exp = 8'he6;
              default: begin end
            endcase
          end
          4'h2: begin
            out_exp = 8'he9;
            case (mant_lo3)
              3'h0: out_exp = 8'he6;
              3'h1: out_exp = 8'he7;
              3'h2: out_exp = 8'he8;
              3'h5: out_exp = 8'hea;
              3'h6: out_exp = 8'heb;
              3'h7: out_exp = 8'heb;
              default: begin end
            endcase
          end
          4'h3: begin
            out_exp = 8'hee;
            case (mant_lo3)
              3'h0: out_exp = 8'hec;
              3'h1: out_exp = 8'hed;
              3'h4: out_exp = 8'hef;
              3'h5: out_exp = 8'hf0;
              3'h6: out_exp = 8'hf0;
              3'h7: out_exp = 8'hf1;
              default: begin end
            endcase
          end
          4'h4: begin
            out_exp = 8'hf3;
            case (mant_lo3)
              3'h0: out_exp = 8'hf2;
              3'h3: out_exp = 8'hf4;
              3'h4: out_exp = 8'hf5;
              3'h5: out_exp = 8'hf6;
              3'h6: out_exp = 8'hf6;
              3'h7: out_exp = 8'hf7;
              default: begin end
            endcase
          end
          4'h5: begin
            out_exp = 8'hf8;
            case (mant_lo3)
              3'h2: out_exp = 8'hf9;
              3'h3: out_exp = 8'hfa;
              3'h4: out_exp = 8'hfb;
              3'h5: out_exp = 8'hfb;
              3'h6: out_exp = 8'hfc;
              3'h7: out_exp = 8'hfd;
              default: begin end
            endcase
          end
          4'h6: begin
            out_exp = 8'hff;
            case (mant_lo3)
              3'h0: out_exp = 8'hfd;
              3'h1: out_exp = 8'hfe;
              default: begin end
            endcase
          end
          4'h7: begin
            out_exp = 8'hff;
          end
          4'h8: begin
            out_exp = 8'hff;
          end
          4'h9: begin
            out_exp = 8'hff;
          end
          4'ha: begin
            out_exp = 8'hff;
          end
          4'hb: begin
            out_exp = 8'hff;
          end
          4'hc: begin
            out_exp = 8'hff;
          end
          4'hd: begin
            out_exp = 8'hff;
          end
          4'he: begin
            out_exp = 8'hff;
          end
          4'hf: begin
            out_exp = 8'hff;
          end
          default: begin end
        endcase
      end
      9'h176: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'h7e;
            case (mant_lo3)
              3'h0: out_exp = 8'h7f;
              default: begin end
            endcase
          end
          4'h1: begin
            out_exp = 8'h7e;
          end
          4'h2: begin
            out_exp = 8'h7e;
          end
          4'h3: begin
            out_exp = 8'h7e;
          end
          4'h4: begin
            out_exp = 8'h7e;
          end
          4'h5: begin
            out_exp = 8'h7e;
          end
          4'h6: begin
            out_exp = 8'h7e;
          end
          4'h7: begin
            out_exp = 8'h7e;
          end
          4'h8: begin
            out_exp = 8'h7e;
          end
          4'h9: begin
            out_exp = 8'h7e;
          end
          4'ha: begin
            out_exp = 8'h7e;
          end
          4'hb: begin
            out_exp = 8'h7e;
          end
          4'hc: begin
            out_exp = 8'h7e;
          end
          4'hd: begin
            out_exp = 8'h7e;
          end
          4'he: begin
            out_exp = 8'h7e;
          end
          4'hf: begin
            out_exp = 8'h7e;
          end
          default: begin end
        endcase
      end
      9'h17e: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'h7e;
          end
          4'h1: begin
            out_exp = 8'h7e;
          end
          4'h2: begin
            out_exp = 8'h7e;
          end
          4'h3: begin
            out_exp = 8'h7e;
          end
          4'h4: begin
            out_exp = 8'h7e;
          end
          4'h5: begin
            out_exp = 8'h7e;
          end
          4'h6: begin
            out_exp = 8'h7d;
            case (mant_lo3)
              3'h0: out_exp = 8'h7e;
              3'h1: out_exp = 8'h7e;
              default: begin end
            endcase
          end
          4'h7: begin
            out_exp = 8'h7d;
          end
          4'h8: begin
            out_exp = 8'h7d;
          end
          4'h9: begin
            out_exp = 8'h7d;
          end
          4'ha: begin
            out_exp = 8'h7d;
          end
          4'hb: begin
            out_exp = 8'h7d;
          end
          4'hc: begin
            out_exp = 8'h7d;
          end
          4'hd: begin
            out_exp = 8'h7d;
          end
          4'he: begin
            out_exp = 8'h7d;
          end
          4'hf: begin
            out_exp = 8'h7d;
          end
          default: begin end
        endcase
      end
      9'h17f: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'h7d;
          end
          4'h1: begin
            out_exp = 8'h7d;
          end
          4'h2: begin
            out_exp = 8'h7d;
          end
          4'h3: begin
            out_exp = 8'h7d;
          end
          4'h4: begin
            out_exp = 8'h7d;
          end
          4'h5: begin
            out_exp = 8'h7d;
          end
          4'h6: begin
            out_exp = 8'h7c;
            case (mant_lo3)
              3'h0: out_exp = 8'h7d;
              3'h1: out_exp = 8'h7d;
              default: begin end
            endcase
          end
          4'h7: begin
            out_exp = 8'h7c;
          end
          4'h8: begin
            out_exp = 8'h7c;
          end
          4'h9: begin
            out_exp = 8'h7c;
          end
          4'ha: begin
            out_exp = 8'h7c;
          end
          4'hb: begin
            out_exp = 8'h7c;
          end
          4'hc: begin
            out_exp = 8'h7c;
          end
          4'hd: begin
            out_exp = 8'h7c;
          end
          4'he: begin
            out_exp = 8'h7c;
          end
          4'hf: begin
            out_exp = 8'h7c;
          end
          default: begin end
        endcase
      end
      9'h180: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'h7c;
            case (mant_lo3)
              3'h6: out_exp = 8'h7b;
              3'h7: out_exp = 8'h7b;
              default: begin end
            endcase
          end
          4'h1: begin
            out_exp = 8'h7b;
          end
          4'h2: begin
            out_exp = 8'h7b;
          end
          4'h3: begin
            out_exp = 8'h7b;
          end
          4'h4: begin
            out_exp = 8'h7b;
          end
          4'h5: begin
            out_exp = 8'h7b;
          end
          4'h6: begin
            out_exp = 8'h7a;
            case (mant_lo3)
              3'h0: out_exp = 8'h7b;
              3'h1: out_exp = 8'h7b;
              default: begin end
            endcase
          end
          4'h7: begin
            out_exp = 8'h7a;
          end
          4'h8: begin
            out_exp = 8'h7a;
          end
          4'h9: begin
            out_exp = 8'h7a;
          end
          4'ha: begin
            out_exp = 8'h7a;
          end
          4'hb: begin
            out_exp = 8'h7a;
            case (mant_lo3)
              3'h6: out_exp = 8'h79;
              3'h7: out_exp = 8'h79;
              default: begin end
            endcase
          end
          4'hc: begin
            out_exp = 8'h79;
          end
          4'hd: begin
            out_exp = 8'h79;
          end
          4'he: begin
            out_exp = 8'h79;
          end
          4'hf: begin
            out_exp = 8'h79;
          end
          default: begin end
        endcase
      end
      9'h181: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'h79;
            case (mant_lo3)
              3'h6: out_exp = 8'h78;
              3'h7: out_exp = 8'h78;
              default: begin end
            endcase
          end
          4'h1: begin
            out_exp = 8'h78;
          end
          4'h2: begin
            out_exp = 8'h78;
          end
          4'h3: begin
            out_exp = 8'h78;
            case (mant_lo3)
              3'h4: out_exp = 8'h77;
              3'h5: out_exp = 8'h77;
              3'h6: out_exp = 8'h77;
              3'h7: out_exp = 8'h77;
              default: begin end
            endcase
          end
          4'h4: begin
            out_exp = 8'h77;
          end
          4'h5: begin
            out_exp = 8'h77;
          end
          4'h6: begin
            out_exp = 8'h76;
            case (mant_lo3)
              3'h0: out_exp = 8'h77;
              3'h1: out_exp = 8'h77;
              default: begin end
            endcase
          end
          4'h7: begin
            out_exp = 8'h76;
          end
          4'h8: begin
            out_exp = 8'h76;
          end
          4'h9: begin
            out_exp = 8'h75;
          end
          4'ha: begin
            out_exp = 8'h75;
          end
          4'hb: begin
            out_exp = 8'h75;
            case (mant_lo3)
              3'h6: out_exp = 8'h74;
              3'h7: out_exp = 8'h74;
              default: begin end
            endcase
          end
          4'hc: begin
            out_exp = 8'h74;
          end
          4'hd: begin
            out_exp = 8'h74;
          end
          4'he: begin
            out_exp = 8'h74;
            case (mant_lo3)
              3'h5: out_exp = 8'h73;
              3'h6: out_exp = 8'h73;
              3'h7: out_exp = 8'h73;
              default: begin end
            endcase
          end
          4'hf: begin
            out_exp = 8'h73;
          end
          default: begin end
        endcase
      end
      9'h182: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'h73;
            case (mant_lo3)
              3'h6: out_exp = 8'h72;
              3'h7: out_exp = 8'h72;
              default: begin end
            endcase
          end
          4'h1: begin
            out_exp = 8'h72;
          end
          4'h2: begin
            out_exp = 8'h71;
            case (mant_lo3)
              3'h0: out_exp = 8'h72;
              default: begin end
            endcase
          end
          4'h3: begin
            out_exp = 8'h71;
            case (mant_lo3)
              3'h4: out_exp = 8'h70;
              3'h5: out_exp = 8'h70;
              3'h6: out_exp = 8'h70;
              3'h7: out_exp = 8'h70;
              default: begin end
            endcase
          end
          4'h4: begin
            out_exp = 8'h70;
            case (mant_lo3)
              3'h7: out_exp = 8'h6f;
              default: begin end
            endcase
          end
          4'h5: begin
            out_exp = 8'h6f;
          end
          4'h6: begin
            out_exp = 8'h6e;
            case (mant_lo3)
              3'h0: out_exp = 8'h6f;
              3'h1: out_exp = 8'h6f;
              default: begin end
            endcase
          end
          4'h7: begin
            out_exp = 8'h6e;
            case (mant_lo3)
              3'h5: out_exp = 8'h6d;
              3'h6: out_exp = 8'h6d;
              3'h7: out_exp = 8'h6d;
              default: begin end
            endcase
          end
          4'h8: begin
            out_exp = 8'h6d;
          end
          4'h9: begin
            out_exp = 8'h6c;
          end
          4'ha: begin
            out_exp = 8'h6b;
            case (mant_lo3)
              3'h0: out_exp = 8'h6c;
              3'h1: out_exp = 8'h6c;
              3'h2: out_exp = 8'h6c;
              default: begin end
            endcase
          end
          4'hb: begin
            out_exp = 8'h6b;
            case (mant_lo3)
              3'h6: out_exp = 8'h6a;
              3'h7: out_exp = 8'h6a;
              default: begin end
            endcase
          end
          4'hc: begin
            out_exp = 8'h6a;
          end
          4'hd: begin
            out_exp = 8'h69;
            case (mant_lo3)
              3'h0: out_exp = 8'h6a;
              default: begin end
            endcase
          end
          4'he: begin
            out_exp = 8'h69;
            case (mant_lo3)
              3'h5: out_exp = 8'h68;
              3'h6: out_exp = 8'h68;
              3'h7: out_exp = 8'h68;
              default: begin end
            endcase
          end
          4'hf: begin
            out_exp = 8'h68;
          end
          default: begin end
        endcase
      end
      9'h183: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'h67;
            case (mant_lo3)
              3'h6: out_exp = 8'h66;
              3'h7: out_exp = 8'h66;
              default: begin end
            endcase
          end
          4'h1: begin
            out_exp = 8'h65;
            case (mant_lo3)
              3'h0: out_exp = 8'h66;
              3'h1: out_exp = 8'h66;
              3'h2: out_exp = 8'h66;
              default: begin end
            endcase
          end
          4'h2: begin
            out_exp = 8'h64;
            case (mant_lo3)
              3'h0: out_exp = 8'h65;
              3'h6: out_exp = 8'h63;
              3'h7: out_exp = 8'h63;
              default: begin end
            endcase
          end
          4'h3: begin
            out_exp = 8'h63;
            case (mant_lo3)
              3'h4: out_exp = 8'h62;
              3'h5: out_exp = 8'h62;
              3'h6: out_exp = 8'h62;
              3'h7: out_exp = 8'h62;
              default: begin end
            endcase
          end
          4'h4: begin
            out_exp = 8'h61;
            case (mant_lo3)
              3'h0: out_exp = 8'h62;
              3'h7: out_exp = 8'h60;
              default: begin end
            endcase
          end
          4'h5: begin
            out_exp = 8'h60;
            case (mant_lo3)
              3'h4: out_exp = 8'h5f;
              3'h5: out_exp = 8'h5f;
              3'h6: out_exp = 8'h5f;
              3'h7: out_exp = 8'h5f;
              default: begin end
            endcase
          end
          4'h6: begin
            out_exp = 8'h5e;
            case (mant_lo3)
              3'h0: out_exp = 8'h5f;
              3'h1: out_exp = 8'h5f;
              default: begin end
            endcase
          end
          4'h7: begin
            out_exp = 8'h5d;
            case (mant_lo3)
              3'h5: out_exp = 8'h5c;
              3'h6: out_exp = 8'h5c;
              3'h7: out_exp = 8'h5c;
              default: begin end
            endcase
          end
          4'h8: begin
            out_exp = 8'h5b;
            case (mant_lo3)
              3'h0: out_exp = 8'h5c;
              3'h1: out_exp = 8'h5c;
              3'h2: out_exp = 8'h5c;
              default: begin end
            endcase
          end
          4'h9: begin
            out_exp = 8'h5a;
            case (mant_lo3)
              3'h6: out_exp = 8'h59;
              3'h7: out_exp = 8'h59;
              default: begin end
            endcase
          end
          4'ha: begin
            out_exp = 8'h58;
            case (mant_lo3)
              3'h0: out_exp = 8'h59;
              3'h1: out_exp = 8'h59;
              3'h2: out_exp = 8'h59;
              default: begin end
            endcase
          end
          4'hb: begin
            out_exp = 8'h57;
            case (mant_lo3)
              3'h0: out_exp = 8'h58;
              3'h6: out_exp = 8'h56;
              3'h7: out_exp = 8'h56;
              default: begin end
            endcase
          end
          4'hc: begin
            out_exp = 8'h56;
            case (mant_lo3)
              3'h4: out_exp = 8'h55;
              3'h5: out_exp = 8'h55;
              3'h6: out_exp = 8'h55;
              3'h7: out_exp = 8'h55;
              default: begin end
            endcase
          end
          4'hd: begin
            out_exp = 8'h54;
            case (mant_lo3)
              3'h0: out_exp = 8'h55;
              3'h7: out_exp = 8'h53;
              default: begin end
            endcase
          end
          4'he: begin
            out_exp = 8'h53;
            case (mant_lo3)
              3'h5: out_exp = 8'h52;
              3'h6: out_exp = 8'h52;
              3'h7: out_exp = 8'h52;
              default: begin end
            endcase
          end
          4'hf: begin
            out_exp = 8'h51;
            case (mant_lo3)
              3'h0: out_exp = 8'h52;
              3'h1: out_exp = 8'h52;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h184: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'h50;
            case (mant_lo3)
              3'h3: out_exp = 8'h4f;
              3'h4: out_exp = 8'h4f;
              3'h5: out_exp = 8'h4f;
              3'h6: out_exp = 8'h4e;
              3'h7: out_exp = 8'h4e;
              default: begin end
            endcase
          end
          4'h1: begin
            out_exp = 8'h4d;
            case (mant_lo3)
              3'h3: out_exp = 8'h4c;
              3'h4: out_exp = 8'h4c;
              3'h5: out_exp = 8'h4c;
              3'h6: out_exp = 8'h4b;
              3'h7: out_exp = 8'h4b;
              default: begin end
            endcase
          end
          4'h2: begin
            out_exp = 8'h49;
            case (mant_lo3)
              3'h0: out_exp = 8'h4b;
              3'h1: out_exp = 8'h4a;
              3'h2: out_exp = 8'h4a;
              3'h6: out_exp = 8'h48;
              3'h7: out_exp = 8'h48;
              default: begin end
            endcase
          end
          4'h3: begin
            out_exp = 8'h47;
            case (mant_lo3)
              3'h0: out_exp = 8'h48;
              3'h4: out_exp = 8'h46;
              3'h5: out_exp = 8'h46;
              3'h6: out_exp = 8'h46;
              3'h7: out_exp = 8'h45;
              default: begin end
            endcase
          end
          4'h4: begin
            out_exp = 8'h44;
            case (mant_lo3)
              3'h0: out_exp = 8'h45;
              3'h4: out_exp = 8'h43;
              3'h5: out_exp = 8'h43;
              3'h6: out_exp = 8'h43;
              3'h7: out_exp = 8'h42;
              default: begin end
            endcase
          end
          4'h5: begin
            out_exp = 8'h40;
            case (mant_lo3)
              3'h0: out_exp = 8'h42;
              3'h1: out_exp = 8'h42;
              3'h2: out_exp = 8'h41;
              3'h3: out_exp = 8'h41;
              3'h7: out_exp = 8'h3f;
              default: begin end
            endcase
          end
          4'h6: begin
            out_exp = 8'h3e;
            case (mant_lo3)
              3'h0: out_exp = 8'h3f;
              3'h1: out_exp = 8'h3f;
              3'h5: out_exp = 8'h3d;
              3'h6: out_exp = 8'h3d;
              3'h7: out_exp = 8'h3c;
              default: begin end
            endcase
          end
          4'h7: begin
            out_exp = 8'h3b;
            case (mant_lo3)
              3'h0: out_exp = 8'h3c;
              3'h1: out_exp = 8'h3c;
              3'h5: out_exp = 8'h3a;
              3'h6: out_exp = 8'h3a;
              3'h7: out_exp = 8'h3a;
              default: begin end
            endcase
          end
          4'h8: begin
            out_exp = 8'h39;
            case (mant_lo3)
              3'h3: out_exp = 8'h38;
              3'h4: out_exp = 8'h38;
              3'h5: out_exp = 8'h37;
              3'h6: out_exp = 8'h37;
              3'h7: out_exp = 8'h37;
              default: begin end
            endcase
          end
          4'h9: begin
            out_exp = 8'h36;
            case (mant_lo3)
              3'h3: out_exp = 8'h35;
              3'h4: out_exp = 8'h35;
              3'h5: out_exp = 8'h35;
              3'h6: out_exp = 8'h34;
              3'h7: out_exp = 8'h34;
              default: begin end
            endcase
          end
          4'ha: begin
            out_exp = 8'h33;
            case (mant_lo3)
              3'h3: out_exp = 8'h32;
              3'h4: out_exp = 8'h32;
              3'h5: out_exp = 8'h32;
              3'h6: out_exp = 8'h31;
              3'h7: out_exp = 8'h31;
              default: begin end
            endcase
          end
          4'hb: begin
            out_exp = 8'h30;
            case (mant_lo3)
              3'h0: out_exp = 8'h31;
              3'h4: out_exp = 8'h2f;
              3'h5: out_exp = 8'h2f;
              3'h6: out_exp = 8'h2e;
              3'h7: out_exp = 8'h2e;
              default: begin end
            endcase
          end
          4'hc: begin
            out_exp = 8'h2d;
            case (mant_lo3)
              3'h0: out_exp = 8'h2e;
              3'h4: out_exp = 8'h2c;
              3'h5: out_exp = 8'h2c;
              3'h6: out_exp = 8'h2c;
              3'h7: out_exp = 8'h2b;
              default: begin end
            endcase
          end
          4'hd: begin
            out_exp = 8'h2a;
            case (mant_lo3)
              3'h0: out_exp = 8'h2b;
              3'h4: out_exp = 8'h29;
              3'h5: out_exp = 8'h29;
              3'h6: out_exp = 8'h29;
              3'h7: out_exp = 8'h28;
              default: begin end
            endcase
          end
          4'he: begin
            out_exp = 8'h26;
            case (mant_lo3)
              3'h0: out_exp = 8'h28;
              3'h1: out_exp = 8'h28;
              3'h2: out_exp = 8'h27;
              3'h3: out_exp = 8'h27;
              3'h7: out_exp = 8'h25;
              default: begin end
            endcase
          end
          4'hf: begin
            out_exp = 8'h24;
            case (mant_lo3)
              3'h0: out_exp = 8'h25;
              3'h1: out_exp = 8'h25;
              3'h5: out_exp = 8'h23;
              3'h6: out_exp = 8'h23;
              3'h7: out_exp = 8'h23;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h185: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'h21;
            case (mant_lo3)
              3'h0: out_exp = 8'h22;
              3'h3: out_exp = 8'h20;
              3'h4: out_exp = 8'h1f;
              3'h5: out_exp = 8'h1f;
              3'h6: out_exp = 8'h1e;
              3'h7: out_exp = 8'h1d;
              default: begin end
            endcase
          end
          4'h1: begin
            out_exp = 8'h1c;
            case (mant_lo3)
              3'h2: out_exp = 8'h1b;
              3'h3: out_exp = 8'h1a;
              3'h4: out_exp = 8'h1a;
              3'h5: out_exp = 8'h19;
              3'h6: out_exp = 8'h18;
              3'h7: out_exp = 8'h17;
              default: begin end
            endcase
          end
          4'h2: begin
            out_exp = 8'h14;
            case (mant_lo3)
              3'h0: out_exp = 8'h17;
              3'h1: out_exp = 8'h16;
              3'h2: out_exp = 8'h15;
              3'h5: out_exp = 8'h13;
              3'h6: out_exp = 8'h12;
              3'h7: out_exp = 8'h12;
              default: begin end
            endcase
          end
          4'h3: begin
            out_exp = 8'h0f;
            case (mant_lo3)
              3'h0: out_exp = 8'h11;
              3'h1: out_exp = 8'h10;
              3'h4: out_exp = 8'h0e;
              3'h5: out_exp = 8'h0d;
              3'h6: out_exp = 8'h0d;
              3'h7: out_exp = 8'h0c;
              default: begin end
            endcase
          end
          4'h4: begin
            out_exp = 8'h0a;
            case (mant_lo3)
              3'h0: out_exp = 8'h0b;
              3'h3: out_exp = 8'h09;
              3'h4: out_exp = 8'h08;
              3'h5: out_exp = 8'h07;
              3'h6: out_exp = 8'h07;
              3'h7: out_exp = 8'h06;
              default: begin end
            endcase
          end
          4'h5: begin
            out_exp = 8'h05;
            case (mant_lo3)
              3'h2: out_exp = 8'h04;
              3'h3: out_exp = 8'h03;
              3'h4: out_exp = 8'h02;
              3'h5: out_exp = 8'h02;
              3'h6: out_exp = 8'h01;
              3'h7: out_exp = 8'h00;
              default: begin end
            endcase
          end
          4'h6: begin
            out_exp = 8'h00;
          end
          4'h7: begin
            out_exp = 8'h00;
          end
          4'h8: begin
            out_exp = 8'h00;
          end
          4'h9: begin
            out_exp = 8'h00;
          end
          4'ha: begin
            out_exp = 8'h00;
          end
          4'hb: begin
            out_exp = 8'h00;
          end
          4'hc: begin
            out_exp = 8'h00;
          end
          4'hd: begin
            out_exp = 8'h00;
          end
          4'he: begin
            out_exp = 8'h00;
          end
          4'hf: begin
            out_exp = 8'h00;
          end
          default: begin end
        endcase
      end
      9'h1ff: begin
        case (mant_hi4)
          4'h0: begin
            out_exp = 8'hff;
            case (mant_lo3)
              3'h0: out_exp = 8'h00;
              default: begin end
            endcase
          end
          4'h1: begin
            out_exp = 8'hff;
          end
          4'h2: begin
            out_exp = 8'hff;
          end
          4'h3: begin
            out_exp = 8'hff;
          end
          4'h4: begin
            out_exp = 8'hff;
          end
          4'h5: begin
            out_exp = 8'hff;
          end
          4'h6: begin
            out_exp = 8'hff;
          end
          4'h7: begin
            out_exp = 8'hff;
          end
          4'h8: begin
            out_exp = 8'hff;
          end
          4'h9: begin
            out_exp = 8'hff;
          end
          4'ha: begin
            out_exp = 8'hff;
          end
          4'hb: begin
            out_exp = 8'hff;
          end
          4'hc: begin
            out_exp = 8'hff;
          end
          4'hd: begin
            out_exp = 8'hff;
          end
          4'he: begin
            out_exp = 8'hff;
          end
          4'hf: begin
            out_exp = 8'hff;
          end
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  always @* begin
    out_mant = 7'h00;
    casez (sign_exp)
      9'b001110111: out_mant = 7'h01;
      9'h078: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h01;
          end
          3'h1: begin
            out_mant = 7'h01;
          end
          3'h2: begin
            out_mant = 7'h01;
          end
          3'h3: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'hf: out_mant = 7'h02;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h02;
          end
          3'h5: begin
            out_mant = 7'h02;
          end
          3'h6: begin
            out_mant = 7'h02;
          end
          3'h7: begin
            out_mant = 7'h02;
          end
          default: begin end
        endcase
      end
      9'h079: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h02;
          end
          3'h1: begin
            out_mant = 7'h02;
            case (mant_lo4)
              4'hf: out_mant = 7'h03;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h03;
          end
          3'h3: begin
            out_mant = 7'h03;
          end
          3'h4: begin
            out_mant = 7'h03;
          end
          3'h5: begin
            out_mant = 7'h03;
            case (mant_lo4)
              4'hd: out_mant = 7'h04;
              4'he: out_mant = 7'h04;
              4'hf: out_mant = 7'h04;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h04;
          end
          3'h7: begin
            out_mant = 7'h04;
          end
          default: begin end
        endcase
      end
      9'h07a: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h04;
            case (mant_lo4)
              4'he: out_mant = 7'h05;
              4'hf: out_mant = 7'h05;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h05;
          end
          3'h2: begin
            out_mant = 7'h05;
            case (mant_lo4)
              4'hd: out_mant = 7'h06;
              4'he: out_mant = 7'h06;
              4'hf: out_mant = 7'h06;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h06;
          end
          3'h4: begin
            out_mant = 7'h06;
            case (mant_lo4)
              4'hb: out_mant = 7'h07;
              4'hc: out_mant = 7'h07;
              4'hd: out_mant = 7'h07;
              4'he: out_mant = 7'h07;
              4'hf: out_mant = 7'h07;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h07;
          end
          3'h6: begin
            out_mant = 7'h07;
            case (mant_lo4)
              4'ha: out_mant = 7'h08;
              4'hb: out_mant = 7'h08;
              4'hc: out_mant = 7'h08;
              4'hd: out_mant = 7'h08;
              4'he: out_mant = 7'h08;
              4'hf: out_mant = 7'h08;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h08;
          end
          default: begin end
        endcase
      end
      9'h07b: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h09;
            case (mant_lo4)
              4'h0: out_mant = 7'h08;
              4'h1: out_mant = 7'h08;
              4'h2: out_mant = 7'h08;
              4'h3: out_mant = 7'h08;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h0a;
            case (mant_lo4)
              4'h0: out_mant = 7'h09;
              4'h1: out_mant = 7'h09;
              4'h2: out_mant = 7'h09;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h0b;
            case (mant_lo4)
              4'h0: out_mant = 7'h0a;
              4'h1: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h0c;
            case (mant_lo4)
              4'h0: out_mant = 7'h0b;
              4'hf: out_mant = 7'h0d;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h0d;
            case (mant_lo4)
              4'he: out_mant = 7'h0e;
              4'hf: out_mant = 7'h0e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h0e;
            case (mant_lo4)
              4'hc: out_mant = 7'h0f;
              4'hd: out_mant = 7'h0f;
              4'he: out_mant = 7'h0f;
              4'hf: out_mant = 7'h0f;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h0f;
            case (mant_lo4)
              4'hb: out_mant = 7'h10;
              4'hc: out_mant = 7'h10;
              4'hd: out_mant = 7'h10;
              4'he: out_mant = 7'h10;
              4'hf: out_mant = 7'h10;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h10;
            case (mant_lo4)
              4'h9: out_mant = 7'h11;
              4'ha: out_mant = 7'h11;
              4'hb: out_mant = 7'h11;
              4'hc: out_mant = 7'h11;
              4'hd: out_mant = 7'h11;
              4'he: out_mant = 7'h11;
              4'hf: out_mant = 7'h11;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07c: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h12;
            case (mant_lo4)
              4'h0: out_mant = 7'h11;
              4'h1: out_mant = 7'h11;
              4'h2: out_mant = 7'h11;
              4'h3: out_mant = 7'h11;
              4'hb: out_mant = 7'h13;
              4'hc: out_mant = 7'h13;
              4'hd: out_mant = 7'h13;
              4'he: out_mant = 7'h13;
              4'hf: out_mant = 7'h13;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h14;
            case (mant_lo4)
              4'h0: out_mant = 7'h13;
              4'h1: out_mant = 7'h13;
              4'h9: out_mant = 7'h15;
              4'ha: out_mant = 7'h15;
              4'hb: out_mant = 7'h15;
              4'hc: out_mant = 7'h15;
              4'hd: out_mant = 7'h15;
              4'he: out_mant = 7'h15;
              4'hf: out_mant = 7'h16;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h17;
            case (mant_lo4)
              4'h0: out_mant = 7'h16;
              4'h1: out_mant = 7'h16;
              4'h2: out_mant = 7'h16;
              4'h3: out_mant = 7'h16;
              4'h4: out_mant = 7'h16;
              4'h5: out_mant = 7'h16;
              4'hd: out_mant = 7'h18;
              4'he: out_mant = 7'h18;
              4'hf: out_mant = 7'h18;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h19;
            case (mant_lo4)
              4'h0: out_mant = 7'h18;
              4'h1: out_mant = 7'h18;
              4'h2: out_mant = 7'h18;
              4'h3: out_mant = 7'h18;
              4'hb: out_mant = 7'h1a;
              4'hc: out_mant = 7'h1a;
              4'hd: out_mant = 7'h1a;
              4'he: out_mant = 7'h1a;
              4'hf: out_mant = 7'h1a;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h1b;
            case (mant_lo4)
              4'h0: out_mant = 7'h1a;
              4'h8: out_mant = 7'h1c;
              4'h9: out_mant = 7'h1c;
              4'ha: out_mant = 7'h1c;
              4'hb: out_mant = 7'h1c;
              4'hc: out_mant = 7'h1c;
              4'hd: out_mant = 7'h1c;
              4'he: out_mant = 7'h1d;
              4'hf: out_mant = 7'h1d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h1e;
            case (mant_lo4)
              4'h0: out_mant = 7'h1d;
              4'h1: out_mant = 7'h1d;
              4'h2: out_mant = 7'h1d;
              4'h3: out_mant = 7'h1d;
              4'h4: out_mant = 7'h1d;
              4'hb: out_mant = 7'h1f;
              4'hc: out_mant = 7'h1f;
              4'hd: out_mant = 7'h1f;
              4'he: out_mant = 7'h1f;
              4'hf: out_mant = 7'h1f;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'h0: out_mant = 7'h1f;
              4'h1: out_mant = 7'h1f;
              4'h2: out_mant = 7'h20;
              4'h3: out_mant = 7'h20;
              4'h4: out_mant = 7'h20;
              4'h5: out_mant = 7'h20;
              4'h6: out_mant = 7'h20;
              4'h7: out_mant = 7'h20;
              4'hf: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h23;
            case (mant_lo4)
              4'h0: out_mant = 7'h22;
              4'h1: out_mant = 7'h22;
              4'h2: out_mant = 7'h22;
              4'h3: out_mant = 7'h22;
              4'h4: out_mant = 7'h22;
              4'hb: out_mant = 7'h24;
              4'hc: out_mant = 7'h24;
              4'hd: out_mant = 7'h24;
              4'he: out_mant = 7'h24;
              4'hf: out_mant = 7'h24;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07d: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h25;
            case (mant_lo4)
              4'h0: out_mant = 7'h24;
              4'h4: out_mant = 7'h26;
              4'h5: out_mant = 7'h26;
              4'h6: out_mant = 7'h26;
              4'h7: out_mant = 7'h27;
              4'h8: out_mant = 7'h27;
              4'h9: out_mant = 7'h27;
              4'ha: out_mant = 7'h28;
              4'hb: out_mant = 7'h28;
              4'hc: out_mant = 7'h28;
              4'hd: out_mant = 7'h29;
              4'he: out_mant = 7'h29;
              4'hf: out_mant = 7'h29;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h2a;
            case (mant_lo4)
              4'h3: out_mant = 7'h2b;
              4'h4: out_mant = 7'h2b;
              4'h5: out_mant = 7'h2b;
              4'h6: out_mant = 7'h2c;
              4'h7: out_mant = 7'h2c;
              4'h8: out_mant = 7'h2c;
              4'h9: out_mant = 7'h2d;
              4'ha: out_mant = 7'h2d;
              4'hb: out_mant = 7'h2d;
              4'hc: out_mant = 7'h2e;
              4'hd: out_mant = 7'h2e;
              4'he: out_mant = 7'h2e;
              4'hf: out_mant = 7'h2f;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h30;
            case (mant_lo4)
              4'h0: out_mant = 7'h2f;
              4'h1: out_mant = 7'h2f;
              4'h5: out_mant = 7'h31;
              4'h6: out_mant = 7'h31;
              4'h7: out_mant = 7'h31;
              4'h8: out_mant = 7'h32;
              4'h9: out_mant = 7'h32;
              4'ha: out_mant = 7'h32;
              4'hb: out_mant = 7'h33;
              4'hc: out_mant = 7'h33;
              4'hd: out_mant = 7'h33;
              4'he: out_mant = 7'h34;
              4'hf: out_mant = 7'h34;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h35;
            case (mant_lo4)
              4'h3: out_mant = 7'h36;
              4'h4: out_mant = 7'h36;
              4'h5: out_mant = 7'h36;
              4'h6: out_mant = 7'h37;
              4'h7: out_mant = 7'h37;
              4'h8: out_mant = 7'h37;
              4'h9: out_mant = 7'h38;
              4'ha: out_mant = 7'h38;
              4'hb: out_mant = 7'h38;
              4'hc: out_mant = 7'h39;
              4'hd: out_mant = 7'h39;
              4'he: out_mant = 7'h3a;
              4'hf: out_mant = 7'h3a;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h3b;
            case (mant_lo4)
              4'h0: out_mant = 7'h3a;
              4'h4: out_mant = 7'h3c;
              4'h5: out_mant = 7'h3c;
              4'h6: out_mant = 7'h3c;
              4'h7: out_mant = 7'h3d;
              4'h8: out_mant = 7'h3d;
              4'h9: out_mant = 7'h3e;
              4'ha: out_mant = 7'h3e;
              4'hb: out_mant = 7'h3e;
              4'hc: out_mant = 7'h3f;
              4'hd: out_mant = 7'h3f;
              4'he: out_mant = 7'h3f;
              4'hf: out_mant = 7'h40;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h41;
            case (mant_lo4)
              4'h0: out_mant = 7'h40;
              4'h4: out_mant = 7'h42;
              4'h5: out_mant = 7'h42;
              4'h6: out_mant = 7'h42;
              4'h7: out_mant = 7'h43;
              4'h8: out_mant = 7'h43;
              4'h9: out_mant = 7'h44;
              4'ha: out_mant = 7'h44;
              4'hb: out_mant = 7'h44;
              4'hc: out_mant = 7'h45;
              4'hd: out_mant = 7'h45;
              4'he: out_mant = 7'h45;
              4'hf: out_mant = 7'h46;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h47;
            case (mant_lo4)
              4'h0: out_mant = 7'h46;
              4'h4: out_mant = 7'h48;
              4'h5: out_mant = 7'h48;
              4'h6: out_mant = 7'h49;
              4'h7: out_mant = 7'h49;
              4'h8: out_mant = 7'h49;
              4'h9: out_mant = 7'h4a;
              4'ha: out_mant = 7'h4a;
              4'hb: out_mant = 7'h4b;
              4'hc: out_mant = 7'h4b;
              4'hd: out_mant = 7'h4b;
              4'he: out_mant = 7'h4c;
              4'hf: out_mant = 7'h4c;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h4d;
            case (mant_lo4)
              4'h3: out_mant = 7'h4e;
              4'h4: out_mant = 7'h4e;
              4'h5: out_mant = 7'h4f;
              4'h6: out_mant = 7'h4f;
              4'h7: out_mant = 7'h4f;
              4'h8: out_mant = 7'h50;
              4'h9: out_mant = 7'h50;
              4'ha: out_mant = 7'h51;
              4'hb: out_mant = 7'h51;
              4'hc: out_mant = 7'h51;
              4'hd: out_mant = 7'h52;
              4'he: out_mant = 7'h52;
              4'hf: out_mant = 7'h53;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07e: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h56;
            case (mant_lo4)
              4'h0: out_mant = 7'h53;
              4'h1: out_mant = 7'h54;
              4'h2: out_mant = 7'h55;
              4'h5: out_mant = 7'h57;
              4'h6: out_mant = 7'h58;
              4'h7: out_mant = 7'h59;
              4'h8: out_mant = 7'h5a;
              4'h9: out_mant = 7'h5b;
              4'ha: out_mant = 7'h5b;
              4'hb: out_mant = 7'h5c;
              4'hc: out_mant = 7'h5d;
              4'hd: out_mant = 7'h5e;
              4'he: out_mant = 7'h5f;
              4'hf: out_mant = 7'h60;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h62;
            case (mant_lo4)
              4'h0: out_mant = 7'h61;
              4'h3: out_mant = 7'h63;
              4'h4: out_mant = 7'h64;
              4'h5: out_mant = 7'h65;
              4'h6: out_mant = 7'h66;
              4'h7: out_mant = 7'h67;
              4'h8: out_mant = 7'h68;
              4'h9: out_mant = 7'h69;
              4'ha: out_mant = 7'h6a;
              4'hb: out_mant = 7'h6b;
              4'hc: out_mant = 7'h6b;
              4'hd: out_mant = 7'h6c;
              4'he: out_mant = 7'h6d;
              4'hf: out_mant = 7'h6e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h6f;
            case (mant_lo4)
              4'h1: out_mant = 7'h70;
              4'h2: out_mant = 7'h71;
              4'h3: out_mant = 7'h72;
              4'h4: out_mant = 7'h73;
              4'h5: out_mant = 7'h74;
              4'h6: out_mant = 7'h75;
              4'h7: out_mant = 7'h76;
              4'h8: out_mant = 7'h77;
              4'h9: out_mant = 7'h78;
              4'ha: out_mant = 7'h79;
              4'hb: out_mant = 7'h7a;
              4'hc: out_mant = 7'h7b;
              4'hd: out_mant = 7'h7c;
              4'he: out_mant = 7'h7d;
              4'hf: out_mant = 7'h7e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h00;
            case (mant_lo4)
              4'h0: out_mant = 7'h7f;
              4'h3: out_mant = 7'h01;
              4'h4: out_mant = 7'h01;
              4'h5: out_mant = 7'h02;
              4'h6: out_mant = 7'h02;
              4'h7: out_mant = 7'h03;
              4'h8: out_mant = 7'h03;
              4'h9: out_mant = 7'h04;
              4'ha: out_mant = 7'h04;
              4'hb: out_mant = 7'h05;
              4'hc: out_mant = 7'h05;
              4'hd: out_mant = 7'h06;
              4'he: out_mant = 7'h06;
              4'hf: out_mant = 7'h07;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h09;
            case (mant_lo4)
              4'h0: out_mant = 7'h07;
              4'h1: out_mant = 7'h08;
              4'h4: out_mant = 7'h0a;
              4'h5: out_mant = 7'h0a;
              4'h6: out_mant = 7'h0b;
              4'h7: out_mant = 7'h0b;
              4'h8: out_mant = 7'h0c;
              4'h9: out_mant = 7'h0c;
              4'ha: out_mant = 7'h0d;
              4'hb: out_mant = 7'h0d;
              4'hc: out_mant = 7'h0e;
              4'hd: out_mant = 7'h0f;
              4'he: out_mant = 7'h0f;
              4'hf: out_mant = 7'h10;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h11;
            case (mant_lo4)
              4'h0: out_mant = 7'h10;
              4'h3: out_mant = 7'h12;
              4'h4: out_mant = 7'h12;
              4'h5: out_mant = 7'h13;
              4'h6: out_mant = 7'h14;
              4'h7: out_mant = 7'h14;
              4'h8: out_mant = 7'h15;
              4'h9: out_mant = 7'h15;
              4'ha: out_mant = 7'h16;
              4'hb: out_mant = 7'h17;
              4'hc: out_mant = 7'h17;
              4'hd: out_mant = 7'h18;
              4'he: out_mant = 7'h18;
              4'hf: out_mant = 7'h19;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h1a;
            case (mant_lo4)
              4'h2: out_mant = 7'h1b;
              4'h3: out_mant = 7'h1b;
              4'h4: out_mant = 7'h1c;
              4'h5: out_mant = 7'h1d;
              4'h6: out_mant = 7'h1d;
              4'h7: out_mant = 7'h1e;
              4'h8: out_mant = 7'h1e;
              4'h9: out_mant = 7'h1f;
              4'ha: out_mant = 7'h20;
              4'hb: out_mant = 7'h20;
              4'hc: out_mant = 7'h21;
              4'hd: out_mant = 7'h22;
              4'he: out_mant = 7'h22;
              4'hf: out_mant = 7'h23;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h25;
            case (mant_lo4)
              4'h0: out_mant = 7'h23;
              4'h1: out_mant = 7'h24;
              4'h4: out_mant = 7'h26;
              4'h5: out_mant = 7'h27;
              4'h6: out_mant = 7'h27;
              4'h7: out_mant = 7'h28;
              4'h8: out_mant = 7'h29;
              4'h9: out_mant = 7'h29;
              4'ha: out_mant = 7'h2a;
              4'hb: out_mant = 7'h2b;
              4'hc: out_mant = 7'h2b;
              4'hd: out_mant = 7'h2c;
              4'he: out_mant = 7'h2d;
              4'hf: out_mant = 7'h2d;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07f: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h2e;
            case (mant_lo4)
              4'h1: out_mant = 7'h2f;
              4'h2: out_mant = 7'h31;
              4'h3: out_mant = 7'h32;
              4'h4: out_mant = 7'h33;
              4'h5: out_mant = 7'h35;
              4'h6: out_mant = 7'h36;
              4'h7: out_mant = 7'h38;
              4'h8: out_mant = 7'h39;
              4'h9: out_mant = 7'h3b;
              4'ha: out_mant = 7'h3c;
              4'hb: out_mant = 7'h3e;
              4'hc: out_mant = 7'h3f;
              4'hd: out_mant = 7'h41;
              4'he: out_mant = 7'h42;
              4'hf: out_mant = 7'h44;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h45;
            case (mant_lo4)
              4'h1: out_mant = 7'h47;
              4'h2: out_mant = 7'h48;
              4'h3: out_mant = 7'h4a;
              4'h4: out_mant = 7'h4b;
              4'h5: out_mant = 7'h4d;
              4'h6: out_mant = 7'h4f;
              4'h7: out_mant = 7'h50;
              4'h8: out_mant = 7'h52;
              4'h9: out_mant = 7'h53;
              4'ha: out_mant = 7'h55;
              4'hb: out_mant = 7'h57;
              4'hc: out_mant = 7'h59;
              4'hd: out_mant = 7'h5a;
              4'he: out_mant = 7'h5c;
              4'hf: out_mant = 7'h5e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h5f;
            case (mant_lo4)
              4'h1: out_mant = 7'h61;
              4'h2: out_mant = 7'h63;
              4'h3: out_mant = 7'h65;
              4'h4: out_mant = 7'h66;
              4'h5: out_mant = 7'h68;
              4'h6: out_mant = 7'h6a;
              4'h7: out_mant = 7'h6c;
              4'h8: out_mant = 7'h6e;
              4'h9: out_mant = 7'h70;
              4'ha: out_mant = 7'h72;
              4'hb: out_mant = 7'h73;
              4'hc: out_mant = 7'h75;
              4'hd: out_mant = 7'h77;
              4'he: out_mant = 7'h79;
              4'hf: out_mant = 7'h7b;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h7d;
            case (mant_lo4)
              4'h1: out_mant = 7'h7f;
              4'h2: out_mant = 7'h01;
              4'h3: out_mant = 7'h02;
              4'h4: out_mant = 7'h03;
              4'h5: out_mant = 7'h04;
              4'h6: out_mant = 7'h05;
              4'h7: out_mant = 7'h06;
              4'h8: out_mant = 7'h07;
              4'h9: out_mant = 7'h08;
              4'ha: out_mant = 7'h09;
              4'hb: out_mant = 7'h0a;
              4'hc: out_mant = 7'h0b;
              4'hd: out_mant = 7'h0c;
              4'he: out_mant = 7'h0d;
              4'hf: out_mant = 7'h0e;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h0f;
            case (mant_lo4)
              4'h1: out_mant = 7'h11;
              4'h2: out_mant = 7'h12;
              4'h3: out_mant = 7'h13;
              4'h4: out_mant = 7'h14;
              4'h5: out_mant = 7'h15;
              4'h6: out_mant = 7'h16;
              4'h7: out_mant = 7'h17;
              4'h8: out_mant = 7'h19;
              4'h9: out_mant = 7'h1a;
              4'ha: out_mant = 7'h1b;
              4'hb: out_mant = 7'h1c;
              4'hc: out_mant = 7'h1e;
              4'hd: out_mant = 7'h1f;
              4'he: out_mant = 7'h20;
              4'hf: out_mant = 7'h21;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h23;
            case (mant_lo4)
              4'h1: out_mant = 7'h24;
              4'h2: out_mant = 7'h25;
              4'h3: out_mant = 7'h26;
              4'h4: out_mant = 7'h28;
              4'h5: out_mant = 7'h29;
              4'h6: out_mant = 7'h2a;
              4'h7: out_mant = 7'h2c;
              4'h8: out_mant = 7'h2d;
              4'h9: out_mant = 7'h2e;
              4'ha: out_mant = 7'h30;
              4'hb: out_mant = 7'h31;
              4'hc: out_mant = 7'h32;
              4'hd: out_mant = 7'h34;
              4'he: out_mant = 7'h35;
              4'hf: out_mant = 7'h37;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h38;
            case (mant_lo4)
              4'h1: out_mant = 7'h3a;
              4'h2: out_mant = 7'h3b;
              4'h3: out_mant = 7'h3d;
              4'h4: out_mant = 7'h3e;
              4'h5: out_mant = 7'h3f;
              4'h6: out_mant = 7'h41;
              4'h7: out_mant = 7'h42;
              4'h8: out_mant = 7'h44;
              4'h9: out_mant = 7'h46;
              4'ha: out_mant = 7'h47;
              4'hb: out_mant = 7'h49;
              4'hc: out_mant = 7'h4a;
              4'hd: out_mant = 7'h4c;
              4'he: out_mant = 7'h4d;
              4'hf: out_mant = 7'h4f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h51;
            case (mant_lo4)
              4'h1: out_mant = 7'h52;
              4'h2: out_mant = 7'h54;
              4'h3: out_mant = 7'h56;
              4'h4: out_mant = 7'h57;
              4'h5: out_mant = 7'h59;
              4'h6: out_mant = 7'h5b;
              4'h7: out_mant = 7'h5c;
              4'h8: out_mant = 7'h5e;
              4'h9: out_mant = 7'h60;
              4'ha: out_mant = 7'h62;
              4'hb: out_mant = 7'h63;
              4'hc: out_mant = 7'h65;
              4'hd: out_mant = 7'h67;
              4'he: out_mant = 7'h69;
              4'hf: out_mant = 7'h6b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h080: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h6c;
            case (mant_lo4)
              4'h1: out_mant = 7'h70;
              4'h2: out_mant = 7'h74;
              4'h3: out_mant = 7'h78;
              4'h4: out_mant = 7'h7c;
              4'h5: out_mant = 7'h00;
              4'h6: out_mant = 7'h02;
              4'h7: out_mant = 7'h04;
              4'h8: out_mant = 7'h06;
              4'h9: out_mant = 7'h08;
              4'ha: out_mant = 7'h0a;
              4'hb: out_mant = 7'h0c;
              4'hc: out_mant = 7'h0f;
              4'hd: out_mant = 7'h11;
              4'he: out_mant = 7'h13;
              4'hf: out_mant = 7'h15;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h18;
            case (mant_lo4)
              4'h1: out_mant = 7'h1a;
              4'h2: out_mant = 7'h1d;
              4'h3: out_mant = 7'h1f;
              4'h4: out_mant = 7'h22;
              4'h5: out_mant = 7'h24;
              4'h6: out_mant = 7'h27;
              4'h7: out_mant = 7'h29;
              4'h8: out_mant = 7'h2c;
              4'h9: out_mant = 7'h2f;
              4'ha: out_mant = 7'h31;
              4'hb: out_mant = 7'h34;
              4'hc: out_mant = 7'h37;
              4'hd: out_mant = 7'h3a;
              4'he: out_mant = 7'h3d;
              4'hf: out_mant = 7'h40;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h43;
            case (mant_lo4)
              4'h1: out_mant = 7'h46;
              4'h2: out_mant = 7'h49;
              4'h3: out_mant = 7'h4c;
              4'h4: out_mant = 7'h4f;
              4'h5: out_mant = 7'h53;
              4'h6: out_mant = 7'h56;
              4'h7: out_mant = 7'h59;
              4'h8: out_mant = 7'h5d;
              4'h9: out_mant = 7'h60;
              4'ha: out_mant = 7'h64;
              4'hb: out_mant = 7'h67;
              4'hc: out_mant = 7'h6b;
              4'hd: out_mant = 7'h6f;
              4'he: out_mant = 7'h73;
              4'hf: out_mant = 7'h76;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h7a;
            case (mant_lo4)
              4'h1: out_mant = 7'h7e;
              4'h2: out_mant = 7'h01;
              4'h3: out_mant = 7'h03;
              4'h4: out_mant = 7'h05;
              4'h5: out_mant = 7'h07;
              4'h6: out_mant = 7'h09;
              4'h7: out_mant = 7'h0c;
              4'h8: out_mant = 7'h0e;
              4'h9: out_mant = 7'h10;
              4'ha: out_mant = 7'h12;
              4'hb: out_mant = 7'h15;
              4'hc: out_mant = 7'h17;
              4'hd: out_mant = 7'h19;
              4'he: out_mant = 7'h1c;
              4'hf: out_mant = 7'h1e;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'h1: out_mant = 7'h23;
              4'h2: out_mant = 7'h26;
              4'h3: out_mant = 7'h28;
              4'h4: out_mant = 7'h2b;
              4'h5: out_mant = 7'h2e;
              4'h6: out_mant = 7'h30;
              4'h7: out_mant = 7'h33;
              4'h8: out_mant = 7'h36;
              4'h9: out_mant = 7'h39;
              4'ha: out_mant = 7'h3c;
              4'hb: out_mant = 7'h3f;
              4'hc: out_mant = 7'h42;
              4'hd: out_mant = 7'h45;
              4'he: out_mant = 7'h48;
              4'hf: out_mant = 7'h4b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h4e;
            case (mant_lo4)
              4'h1: out_mant = 7'h52;
              4'h2: out_mant = 7'h55;
              4'h3: out_mant = 7'h58;
              4'h4: out_mant = 7'h5c;
              4'h5: out_mant = 7'h5f;
              4'h6: out_mant = 7'h63;
              4'h7: out_mant = 7'h66;
              4'h8: out_mant = 7'h6a;
              4'h9: out_mant = 7'h6d;
              4'ha: out_mant = 7'h71;
              4'hb: out_mant = 7'h75;
              4'hc: out_mant = 7'h79;
              4'hd: out_mant = 7'h7d;
              4'he: out_mant = 7'h00;
              4'hf: out_mant = 7'h02;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h04;
            case (mant_lo4)
              4'h1: out_mant = 7'h07;
              4'h2: out_mant = 7'h09;
              4'h3: out_mant = 7'h0b;
              4'h4: out_mant = 7'h0d;
              4'h5: out_mant = 7'h0f;
              4'h6: out_mant = 7'h11;
              4'h7: out_mant = 7'h14;
              4'h8: out_mant = 7'h16;
              4'h9: out_mant = 7'h18;
              4'ha: out_mant = 7'h1b;
              4'hb: out_mant = 7'h1d;
              4'hc: out_mant = 7'h20;
              4'hd: out_mant = 7'h22;
              4'he: out_mant = 7'h25;
              4'hf: out_mant = 7'h27;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h2a;
            case (mant_lo4)
              4'h1: out_mant = 7'h2d;
              4'h2: out_mant = 7'h2f;
              4'h3: out_mant = 7'h32;
              4'h4: out_mant = 7'h35;
              4'h5: out_mant = 7'h38;
              4'h6: out_mant = 7'h3b;
              4'h7: out_mant = 7'h3e;
              4'h8: out_mant = 7'h41;
              4'h9: out_mant = 7'h44;
              4'ha: out_mant = 7'h47;
              4'hb: out_mant = 7'h4a;
              4'hc: out_mant = 7'h4d;
              4'hd: out_mant = 7'h50;
              4'he: out_mant = 7'h54;
              4'hf: out_mant = 7'h57;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h081: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h5a;
            case (mant_lo4)
              4'h1: out_mant = 7'h61;
              4'h2: out_mant = 7'h68;
              4'h3: out_mant = 7'h70;
              4'h4: out_mant = 7'h77;
              4'h5: out_mant = 7'h7f;
              4'h6: out_mant = 7'h04;
              4'h7: out_mant = 7'h08;
              4'h8: out_mant = 7'h0c;
              4'h9: out_mant = 7'h11;
              4'ha: out_mant = 7'h15;
              4'hb: out_mant = 7'h1a;
              4'hc: out_mant = 7'h1f;
              4'hd: out_mant = 7'h24;
              4'he: out_mant = 7'h29;
              4'hf: out_mant = 7'h2e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h34;
            case (mant_lo4)
              4'h1: out_mant = 7'h3a;
              4'h2: out_mant = 7'h40;
              4'h3: out_mant = 7'h46;
              4'h4: out_mant = 7'h4c;
              4'h5: out_mant = 7'h52;
              4'h6: out_mant = 7'h59;
              4'h7: out_mant = 7'h60;
              4'h8: out_mant = 7'h67;
              4'h9: out_mant = 7'h6f;
              4'ha: out_mant = 7'h76;
              4'hb: out_mant = 7'h7e;
              4'hc: out_mant = 7'h03;
              4'hd: out_mant = 7'h07;
              4'he: out_mant = 7'h0b;
              4'hf: out_mant = 7'h10;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h14;
            case (mant_lo4)
              4'h1: out_mant = 7'h19;
              4'h2: out_mant = 7'h1e;
              4'h3: out_mant = 7'h23;
              4'h4: out_mant = 7'h28;
              4'h5: out_mant = 7'h2e;
              4'h6: out_mant = 7'h33;
              4'h7: out_mant = 7'h39;
              4'h8: out_mant = 7'h3f;
              4'h9: out_mant = 7'h45;
              4'ha: out_mant = 7'h4b;
              4'hb: out_mant = 7'h51;
              4'hc: out_mant = 7'h58;
              4'hd: out_mant = 7'h5f;
              4'he: out_mant = 7'h66;
              4'hf: out_mant = 7'h6d;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h75;
            case (mant_lo4)
              4'h1: out_mant = 7'h7c;
              4'h2: out_mant = 7'h02;
              4'h3: out_mant = 7'h06;
              4'h4: out_mant = 7'h0b;
              4'h5: out_mant = 7'h0f;
              4'h6: out_mant = 7'h14;
              4'h7: out_mant = 7'h18;
              4'h8: out_mant = 7'h1d;
              4'h9: out_mant = 7'h22;
              4'ha: out_mant = 7'h27;
              4'hb: out_mant = 7'h2d;
              4'hc: out_mant = 7'h32;
              4'hd: out_mant = 7'h38;
              4'he: out_mant = 7'h3d;
              4'hf: out_mant = 7'h44;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h4a;
            case (mant_lo4)
              4'h1: out_mant = 7'h50;
              4'h2: out_mant = 7'h57;
              4'h3: out_mant = 7'h5e;
              4'h4: out_mant = 7'h65;
              4'h5: out_mant = 7'h6c;
              4'h6: out_mant = 7'h73;
              4'h7: out_mant = 7'h7b;
              4'h8: out_mant = 7'h02;
              4'h9: out_mant = 7'h06;
              4'ha: out_mant = 7'h0a;
              4'hb: out_mant = 7'h0e;
              4'hc: out_mant = 7'h13;
              4'hd: out_mant = 7'h17;
              4'he: out_mant = 7'h1c;
              4'hf: out_mant = 7'h21;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h26;
            case (mant_lo4)
              4'h1: out_mant = 7'h2c;
              4'h2: out_mant = 7'h31;
              4'h3: out_mant = 7'h37;
              4'h4: out_mant = 7'h3c;
              4'h5: out_mant = 7'h42;
              4'h6: out_mant = 7'h49;
              4'h7: out_mant = 7'h4f;
              4'h8: out_mant = 7'h56;
              4'h9: out_mant = 7'h5c;
              4'ha: out_mant = 7'h63;
              4'hb: out_mant = 7'h6b;
              4'hc: out_mant = 7'h72;
              4'hd: out_mant = 7'h7a;
              4'he: out_mant = 7'h01;
              4'hf: out_mant = 7'h05;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h09;
            case (mant_lo4)
              4'h1: out_mant = 7'h0d;
              4'h2: out_mant = 7'h12;
              4'h3: out_mant = 7'h17;
              4'h4: out_mant = 7'h1b;
              4'h5: out_mant = 7'h20;
              4'h6: out_mant = 7'h25;
              4'h7: out_mant = 7'h2b;
              4'h8: out_mant = 7'h30;
              4'h9: out_mant = 7'h36;
              4'ha: out_mant = 7'h3b;
              4'hb: out_mant = 7'h41;
              4'hc: out_mant = 7'h47;
              4'hd: out_mant = 7'h4e;
              4'he: out_mant = 7'h54;
              4'hf: out_mant = 7'h5b;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h62;
            case (mant_lo4)
              4'h1: out_mant = 7'h69;
              4'h2: out_mant = 7'h71;
              4'h3: out_mant = 7'h78;
              4'h4: out_mant = 7'h00;
              4'h5: out_mant = 7'h04;
              4'h6: out_mant = 7'h08;
              4'h7: out_mant = 7'h0d;
              4'h8: out_mant = 7'h11;
              4'h9: out_mant = 7'h16;
              4'ha: out_mant = 7'h1a;
              4'hb: out_mant = 7'h1f;
              4'hc: out_mant = 7'h24;
              4'hd: out_mant = 7'h2a;
              4'he: out_mant = 7'h2f;
              4'hf: out_mant = 7'h35;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h082: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h3a;
            case (mant_lo4)
              4'h1: out_mant = 7'h46;
              4'h2: out_mant = 7'h53;
              4'h3: out_mant = 7'h61;
              4'h4: out_mant = 7'h6f;
              4'h5: out_mant = 7'h7f;
              4'h6: out_mant = 7'h08;
              4'h7: out_mant = 7'h10;
              4'h8: out_mant = 7'h1a;
              4'h9: out_mant = 7'h23;
              4'ha: out_mant = 7'h2e;
              4'hb: out_mant = 7'h39;
              4'hc: out_mant = 7'h45;
              4'hd: out_mant = 7'h52;
              4'he: out_mant = 7'h5f;
              4'hf: out_mant = 7'h6e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h0f;
            case (mant_lo4)
              4'h0: out_mant = 7'h7d;
              4'h1: out_mant = 7'h07;
              4'h3: out_mant = 7'h19;
              4'h4: out_mant = 7'h23;
              4'h5: out_mant = 7'h2d;
              4'h6: out_mant = 7'h38;
              4'h7: out_mant = 7'h44;
              4'h8: out_mant = 7'h51;
              4'h9: out_mant = 7'h5e;
              4'ha: out_mant = 7'h6d;
              4'hb: out_mant = 7'h7c;
              4'hc: out_mant = 7'h06;
              4'he: out_mant = 7'h18;
              4'hf: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h2c;
            case (mant_lo4)
              4'h1: out_mant = 7'h37;
              4'h2: out_mant = 7'h43;
              4'h3: out_mant = 7'h50;
              4'h4: out_mant = 7'h5d;
              4'h5: out_mant = 7'h6b;
              4'h6: out_mant = 7'h7a;
              4'h7: out_mant = 7'h05;
              4'h8: out_mant = 7'h0e;
              4'h9: out_mant = 7'h17;
              4'ha: out_mant = 7'h21;
              4'hb: out_mant = 7'h2b;
              4'hc: out_mant = 7'h36;
              4'hd: out_mant = 7'h42;
              4'he: out_mant = 7'h4e;
              4'hf: out_mant = 7'h5c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h6a;
            case (mant_lo4)
              4'h1: out_mant = 7'h79;
              4'h2: out_mant = 7'h05;
              4'h3: out_mant = 7'h0d;
              4'h4: out_mant = 7'h16;
              4'h5: out_mant = 7'h20;
              4'h6: out_mant = 7'h2a;
              4'h7: out_mant = 7'h35;
              4'h8: out_mant = 7'h41;
              4'h9: out_mant = 7'h4d;
              4'ha: out_mant = 7'h5a;
              4'hb: out_mant = 7'h69;
              4'hc: out_mant = 7'h78;
              4'hd: out_mant = 7'h04;
              4'he: out_mant = 7'h0c;
              4'hf: out_mant = 7'h15;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h1f;
            case (mant_lo4)
              4'h1: out_mant = 7'h29;
              4'h2: out_mant = 7'h34;
              4'h3: out_mant = 7'h40;
              4'h4: out_mant = 7'h4c;
              4'h5: out_mant = 7'h59;
              4'h6: out_mant = 7'h67;
              4'h7: out_mant = 7'h76;
              4'h8: out_mant = 7'h03;
              4'h9: out_mant = 7'h0b;
              4'ha: out_mant = 7'h14;
              4'hb: out_mant = 7'h1e;
              4'hc: out_mant = 7'h28;
              4'hd: out_mant = 7'h33;
              4'he: out_mant = 7'h3f;
              4'hf: out_mant = 7'h4b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h02;
            case (mant_lo4)
              4'h0: out_mant = 7'h58;
              4'h1: out_mant = 7'h66;
              4'h2: out_mant = 7'h75;
              4'h4: out_mant = 7'h0b;
              4'h5: out_mant = 7'h14;
              4'h6: out_mant = 7'h1d;
              4'h7: out_mant = 7'h27;
              4'h8: out_mant = 7'h32;
              4'h9: out_mant = 7'h3e;
              4'ha: out_mant = 7'h4a;
              4'hb: out_mant = 7'h57;
              4'hc: out_mant = 7'h65;
              4'hd: out_mant = 7'h73;
              4'hf: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h13;
            case (mant_lo4)
              4'h1: out_mant = 7'h1c;
              4'h2: out_mant = 7'h26;
              4'h3: out_mant = 7'h31;
              4'h4: out_mant = 7'h3c;
              4'h5: out_mant = 7'h49;
              4'h6: out_mant = 7'h56;
              4'h7: out_mant = 7'h63;
              4'h8: out_mant = 7'h72;
              4'h9: out_mant = 7'h01;
              4'ha: out_mant = 7'h09;
              4'hb: out_mant = 7'h12;
              4'hc: out_mant = 7'h1b;
              4'hd: out_mant = 7'h25;
              4'he: out_mant = 7'h30;
              4'hf: out_mant = 7'h3b;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h48;
            case (mant_lo4)
              4'h1: out_mant = 7'h54;
              4'h2: out_mant = 7'h62;
              4'h3: out_mant = 7'h71;
              4'h4: out_mant = 7'h00;
              4'h5: out_mant = 7'h08;
              4'h6: out_mant = 7'h11;
              4'h7: out_mant = 7'h1b;
              4'h8: out_mant = 7'h24;
              4'h9: out_mant = 7'h2f;
              4'ha: out_mant = 7'h3a;
              4'hb: out_mant = 7'h46;
              4'hc: out_mant = 7'h53;
              4'hd: out_mant = 7'h61;
              4'he: out_mant = 7'h6f;
              4'hf: out_mant = 7'h7f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h083: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h08;
            case (mant_lo4)
              4'h1: out_mant = 7'h1a;
              4'h2: out_mant = 7'h2e;
              4'h3: out_mant = 7'h45;
              4'h4: out_mant = 7'h60;
              4'h5: out_mant = 7'h7d;
              4'h6: out_mant = 7'h10;
              4'h7: out_mant = 7'h23;
              4'h8: out_mant = 7'h38;
              4'h9: out_mant = 7'h51;
              4'ha: out_mant = 7'h6d;
              4'hb: out_mant = 7'h06;
              4'hc: out_mant = 7'h18;
              4'hd: out_mant = 7'h2c;
              4'he: out_mant = 7'h43;
              4'hf: out_mant = 7'h5d;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h7a;
            case (mant_lo4)
              4'h1: out_mant = 7'h0e;
              4'h2: out_mant = 7'h21;
              4'h3: out_mant = 7'h36;
              4'h4: out_mant = 7'h4e;
              4'h5: out_mant = 7'h6a;
              4'h6: out_mant = 7'h05;
              4'h7: out_mant = 7'h16;
              4'h8: out_mant = 7'h2a;
              4'h9: out_mant = 7'h41;
              4'ha: out_mant = 7'h5b;
              4'hb: out_mant = 7'h78;
              4'hc: out_mant = 7'h0c;
              4'hd: out_mant = 7'h1f;
              4'he: out_mant = 7'h34;
              4'hf: out_mant = 7'h4c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h67;
            case (mant_lo4)
              4'h1: out_mant = 7'h03;
              4'h2: out_mant = 7'h15;
              4'h3: out_mant = 7'h28;
              4'h4: out_mant = 7'h3f;
              4'h5: out_mant = 7'h58;
              4'h6: out_mant = 7'h75;
              4'h7: out_mant = 7'h0b;
              4'h8: out_mant = 7'h1d;
              4'h9: out_mant = 7'h32;
              4'ha: out_mant = 7'h4a;
              4'hb: out_mant = 7'h65;
              4'hc: out_mant = 7'h02;
              4'hd: out_mant = 7'h13;
              4'he: out_mant = 7'h26;
              4'hf: out_mant = 7'h3d;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h56;
            case (mant_lo4)
              4'h1: out_mant = 7'h72;
              4'h2: out_mant = 7'h09;
              4'h3: out_mant = 7'h1b;
              4'h4: out_mant = 7'h30;
              4'h5: out_mant = 7'h48;
              4'h6: out_mant = 7'h62;
              4'h7: out_mant = 7'h00;
              4'h8: out_mant = 7'h11;
              4'h9: out_mant = 7'h25;
              4'ha: out_mant = 7'h3a;
              4'hb: out_mant = 7'h53;
              4'hc: out_mant = 7'h6f;
              4'hd: out_mant = 7'h08;
              4'he: out_mant = 7'h1a;
              4'hf: out_mant = 7'h2e;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h45;
            case (mant_lo4)
              4'h1: out_mant = 7'h60;
              4'h2: out_mant = 7'h7d;
              4'h3: out_mant = 7'h10;
              4'h4: out_mant = 7'h23;
              4'h5: out_mant = 7'h38;
              4'h6: out_mant = 7'h51;
              4'h7: out_mant = 7'h6d;
              4'h8: out_mant = 7'h06;
              4'h9: out_mant = 7'h18;
              4'ha: out_mant = 7'h2c;
              4'hb: out_mant = 7'h43;
              4'hc: out_mant = 7'h5d;
              4'hd: out_mant = 7'h7b;
              4'he: out_mant = 7'h0e;
              4'hf: out_mant = 7'h21;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h36;
            case (mant_lo4)
              4'h1: out_mant = 7'h4f;
              4'h2: out_mant = 7'h6a;
              4'h3: out_mant = 7'h05;
              4'h4: out_mant = 7'h16;
              4'h5: out_mant = 7'h2a;
              4'h6: out_mant = 7'h41;
              4'h7: out_mant = 7'h5b;
              4'h8: out_mant = 7'h78;
              4'h9: out_mant = 7'h0c;
              4'ha: out_mant = 7'h1f;
              4'hb: out_mant = 7'h34;
              4'hc: out_mant = 7'h4c;
              4'hd: out_mant = 7'h67;
              4'he: out_mant = 7'h03;
              4'hf: out_mant = 7'h15;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h28;
            case (mant_lo4)
              4'h1: out_mant = 7'h3f;
              4'h2: out_mant = 7'h58;
              4'h3: out_mant = 7'h75;
              4'h4: out_mant = 7'h0b;
              4'h5: out_mant = 7'h1d;
              4'h6: out_mant = 7'h32;
              4'h7: out_mant = 7'h4a;
              4'h8: out_mant = 7'h65;
              4'h9: out_mant = 7'h02;
              4'ha: out_mant = 7'h13;
              4'hb: out_mant = 7'h26;
              4'hc: out_mant = 7'h3d;
              4'hd: out_mant = 7'h56;
              4'he: out_mant = 7'h72;
              4'hf: out_mant = 7'h09;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h1c;
            case (mant_lo4)
              4'h1: out_mant = 7'h30;
              4'h2: out_mant = 7'h48;
              4'h3: out_mant = 7'h62;
              4'h4: out_mant = 7'h00;
              4'h5: out_mant = 7'h11;
              4'h6: out_mant = 7'h25;
              4'h7: out_mant = 7'h3b;
              4'h8: out_mant = 7'h53;
              4'h9: out_mant = 7'h70;
              4'ha: out_mant = 7'h08;
              4'hb: out_mant = 7'h1a;
              4'hc: out_mant = 7'h2e;
              4'hd: out_mant = 7'h45;
              4'he: out_mant = 7'h60;
              4'hf: out_mant = 7'h7e;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h084: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h10;
            case (mant_lo4)
              4'h1: out_mant = 7'h38;
              4'h2: out_mant = 7'h6d;
              4'h3: out_mant = 7'h18;
              4'h4: out_mant = 7'h43;
              4'h5: out_mant = 7'h7b;
              4'h6: out_mant = 7'h21;
              4'h7: out_mant = 7'h4f;
              4'h8: out_mant = 7'h05;
              4'h9: out_mant = 7'h2a;
              4'ha: out_mant = 7'h5b;
              4'hb: out_mant = 7'h0c;
              4'hc: out_mant = 7'h34;
              4'hd: out_mant = 7'h68;
              4'he: out_mant = 7'h15;
              4'hf: out_mant = 7'h3f;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h75;
            case (mant_lo4)
              4'h1: out_mant = 7'h1d;
              4'h2: out_mant = 7'h4a;
              4'h3: out_mant = 7'h02;
              4'h4: out_mant = 7'h27;
              4'h5: out_mant = 7'h56;
              4'h6: out_mant = 7'h09;
              4'h7: out_mant = 7'h30;
              4'h8: out_mant = 7'h62;
              4'h9: out_mant = 7'h11;
              4'ha: out_mant = 7'h3b;
              4'hb: out_mant = 7'h70;
              4'hc: out_mant = 7'h1a;
              4'hd: out_mant = 7'h46;
              4'he: out_mant = 7'h7e;
              4'hf: out_mant = 7'h23;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h51;
            case (mant_lo4)
              4'h1: out_mant = 7'h06;
              4'h2: out_mant = 7'h2c;
              4'h3: out_mant = 7'h5d;
              4'h4: out_mant = 7'h0e;
              4'h5: out_mant = 7'h36;
              4'h6: out_mant = 7'h6a;
              4'h7: out_mant = 7'h16;
              4'h8: out_mant = 7'h41;
              4'h9: out_mant = 7'h78;
              4'ha: out_mant = 7'h1f;
              4'hb: out_mant = 7'h4c;
              4'hc: out_mant = 7'h03;
              4'hd: out_mant = 7'h28;
              4'he: out_mant = 7'h58;
              4'hf: out_mant = 7'h0b;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h32;
            case (mant_lo4)
              4'h1: out_mant = 7'h65;
              4'h2: out_mant = 7'h13;
              4'h3: out_mant = 7'h3d;
              4'h4: out_mant = 7'h72;
              4'h5: out_mant = 7'h1c;
              4'h6: out_mant = 7'h48;
              4'h7: out_mant = 7'h00;
              4'h8: out_mant = 7'h25;
              4'h9: out_mant = 7'h54;
              4'ha: out_mant = 7'h08;
              4'hb: out_mant = 7'h2e;
              4'hc: out_mant = 7'h60;
              4'hd: out_mant = 7'h10;
              4'he: out_mant = 7'h39;
              4'hf: out_mant = 7'h6d;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h18;
            case (mant_lo4)
              4'h1: out_mant = 7'h43;
              4'h2: out_mant = 7'h7b;
              4'h3: out_mant = 7'h21;
              4'h4: out_mant = 7'h4f;
              4'h5: out_mant = 7'h05;
              4'h6: out_mant = 7'h2a;
              4'h7: out_mant = 7'h5b;
              4'h8: out_mant = 7'h0d;
              4'h9: out_mant = 7'h34;
              4'ha: out_mant = 7'h68;
              4'hb: out_mant = 7'h15;
              4'hc: out_mant = 7'h3f;
              4'hd: out_mant = 7'h75;
              4'he: out_mant = 7'h1d;
              4'hf: out_mant = 7'h4a;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h02;
            case (mant_lo4)
              4'h1: out_mant = 7'h27;
              4'h2: out_mant = 7'h56;
              4'h3: out_mant = 7'h09;
              4'h4: out_mant = 7'h30;
              4'h5: out_mant = 7'h63;
              4'h6: out_mant = 7'h11;
              4'h7: out_mant = 7'h3b;
              4'h8: out_mant = 7'h70;
              4'h9: out_mant = 7'h1a;
              4'ha: out_mant = 7'h46;
              4'hb: out_mant = 7'h7e;
              4'hc: out_mant = 7'h23;
              4'hd: out_mant = 7'h51;
              4'he: out_mant = 7'h06;
              4'hf: out_mant = 7'h2c;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h5d;
            case (mant_lo4)
              4'h1: out_mant = 7'h0e;
              4'h2: out_mant = 7'h37;
              4'h3: out_mant = 7'h6a;
              4'h4: out_mant = 7'h16;
              4'h5: out_mant = 7'h41;
              4'h6: out_mant = 7'h78;
              4'h7: out_mant = 7'h1f;
              4'h8: out_mant = 7'h4d;
              4'h9: out_mant = 7'h03;
              4'ha: out_mant = 7'h29;
              4'hb: out_mant = 7'h59;
              4'hc: out_mant = 7'h0b;
              4'hd: out_mant = 7'h32;
              4'he: out_mant = 7'h65;
              4'hf: out_mant = 7'h13;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h3d;
            case (mant_lo4)
              4'h1: out_mant = 7'h73;
              4'h2: out_mant = 7'h1c;
              4'h3: out_mant = 7'h48;
              4'h4: out_mant = 7'h00;
              4'h5: out_mant = 7'h25;
              4'h6: out_mant = 7'h54;
              4'h7: out_mant = 7'h08;
              4'h8: out_mant = 7'h2f;
              4'h9: out_mant = 7'h60;
              4'ha: out_mant = 7'h10;
              4'hb: out_mant = 7'h39;
              4'hc: out_mant = 7'h6d;
              4'hd: out_mant = 7'h18;
              4'he: out_mant = 7'h44;
              4'hf: out_mant = 7'h7b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h085: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'h1: out_mant = 7'h05;
              4'h2: out_mant = 7'h5b;
              4'h3: out_mant = 7'h35;
              4'h4: out_mant = 7'h15;
              4'h5: out_mant = 7'h75;
              4'h6: out_mant = 7'h4a;
              4'h7: out_mant = 7'h27;
              4'h8: out_mant = 7'h09;
              4'h9: out_mant = 7'h63;
              4'ha: out_mant = 7'h3b;
              4'hb: out_mant = 7'h1a;
              4'hc: out_mant = 7'h7e;
              4'hd: out_mant = 7'h51;
              4'he: out_mant = 7'h2d;
              4'hf: out_mant = 7'h0e;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h6b;
            case (mant_lo4)
              4'h1: out_mant = 7'h41;
              4'h2: out_mant = 7'h1f;
              4'h3: out_mant = 7'h03;
              4'h4: out_mant = 7'h59;
              4'h5: out_mant = 7'h33;
              4'h6: out_mant = 7'h13;
              4'h7: out_mant = 7'h73;
              4'h8: out_mant = 7'h48;
              4'h9: out_mant = 7'h25;
              4'ha: out_mant = 7'h08;
              4'hb: out_mant = 7'h60;
              4'hc: out_mant = 7'h39;
              4'hd: out_mant = 7'h18;
              4'he: out_mant = 7'h7b;
              4'hf: out_mant = 7'h4f;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h2b;
            case (mant_lo4)
              4'h1: out_mant = 7'h0d;
              4'h2: out_mant = 7'h68;
              4'h3: out_mant = 7'h3f;
              4'h4: out_mant = 7'h1e;
              4'h5: out_mant = 7'h02;
              4'h6: out_mant = 7'h56;
              4'h7: out_mant = 7'h31;
              4'h8: out_mant = 7'h12;
              4'h9: out_mant = 7'h70;
              4'ha: out_mant = 7'h46;
              4'hb: out_mant = 7'h23;
              4'hc: out_mant = 7'h07;
              4'hd: out_mant = 7'h5e;
              4'he: out_mant = 7'h37;
              4'hf: out_mant = 7'h17;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h00;
            case (mant_lo4)
              4'h0: out_mant = 7'h79;
              4'h1: out_mant = 7'h4d;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h00;
          end
          3'h5: begin
            out_mant = 7'h00;
          end
          3'h6: begin
            out_mant = 7'h00;
          end
          3'h7: begin
            out_mant = 7'h00;
          end
          default: begin end
        endcase
      end
      9'h0ff: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h40;
            case (mant_lo4)
              4'h0: out_mant = 7'h00;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h40;
          end
          3'h2: begin
            out_mant = 7'h40;
          end
          3'h3: begin
            out_mant = 7'h40;
          end
          3'h4: begin
            out_mant = 7'h40;
          end
          3'h5: begin
            out_mant = 7'h40;
          end
          3'h6: begin
            out_mant = 7'h40;
          end
          3'h7: begin
            out_mant = 7'h40;
          end
          default: begin end
        endcase
      end
      9'h176: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7f;
            case (mant_lo4)
              4'h0: out_mant = 7'h00;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h7f;
          end
          3'h2: begin
            out_mant = 7'h7f;
          end
          3'h3: begin
            out_mant = 7'h7f;
          end
          3'h4: begin
            out_mant = 7'h7f;
          end
          3'h5: begin
            out_mant = 7'h7f;
          end
          3'h6: begin
            out_mant = 7'h7f;
          end
          3'h7: begin
            out_mant = 7'h7f;
          end
          default: begin end
        endcase
      end
      9'h177: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7f;
          end
          3'h1: begin
            out_mant = 7'h7f;
          end
          3'h2: begin
            out_mant = 7'h7f;
          end
          3'h3: begin
            out_mant = 7'h7f;
          end
          3'h4: begin
            out_mant = 7'h7e;
            case (mant_lo4)
              4'h0: out_mant = 7'h7f;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h7e;
          end
          3'h6: begin
            out_mant = 7'h7e;
          end
          3'h7: begin
            out_mant = 7'h7e;
          end
          default: begin end
        endcase
      end
      9'h178: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7e;
          end
          3'h1: begin
            out_mant = 7'h7e;
          end
          3'h2: begin
            out_mant = 7'h7d;
            case (mant_lo4)
              4'h0: out_mant = 7'h7e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h7d;
          end
          3'h4: begin
            out_mant = 7'h7d;
          end
          3'h5: begin
            out_mant = 7'h7d;
          end
          3'h6: begin
            out_mant = 7'h7c;
            case (mant_lo4)
              4'h0: out_mant = 7'h7d;
              4'h1: out_mant = 7'h7d;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h7c;
          end
          default: begin end
        endcase
      end
      9'h179: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h7c;
          end
          3'h1: begin
            out_mant = 7'h7b;
            case (mant_lo4)
              4'h0: out_mant = 7'h7c;
              4'h1: out_mant = 7'h7c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h7b;
          end
          3'h3: begin
            out_mant = 7'h7a;
            case (mant_lo4)
              4'h0: out_mant = 7'h7b;
              4'h1: out_mant = 7'h7b;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h7a;
          end
          3'h5: begin
            out_mant = 7'h79;
            case (mant_lo4)
              4'h0: out_mant = 7'h7a;
              4'h1: out_mant = 7'h7a;
              4'h2: out_mant = 7'h7a;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h79;
          end
          3'h7: begin
            out_mant = 7'h78;
            case (mant_lo4)
              4'h0: out_mant = 7'h79;
              4'h1: out_mant = 7'h79;
              4'h2: out_mant = 7'h79;
              4'h3: out_mant = 7'h79;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17a: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h78;
            case (mant_lo4)
              4'hb: out_mant = 7'h77;
              4'hc: out_mant = 7'h77;
              4'hd: out_mant = 7'h77;
              4'he: out_mant = 7'h77;
              4'hf: out_mant = 7'h77;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h77;
            case (mant_lo4)
              4'hb: out_mant = 7'h76;
              4'hc: out_mant = 7'h76;
              4'hd: out_mant = 7'h76;
              4'he: out_mant = 7'h76;
              4'hf: out_mant = 7'h76;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h76;
            case (mant_lo4)
              4'hc: out_mant = 7'h75;
              4'hd: out_mant = 7'h75;
              4'he: out_mant = 7'h75;
              4'hf: out_mant = 7'h75;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h75;
            case (mant_lo4)
              4'hd: out_mant = 7'h74;
              4'he: out_mant = 7'h74;
              4'hf: out_mant = 7'h74;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h74;
            case (mant_lo4)
              4'he: out_mant = 7'h73;
              4'hf: out_mant = 7'h73;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h73;
            case (mant_lo4)
              4'he: out_mant = 7'h72;
              4'hf: out_mant = 7'h72;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h72;
            case (mant_lo4)
              4'hf: out_mant = 7'h71;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h71;
          end
          default: begin end
        endcase
      end
      9'h17b: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h70;
            case (mant_lo4)
              4'h9: out_mant = 7'h6f;
              4'ha: out_mant = 7'h6f;
              4'hb: out_mant = 7'h6f;
              4'hc: out_mant = 7'h6f;
              4'hd: out_mant = 7'h6f;
              4'he: out_mant = 7'h6f;
              4'hf: out_mant = 7'h6f;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h6e;
            case (mant_lo4)
              4'h0: out_mant = 7'h6f;
              4'h1: out_mant = 7'h6f;
              4'ha: out_mant = 7'h6d;
              4'hb: out_mant = 7'h6d;
              4'hc: out_mant = 7'h6d;
              4'hd: out_mant = 7'h6d;
              4'he: out_mant = 7'h6d;
              4'hf: out_mant = 7'h6d;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h6c;
            case (mant_lo4)
              4'h0: out_mant = 7'h6d;
              4'h1: out_mant = 7'h6d;
              4'h2: out_mant = 7'h6d;
              4'hb: out_mant = 7'h6b;
              4'hc: out_mant = 7'h6b;
              4'hd: out_mant = 7'h6b;
              4'he: out_mant = 7'h6b;
              4'hf: out_mant = 7'h6b;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h6a;
            case (mant_lo4)
              4'h0: out_mant = 7'h6b;
              4'h1: out_mant = 7'h6b;
              4'h2: out_mant = 7'h6b;
              4'h3: out_mant = 7'h6b;
              4'hd: out_mant = 7'h69;
              4'he: out_mant = 7'h69;
              4'hf: out_mant = 7'h69;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h68;
            case (mant_lo4)
              4'h0: out_mant = 7'h69;
              4'h1: out_mant = 7'h69;
              4'h2: out_mant = 7'h69;
              4'h3: out_mant = 7'h69;
              4'h4: out_mant = 7'h69;
              4'h5: out_mant = 7'h69;
              4'hf: out_mant = 7'h67;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h66;
            case (mant_lo4)
              4'h0: out_mant = 7'h67;
              4'h1: out_mant = 7'h67;
              4'h2: out_mant = 7'h67;
              4'h3: out_mant = 7'h67;
              4'h4: out_mant = 7'h67;
              4'h5: out_mant = 7'h67;
              4'h6: out_mant = 7'h67;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h65;
            case (mant_lo4)
              4'h9: out_mant = 7'h64;
              4'ha: out_mant = 7'h64;
              4'hb: out_mant = 7'h64;
              4'hc: out_mant = 7'h64;
              4'hd: out_mant = 7'h64;
              4'he: out_mant = 7'h64;
              4'hf: out_mant = 7'h64;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h63;
            case (mant_lo4)
              4'h0: out_mant = 7'h64;
              4'h1: out_mant = 7'h64;
              4'hb: out_mant = 7'h62;
              4'hc: out_mant = 7'h62;
              4'hd: out_mant = 7'h62;
              4'he: out_mant = 7'h62;
              4'hf: out_mant = 7'h62;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17c: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h61;
            case (mant_lo4)
              4'h0: out_mant = 7'h62;
              4'h1: out_mant = 7'h62;
              4'h7: out_mant = 7'h60;
              4'h8: out_mant = 7'h60;
              4'h9: out_mant = 7'h60;
              4'ha: out_mant = 7'h60;
              4'hb: out_mant = 7'h60;
              4'hc: out_mant = 7'h5f;
              4'hd: out_mant = 7'h5f;
              4'he: out_mant = 7'h5f;
              4'hf: out_mant = 7'h5f;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h5e;
            case (mant_lo4)
              4'h5: out_mant = 7'h5d;
              4'h6: out_mant = 7'h5d;
              4'h7: out_mant = 7'h5d;
              4'h8: out_mant = 7'h5d;
              4'h9: out_mant = 7'h5c;
              4'ha: out_mant = 7'h5c;
              4'hb: out_mant = 7'h5c;
              4'hc: out_mant = 7'h5c;
              4'hd: out_mant = 7'h5c;
              4'he: out_mant = 7'h5b;
              4'hf: out_mant = 7'h5b;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h59;
            case (mant_lo4)
              4'h0: out_mant = 7'h5b;
              4'h1: out_mant = 7'h5b;
              4'h2: out_mant = 7'h5b;
              4'h3: out_mant = 7'h5a;
              4'h4: out_mant = 7'h5a;
              4'h5: out_mant = 7'h5a;
              4'h6: out_mant = 7'h5a;
              4'hc: out_mant = 7'h58;
              4'hd: out_mant = 7'h58;
              4'he: out_mant = 7'h58;
              4'hf: out_mant = 7'h58;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h57;
            case (mant_lo4)
              4'h0: out_mant = 7'h58;
              4'h6: out_mant = 7'h56;
              4'h7: out_mant = 7'h56;
              4'h8: out_mant = 7'h56;
              4'h9: out_mant = 7'h56;
              4'ha: out_mant = 7'h55;
              4'hb: out_mant = 7'h55;
              4'hc: out_mant = 7'h55;
              4'hd: out_mant = 7'h55;
              4'he: out_mant = 7'h55;
              4'hf: out_mant = 7'h54;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h53;
            case (mant_lo4)
              4'h0: out_mant = 7'h54;
              4'h1: out_mant = 7'h54;
              4'h2: out_mant = 7'h54;
              4'h3: out_mant = 7'h54;
              4'h9: out_mant = 7'h52;
              4'ha: out_mant = 7'h52;
              4'hb: out_mant = 7'h52;
              4'hc: out_mant = 7'h52;
              4'hd: out_mant = 7'h52;
              4'he: out_mant = 7'h51;
              4'hf: out_mant = 7'h51;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h50;
            case (mant_lo4)
              4'h0: out_mant = 7'h51;
              4'h1: out_mant = 7'h51;
              4'h2: out_mant = 7'h51;
              4'h8: out_mant = 7'h4f;
              4'h9: out_mant = 7'h4f;
              4'ha: out_mant = 7'h4f;
              4'hb: out_mant = 7'h4f;
              4'hc: out_mant = 7'h4f;
              4'hd: out_mant = 7'h4e;
              4'he: out_mant = 7'h4e;
              4'hf: out_mant = 7'h4e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h4d;
            case (mant_lo4)
              4'h0: out_mant = 7'h4e;
              4'h1: out_mant = 7'h4e;
              4'h7: out_mant = 7'h4c;
              4'h8: out_mant = 7'h4c;
              4'h9: out_mant = 7'h4c;
              4'ha: out_mant = 7'h4c;
              4'hb: out_mant = 7'h4c;
              4'hc: out_mant = 7'h4b;
              4'hd: out_mant = 7'h4b;
              4'he: out_mant = 7'h4b;
              4'hf: out_mant = 7'h4b;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h4a;
            case (mant_lo4)
              4'h0: out_mant = 7'h4b;
              4'h6: out_mant = 7'h49;
              4'h7: out_mant = 7'h49;
              4'h8: out_mant = 7'h49;
              4'h9: out_mant = 7'h49;
              4'ha: out_mant = 7'h49;
              4'hb: out_mant = 7'h48;
              4'hc: out_mant = 7'h48;
              4'hd: out_mant = 7'h48;
              4'he: out_mant = 7'h48;
              4'hf: out_mant = 7'h48;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17d: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h47;
            case (mant_lo4)
              4'h3: out_mant = 7'h46;
              4'h4: out_mant = 7'h46;
              4'h5: out_mant = 7'h45;
              4'h6: out_mant = 7'h45;
              4'h7: out_mant = 7'h45;
              4'h8: out_mant = 7'h44;
              4'h9: out_mant = 7'h44;
              4'ha: out_mant = 7'h44;
              4'hb: out_mant = 7'h43;
              4'hc: out_mant = 7'h43;
              4'hd: out_mant = 7'h42;
              4'he: out_mant = 7'h42;
              4'hf: out_mant = 7'h42;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h40;
            case (mant_lo4)
              4'h0: out_mant = 7'h41;
              4'h1: out_mant = 7'h41;
              4'h5: out_mant = 7'h3f;
              4'h6: out_mant = 7'h3f;
              4'h7: out_mant = 7'h3f;
              4'h8: out_mant = 7'h3e;
              4'h9: out_mant = 7'h3e;
              4'ha: out_mant = 7'h3e;
              4'hb: out_mant = 7'h3d;
              4'hc: out_mant = 7'h3d;
              4'hd: out_mant = 7'h3c;
              4'he: out_mant = 7'h3c;
              4'hf: out_mant = 7'h3c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h3b;
            case (mant_lo4)
              4'h3: out_mant = 7'h3a;
              4'h4: out_mant = 7'h3a;
              4'h5: out_mant = 7'h39;
              4'h6: out_mant = 7'h39;
              4'h7: out_mant = 7'h39;
              4'h8: out_mant = 7'h38;
              4'h9: out_mant = 7'h38;
              4'ha: out_mant = 7'h38;
              4'hb: out_mant = 7'h37;
              4'hc: out_mant = 7'h37;
              4'hd: out_mant = 7'h37;
              4'he: out_mant = 7'h36;
              4'hf: out_mant = 7'h36;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h34;
            case (mant_lo4)
              4'h0: out_mant = 7'h36;
              4'h1: out_mant = 7'h35;
              4'h2: out_mant = 7'h35;
              4'h6: out_mant = 7'h33;
              4'h7: out_mant = 7'h33;
              4'h8: out_mant = 7'h33;
              4'h9: out_mant = 7'h32;
              4'ha: out_mant = 7'h32;
              4'hb: out_mant = 7'h32;
              4'hc: out_mant = 7'h31;
              4'hd: out_mant = 7'h31;
              4'he: out_mant = 7'h31;
              4'hf: out_mant = 7'h30;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h2f;
            case (mant_lo4)
              4'h0: out_mant = 7'h30;
              4'h1: out_mant = 7'h30;
              4'h5: out_mant = 7'h2e;
              4'h6: out_mant = 7'h2e;
              4'h7: out_mant = 7'h2e;
              4'h8: out_mant = 7'h2d;
              4'h9: out_mant = 7'h2d;
              4'ha: out_mant = 7'h2d;
              4'hb: out_mant = 7'h2c;
              4'hc: out_mant = 7'h2c;
              4'hd: out_mant = 7'h2c;
              4'he: out_mant = 7'h2b;
              4'hf: out_mant = 7'h2b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h2a;
            case (mant_lo4)
              4'h0: out_mant = 7'h2b;
              4'h4: out_mant = 7'h29;
              4'h5: out_mant = 7'h29;
              4'h6: out_mant = 7'h29;
              4'h7: out_mant = 7'h28;
              4'h8: out_mant = 7'h28;
              4'h9: out_mant = 7'h28;
              4'ha: out_mant = 7'h27;
              4'hb: out_mant = 7'h27;
              4'hc: out_mant = 7'h27;
              4'hd: out_mant = 7'h26;
              4'he: out_mant = 7'h26;
              4'hf: out_mant = 7'h26;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'h0: out_mant = 7'h25;
              4'h1: out_mant = 7'h25;
              4'h2: out_mant = 7'h25;
              4'h3: out_mant = 7'h24;
              4'h4: out_mant = 7'h24;
              4'h5: out_mant = 7'h24;
              4'h6: out_mant = 7'h23;
              4'h7: out_mant = 7'h23;
              4'h8: out_mant = 7'h23;
              4'h9: out_mant = 7'h22;
              4'ha: out_mant = 7'h22;
              4'hb: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h1c;
            case (mant_lo4)
              4'h0: out_mant = 7'h20;
              4'h1: out_mant = 7'h20;
              4'h2: out_mant = 7'h20;
              4'h3: out_mant = 7'h1f;
              4'h4: out_mant = 7'h1f;
              4'h5: out_mant = 7'h1f;
              4'h6: out_mant = 7'h1e;
              4'h7: out_mant = 7'h1e;
              4'h8: out_mant = 7'h1e;
              4'h9: out_mant = 7'h1d;
              4'ha: out_mant = 7'h1d;
              4'hb: out_mant = 7'h1d;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17e: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h1b;
            case (mant_lo4)
              4'h2: out_mant = 7'h1a;
              4'h3: out_mant = 7'h19;
              4'h4: out_mant = 7'h19;
              4'h5: out_mant = 7'h18;
              4'h6: out_mant = 7'h18;
              4'h7: out_mant = 7'h17;
              4'h8: out_mant = 7'h16;
              4'h9: out_mant = 7'h16;
              4'ha: out_mant = 7'h15;
              4'hb: out_mant = 7'h15;
              4'hc: out_mant = 7'h14;
              4'hd: out_mant = 7'h14;
              4'he: out_mant = 7'h13;
              4'hf: out_mant = 7'h12;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h11;
            case (mant_lo4)
              4'h0: out_mant = 7'h12;
              4'h3: out_mant = 7'h10;
              4'h4: out_mant = 7'h10;
              4'h5: out_mant = 7'h0f;
              4'h6: out_mant = 7'h0e;
              4'h7: out_mant = 7'h0e;
              4'h8: out_mant = 7'h0d;
              4'h9: out_mant = 7'h0d;
              4'ha: out_mant = 7'h0c;
              4'hb: out_mant = 7'h0c;
              4'hc: out_mant = 7'h0b;
              4'hd: out_mant = 7'h0b;
              4'he: out_mant = 7'h0a;
              4'hf: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h08;
            case (mant_lo4)
              4'h0: out_mant = 7'h09;
              4'h3: out_mant = 7'h07;
              4'h4: out_mant = 7'h07;
              4'h5: out_mant = 7'h06;
              4'h6: out_mant = 7'h06;
              4'h7: out_mant = 7'h05;
              4'h8: out_mant = 7'h05;
              4'h9: out_mant = 7'h04;
              4'ha: out_mant = 7'h04;
              4'hb: out_mant = 7'h03;
              4'hc: out_mant = 7'h03;
              4'hd: out_mant = 7'h02;
              4'he: out_mant = 7'h02;
              4'hf: out_mant = 7'h01;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h7b;
            case (mant_lo4)
              4'h0: out_mant = 7'h01;
              4'h1: out_mant = 7'h00;
              4'h2: out_mant = 7'h7f;
              4'h3: out_mant = 7'h7e;
              4'h4: out_mant = 7'h7d;
              4'h5: out_mant = 7'h7c;
              4'h8: out_mant = 7'h7a;
              4'h9: out_mant = 7'h79;
              4'ha: out_mant = 7'h78;
              4'hb: out_mant = 7'h77;
              4'hc: out_mant = 7'h76;
              4'hd: out_mant = 7'h75;
              4'he: out_mant = 7'h74;
              4'hf: out_mant = 7'h73;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h69;
            case (mant_lo4)
              4'h0: out_mant = 7'h72;
              4'h1: out_mant = 7'h71;
              4'h2: out_mant = 7'h70;
              4'h3: out_mant = 7'h6f;
              4'h4: out_mant = 7'h6e;
              4'h5: out_mant = 7'h6d;
              4'h6: out_mant = 7'h6c;
              4'h7: out_mant = 7'h6b;
              4'h8: out_mant = 7'h6a;
              4'hb: out_mant = 7'h68;
              4'hc: out_mant = 7'h67;
              4'hd: out_mant = 7'h66;
              4'he: out_mant = 7'h65;
              4'hf: out_mant = 7'h64;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h61;
            case (mant_lo4)
              4'h0: out_mant = 7'h63;
              4'h1: out_mant = 7'h62;
              4'h4: out_mant = 7'h60;
              4'h5: out_mant = 7'h5f;
              4'h6: out_mant = 7'h5e;
              4'h7: out_mant = 7'h5d;
              4'h8: out_mant = 7'h5c;
              4'h9: out_mant = 7'h5b;
              4'ha: out_mant = 7'h5a;
              4'hb: out_mant = 7'h5a;
              4'hc: out_mant = 7'h59;
              4'hd: out_mant = 7'h58;
              4'he: out_mant = 7'h57;
              4'hf: out_mant = 7'h56;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h55;
            case (mant_lo4)
              4'h2: out_mant = 7'h54;
              4'h3: out_mant = 7'h53;
              4'h4: out_mant = 7'h52;
              4'h5: out_mant = 7'h51;
              4'h6: out_mant = 7'h50;
              4'h7: out_mant = 7'h50;
              4'h8: out_mant = 7'h4f;
              4'h9: out_mant = 7'h4e;
              4'ha: out_mant = 7'h4d;
              4'hb: out_mant = 7'h4c;
              4'hc: out_mant = 7'h4c;
              4'hd: out_mant = 7'h4b;
              4'he: out_mant = 7'h4a;
              4'hf: out_mant = 7'h49;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h45;
            case (mant_lo4)
              4'h0: out_mant = 7'h49;
              4'h1: out_mant = 7'h48;
              4'h2: out_mant = 7'h47;
              4'h3: out_mant = 7'h46;
              4'h6: out_mant = 7'h44;
              4'h7: out_mant = 7'h43;
              4'h8: out_mant = 7'h42;
              4'h9: out_mant = 7'h42;
              4'ha: out_mant = 7'h41;
              4'hb: out_mant = 7'h40;
              4'hc: out_mant = 7'h3f;
              4'hd: out_mant = 7'h3f;
              4'he: out_mant = 7'h3e;
              4'hf: out_mant = 7'h3d;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17f: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h3c;
            case (mant_lo4)
              4'h1: out_mant = 7'h3b;
              4'h2: out_mant = 7'h39;
              4'h3: out_mant = 7'h38;
              4'h4: out_mant = 7'h37;
              4'h5: out_mant = 7'h35;
              4'h6: out_mant = 7'h34;
              4'h7: out_mant = 7'h32;
              4'h8: out_mant = 7'h31;
              4'h9: out_mant = 7'h30;
              4'ha: out_mant = 7'h2e;
              4'hb: out_mant = 7'h2d;
              4'hc: out_mant = 7'h2b;
              4'hd: out_mant = 7'h2a;
              4'he: out_mant = 7'h29;
              4'hf: out_mant = 7'h28;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h26;
            case (mant_lo4)
              4'h1: out_mant = 7'h25;
              4'h2: out_mant = 7'h24;
              4'h3: out_mant = 7'h22;
              4'h4: out_mant = 7'h21;
              4'h5: out_mant = 7'h20;
              4'h6: out_mant = 7'h1f;
              4'h7: out_mant = 7'h1d;
              4'h8: out_mant = 7'h1c;
              4'h9: out_mant = 7'h1b;
              4'ha: out_mant = 7'h1a;
              4'hb: out_mant = 7'h19;
              4'hc: out_mant = 7'h17;
              4'hd: out_mant = 7'h16;
              4'he: out_mant = 7'h15;
              4'hf: out_mant = 7'h14;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h13;
            case (mant_lo4)
              4'h1: out_mant = 7'h12;
              4'h2: out_mant = 7'h10;
              4'h3: out_mant = 7'h0f;
              4'h4: out_mant = 7'h0e;
              4'h5: out_mant = 7'h0d;
              4'h6: out_mant = 7'h0c;
              4'h7: out_mant = 7'h0b;
              4'h8: out_mant = 7'h0a;
              4'h9: out_mant = 7'h09;
              4'ha: out_mant = 7'h08;
              4'hb: out_mant = 7'h07;
              4'hc: out_mant = 7'h06;
              4'hd: out_mant = 7'h05;
              4'he: out_mant = 7'h03;
              4'hf: out_mant = 7'h02;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'h1: out_mant = 7'h00;
              4'h2: out_mant = 7'h7f;
              4'h3: out_mant = 7'h7d;
              4'h4: out_mant = 7'h7b;
              4'h5: out_mant = 7'h79;
              4'h6: out_mant = 7'h77;
              4'h7: out_mant = 7'h75;
              4'h8: out_mant = 7'h73;
              4'h9: out_mant = 7'h71;
              4'ha: out_mant = 7'h6f;
              4'hb: out_mant = 7'h6e;
              4'hc: out_mant = 7'h6c;
              4'hd: out_mant = 7'h6a;
              4'he: out_mant = 7'h68;
              4'hf: out_mant = 7'h66;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h64;
            case (mant_lo4)
              4'h1: out_mant = 7'h63;
              4'h2: out_mant = 7'h61;
              4'h3: out_mant = 7'h5f;
              4'h4: out_mant = 7'h5d;
              4'h5: out_mant = 7'h5c;
              4'h6: out_mant = 7'h5a;
              4'h7: out_mant = 7'h58;
              4'h8: out_mant = 7'h57;
              4'h9: out_mant = 7'h55;
              4'ha: out_mant = 7'h53;
              4'hb: out_mant = 7'h52;
              4'hc: out_mant = 7'h50;
              4'hd: out_mant = 7'h4e;
              4'he: out_mant = 7'h4d;
              4'hf: out_mant = 7'h4b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h4a;
            case (mant_lo4)
              4'h1: out_mant = 7'h48;
              4'h2: out_mant = 7'h47;
              4'h3: out_mant = 7'h45;
              4'h4: out_mant = 7'h43;
              4'h5: out_mant = 7'h42;
              4'h6: out_mant = 7'h40;
              4'h7: out_mant = 7'h3f;
              4'h8: out_mant = 7'h3d;
              4'h9: out_mant = 7'h3c;
              4'ha: out_mant = 7'h3a;
              4'hb: out_mant = 7'h39;
              4'hc: out_mant = 7'h38;
              4'hd: out_mant = 7'h36;
              4'he: out_mant = 7'h35;
              4'hf: out_mant = 7'h33;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h32;
            case (mant_lo4)
              4'h1: out_mant = 7'h31;
              4'h2: out_mant = 7'h2f;
              4'h3: out_mant = 7'h2e;
              4'h4: out_mant = 7'h2c;
              4'h5: out_mant = 7'h2b;
              4'h6: out_mant = 7'h2a;
              4'h7: out_mant = 7'h28;
              4'h8: out_mant = 7'h27;
              4'h9: out_mant = 7'h26;
              4'ha: out_mant = 7'h25;
              4'hb: out_mant = 7'h23;
              4'hc: out_mant = 7'h22;
              4'hd: out_mant = 7'h21;
              4'he: out_mant = 7'h20;
              4'hf: out_mant = 7'h1e;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h1d;
            case (mant_lo4)
              4'h1: out_mant = 7'h1c;
              4'h2: out_mant = 7'h1b;
              4'h3: out_mant = 7'h19;
              4'h4: out_mant = 7'h18;
              4'h5: out_mant = 7'h17;
              4'h6: out_mant = 7'h16;
              4'h7: out_mant = 7'h15;
              4'h8: out_mant = 7'h14;
              4'h9: out_mant = 7'h12;
              4'ha: out_mant = 7'h11;
              4'hb: out_mant = 7'h10;
              4'hc: out_mant = 7'h0f;
              4'hd: out_mant = 7'h0e;
              4'he: out_mant = 7'h0d;
              4'hf: out_mant = 7'h0c;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h180: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h0b;
            case (mant_lo4)
              4'h1: out_mant = 7'h08;
              4'h2: out_mant = 7'h06;
              4'h3: out_mant = 7'h04;
              4'h4: out_mant = 7'h02;
              4'h5: out_mant = 7'h00;
              4'h6: out_mant = 7'h7c;
              4'h7: out_mant = 7'h78;
              4'h8: out_mant = 7'h75;
              4'h9: out_mant = 7'h71;
              4'ha: out_mant = 7'h6d;
              4'hb: out_mant = 7'h69;
              4'hc: out_mant = 7'h66;
              4'hd: out_mant = 7'h62;
              4'he: out_mant = 7'h5f;
              4'hf: out_mant = 7'h5b;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h58;
            case (mant_lo4)
              4'h1: out_mant = 7'h55;
              4'h2: out_mant = 7'h51;
              4'h3: out_mant = 7'h4e;
              4'h4: out_mant = 7'h4b;
              4'h5: out_mant = 7'h48;
              4'h6: out_mant = 7'h45;
              4'h7: out_mant = 7'h41;
              4'h8: out_mant = 7'h3e;
              4'h9: out_mant = 7'h3c;
              4'ha: out_mant = 7'h39;
              4'hb: out_mant = 7'h36;
              4'hc: out_mant = 7'h33;
              4'hd: out_mant = 7'h30;
              4'he: out_mant = 7'h2d;
              4'hf: out_mant = 7'h2b;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h28;
            case (mant_lo4)
              4'h1: out_mant = 7'h26;
              4'h2: out_mant = 7'h23;
              4'h3: out_mant = 7'h20;
              4'h4: out_mant = 7'h1e;
              4'h5: out_mant = 7'h1b;
              4'h6: out_mant = 7'h19;
              4'h7: out_mant = 7'h17;
              4'h8: out_mant = 7'h14;
              4'h9: out_mant = 7'h12;
              4'ha: out_mant = 7'h10;
              4'hb: out_mant = 7'h0e;
              4'hc: out_mant = 7'h0b;
              4'hd: out_mant = 7'h09;
              4'he: out_mant = 7'h07;
              4'hf: out_mant = 7'h05;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h03;
            case (mant_lo4)
              4'h1: out_mant = 7'h01;
              4'h2: out_mant = 7'h7e;
              4'h3: out_mant = 7'h7a;
              4'h4: out_mant = 7'h76;
              4'h5: out_mant = 7'h72;
              4'h6: out_mant = 7'h6e;
              4'h7: out_mant = 7'h6b;
              4'h8: out_mant = 7'h67;
              4'h9: out_mant = 7'h63;
              4'ha: out_mant = 7'h60;
              4'hb: out_mant = 7'h5c;
              4'hc: out_mant = 7'h59;
              4'hd: out_mant = 7'h56;
              4'he: out_mant = 7'h52;
              4'hf: out_mant = 7'h4f;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h4c;
            case (mant_lo4)
              4'h1: out_mant = 7'h49;
              4'h2: out_mant = 7'h46;
              4'h3: out_mant = 7'h43;
              4'h4: out_mant = 7'h40;
              4'h5: out_mant = 7'h3d;
              4'h6: out_mant = 7'h3a;
              4'h7: out_mant = 7'h37;
              4'h8: out_mant = 7'h34;
              4'h9: out_mant = 7'h31;
              4'ha: out_mant = 7'h2e;
              4'hb: out_mant = 7'h2c;
              4'hc: out_mant = 7'h29;
              4'hd: out_mant = 7'h26;
              4'he: out_mant = 7'h24;
              4'hf: out_mant = 7'h21;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h1f;
            case (mant_lo4)
              4'h1: out_mant = 7'h1c;
              4'h2: out_mant = 7'h1a;
              4'h3: out_mant = 7'h18;
              4'h4: out_mant = 7'h15;
              4'h5: out_mant = 7'h13;
              4'h6: out_mant = 7'h11;
              4'h7: out_mant = 7'h0e;
              4'h8: out_mant = 7'h0c;
              4'h9: out_mant = 7'h0a;
              4'ha: out_mant = 7'h08;
              4'hb: out_mant = 7'h06;
              4'hc: out_mant = 7'h04;
              4'hd: out_mant = 7'h02;
              4'he: out_mant = 7'h7f;
              4'hf: out_mant = 7'h7b;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h77;
            case (mant_lo4)
              4'h1: out_mant = 7'h74;
              4'h2: out_mant = 7'h70;
              4'h3: out_mant = 7'h6c;
              4'h4: out_mant = 7'h68;
              4'h5: out_mant = 7'h65;
              4'h6: out_mant = 7'h61;
              4'h7: out_mant = 7'h5e;
              4'h8: out_mant = 7'h5a;
              4'h9: out_mant = 7'h57;
              4'ha: out_mant = 7'h54;
              4'hb: out_mant = 7'h50;
              4'hc: out_mant = 7'h4d;
              4'hd: out_mant = 7'h4a;
              4'he: out_mant = 7'h47;
              4'hf: out_mant = 7'h44;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h41;
            case (mant_lo4)
              4'h1: out_mant = 7'h3e;
              4'h2: out_mant = 7'h3b;
              4'h3: out_mant = 7'h38;
              4'h4: out_mant = 7'h35;
              4'h5: out_mant = 7'h32;
              4'h6: out_mant = 7'h2f;
              4'h7: out_mant = 7'h2d;
              4'h8: out_mant = 7'h2a;
              4'h9: out_mant = 7'h27;
              4'ha: out_mant = 7'h25;
              4'hb: out_mant = 7'h22;
              4'hc: out_mant = 7'h20;
              4'hd: out_mant = 7'h1d;
              4'he: out_mant = 7'h1b;
              4'hf: out_mant = 7'h18;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h181: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h16;
            case (mant_lo4)
              4'h1: out_mant = 7'h11;
              4'h2: out_mant = 7'h0d;
              4'h3: out_mant = 7'h09;
              4'h4: out_mant = 7'h04;
              4'h5: out_mant = 7'h00;
              4'h6: out_mant = 7'h79;
              4'h7: out_mant = 7'h71;
              4'h8: out_mant = 7'h6a;
              4'h9: out_mant = 7'h63;
              4'ha: out_mant = 7'h5c;
              4'hb: out_mant = 7'h55;
              4'hc: out_mant = 7'h4e;
              4'hd: out_mant = 7'h48;
              4'he: out_mant = 7'h42;
              4'hf: out_mant = 7'h3c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h36;
            case (mant_lo4)
              4'h1: out_mant = 7'h30;
              4'h2: out_mant = 7'h2b;
              4'h3: out_mant = 7'h26;
              4'h4: out_mant = 7'h21;
              4'h5: out_mant = 7'h1c;
              4'h6: out_mant = 7'h17;
              4'h7: out_mant = 7'h12;
              4'h8: out_mant = 7'h0e;
              4'h9: out_mant = 7'h09;
              4'ha: out_mant = 7'h05;
              4'hb: out_mant = 7'h01;
              4'hc: out_mant = 7'h7a;
              4'hd: out_mant = 7'h72;
              4'he: out_mant = 7'h6b;
              4'hf: out_mant = 7'h64;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h5d;
            case (mant_lo4)
              4'h1: out_mant = 7'h56;
              4'h2: out_mant = 7'h4f;
              4'h3: out_mant = 7'h49;
              4'h4: out_mant = 7'h43;
              4'h5: out_mant = 7'h3d;
              4'h6: out_mant = 7'h37;
              4'h7: out_mant = 7'h31;
              4'h8: out_mant = 7'h2c;
              4'h9: out_mant = 7'h27;
              4'ha: out_mant = 7'h22;
              4'hb: out_mant = 7'h1d;
              4'hc: out_mant = 7'h18;
              4'hd: out_mant = 7'h13;
              4'he: out_mant = 7'h0f;
              4'hf: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h06;
            case (mant_lo4)
              4'h1: out_mant = 7'h02;
              4'h2: out_mant = 7'h7c;
              4'h3: out_mant = 7'h74;
              4'h4: out_mant = 7'h6c;
              4'h5: out_mant = 7'h65;
              4'h6: out_mant = 7'h5e;
              4'h7: out_mant = 7'h57;
              4'h8: out_mant = 7'h51;
              4'h9: out_mant = 7'h4a;
              4'ha: out_mant = 7'h44;
              4'hb: out_mant = 7'h3e;
              4'hc: out_mant = 7'h38;
              4'hd: out_mant = 7'h32;
              4'he: out_mant = 7'h2d;
              4'hf: out_mant = 7'h28;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h22;
            case (mant_lo4)
              4'h1: out_mant = 7'h1d;
              4'h2: out_mant = 7'h19;
              4'h3: out_mant = 7'h14;
              4'h4: out_mant = 7'h0f;
              4'h5: out_mant = 7'h0b;
              4'h6: out_mant = 7'h07;
              4'h7: out_mant = 7'h03;
              4'h8: out_mant = 7'h7d;
              4'h9: out_mant = 7'h75;
              4'ha: out_mant = 7'h6e;
              4'hb: out_mant = 7'h66;
              4'hc: out_mant = 7'h5f;
              4'hd: out_mant = 7'h58;
              4'he: out_mant = 7'h52;
              4'hf: out_mant = 7'h4b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h45;
            case (mant_lo4)
              4'h1: out_mant = 7'h3f;
              4'h2: out_mant = 7'h39;
              4'h3: out_mant = 7'h33;
              4'h4: out_mant = 7'h2e;
              4'h5: out_mant = 7'h29;
              4'h6: out_mant = 7'h23;
              4'h7: out_mant = 7'h1e;
              4'h8: out_mant = 7'h19;
              4'h9: out_mant = 7'h15;
              4'ha: out_mant = 7'h10;
              4'hb: out_mant = 7'h0c;
              4'hc: out_mant = 7'h07;
              4'hd: out_mant = 7'h03;
              4'he: out_mant = 7'h7e;
              4'hf: out_mant = 7'h77;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h6f;
            case (mant_lo4)
              4'h1: out_mant = 7'h68;
              4'h2: out_mant = 7'h61;
              4'h3: out_mant = 7'h5a;
              4'h4: out_mant = 7'h53;
              4'h5: out_mant = 7'h4c;
              4'h6: out_mant = 7'h46;
              4'h7: out_mant = 7'h40;
              4'h8: out_mant = 7'h3a;
              4'h9: out_mant = 7'h34;
              4'ha: out_mant = 7'h2f;
              4'hb: out_mant = 7'h2a;
              4'hc: out_mant = 7'h24;
              4'hd: out_mant = 7'h1f;
              4'he: out_mant = 7'h1a;
              4'hf: out_mant = 7'h16;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h11;
            case (mant_lo4)
              4'h1: out_mant = 7'h0d;
              4'h2: out_mant = 7'h08;
              4'h3: out_mant = 7'h04;
              4'h4: out_mant = 7'h00;
              4'h5: out_mant = 7'h78;
              4'h6: out_mant = 7'h70;
              4'h7: out_mant = 7'h69;
              4'h8: out_mant = 7'h62;
              4'h9: out_mant = 7'h5b;
              4'ha: out_mant = 7'h54;
              4'hb: out_mant = 7'h4e;
              4'hc: out_mant = 7'h47;
              4'hd: out_mant = 7'h41;
              4'he: out_mant = 7'h3b;
              4'hf: out_mant = 7'h35;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h182: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h30;
            case (mant_lo4)
              4'h1: out_mant = 7'h25;
              4'h2: out_mant = 7'h1b;
              4'h3: out_mant = 7'h12;
              4'h4: out_mant = 7'h09;
              4'h5: out_mant = 7'h01;
              4'h6: out_mant = 7'h72;
              4'h7: out_mant = 7'h63;
              4'h8: out_mant = 7'h55;
              4'h9: out_mant = 7'h48;
              4'ha: out_mant = 7'h3c;
              4'hb: out_mant = 7'h31;
              4'hc: out_mant = 7'h26;
              4'hd: out_mant = 7'h1c;
              4'he: out_mant = 7'h13;
              4'hf: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h01;
            case (mant_lo4)
              4'h1: out_mant = 7'h73;
              4'h2: out_mant = 7'h64;
              4'h3: out_mant = 7'h57;
              4'h4: out_mant = 7'h4a;
              4'h5: out_mant = 7'h3d;
              4'h6: out_mant = 7'h32;
              4'h7: out_mant = 7'h27;
              4'h8: out_mant = 7'h1d;
              4'h9: out_mant = 7'h13;
              4'ha: out_mant = 7'h0b;
              4'hb: out_mant = 7'h02;
              4'hc: out_mant = 7'h75;
              4'hd: out_mant = 7'h66;
              4'he: out_mant = 7'h58;
              4'hf: out_mant = 7'h4b;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h3e;
            case (mant_lo4)
              4'h1: out_mant = 7'h33;
              4'h2: out_mant = 7'h28;
              4'h3: out_mant = 7'h1e;
              4'h4: out_mant = 7'h14;
              4'h5: out_mant = 7'h0b;
              4'h6: out_mant = 7'h03;
              4'h7: out_mant = 7'h76;
              4'h8: out_mant = 7'h67;
              4'h9: out_mant = 7'h59;
              4'ha: out_mant = 7'h4c;
              4'hb: out_mant = 7'h3f;
              4'hc: out_mant = 7'h34;
              4'hd: out_mant = 7'h29;
              4'he: out_mant = 7'h1f;
              4'hf: out_mant = 7'h15;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h04;
            case (mant_lo4)
              4'h0: out_mant = 7'h0c;
              4'h2: out_mant = 7'h77;
              4'h3: out_mant = 7'h68;
              4'h4: out_mant = 7'h5a;
              4'h5: out_mant = 7'h4d;
              4'h6: out_mant = 7'h41;
              4'h7: out_mant = 7'h35;
              4'h8: out_mant = 7'h2a;
              4'h9: out_mant = 7'h20;
              4'ha: out_mant = 7'h16;
              4'hb: out_mant = 7'h0d;
              4'hd: out_mant = 7'h79;
              4'he: out_mant = 7'h6a;
              4'hf: out_mant = 7'h5b;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h21;
            case (mant_lo4)
              4'h0: out_mant = 7'h4e;
              4'h1: out_mant = 7'h42;
              4'h2: out_mant = 7'h36;
              4'h3: out_mant = 7'h2b;
              4'h5: out_mant = 7'h17;
              4'h6: out_mant = 7'h0e;
              4'h7: out_mant = 7'h05;
              4'h8: out_mant = 7'h7a;
              4'h9: out_mant = 7'h6b;
              4'ha: out_mant = 7'h5d;
              4'hb: out_mant = 7'h4f;
              4'hc: out_mant = 7'h43;
              4'hd: out_mant = 7'h37;
              4'he: out_mant = 7'h2c;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h18;
            case (mant_lo4)
              4'h1: out_mant = 7'h0e;
              4'h2: out_mant = 7'h06;
              4'h3: out_mant = 7'h7c;
              4'h4: out_mant = 7'h6c;
              4'h5: out_mant = 7'h5e;
              4'h6: out_mant = 7'h51;
              4'h7: out_mant = 7'h44;
              4'h8: out_mant = 7'h38;
              4'h9: out_mant = 7'h2d;
              4'ha: out_mant = 7'h22;
              4'hb: out_mant = 7'h19;
              4'hc: out_mant = 7'h0f;
              4'hd: out_mant = 7'h07;
              4'he: out_mant = 7'h7d;
              4'hf: out_mant = 7'h6e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h5f;
            case (mant_lo4)
              4'h1: out_mant = 7'h52;
              4'h2: out_mant = 7'h45;
              4'h3: out_mant = 7'h39;
              4'h4: out_mant = 7'h2e;
              4'h5: out_mant = 7'h23;
              4'h6: out_mant = 7'h19;
              4'h7: out_mant = 7'h10;
              4'h8: out_mant = 7'h07;
              4'h9: out_mant = 7'h7e;
              4'ha: out_mant = 7'h6f;
              4'hb: out_mant = 7'h60;
              4'hc: out_mant = 7'h53;
              4'hd: out_mant = 7'h46;
              4'he: out_mant = 7'h3a;
              4'hf: out_mant = 7'h2f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h24;
            case (mant_lo4)
              4'h1: out_mant = 7'h1a;
              4'h2: out_mant = 7'h11;
              4'h3: out_mant = 7'h08;
              4'h4: out_mant = 7'h00;
              4'h5: out_mant = 7'h70;
              4'h6: out_mant = 7'h62;
              4'h7: out_mant = 7'h54;
              4'h8: out_mant = 7'h47;
              4'h9: out_mant = 7'h3b;
              4'ha: out_mant = 7'h30;
              4'hb: out_mant = 7'h25;
              4'hc: out_mant = 7'h1b;
              4'hd: out_mant = 7'h12;
              4'he: out_mant = 7'h09;
              4'hf: out_mant = 7'h01;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h183: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h72;
            case (mant_lo4)
              4'h1: out_mant = 7'h55;
              4'h2: out_mant = 7'h3c;
              4'h3: out_mant = 7'h26;
              4'h4: out_mant = 7'h13;
              4'h5: out_mant = 7'h01;
              4'h6: out_mant = 7'h64;
              4'h7: out_mant = 7'h49;
              4'h8: out_mant = 7'h32;
              4'h9: out_mant = 7'h1d;
              4'ha: out_mant = 7'h0a;
              4'hb: out_mant = 7'h74;
              4'hc: out_mant = 7'h58;
              4'hd: out_mant = 7'h3e;
              4'he: out_mant = 7'h28;
              4'hf: out_mant = 7'h14;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h03;
            case (mant_lo4)
              4'h1: out_mant = 7'h67;
              4'h2: out_mant = 7'h4c;
              4'h3: out_mant = 7'h34;
              4'h4: out_mant = 7'h1f;
              4'h5: out_mant = 7'h0c;
              4'h6: out_mant = 7'h77;
              4'h7: out_mant = 7'h5a;
              4'h8: out_mant = 7'h41;
              4'h9: out_mant = 7'h2a;
              4'ha: out_mant = 7'h16;
              4'hb: out_mant = 7'h04;
              4'hc: out_mant = 7'h6a;
              4'hd: out_mant = 7'h4e;
              4'he: out_mant = 7'h36;
              4'hf: out_mant = 7'h21;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h0e;
            case (mant_lo4)
              4'h1: out_mant = 7'h7a;
              4'h2: out_mant = 7'h5d;
              4'h3: out_mant = 7'h43;
              4'h4: out_mant = 7'h2c;
              4'h5: out_mant = 7'h18;
              4'h6: out_mant = 7'h06;
              4'h7: out_mant = 7'h6c;
              4'h8: out_mant = 7'h50;
              4'h9: out_mant = 7'h38;
              4'ha: out_mant = 7'h22;
              4'hb: out_mant = 7'h0f;
              4'hc: out_mant = 7'h7d;
              4'hd: out_mant = 7'h5f;
              4'he: out_mant = 7'h45;
              4'hf: out_mant = 7'h2e;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h19;
            case (mant_lo4)
              4'h1: out_mant = 7'h07;
              4'h2: out_mant = 7'h6f;
              4'h3: out_mant = 7'h53;
              4'h4: out_mant = 7'h3a;
              4'h5: out_mant = 7'h24;
              4'h6: out_mant = 7'h11;
              4'h7: out_mant = 7'h00;
              4'h8: out_mant = 7'h62;
              4'h9: out_mant = 7'h47;
              4'ha: out_mant = 7'h30;
              4'hb: out_mant = 7'h1b;
              4'hc: out_mant = 7'h09;
              4'hd: out_mant = 7'h72;
              4'he: out_mant = 7'h55;
              4'hf: out_mant = 7'h3c;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h26;
            case (mant_lo4)
              4'h1: out_mant = 7'h13;
              4'h2: out_mant = 7'h01;
              4'h3: out_mant = 7'h64;
              4'h4: out_mant = 7'h49;
              4'h5: out_mant = 7'h32;
              4'h6: out_mant = 7'h1d;
              4'h7: out_mant = 7'h0a;
              4'h8: out_mant = 7'h74;
              4'h9: out_mant = 7'h58;
              4'ha: out_mant = 7'h3e;
              4'hb: out_mant = 7'h28;
              4'hc: out_mant = 7'h14;
              4'hd: out_mant = 7'h03;
              4'he: out_mant = 7'h67;
              4'hf: out_mant = 7'h4c;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h34;
            case (mant_lo4)
              4'h1: out_mant = 7'h1f;
              4'h2: out_mant = 7'h0c;
              4'h3: out_mant = 7'h77;
              4'h4: out_mant = 7'h5a;
              4'h5: out_mant = 7'h40;
              4'h6: out_mant = 7'h2a;
              4'h7: out_mant = 7'h16;
              4'h8: out_mant = 7'h04;
              4'h9: out_mant = 7'h69;
              4'ha: out_mant = 7'h4e;
              4'hb: out_mant = 7'h36;
              4'hc: out_mant = 7'h20;
              4'hd: out_mant = 7'h0e;
              4'he: out_mant = 7'h7a;
              4'hf: out_mant = 7'h5d;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h43;
            case (mant_lo4)
              4'h1: out_mant = 7'h2c;
              4'h2: out_mant = 7'h18;
              4'h3: out_mant = 7'h06;
              4'h4: out_mant = 7'h6c;
              4'h5: out_mant = 7'h50;
              4'h6: out_mant = 7'h38;
              4'h7: out_mant = 7'h22;
              4'h8: out_mant = 7'h0f;
              4'h9: out_mant = 7'h7d;
              4'ha: out_mant = 7'h5f;
              4'hb: out_mant = 7'h45;
              4'hc: out_mant = 7'h2e;
              4'hd: out_mant = 7'h19;
              4'he: out_mant = 7'h07;
              4'hf: out_mant = 7'h6f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h53;
            case (mant_lo4)
              4'h1: out_mant = 7'h3a;
              4'h2: out_mant = 7'h24;
              4'h3: out_mant = 7'h11;
              4'h4: out_mant = 7'h00;
              4'h5: out_mant = 7'h62;
              4'h6: out_mant = 7'h47;
              4'h7: out_mant = 7'h30;
              4'h8: out_mant = 7'h1b;
              4'h9: out_mant = 7'h09;
              4'ha: out_mant = 7'h71;
              4'hb: out_mant = 7'h55;
              4'hc: out_mant = 7'h3c;
              4'hd: out_mant = 7'h26;
              4'he: out_mant = 7'h12;
              4'hf: out_mant = 7'h01;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h184: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h64;
            case (mant_lo4)
              4'h1: out_mant = 7'h32;
              4'h2: out_mant = 7'h0a;
              4'h3: out_mant = 7'h58;
              4'h4: out_mant = 7'h28;
              4'h5: out_mant = 7'h03;
              4'h6: out_mant = 7'h4c;
              4'h7: out_mant = 7'h1f;
              4'h8: out_mant = 7'h77;
              4'h9: out_mant = 7'h40;
              4'ha: out_mant = 7'h16;
              4'hb: out_mant = 7'h69;
              4'hc: out_mant = 7'h36;
              4'hd: out_mant = 7'h0e;
              4'he: out_mant = 7'h5c;
              4'hf: out_mant = 7'h2c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h06;
            case (mant_lo4)
              4'h1: out_mant = 7'h50;
              4'h2: out_mant = 7'h22;
              4'h3: out_mant = 7'h7d;
              4'h4: out_mant = 7'h45;
              4'h5: out_mant = 7'h19;
              4'h6: out_mant = 7'h6f;
              4'h7: out_mant = 7'h3a;
              4'h8: out_mant = 7'h11;
              4'h9: out_mant = 7'h61;
              4'ha: out_mant = 7'h30;
              4'hb: out_mant = 7'h09;
              4'hc: out_mant = 7'h55;
              4'hd: out_mant = 7'h26;
              4'he: out_mant = 7'h01;
              4'hf: out_mant = 7'h49;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h1d;
            case (mant_lo4)
              4'h1: out_mant = 7'h74;
              4'h2: out_mant = 7'h3e;
              4'h3: out_mant = 7'h14;
              4'h4: out_mant = 7'h67;
              4'h5: out_mant = 7'h34;
              4'h6: out_mant = 7'h0c;
              4'h7: out_mant = 7'h5a;
              4'h8: out_mant = 7'h2a;
              4'h9: out_mant = 7'h04;
              4'ha: out_mant = 7'h4e;
              4'hb: out_mant = 7'h20;
              4'hc: out_mant = 7'h7a;
              4'hd: out_mant = 7'h42;
              4'he: out_mant = 7'h17;
              4'hf: out_mant = 7'h6c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h38;
            case (mant_lo4)
              4'h1: out_mant = 7'h0f;
              4'h2: out_mant = 7'h5f;
              4'h3: out_mant = 7'h2e;
              4'h4: out_mant = 7'h07;
              4'h5: out_mant = 7'h53;
              4'h6: out_mant = 7'h24;
              4'h7: out_mant = 7'h7f;
              4'h8: out_mant = 7'h47;
              4'h9: out_mant = 7'h1b;
              4'ha: out_mant = 7'h71;
              4'hb: out_mant = 7'h3c;
              4'hc: out_mant = 7'h12;
              4'hd: out_mant = 7'h64;
              4'he: out_mant = 7'h32;
              4'hf: out_mant = 7'h0a;
              default: begin end
            endcase
          end
          3'h4: begin
            out_mant = 7'h57;
            case (mant_lo4)
              4'h1: out_mant = 7'h28;
              4'h2: out_mant = 7'h03;
              4'h3: out_mant = 7'h4b;
              4'h4: out_mant = 7'h1e;
              4'h5: out_mant = 7'h77;
              4'h6: out_mant = 7'h40;
              4'h7: out_mant = 7'h16;
              4'h8: out_mant = 7'h69;
              4'h9: out_mant = 7'h36;
              4'ha: out_mant = 7'h0d;
              4'hb: out_mant = 7'h5c;
              4'hc: out_mant = 7'h2c;
              4'hd: out_mant = 7'h06;
              4'he: out_mant = 7'h50;
              4'hf: out_mant = 7'h22;
              default: begin end
            endcase
          end
          3'h5: begin
            out_mant = 7'h7c;
            case (mant_lo4)
              4'h1: out_mant = 7'h45;
              4'h2: out_mant = 7'h19;
              4'h3: out_mant = 7'h6e;
              4'h4: out_mant = 7'h3a;
              4'h5: out_mant = 7'h11;
              4'h6: out_mant = 7'h61;
              4'h7: out_mant = 7'h2f;
              4'h8: out_mant = 7'h09;
              4'h9: out_mant = 7'h55;
              4'ha: out_mant = 7'h26;
              4'hb: out_mant = 7'h01;
              4'hc: out_mant = 7'h49;
              4'hd: out_mant = 7'h1d;
              4'he: out_mant = 7'h74;
              4'hf: out_mant = 7'h3e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_mant = 7'h14;
            case (mant_lo4)
              4'h1: out_mant = 7'h66;
              4'h2: out_mant = 7'h33;
              4'h3: out_mant = 7'h0c;
              4'h4: out_mant = 7'h5a;
              4'h5: out_mant = 7'h2a;
              4'h6: out_mant = 7'h04;
              4'h7: out_mant = 7'h4e;
              4'h8: out_mant = 7'h20;
              4'h9: out_mant = 7'h7a;
              4'ha: out_mant = 7'h42;
              4'hb: out_mant = 7'h17;
              4'hc: out_mant = 7'h6c;
              4'hd: out_mant = 7'h38;
              4'he: out_mant = 7'h0f;
              4'hf: out_mant = 7'h5f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_mant = 7'h2d;
            case (mant_lo4)
              4'h1: out_mant = 7'h07;
              4'h2: out_mant = 7'h52;
              4'h3: out_mant = 7'h24;
              4'h4: out_mant = 7'h7f;
              4'h5: out_mant = 7'h47;
              4'h6: out_mant = 7'h1b;
              4'h7: out_mant = 7'h71;
              4'h8: out_mant = 7'h3c;
              4'h9: out_mant = 7'h12;
              4'ha: out_mant = 7'h64;
              4'hb: out_mant = 7'h31;
              4'hc: out_mant = 7'h0a;
              4'hd: out_mant = 7'h57;
              4'he: out_mant = 7'h28;
              4'hf: out_mant = 7'h03;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h185: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h4b;
            case (mant_lo4)
              4'h1: out_mant = 7'h77;
              4'h2: out_mant = 7'h16;
              4'h3: out_mant = 7'h35;
              4'h4: out_mant = 7'h5c;
              4'h5: out_mant = 7'h06;
              4'h6: out_mant = 7'h22;
              4'h7: out_mant = 7'h44;
              4'h8: out_mant = 7'h6e;
              4'h9: out_mant = 7'h11;
              4'ha: out_mant = 7'h2f;
              4'hb: out_mant = 7'h55;
              4'hc: out_mant = 7'h01;
              4'hd: out_mant = 7'h1c;
              4'he: out_mant = 7'h3e;
              4'hf: out_mant = 7'h66;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h0c;
            case (mant_lo4)
              4'h1: out_mant = 7'h29;
              4'h2: out_mant = 7'h4e;
              4'h3: out_mant = 7'h79;
              4'h4: out_mant = 7'h17;
              4'h5: out_mant = 7'h37;
              4'h6: out_mant = 7'h5f;
              4'h7: out_mant = 7'h07;
              4'h8: out_mant = 7'h24;
              4'h9: out_mant = 7'h47;
              4'ha: out_mant = 7'h71;
              4'hb: out_mant = 7'h12;
              4'hc: out_mant = 7'h31;
              4'hd: out_mant = 7'h57;
              4'he: out_mant = 7'h02;
              4'hf: out_mant = 7'h1e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_mant = 7'h40;
            case (mant_lo4)
              4'h1: out_mant = 7'h69;
              4'h2: out_mant = 7'h0d;
              4'h3: out_mant = 7'h2b;
              4'h4: out_mant = 7'h50;
              4'h5: out_mant = 7'h7c;
              4'h6: out_mant = 7'h19;
              4'h7: out_mant = 7'h39;
              4'h8: out_mant = 7'h61;
              4'h9: out_mant = 7'h08;
              4'ha: out_mant = 7'h26;
              4'hb: out_mant = 7'h49;
              4'hc: out_mant = 7'h74;
              4'hd: out_mant = 7'h14;
              4'he: out_mant = 7'h33;
              4'hf: out_mant = 7'h00;
              default: begin end
            endcase
          end
          3'h3: begin
            out_mant = 7'h00;
          end
          3'h4: begin
            out_mant = 7'h00;
          end
          3'h5: begin
            out_mant = 7'h00;
          end
          3'h6: begin
            out_mant = 7'h00;
          end
          3'h7: begin
            out_mant = 7'h00;
          end
          default: begin end
        endcase
      end
      9'h1ff: begin
        case (mant_hi3)
          3'h0: begin
            out_mant = 7'h40;
            case (mant_lo4)
              4'h0: out_mant = 7'h00;
              default: begin end
            endcase
          end
          3'h1: begin
            out_mant = 7'h40;
          end
          3'h2: begin
            out_mant = 7'h40;
          end
          3'h3: begin
            out_mant = 7'h40;
          end
          3'h4: begin
            out_mant = 7'h40;
          end
          3'h5: begin
            out_mant = 7'h40;
          end
          3'h6: begin
            out_mant = 7'h40;
          end
          3'h7: begin
            out_mant = 7'h40;
          end
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  reg bit_14;
  always @* begin
    bit_14 = 1'b0;
    casez (sign_exp)
      9'b001111111: bit_14 = 1'b1;
      9'b01???????: bit_14 = 1'b1;
        9'h07e: begin
          case (mant_hi2)
            2'h0: begin
              bit_14 = 1'b0;
            end
            2'h1: begin
              bit_14 = 1'b0;
              case (mant_lo5)
                5'h11: bit_14 = 1'b1;
                5'h12: bit_14 = 1'b1;
                5'h13: bit_14 = 1'b1;
                5'h14: bit_14 = 1'b1;
                5'h15: bit_14 = 1'b1;
                5'h16: bit_14 = 1'b1;
                5'h17: bit_14 = 1'b1;
                5'h18: bit_14 = 1'b1;
                5'h19: bit_14 = 1'b1;
                5'h1a: bit_14 = 1'b1;
                5'h1b: bit_14 = 1'b1;
                5'h1c: bit_14 = 1'b1;
                5'h1d: bit_14 = 1'b1;
                5'h1e: bit_14 = 1'b1;
                5'h1f: bit_14 = 1'b1;
                default: begin end
              endcase
            end
            2'h2: begin
              bit_14 = 1'b1;
            end
            2'h3: begin
              bit_14 = 1'b1;
            end
            default: begin end
          endcase
        end
        9'h1ff: begin
          case (mant_hi2)
            2'h0: begin
              bit_14 = 1'b1;
              case (mant_lo5)
                5'h00: bit_14 = 1'b0;
                default: begin end
              endcase
            end
            2'h1: begin
              bit_14 = 1'b1;
            end
            2'h2: begin
              bit_14 = 1'b1;
            end
            2'h3: begin
              bit_14 = 1'b1;
            end
            default: begin end
          endcase
        end
      default: begin end
    endcase
  end
  assign out = {out_sign, bit_14, out_exp[6], out_exp[5], out_exp[4], out_exp[3], out_exp[2], out_exp[1], out_exp[0], out_mant[6], out_mant[5], out_mant[4], out_mant[3], out_mant[2], out_mant[1], out_mant[0]};
endmodule
