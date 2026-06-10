module ex218_bf16_reciprocal_cube_delta_pair_first_hilo4(in, out);
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
  wire sign = in[15];
  wire [7:0] exp = in[14:7];
  reg [31:0] base_pair;
  reg [31:0] delta_pair;
  always @* begin
    case (exp)
      8'h00: base_pair = 32'hff807f80;
      8'h01: base_pair = 32'hff807f80;
      8'h02: base_pair = 32'hff807f80;
      8'h03: base_pair = 32'hff807f80;
      8'h04: base_pair = 32'hff807f80;
      8'h05: base_pair = 32'hff807f80;
      8'h06: base_pair = 32'hff807f80;
      8'h07: base_pair = 32'hff807f80;
      8'h08: base_pair = 32'hff807f80;
      8'h09: base_pair = 32'hff807f80;
      8'h0a: base_pair = 32'hff807f80;
      8'h0b: base_pair = 32'hff807f80;
      8'h0c: base_pair = 32'hff807f80;
      8'h0d: base_pair = 32'hff807f80;
      8'h0e: base_pair = 32'hff807f80;
      8'h0f: base_pair = 32'hff807f80;
      8'h10: base_pair = 32'hff807f80;
      8'h11: base_pair = 32'hff807f80;
      8'h12: base_pair = 32'hff807f80;
      8'h13: base_pair = 32'hff807f80;
      8'h14: base_pair = 32'hff807f80;
      8'h15: base_pair = 32'hff807f80;
      8'h16: base_pair = 32'hff807f80;
      8'h17: base_pair = 32'hff807f80;
      8'h18: base_pair = 32'hff807f80;
      8'h19: base_pair = 32'hff807f80;
      8'h1a: base_pair = 32'hff807f80;
      8'h1b: base_pair = 32'hff807f80;
      8'h1c: base_pair = 32'hff807f80;
      8'h1d: base_pair = 32'hff807f80;
      8'h1e: base_pair = 32'hff807f80;
      8'h1f: base_pair = 32'hff807f80;
      8'h20: base_pair = 32'hff807f80;
      8'h21: base_pair = 32'hff807f80;
      8'h22: base_pair = 32'hff807f80;
      8'h23: base_pair = 32'hff807f80;
      8'h24: base_pair = 32'hff807f80;
      8'h25: base_pair = 32'hff807f80;
      8'h26: base_pair = 32'hff807f80;
      8'h27: base_pair = 32'hff807f80;
      8'h28: base_pair = 32'hff807f80;
      8'h29: base_pair = 32'hff807f80;
      8'h2a: base_pair = 32'hff807f80;
      8'h2b: base_pair = 32'hff807f80;
      8'h2c: base_pair = 32'hff807f80;
      8'h2d: base_pair = 32'hff807f80;
      8'h2e: base_pair = 32'hff807f80;
      8'h2f: base_pair = 32'hff807f80;
      8'h30: base_pair = 32'hff807f80;
      8'h31: base_pair = 32'hff807f80;
      8'h32: base_pair = 32'hff807f80;
      8'h33: base_pair = 32'hff807f80;
      8'h34: base_pair = 32'hff807f80;
      8'h35: base_pair = 32'hff807f80;
      8'h36: base_pair = 32'hff807f80;
      8'h37: base_pair = 32'hff807f80;
      8'h38: base_pair = 32'hff807f80;
      8'h39: base_pair = 32'hff807f80;
      8'h3a: base_pair = 32'hff807f80;
      8'h3b: base_pair = 32'hff807f80;
      8'h3c: base_pair = 32'hff807f80;
      8'h3d: base_pair = 32'hff807f80;
      8'h3e: base_pair = 32'hff807f80;
      8'h3f: base_pair = 32'hff807f80;
      8'h40: base_pair = 32'hff807f80;
      8'h41: base_pair = 32'hff807f80;
      8'h42: base_pair = 32'hff807f80;
      8'h43: base_pair = 32'hff807f80;
      8'h44: base_pair = 32'hff807f80;
      8'h45: base_pair = 32'hff807f80;
      8'h46: base_pair = 32'hff807f80;
      8'h47: base_pair = 32'hff807f80;
      8'h48: base_pair = 32'hff807f80;
      8'h49: base_pair = 32'hff807f80;
      8'h4a: base_pair = 32'hff807f80;
      8'h4b: base_pair = 32'hff807f80;
      8'h4c: base_pair = 32'hff807f80;
      8'h4d: base_pair = 32'hff807f80;
      8'h4e: base_pair = 32'hff807f80;
      8'h4f: base_pair = 32'hff807f80;
      8'h50: base_pair = 32'hff807f80;
      8'h51: base_pair = 32'hff807f80;
      8'h52: base_pair = 32'hff807f80;
      8'h53: base_pair = 32'hff807f80;
      8'h54: base_pair = 32'hff807f80;
      8'h55: base_pair = 32'hfe807e80;
      8'h56: base_pair = 32'hfd007d00;
      8'h57: base_pair = 32'hfb807b80;
      8'h58: base_pair = 32'hfa007a00;
      8'h59: base_pair = 32'hf8807880;
      8'h5a: base_pair = 32'hf7007700;
      8'h5b: base_pair = 32'hf5807580;
      8'h5c: base_pair = 32'hf4007400;
      8'h5d: base_pair = 32'hf2807280;
      8'h5e: base_pair = 32'hf1007100;
      8'h5f: base_pair = 32'hef806f80;
      8'h60: base_pair = 32'hee006e00;
      8'h61: base_pair = 32'hec806c80;
      8'h62: base_pair = 32'heb006b00;
      8'h63: base_pair = 32'he9806980;
      8'h64: base_pair = 32'he8006800;
      8'h65: base_pair = 32'he6806680;
      8'h66: base_pair = 32'he5006500;
      8'h67: base_pair = 32'he3806380;
      8'h68: base_pair = 32'he2006200;
      8'h69: base_pair = 32'he0806080;
      8'h6a: base_pair = 32'hdf005f00;
      8'h6b: base_pair = 32'hdd805d80;
      8'h6c: base_pair = 32'hdc005c00;
      8'h6d: base_pair = 32'hda805a80;
      8'h6e: base_pair = 32'hd9005900;
      8'h6f: base_pair = 32'hd7805780;
      8'h70: base_pair = 32'hd6005600;
      8'h71: base_pair = 32'hd4805480;
      8'h72: base_pair = 32'hd3005300;
      8'h73: base_pair = 32'hd1805180;
      8'h74: base_pair = 32'hd0005000;
      8'h75: base_pair = 32'hce804e80;
      8'h76: base_pair = 32'hcd004d00;
      8'h77: base_pair = 32'hcb804b80;
      8'h78: base_pair = 32'hca004a00;
      8'h79: base_pair = 32'hc8804880;
      8'h7a: base_pair = 32'hc7004700;
      8'h7b: base_pair = 32'hc5804580;
      8'h7c: base_pair = 32'hc4004400;
      8'h7d: base_pair = 32'hc2804280;
      8'h7e: base_pair = 32'hc1004100;
      8'h7f: base_pair = 32'hbf803f80;
      8'h80: base_pair = 32'hbe003e00;
      8'h81: base_pair = 32'hbc803c80;
      8'h82: base_pair = 32'hbb003b00;
      8'h83: base_pair = 32'hb9803980;
      8'h84: base_pair = 32'hb8003800;
      8'h85: base_pair = 32'hb6803680;
      8'h86: base_pair = 32'hb5003500;
      8'h87: base_pair = 32'hb3803380;
      8'h88: base_pair = 32'hb2003200;
      8'h89: base_pair = 32'hb0803080;
      8'h8a: base_pair = 32'haf002f00;
      8'h8b: base_pair = 32'had802d80;
      8'h8c: base_pair = 32'hac002c00;
      8'h8d: base_pair = 32'haa802a80;
      8'h8e: base_pair = 32'ha9002900;
      8'h8f: base_pair = 32'ha7802780;
      8'h90: base_pair = 32'ha6002600;
      8'h91: base_pair = 32'ha4802480;
      8'h92: base_pair = 32'ha3002300;
      8'h93: base_pair = 32'ha1802180;
      8'h94: base_pair = 32'ha0002000;
      8'h95: base_pair = 32'h9e801e80;
      8'h96: base_pair = 32'h9d001d00;
      8'h97: base_pair = 32'h9b801b80;
      8'h98: base_pair = 32'h9a001a00;
      8'h99: base_pair = 32'h98801880;
      8'h9a: base_pair = 32'h97001700;
      8'h9b: base_pair = 32'h95801580;
      8'h9c: base_pair = 32'h94001400;
      8'h9d: base_pair = 32'h92801280;
      8'h9e: base_pair = 32'h91001100;
      8'h9f: base_pair = 32'h8f800f80;
      8'ha0: base_pair = 32'h8e000e00;
      8'ha1: base_pair = 32'h8c800c80;
      8'ha2: base_pair = 32'h8b000b00;
      8'ha3: base_pair = 32'h89800980;
      8'ha4: base_pair = 32'h88000800;
      8'ha5: base_pair = 32'h86800680;
      8'ha6: base_pair = 32'h85000500;
      8'ha7: base_pair = 32'h83800380;
      8'ha8: base_pair = 32'h82000200;
      8'ha9: base_pair = 32'h80800080;
      8'haa: base_pair = 32'h80000000;
      8'hab: base_pair = 32'h80000000;
      8'hac: base_pair = 32'h80000000;
      8'had: base_pair = 32'h80000000;
      8'hae: base_pair = 32'h80000000;
      8'haf: base_pair = 32'h80000000;
      8'hb0: base_pair = 32'h80000000;
      8'hb1: base_pair = 32'h80000000;
      8'hb2: base_pair = 32'h80000000;
      8'hb3: base_pair = 32'h80000000;
      8'hb4: base_pair = 32'h80000000;
      8'hb5: base_pair = 32'h80000000;
      8'hb6: base_pair = 32'h80000000;
      8'hb7: base_pair = 32'h80000000;
      8'hb8: base_pair = 32'h80000000;
      8'hb9: base_pair = 32'h80000000;
      8'hba: base_pair = 32'h80000000;
      8'hbb: base_pair = 32'h80000000;
      8'hbc: base_pair = 32'h80000000;
      8'hbd: base_pair = 32'h80000000;
      8'hbe: base_pair = 32'h80000000;
      8'hbf: base_pair = 32'h80000000;
      8'hc0: base_pair = 32'h80000000;
      8'hc1: base_pair = 32'h80000000;
      8'hc2: base_pair = 32'h80000000;
      8'hc3: base_pair = 32'h80000000;
      8'hc4: base_pair = 32'h80000000;
      8'hc5: base_pair = 32'h80000000;
      8'hc6: base_pair = 32'h80000000;
      8'hc7: base_pair = 32'h80000000;
      8'hc8: base_pair = 32'h80000000;
      8'hc9: base_pair = 32'h80000000;
      8'hca: base_pair = 32'h80000000;
      8'hcb: base_pair = 32'h80000000;
      8'hcc: base_pair = 32'h80000000;
      8'hcd: base_pair = 32'h80000000;
      8'hce: base_pair = 32'h80000000;
      8'hcf: base_pair = 32'h80000000;
      8'hd0: base_pair = 32'h80000000;
      8'hd1: base_pair = 32'h80000000;
      8'hd2: base_pair = 32'h80000000;
      8'hd3: base_pair = 32'h80000000;
      8'hd4: base_pair = 32'h80000000;
      8'hd5: base_pair = 32'h80000000;
      8'hd6: base_pair = 32'h80000000;
      8'hd7: base_pair = 32'h80000000;
      8'hd8: base_pair = 32'h80000000;
      8'hd9: base_pair = 32'h80000000;
      8'hda: base_pair = 32'h80000000;
      8'hdb: base_pair = 32'h80000000;
      8'hdc: base_pair = 32'h80000000;
      8'hdd: base_pair = 32'h80000000;
      8'hde: base_pair = 32'h80000000;
      8'hdf: base_pair = 32'h80000000;
      8'he0: base_pair = 32'h80000000;
      8'he1: base_pair = 32'h80000000;
      8'he2: base_pair = 32'h80000000;
      8'he3: base_pair = 32'h80000000;
      8'he4: base_pair = 32'h80000000;
      8'he5: base_pair = 32'h80000000;
      8'he6: base_pair = 32'h80000000;
      8'he7: base_pair = 32'h80000000;
      8'he8: base_pair = 32'h80000000;
      8'he9: base_pair = 32'h80000000;
      8'hea: base_pair = 32'h80000000;
      8'heb: base_pair = 32'h80000000;
      8'hec: base_pair = 32'h80000000;
      8'hed: base_pair = 32'h80000000;
      8'hee: base_pair = 32'h80000000;
      8'hef: base_pair = 32'h80000000;
      8'hf0: base_pair = 32'h80000000;
      8'hf1: base_pair = 32'h80000000;
      8'hf2: base_pair = 32'h80000000;
      8'hf3: base_pair = 32'h80000000;
      8'hf4: base_pair = 32'h80000000;
      8'hf5: base_pair = 32'h80000000;
      8'hf6: base_pair = 32'h80000000;
      8'hf7: base_pair = 32'h80000000;
      8'hf8: base_pair = 32'h80000000;
      8'hf9: base_pair = 32'h80000000;
      8'hfa: base_pair = 32'h80000000;
      8'hfb: base_pair = 32'h80000000;
      8'hfc: base_pair = 32'h80000000;
      8'hfd: base_pair = 32'h80000000;
      8'hfe: base_pair = 32'h80000000;
      8'hff: base_pair = 32'h80000000;
      default: base_pair = 32'h00000000;
    endcase
  end
  always @* begin
    delta_pair = 32'h00000000;
    case (exp)
      8'h54: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
          end
          4'h1: begin
            delta_pair = 32'h00000000;
          end
          4'h2: begin
            delta_pair = 32'h00000000;
          end
          4'h3: begin
            delta_pair = 32'h00000000;
          end
          4'h4: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h2: delta_pair = 32'h00fd00fd;
              3'h3: delta_pair = 32'h00f800f8;
              3'h4: delta_pair = 32'h00f300f3;
              3'h5: delta_pair = 32'h00ef00ef;
              3'h6: delta_pair = 32'h00eb00eb;
              3'h7: delta_pair = 32'h00e700e7;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00e200e2;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00de00de;
              3'h2: delta_pair = 32'h00db00db;
              3'h3: delta_pair = 32'h00d700d7;
              3'h4: delta_pair = 32'h00d300d3;
              3'h5: delta_pair = 32'h00cf00cf;
              3'h6: delta_pair = 32'h00cc00cc;
              3'h7: delta_pair = 32'h00c800c8;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00c500c5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c200c2;
              3'h2: delta_pair = 32'h00be00be;
              3'h3: delta_pair = 32'h00bb00bb;
              3'h4: delta_pair = 32'h00b800b8;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b200b2;
              3'h7: delta_pair = 32'h00af00af;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00ac00ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00aa00aa;
              3'h2: delta_pair = 32'h00a700a7;
              3'h3: delta_pair = 32'h00a400a4;
              3'h4: delta_pair = 32'h00a200a2;
              3'h5: delta_pair = 32'h009f009f;
              3'h6: delta_pair = 32'h009d009d;
              3'h7: delta_pair = 32'h009a009a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00980098;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00950095;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00910091;
              3'h4: delta_pair = 32'h008f008f;
              3'h5: delta_pair = 32'h008c008c;
              3'h6: delta_pair = 32'h008a008a;
              3'h7: delta_pair = 32'h00880088;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00860086;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00840084;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00800080;
              3'h4: delta_pair = 32'h017d017d;
              3'h5: delta_pair = 32'h01790179;
              3'h6: delta_pair = 32'h01760176;
              3'h7: delta_pair = 32'h01720172;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h016f016f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016b016b;
              3'h2: delta_pair = 32'h01680168;
              3'h3: delta_pair = 32'h01650165;
              3'h4: delta_pair = 32'h01610161;
              3'h5: delta_pair = 32'h015e015e;
              3'h6: delta_pair = 32'h015b015b;
              3'h7: delta_pair = 32'h01580158;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01550155;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01520152;
              3'h2: delta_pair = 32'h014f014f;
              3'h3: delta_pair = 32'h014c014c;
              3'h4: delta_pair = 32'h014a014a;
              3'h5: delta_pair = 32'h01470147;
              3'h6: delta_pair = 32'h01440144;
              3'h7: delta_pair = 32'h01420142;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h013d013d;
              3'h2: delta_pair = 32'h013a013a;
              3'h3: delta_pair = 32'h01380138;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01330133;
              3'h6: delta_pair = 32'h01310131;
              3'h7: delta_pair = 32'h012e012e;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01280128;
              3'h3: delta_pair = 32'h01250125;
              3'h4: delta_pair = 32'h01230123;
              3'h5: delta_pair = 32'h01210121;
              3'h6: delta_pair = 32'h011f011f;
              3'h7: delta_pair = 32'h011d011d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h011b011b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01190119;
              3'h2: delta_pair = 32'h01180118;
              3'h3: delta_pair = 32'h01160116;
              3'h4: delta_pair = 32'h01140114;
              3'h5: delta_pair = 32'h01120112;
              3'h6: delta_pair = 32'h01100110;
              3'h7: delta_pair = 32'h010f010f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h010d010d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h01090109;
              3'h3: delta_pair = 32'h01080108;
              3'h4: delta_pair = 32'h01060106;
              3'h5: delta_pair = 32'h01050105;
              3'h6: delta_pair = 32'h01030103;
              3'h7: delta_pair = 32'h01020102;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h55: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h03fd03fd;
              3'h5: delta_pair = 32'h03f903f9;
              3'h6: delta_pair = 32'h03f603f6;
              3'h7: delta_pair = 32'h03f203f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03ef03ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03eb03eb;
              3'h2: delta_pair = 32'h03e803e8;
              3'h3: delta_pair = 32'h03e503e5;
              3'h4: delta_pair = 32'h03e103e1;
              3'h5: delta_pair = 32'h03de03de;
              3'h6: delta_pair = 32'h03db03db;
              3'h7: delta_pair = 32'h03d803d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d203d2;
              3'h2: delta_pair = 32'h03cf03cf;
              3'h3: delta_pair = 32'h03cc03cc;
              3'h4: delta_pair = 32'h03ca03ca;
              3'h5: delta_pair = 32'h03c703c7;
              3'h6: delta_pair = 32'h03c403c4;
              3'h7: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h03bf03bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03bd03bd;
              3'h2: delta_pair = 32'h03ba03ba;
              3'h3: delta_pair = 32'h03b803b8;
              3'h4: delta_pair = 32'h03b503b5;
              3'h5: delta_pair = 32'h03b303b3;
              3'h6: delta_pair = 32'h03b103b1;
              3'h7: delta_pair = 32'h03ae03ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h03ac03ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03aa03aa;
              3'h2: delta_pair = 32'h03a803a8;
              3'h3: delta_pair = 32'h03a503a5;
              3'h4: delta_pair = 32'h03a303a3;
              3'h5: delta_pair = 32'h03a103a1;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039d039d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h039b039b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03990399;
              3'h2: delta_pair = 32'h03980398;
              3'h3: delta_pair = 32'h03960396;
              3'h4: delta_pair = 32'h03940394;
              3'h5: delta_pair = 32'h03920392;
              3'h6: delta_pair = 32'h03900390;
              3'h7: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h038d038d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h038b038b;
              3'h2: delta_pair = 32'h03890389;
              3'h3: delta_pair = 32'h03880388;
              3'h4: delta_pair = 32'h03860386;
              3'h5: delta_pair = 32'h03850385;
              3'h6: delta_pair = 32'h03830383;
              3'h7: delta_pair = 32'h03820382;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h56: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h06fd06fd;
              3'h5: delta_pair = 32'h06f906f9;
              3'h6: delta_pair = 32'h06f606f6;
              3'h7: delta_pair = 32'h06f206f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h06ef06ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06eb06eb;
              3'h2: delta_pair = 32'h06e806e8;
              3'h3: delta_pair = 32'h06e506e5;
              3'h4: delta_pair = 32'h06e106e1;
              3'h5: delta_pair = 32'h06de06de;
              3'h6: delta_pair = 32'h06db06db;
              3'h7: delta_pair = 32'h06d806d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h06d506d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06d206d2;
              3'h2: delta_pair = 32'h06cf06cf;
              3'h3: delta_pair = 32'h06cc06cc;
              3'h4: delta_pair = 32'h06ca06ca;
              3'h5: delta_pair = 32'h06c706c7;
              3'h6: delta_pair = 32'h06c406c4;
              3'h7: delta_pair = 32'h06c206c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h06bf06bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06bd06bd;
              3'h2: delta_pair = 32'h06ba06ba;
              3'h3: delta_pair = 32'h06b806b8;
              3'h4: delta_pair = 32'h06b506b5;
              3'h5: delta_pair = 32'h06b306b3;
              3'h6: delta_pair = 32'h06b106b1;
              3'h7: delta_pair = 32'h06ae06ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h06ac06ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06aa06aa;
              3'h2: delta_pair = 32'h06a806a8;
              3'h3: delta_pair = 32'h06a506a5;
              3'h4: delta_pair = 32'h06a306a3;
              3'h5: delta_pair = 32'h06a106a1;
              3'h6: delta_pair = 32'h069f069f;
              3'h7: delta_pair = 32'h069d069d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h069b069b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06990699;
              3'h2: delta_pair = 32'h06980698;
              3'h3: delta_pair = 32'h06960696;
              3'h4: delta_pair = 32'h06940694;
              3'h5: delta_pair = 32'h06920692;
              3'h6: delta_pair = 32'h06900690;
              3'h7: delta_pair = 32'h068f068f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h068d068d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h068b068b;
              3'h2: delta_pair = 32'h06890689;
              3'h3: delta_pair = 32'h06880688;
              3'h4: delta_pair = 32'h06860686;
              3'h5: delta_pair = 32'h06850685;
              3'h6: delta_pair = 32'h06830683;
              3'h7: delta_pair = 32'h06820682;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h57: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h58: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03fa03fa;
              3'h2: delta_pair = 32'h03f403f4;
              3'h3: delta_pair = 32'h03ef03ef;
              3'h4: delta_pair = 32'h03e903e9;
              3'h5: delta_pair = 32'h03e403e4;
              3'h6: delta_pair = 32'h03df03df;
              3'h7: delta_pair = 32'h03da03da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d103d1;
              3'h2: delta_pair = 32'h03cc03cc;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03c403c4;
              3'h5: delta_pair = 32'h03c003c0;
              3'h6: delta_pair = 32'h03bc03bc;
              3'h7: delta_pair = 32'h03b803b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h03b403b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03b003b0;
              3'h2: delta_pair = 32'h03ad03ad;
              3'h3: delta_pair = 32'h03a903a9;
              3'h4: delta_pair = 32'h03a603a6;
              3'h5: delta_pair = 32'h03a203a2;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039c039c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h03990399;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03960396;
              3'h2: delta_pair = 32'h03930393;
              3'h3: delta_pair = 32'h03900390;
              3'h4: delta_pair = 32'h038d038d;
              3'h5: delta_pair = 32'h038b038b;
              3'h6: delta_pair = 32'h03880388;
              3'h7: delta_pair = 32'h03860386;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h03830383;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03810381;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h59: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h0f7d0f7d;
              3'h3: delta_pair = 32'h0f780f78;
              3'h4: delta_pair = 32'h0f730f73;
              3'h5: delta_pair = 32'h0f6f0f6f;
              3'h6: delta_pair = 32'h0f6b0f6b;
              3'h7: delta_pair = 32'h0f670f67;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h0f620f62;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f5e0f5e;
              3'h2: delta_pair = 32'h0f5b0f5b;
              3'h3: delta_pair = 32'h0f570f57;
              3'h4: delta_pair = 32'h0f530f53;
              3'h5: delta_pair = 32'h0f4f0f4f;
              3'h6: delta_pair = 32'h0f4c0f4c;
              3'h7: delta_pair = 32'h0f480f48;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h0f450f45;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f420f42;
              3'h2: delta_pair = 32'h0f3e0f3e;
              3'h3: delta_pair = 32'h0f3b0f3b;
              3'h4: delta_pair = 32'h0f380f38;
              3'h5: delta_pair = 32'h0f350f35;
              3'h6: delta_pair = 32'h0f320f32;
              3'h7: delta_pair = 32'h0f2f0f2f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h0f2c0f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f2a0f2a;
              3'h2: delta_pair = 32'h0f270f27;
              3'h3: delta_pair = 32'h0f240f24;
              3'h4: delta_pair = 32'h0f220f22;
              3'h5: delta_pair = 32'h0f1f0f1f;
              3'h6: delta_pair = 32'h0f1d0f1d;
              3'h7: delta_pair = 32'h0f1a0f1a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h0f180f18;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f150f15;
              3'h2: delta_pair = 32'h0f130f13;
              3'h3: delta_pair = 32'h0f110f11;
              3'h4: delta_pair = 32'h0f0f0f0f;
              3'h5: delta_pair = 32'h0f0c0f0c;
              3'h6: delta_pair = 32'h0f0a0f0a;
              3'h7: delta_pair = 32'h0f080f08;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h0f060f06;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f040f04;
              3'h2: delta_pair = 32'h0f020f02;
              3'h3: delta_pair = 32'h0f000f00;
              3'h4: delta_pair = 32'h0ffd0ffd;
              3'h5: delta_pair = 32'h0ff90ff9;
              3'h6: delta_pair = 32'h0ff60ff6;
              3'h7: delta_pair = 32'h0ff20ff2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h0fef0fef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0feb0feb;
              3'h2: delta_pair = 32'h0fe80fe8;
              3'h3: delta_pair = 32'h0fe50fe5;
              3'h4: delta_pair = 32'h0fe10fe1;
              3'h5: delta_pair = 32'h0fde0fde;
              3'h6: delta_pair = 32'h0fdb0fdb;
              3'h7: delta_pair = 32'h0fd80fd8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h0fd50fd5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fd20fd2;
              3'h2: delta_pair = 32'h0fcf0fcf;
              3'h3: delta_pair = 32'h0fcc0fcc;
              3'h4: delta_pair = 32'h0fca0fca;
              3'h5: delta_pair = 32'h0fc70fc7;
              3'h6: delta_pair = 32'h0fc40fc4;
              3'h7: delta_pair = 32'h0fc20fc2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h0fbf0fbf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fbd0fbd;
              3'h2: delta_pair = 32'h0fba0fba;
              3'h3: delta_pair = 32'h0fb80fb8;
              3'h4: delta_pair = 32'h0fb50fb5;
              3'h5: delta_pair = 32'h0fb30fb3;
              3'h6: delta_pair = 32'h0fb10fb1;
              3'h7: delta_pair = 32'h0fae0fae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h0fac0fac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0faa0faa;
              3'h2: delta_pair = 32'h0fa80fa8;
              3'h3: delta_pair = 32'h0fa50fa5;
              3'h4: delta_pair = 32'h0fa30fa3;
              3'h5: delta_pair = 32'h0fa10fa1;
              3'h6: delta_pair = 32'h0f9f0f9f;
              3'h7: delta_pair = 32'h0f9d0f9d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h0f9b0f9b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f990f99;
              3'h2: delta_pair = 32'h0f980f98;
              3'h3: delta_pair = 32'h0f960f96;
              3'h4: delta_pair = 32'h0f940f94;
              3'h5: delta_pair = 32'h0f920f92;
              3'h6: delta_pair = 32'h0f900f90;
              3'h7: delta_pair = 32'h0f8f0f8f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h0f8d0f8d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f8b0f8b;
              3'h2: delta_pair = 32'h0f890f89;
              3'h3: delta_pair = 32'h0f880f88;
              3'h4: delta_pair = 32'h0f860f86;
              3'h5: delta_pair = 32'h0f850f85;
              3'h6: delta_pair = 32'h0f830f83;
              3'h7: delta_pair = 32'h0f820f82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h5a: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h5b: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h5c: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07fa07fa;
              3'h2: delta_pair = 32'h07f407f4;
              3'h3: delta_pair = 32'h07ef07ef;
              3'h4: delta_pair = 32'h07e907e9;
              3'h5: delta_pair = 32'h07e407e4;
              3'h6: delta_pair = 32'h07df07df;
              3'h7: delta_pair = 32'h07da07da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h07d507d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07d107d1;
              3'h2: delta_pair = 32'h07cc07cc;
              3'h3: delta_pair = 32'h07c807c8;
              3'h4: delta_pair = 32'h07c407c4;
              3'h5: delta_pair = 32'h07c007c0;
              3'h6: delta_pair = 32'h07bc07bc;
              3'h7: delta_pair = 32'h07b807b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h07b407b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07b007b0;
              3'h2: delta_pair = 32'h07ad07ad;
              3'h3: delta_pair = 32'h07a907a9;
              3'h4: delta_pair = 32'h07a607a6;
              3'h5: delta_pair = 32'h07a207a2;
              3'h6: delta_pair = 32'h079f079f;
              3'h7: delta_pair = 32'h079c079c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h07990799;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07960796;
              3'h2: delta_pair = 32'h07930793;
              3'h3: delta_pair = 32'h07900790;
              3'h4: delta_pair = 32'h078d078d;
              3'h5: delta_pair = 32'h078b078b;
              3'h6: delta_pair = 32'h07880788;
              3'h7: delta_pair = 32'h07860786;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h07830783;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07810781;
              3'h2: delta_pair = 32'h077d077d;
              3'h3: delta_pair = 32'h07780778;
              3'h4: delta_pair = 32'h07730773;
              3'h5: delta_pair = 32'h076f076f;
              3'h6: delta_pair = 32'h076b076b;
              3'h7: delta_pair = 32'h07670767;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h07620762;
            case (mant_lo3)
              3'h1: delta_pair = 32'h075e075e;
              3'h2: delta_pair = 32'h075b075b;
              3'h3: delta_pair = 32'h07570757;
              3'h4: delta_pair = 32'h07530753;
              3'h5: delta_pair = 32'h074f074f;
              3'h6: delta_pair = 32'h074c074c;
              3'h7: delta_pair = 32'h07480748;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h07450745;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07420742;
              3'h2: delta_pair = 32'h073e073e;
              3'h3: delta_pair = 32'h073b073b;
              3'h4: delta_pair = 32'h07380738;
              3'h5: delta_pair = 32'h07350735;
              3'h6: delta_pair = 32'h07320732;
              3'h7: delta_pair = 32'h072f072f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072a072a;
              3'h2: delta_pair = 32'h07270727;
              3'h3: delta_pair = 32'h07240724;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h071f071f;
              3'h6: delta_pair = 32'h071d071d;
              3'h7: delta_pair = 32'h071a071a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h07180718;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07150715;
              3'h2: delta_pair = 32'h07130713;
              3'h3: delta_pair = 32'h07110711;
              3'h4: delta_pair = 32'h070f070f;
              3'h5: delta_pair = 32'h070c070c;
              3'h6: delta_pair = 32'h070a070a;
              3'h7: delta_pair = 32'h07080708;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h07060706;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07040704;
              3'h2: delta_pair = 32'h07020702;
              3'h3: delta_pair = 32'h07000700;
              3'h4: delta_pair = 32'h06fd06fd;
              3'h5: delta_pair = 32'h06f906f9;
              3'h6: delta_pair = 32'h06f606f6;
              3'h7: delta_pair = 32'h06f206f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h06ef06ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06eb06eb;
              3'h2: delta_pair = 32'h06e806e8;
              3'h3: delta_pair = 32'h06e506e5;
              3'h4: delta_pair = 32'h06e106e1;
              3'h5: delta_pair = 32'h06de06de;
              3'h6: delta_pair = 32'h06db06db;
              3'h7: delta_pair = 32'h06d806d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h06d506d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06d206d2;
              3'h2: delta_pair = 32'h06cf06cf;
              3'h3: delta_pair = 32'h06cc06cc;
              3'h4: delta_pair = 32'h06ca06ca;
              3'h5: delta_pair = 32'h06c706c7;
              3'h6: delta_pair = 32'h06c406c4;
              3'h7: delta_pair = 32'h06c206c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h06bf06bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06bd06bd;
              3'h2: delta_pair = 32'h06ba06ba;
              3'h3: delta_pair = 32'h06b806b8;
              3'h4: delta_pair = 32'h06b506b5;
              3'h5: delta_pair = 32'h06b306b3;
              3'h6: delta_pair = 32'h06b106b1;
              3'h7: delta_pair = 32'h06ae06ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h06ac06ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06aa06aa;
              3'h2: delta_pair = 32'h06a806a8;
              3'h3: delta_pair = 32'h06a506a5;
              3'h4: delta_pair = 32'h06a306a3;
              3'h5: delta_pair = 32'h06a106a1;
              3'h6: delta_pair = 32'h069f069f;
              3'h7: delta_pair = 32'h069d069d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h069b069b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06990699;
              3'h2: delta_pair = 32'h06980698;
              3'h3: delta_pair = 32'h06960696;
              3'h4: delta_pair = 32'h06940694;
              3'h5: delta_pair = 32'h06920692;
              3'h6: delta_pair = 32'h06900690;
              3'h7: delta_pair = 32'h068f068f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h068d068d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h068b068b;
              3'h2: delta_pair = 32'h06890689;
              3'h3: delta_pair = 32'h06880688;
              3'h4: delta_pair = 32'h06860686;
              3'h5: delta_pair = 32'h06850685;
              3'h6: delta_pair = 32'h06830683;
              3'h7: delta_pair = 32'h06820682;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h5d: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h03fd03fd;
              3'h5: delta_pair = 32'h03f903f9;
              3'h6: delta_pair = 32'h03f603f6;
              3'h7: delta_pair = 32'h03f203f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03ef03ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03eb03eb;
              3'h2: delta_pair = 32'h03e803e8;
              3'h3: delta_pair = 32'h03e503e5;
              3'h4: delta_pair = 32'h03e103e1;
              3'h5: delta_pair = 32'h03de03de;
              3'h6: delta_pair = 32'h03db03db;
              3'h7: delta_pair = 32'h03d803d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d203d2;
              3'h2: delta_pair = 32'h03cf03cf;
              3'h3: delta_pair = 32'h03cc03cc;
              3'h4: delta_pair = 32'h03ca03ca;
              3'h5: delta_pair = 32'h03c703c7;
              3'h6: delta_pair = 32'h03c403c4;
              3'h7: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h03bf03bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03bd03bd;
              3'h2: delta_pair = 32'h03ba03ba;
              3'h3: delta_pair = 32'h03b803b8;
              3'h4: delta_pair = 32'h03b503b5;
              3'h5: delta_pair = 32'h03b303b3;
              3'h6: delta_pair = 32'h03b103b1;
              3'h7: delta_pair = 32'h03ae03ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h03ac03ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03aa03aa;
              3'h2: delta_pair = 32'h03a803a8;
              3'h3: delta_pair = 32'h03a503a5;
              3'h4: delta_pair = 32'h03a303a3;
              3'h5: delta_pair = 32'h03a103a1;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039d039d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h039b039b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03990399;
              3'h2: delta_pair = 32'h03980398;
              3'h3: delta_pair = 32'h03960396;
              3'h4: delta_pair = 32'h03940394;
              3'h5: delta_pair = 32'h03920392;
              3'h6: delta_pair = 32'h03900390;
              3'h7: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h038d038d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h038b038b;
              3'h2: delta_pair = 32'h03890389;
              3'h3: delta_pair = 32'h03880388;
              3'h4: delta_pair = 32'h03860386;
              3'h5: delta_pair = 32'h03850385;
              3'h6: delta_pair = 32'h03830383;
              3'h7: delta_pair = 32'h03820382;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h5e: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h1efd1efd;
              3'h5: delta_pair = 32'h1ef91ef9;
              3'h6: delta_pair = 32'h1ef61ef6;
              3'h7: delta_pair = 32'h1ef21ef2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h1eef1eef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1eeb1eeb;
              3'h2: delta_pair = 32'h1ee81ee8;
              3'h3: delta_pair = 32'h1ee51ee5;
              3'h4: delta_pair = 32'h1ee11ee1;
              3'h5: delta_pair = 32'h1ede1ede;
              3'h6: delta_pair = 32'h1edb1edb;
              3'h7: delta_pair = 32'h1ed81ed8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h1ed51ed5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1ed21ed2;
              3'h2: delta_pair = 32'h1ecf1ecf;
              3'h3: delta_pair = 32'h1ecc1ecc;
              3'h4: delta_pair = 32'h1eca1eca;
              3'h5: delta_pair = 32'h1ec71ec7;
              3'h6: delta_pair = 32'h1ec41ec4;
              3'h7: delta_pair = 32'h1ec21ec2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h1ebf1ebf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1ebd1ebd;
              3'h2: delta_pair = 32'h1eba1eba;
              3'h3: delta_pair = 32'h1eb81eb8;
              3'h4: delta_pair = 32'h1eb51eb5;
              3'h5: delta_pair = 32'h1eb31eb3;
              3'h6: delta_pair = 32'h1eb11eb1;
              3'h7: delta_pair = 32'h1eae1eae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h1eac1eac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1eaa1eaa;
              3'h2: delta_pair = 32'h1ea81ea8;
              3'h3: delta_pair = 32'h1ea51ea5;
              3'h4: delta_pair = 32'h1ea31ea3;
              3'h5: delta_pair = 32'h1ea11ea1;
              3'h6: delta_pair = 32'h1e9f1e9f;
              3'h7: delta_pair = 32'h1e9d1e9d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h1e9b1e9b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1e991e99;
              3'h2: delta_pair = 32'h1e981e98;
              3'h3: delta_pair = 32'h1e961e96;
              3'h4: delta_pair = 32'h1e941e94;
              3'h5: delta_pair = 32'h1e921e92;
              3'h6: delta_pair = 32'h1e901e90;
              3'h7: delta_pair = 32'h1e8f1e8f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h1e8d1e8d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1e8b1e8b;
              3'h2: delta_pair = 32'h1e891e89;
              3'h3: delta_pair = 32'h1e881e88;
              3'h4: delta_pair = 32'h1e861e86;
              3'h5: delta_pair = 32'h1e851e85;
              3'h6: delta_pair = 32'h1e831e83;
              3'h7: delta_pair = 32'h1e821e82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h5f: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h60: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03fa03fa;
              3'h2: delta_pair = 32'h03f403f4;
              3'h3: delta_pair = 32'h03ef03ef;
              3'h4: delta_pair = 32'h03e903e9;
              3'h5: delta_pair = 32'h03e403e4;
              3'h6: delta_pair = 32'h03df03df;
              3'h7: delta_pair = 32'h03da03da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d103d1;
              3'h2: delta_pair = 32'h03cc03cc;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03c403c4;
              3'h5: delta_pair = 32'h03c003c0;
              3'h6: delta_pair = 32'h03bc03bc;
              3'h7: delta_pair = 32'h03b803b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h03b403b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03b003b0;
              3'h2: delta_pair = 32'h03ad03ad;
              3'h3: delta_pair = 32'h03a903a9;
              3'h4: delta_pair = 32'h03a603a6;
              3'h5: delta_pair = 32'h03a203a2;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039c039c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h03990399;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03960396;
              3'h2: delta_pair = 32'h03930393;
              3'h3: delta_pair = 32'h03900390;
              3'h4: delta_pair = 32'h038d038d;
              3'h5: delta_pair = 32'h038b038b;
              3'h6: delta_pair = 32'h03880388;
              3'h7: delta_pair = 32'h03860386;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h03830383;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03810381;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h61: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h077d077d;
              3'h3: delta_pair = 32'h07780778;
              3'h4: delta_pair = 32'h07730773;
              3'h5: delta_pair = 32'h076f076f;
              3'h6: delta_pair = 32'h076b076b;
              3'h7: delta_pair = 32'h07670767;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h07620762;
            case (mant_lo3)
              3'h1: delta_pair = 32'h075e075e;
              3'h2: delta_pair = 32'h075b075b;
              3'h3: delta_pair = 32'h07570757;
              3'h4: delta_pair = 32'h07530753;
              3'h5: delta_pair = 32'h074f074f;
              3'h6: delta_pair = 32'h074c074c;
              3'h7: delta_pair = 32'h07480748;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h07450745;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07420742;
              3'h2: delta_pair = 32'h073e073e;
              3'h3: delta_pair = 32'h073b073b;
              3'h4: delta_pair = 32'h07380738;
              3'h5: delta_pair = 32'h07350735;
              3'h6: delta_pair = 32'h07320732;
              3'h7: delta_pair = 32'h072f072f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072a072a;
              3'h2: delta_pair = 32'h07270727;
              3'h3: delta_pair = 32'h07240724;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h071f071f;
              3'h6: delta_pair = 32'h071d071d;
              3'h7: delta_pair = 32'h071a071a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h07180718;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07150715;
              3'h2: delta_pair = 32'h07130713;
              3'h3: delta_pair = 32'h07110711;
              3'h4: delta_pair = 32'h070f070f;
              3'h5: delta_pair = 32'h070c070c;
              3'h6: delta_pair = 32'h070a070a;
              3'h7: delta_pair = 32'h07080708;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h07060706;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07040704;
              3'h2: delta_pair = 32'h07020702;
              3'h3: delta_pair = 32'h07000700;
              3'h4: delta_pair = 32'h07fd07fd;
              3'h5: delta_pair = 32'h07f907f9;
              3'h6: delta_pair = 32'h07f607f6;
              3'h7: delta_pair = 32'h07f207f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h07ef07ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07eb07eb;
              3'h2: delta_pair = 32'h07e807e8;
              3'h3: delta_pair = 32'h07e507e5;
              3'h4: delta_pair = 32'h07e107e1;
              3'h5: delta_pair = 32'h07de07de;
              3'h6: delta_pair = 32'h07db07db;
              3'h7: delta_pair = 32'h07d807d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h07d507d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07d207d2;
              3'h2: delta_pair = 32'h07cf07cf;
              3'h3: delta_pair = 32'h07cc07cc;
              3'h4: delta_pair = 32'h07ca07ca;
              3'h5: delta_pair = 32'h07c707c7;
              3'h6: delta_pair = 32'h07c407c4;
              3'h7: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h07bf07bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07bd07bd;
              3'h2: delta_pair = 32'h07ba07ba;
              3'h3: delta_pair = 32'h07b807b8;
              3'h4: delta_pair = 32'h07b507b5;
              3'h5: delta_pair = 32'h07b307b3;
              3'h6: delta_pair = 32'h07b107b1;
              3'h7: delta_pair = 32'h07ae07ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h07ac07ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07aa07aa;
              3'h2: delta_pair = 32'h07a807a8;
              3'h3: delta_pair = 32'h07a507a5;
              3'h4: delta_pair = 32'h07a307a3;
              3'h5: delta_pair = 32'h07a107a1;
              3'h6: delta_pair = 32'h079f079f;
              3'h7: delta_pair = 32'h079d079d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h079b079b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07990799;
              3'h2: delta_pair = 32'h07980798;
              3'h3: delta_pair = 32'h07960796;
              3'h4: delta_pair = 32'h07940794;
              3'h5: delta_pair = 32'h07920792;
              3'h6: delta_pair = 32'h07900790;
              3'h7: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h078d078d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h078b078b;
              3'h2: delta_pair = 32'h07890789;
              3'h3: delta_pair = 32'h07880788;
              3'h4: delta_pair = 32'h07860786;
              3'h5: delta_pair = 32'h07850785;
              3'h6: delta_pair = 32'h07830783;
              3'h7: delta_pair = 32'h07820782;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h62: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h63: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h64: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0ffa0ffa;
              3'h2: delta_pair = 32'h0ff40ff4;
              3'h3: delta_pair = 32'h0fef0fef;
              3'h4: delta_pair = 32'h0fe90fe9;
              3'h5: delta_pair = 32'h0fe40fe4;
              3'h6: delta_pair = 32'h0fdf0fdf;
              3'h7: delta_pair = 32'h0fda0fda;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h0fd50fd5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fd10fd1;
              3'h2: delta_pair = 32'h0fcc0fcc;
              3'h3: delta_pair = 32'h0fc80fc8;
              3'h4: delta_pair = 32'h0fc40fc4;
              3'h5: delta_pair = 32'h0fc00fc0;
              3'h6: delta_pair = 32'h0fbc0fbc;
              3'h7: delta_pair = 32'h0fb80fb8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h0fb40fb4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fb00fb0;
              3'h2: delta_pair = 32'h0fad0fad;
              3'h3: delta_pair = 32'h0fa90fa9;
              3'h4: delta_pair = 32'h0fa60fa6;
              3'h5: delta_pair = 32'h0fa20fa2;
              3'h6: delta_pair = 32'h0f9f0f9f;
              3'h7: delta_pair = 32'h0f9c0f9c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h0f990f99;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f960f96;
              3'h2: delta_pair = 32'h0f930f93;
              3'h3: delta_pair = 32'h0f900f90;
              3'h4: delta_pair = 32'h0f8d0f8d;
              3'h5: delta_pair = 32'h0f8b0f8b;
              3'h6: delta_pair = 32'h0f880f88;
              3'h7: delta_pair = 32'h0f860f86;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h0f830f83;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f810f81;
              3'h2: delta_pair = 32'h0f7d0f7d;
              3'h3: delta_pair = 32'h0f780f78;
              3'h4: delta_pair = 32'h0f730f73;
              3'h5: delta_pair = 32'h0f6f0f6f;
              3'h6: delta_pair = 32'h0f6b0f6b;
              3'h7: delta_pair = 32'h0f670f67;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h0f620f62;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f5e0f5e;
              3'h2: delta_pair = 32'h0f5b0f5b;
              3'h3: delta_pair = 32'h0f570f57;
              3'h4: delta_pair = 32'h0f530f53;
              3'h5: delta_pair = 32'h0f4f0f4f;
              3'h6: delta_pair = 32'h0f4c0f4c;
              3'h7: delta_pair = 32'h0f480f48;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h0f450f45;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f420f42;
              3'h2: delta_pair = 32'h0f3e0f3e;
              3'h3: delta_pair = 32'h0f3b0f3b;
              3'h4: delta_pair = 32'h0f380f38;
              3'h5: delta_pair = 32'h0f350f35;
              3'h6: delta_pair = 32'h0f320f32;
              3'h7: delta_pair = 32'h0f2f0f2f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h0f2c0f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f2a0f2a;
              3'h2: delta_pair = 32'h0f270f27;
              3'h3: delta_pair = 32'h0f240f24;
              3'h4: delta_pair = 32'h0f220f22;
              3'h5: delta_pair = 32'h0f1f0f1f;
              3'h6: delta_pair = 32'h0f1d0f1d;
              3'h7: delta_pair = 32'h0f1a0f1a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h0f180f18;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f150f15;
              3'h2: delta_pair = 32'h0f130f13;
              3'h3: delta_pair = 32'h0f110f11;
              3'h4: delta_pair = 32'h0f0f0f0f;
              3'h5: delta_pair = 32'h0f0c0f0c;
              3'h6: delta_pair = 32'h0f0a0f0a;
              3'h7: delta_pair = 32'h0f080f08;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h0f060f06;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f040f04;
              3'h2: delta_pair = 32'h0f020f02;
              3'h3: delta_pair = 32'h0f000f00;
              3'h4: delta_pair = 32'h0efd0efd;
              3'h5: delta_pair = 32'h0ef90ef9;
              3'h6: delta_pair = 32'h0ef60ef6;
              3'h7: delta_pair = 32'h0ef20ef2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h0eef0eef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0eeb0eeb;
              3'h2: delta_pair = 32'h0ee80ee8;
              3'h3: delta_pair = 32'h0ee50ee5;
              3'h4: delta_pair = 32'h0ee10ee1;
              3'h5: delta_pair = 32'h0ede0ede;
              3'h6: delta_pair = 32'h0edb0edb;
              3'h7: delta_pair = 32'h0ed80ed8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h0ed50ed5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0ed20ed2;
              3'h2: delta_pair = 32'h0ecf0ecf;
              3'h3: delta_pair = 32'h0ecc0ecc;
              3'h4: delta_pair = 32'h0eca0eca;
              3'h5: delta_pair = 32'h0ec70ec7;
              3'h6: delta_pair = 32'h0ec40ec4;
              3'h7: delta_pair = 32'h0ec20ec2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h0ebf0ebf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0ebd0ebd;
              3'h2: delta_pair = 32'h0eba0eba;
              3'h3: delta_pair = 32'h0eb80eb8;
              3'h4: delta_pair = 32'h0eb50eb5;
              3'h5: delta_pair = 32'h0eb30eb3;
              3'h6: delta_pair = 32'h0eb10eb1;
              3'h7: delta_pair = 32'h0eae0eae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h0eac0eac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0eaa0eaa;
              3'h2: delta_pair = 32'h0ea80ea8;
              3'h3: delta_pair = 32'h0ea50ea5;
              3'h4: delta_pair = 32'h0ea30ea3;
              3'h5: delta_pair = 32'h0ea10ea1;
              3'h6: delta_pair = 32'h0e9f0e9f;
              3'h7: delta_pair = 32'h0e9d0e9d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h0e9b0e9b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0e990e99;
              3'h2: delta_pair = 32'h0e980e98;
              3'h3: delta_pair = 32'h0e960e96;
              3'h4: delta_pair = 32'h0e940e94;
              3'h5: delta_pair = 32'h0e920e92;
              3'h6: delta_pair = 32'h0e900e90;
              3'h7: delta_pair = 32'h0e8f0e8f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h0e8d0e8d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0e8b0e8b;
              3'h2: delta_pair = 32'h0e890e89;
              3'h3: delta_pair = 32'h0e880e88;
              3'h4: delta_pair = 32'h0e860e86;
              3'h5: delta_pair = 32'h0e850e85;
              3'h6: delta_pair = 32'h0e830e83;
              3'h7: delta_pair = 32'h0e820e82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h65: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h03fd03fd;
              3'h5: delta_pair = 32'h03f903f9;
              3'h6: delta_pair = 32'h03f603f6;
              3'h7: delta_pair = 32'h03f203f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03ef03ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03eb03eb;
              3'h2: delta_pair = 32'h03e803e8;
              3'h3: delta_pair = 32'h03e503e5;
              3'h4: delta_pair = 32'h03e103e1;
              3'h5: delta_pair = 32'h03de03de;
              3'h6: delta_pair = 32'h03db03db;
              3'h7: delta_pair = 32'h03d803d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d203d2;
              3'h2: delta_pair = 32'h03cf03cf;
              3'h3: delta_pair = 32'h03cc03cc;
              3'h4: delta_pair = 32'h03ca03ca;
              3'h5: delta_pair = 32'h03c703c7;
              3'h6: delta_pair = 32'h03c403c4;
              3'h7: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h03bf03bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03bd03bd;
              3'h2: delta_pair = 32'h03ba03ba;
              3'h3: delta_pair = 32'h03b803b8;
              3'h4: delta_pair = 32'h03b503b5;
              3'h5: delta_pair = 32'h03b303b3;
              3'h6: delta_pair = 32'h03b103b1;
              3'h7: delta_pair = 32'h03ae03ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h03ac03ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03aa03aa;
              3'h2: delta_pair = 32'h03a803a8;
              3'h3: delta_pair = 32'h03a503a5;
              3'h4: delta_pair = 32'h03a303a3;
              3'h5: delta_pair = 32'h03a103a1;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039d039d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h039b039b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03990399;
              3'h2: delta_pair = 32'h03980398;
              3'h3: delta_pair = 32'h03960396;
              3'h4: delta_pair = 32'h03940394;
              3'h5: delta_pair = 32'h03920392;
              3'h6: delta_pair = 32'h03900390;
              3'h7: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h038d038d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h038b038b;
              3'h2: delta_pair = 32'h03890389;
              3'h3: delta_pair = 32'h03880388;
              3'h4: delta_pair = 32'h03860386;
              3'h5: delta_pair = 32'h03850385;
              3'h6: delta_pair = 32'h03830383;
              3'h7: delta_pair = 32'h03820382;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h66: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h06fd06fd;
              3'h5: delta_pair = 32'h06f906f9;
              3'h6: delta_pair = 32'h06f606f6;
              3'h7: delta_pair = 32'h06f206f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h06ef06ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06eb06eb;
              3'h2: delta_pair = 32'h06e806e8;
              3'h3: delta_pair = 32'h06e506e5;
              3'h4: delta_pair = 32'h06e106e1;
              3'h5: delta_pair = 32'h06de06de;
              3'h6: delta_pair = 32'h06db06db;
              3'h7: delta_pair = 32'h06d806d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h06d506d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06d206d2;
              3'h2: delta_pair = 32'h06cf06cf;
              3'h3: delta_pair = 32'h06cc06cc;
              3'h4: delta_pair = 32'h06ca06ca;
              3'h5: delta_pair = 32'h06c706c7;
              3'h6: delta_pair = 32'h06c406c4;
              3'h7: delta_pair = 32'h06c206c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h06bf06bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06bd06bd;
              3'h2: delta_pair = 32'h06ba06ba;
              3'h3: delta_pair = 32'h06b806b8;
              3'h4: delta_pair = 32'h06b506b5;
              3'h5: delta_pair = 32'h06b306b3;
              3'h6: delta_pair = 32'h06b106b1;
              3'h7: delta_pair = 32'h06ae06ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h06ac06ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06aa06aa;
              3'h2: delta_pair = 32'h06a806a8;
              3'h3: delta_pair = 32'h06a506a5;
              3'h4: delta_pair = 32'h06a306a3;
              3'h5: delta_pair = 32'h06a106a1;
              3'h6: delta_pair = 32'h069f069f;
              3'h7: delta_pair = 32'h069d069d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h069b069b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06990699;
              3'h2: delta_pair = 32'h06980698;
              3'h3: delta_pair = 32'h06960696;
              3'h4: delta_pair = 32'h06940694;
              3'h5: delta_pair = 32'h06920692;
              3'h6: delta_pair = 32'h06900690;
              3'h7: delta_pair = 32'h068f068f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h068d068d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h068b068b;
              3'h2: delta_pair = 32'h06890689;
              3'h3: delta_pair = 32'h06880688;
              3'h4: delta_pair = 32'h06860686;
              3'h5: delta_pair = 32'h06850685;
              3'h6: delta_pair = 32'h06830683;
              3'h7: delta_pair = 32'h06820682;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h67: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h68: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03fa03fa;
              3'h2: delta_pair = 32'h03f403f4;
              3'h3: delta_pair = 32'h03ef03ef;
              3'h4: delta_pair = 32'h03e903e9;
              3'h5: delta_pair = 32'h03e403e4;
              3'h6: delta_pair = 32'h03df03df;
              3'h7: delta_pair = 32'h03da03da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d103d1;
              3'h2: delta_pair = 32'h03cc03cc;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03c403c4;
              3'h5: delta_pair = 32'h03c003c0;
              3'h6: delta_pair = 32'h03bc03bc;
              3'h7: delta_pair = 32'h03b803b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h03b403b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03b003b0;
              3'h2: delta_pair = 32'h03ad03ad;
              3'h3: delta_pair = 32'h03a903a9;
              3'h4: delta_pair = 32'h03a603a6;
              3'h5: delta_pair = 32'h03a203a2;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039c039c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h03990399;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03960396;
              3'h2: delta_pair = 32'h03930393;
              3'h3: delta_pair = 32'h03900390;
              3'h4: delta_pair = 32'h038d038d;
              3'h5: delta_pair = 32'h038b038b;
              3'h6: delta_pair = 32'h03880388;
              3'h7: delta_pair = 32'h03860386;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h03830383;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03810381;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h69: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h3f7d3f7d;
              3'h3: delta_pair = 32'h3f783f78;
              3'h4: delta_pair = 32'h3f733f73;
              3'h5: delta_pair = 32'h3f6f3f6f;
              3'h6: delta_pair = 32'h3f6b3f6b;
              3'h7: delta_pair = 32'h3f673f67;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h3f623f62;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f5e3f5e;
              3'h2: delta_pair = 32'h3f5b3f5b;
              3'h3: delta_pair = 32'h3f573f57;
              3'h4: delta_pair = 32'h3f533f53;
              3'h5: delta_pair = 32'h3f4f3f4f;
              3'h6: delta_pair = 32'h3f4c3f4c;
              3'h7: delta_pair = 32'h3f483f48;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h3f453f45;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f423f42;
              3'h2: delta_pair = 32'h3f3e3f3e;
              3'h3: delta_pair = 32'h3f3b3f3b;
              3'h4: delta_pair = 32'h3f383f38;
              3'h5: delta_pair = 32'h3f353f35;
              3'h6: delta_pair = 32'h3f323f32;
              3'h7: delta_pair = 32'h3f2f3f2f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h3f2c3f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f2a3f2a;
              3'h2: delta_pair = 32'h3f273f27;
              3'h3: delta_pair = 32'h3f243f24;
              3'h4: delta_pair = 32'h3f223f22;
              3'h5: delta_pair = 32'h3f1f3f1f;
              3'h6: delta_pair = 32'h3f1d3f1d;
              3'h7: delta_pair = 32'h3f1a3f1a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h3f183f18;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f153f15;
              3'h2: delta_pair = 32'h3f133f13;
              3'h3: delta_pair = 32'h3f113f11;
              3'h4: delta_pair = 32'h3f0f3f0f;
              3'h5: delta_pair = 32'h3f0c3f0c;
              3'h6: delta_pair = 32'h3f0a3f0a;
              3'h7: delta_pair = 32'h3f083f08;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h3f063f06;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f043f04;
              3'h2: delta_pair = 32'h3f023f02;
              3'h3: delta_pair = 32'h3f003f00;
              3'h4: delta_pair = 32'h3ffd3ffd;
              3'h5: delta_pair = 32'h3ff93ff9;
              3'h6: delta_pair = 32'h3ff63ff6;
              3'h7: delta_pair = 32'h3ff23ff2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h3fef3fef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3feb3feb;
              3'h2: delta_pair = 32'h3fe83fe8;
              3'h3: delta_pair = 32'h3fe53fe5;
              3'h4: delta_pair = 32'h3fe13fe1;
              3'h5: delta_pair = 32'h3fde3fde;
              3'h6: delta_pair = 32'h3fdb3fdb;
              3'h7: delta_pair = 32'h3fd83fd8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h3fd53fd5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3fd23fd2;
              3'h2: delta_pair = 32'h3fcf3fcf;
              3'h3: delta_pair = 32'h3fcc3fcc;
              3'h4: delta_pair = 32'h3fca3fca;
              3'h5: delta_pair = 32'h3fc73fc7;
              3'h6: delta_pair = 32'h3fc43fc4;
              3'h7: delta_pair = 32'h3fc23fc2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h3fbf3fbf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3fbd3fbd;
              3'h2: delta_pair = 32'h3fba3fba;
              3'h3: delta_pair = 32'h3fb83fb8;
              3'h4: delta_pair = 32'h3fb53fb5;
              3'h5: delta_pair = 32'h3fb33fb3;
              3'h6: delta_pair = 32'h3fb13fb1;
              3'h7: delta_pair = 32'h3fae3fae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h3fac3fac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3faa3faa;
              3'h2: delta_pair = 32'h3fa83fa8;
              3'h3: delta_pair = 32'h3fa53fa5;
              3'h4: delta_pair = 32'h3fa33fa3;
              3'h5: delta_pair = 32'h3fa13fa1;
              3'h6: delta_pair = 32'h3f9f3f9f;
              3'h7: delta_pair = 32'h3f9d3f9d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h3f9b3f9b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f993f99;
              3'h2: delta_pair = 32'h3f983f98;
              3'h3: delta_pair = 32'h3f963f96;
              3'h4: delta_pair = 32'h3f943f94;
              3'h5: delta_pair = 32'h3f923f92;
              3'h6: delta_pair = 32'h3f903f90;
              3'h7: delta_pair = 32'h3f8f3f8f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h3f8d3f8d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f8b3f8b;
              3'h2: delta_pair = 32'h3f893f89;
              3'h3: delta_pair = 32'h3f883f88;
              3'h4: delta_pair = 32'h3f863f86;
              3'h5: delta_pair = 32'h3f853f85;
              3'h6: delta_pair = 32'h3f833f83;
              3'h7: delta_pair = 32'h3f823f82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6a: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6b: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6c: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07fa07fa;
              3'h2: delta_pair = 32'h07f407f4;
              3'h3: delta_pair = 32'h07ef07ef;
              3'h4: delta_pair = 32'h07e907e9;
              3'h5: delta_pair = 32'h07e407e4;
              3'h6: delta_pair = 32'h07df07df;
              3'h7: delta_pair = 32'h07da07da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h07d507d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07d107d1;
              3'h2: delta_pair = 32'h07cc07cc;
              3'h3: delta_pair = 32'h07c807c8;
              3'h4: delta_pair = 32'h07c407c4;
              3'h5: delta_pair = 32'h07c007c0;
              3'h6: delta_pair = 32'h07bc07bc;
              3'h7: delta_pair = 32'h07b807b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h07b407b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07b007b0;
              3'h2: delta_pair = 32'h07ad07ad;
              3'h3: delta_pair = 32'h07a907a9;
              3'h4: delta_pair = 32'h07a607a6;
              3'h5: delta_pair = 32'h07a207a2;
              3'h6: delta_pair = 32'h079f079f;
              3'h7: delta_pair = 32'h079c079c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h07990799;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07960796;
              3'h2: delta_pair = 32'h07930793;
              3'h3: delta_pair = 32'h07900790;
              3'h4: delta_pair = 32'h078d078d;
              3'h5: delta_pair = 32'h078b078b;
              3'h6: delta_pair = 32'h07880788;
              3'h7: delta_pair = 32'h07860786;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h07830783;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07810781;
              3'h2: delta_pair = 32'h077d077d;
              3'h3: delta_pair = 32'h07780778;
              3'h4: delta_pair = 32'h07730773;
              3'h5: delta_pair = 32'h076f076f;
              3'h6: delta_pair = 32'h076b076b;
              3'h7: delta_pair = 32'h07670767;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h07620762;
            case (mant_lo3)
              3'h1: delta_pair = 32'h075e075e;
              3'h2: delta_pair = 32'h075b075b;
              3'h3: delta_pair = 32'h07570757;
              3'h4: delta_pair = 32'h07530753;
              3'h5: delta_pair = 32'h074f074f;
              3'h6: delta_pair = 32'h074c074c;
              3'h7: delta_pair = 32'h07480748;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h07450745;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07420742;
              3'h2: delta_pair = 32'h073e073e;
              3'h3: delta_pair = 32'h073b073b;
              3'h4: delta_pair = 32'h07380738;
              3'h5: delta_pair = 32'h07350735;
              3'h6: delta_pair = 32'h07320732;
              3'h7: delta_pair = 32'h072f072f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072a072a;
              3'h2: delta_pair = 32'h07270727;
              3'h3: delta_pair = 32'h07240724;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h071f071f;
              3'h6: delta_pair = 32'h071d071d;
              3'h7: delta_pair = 32'h071a071a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h07180718;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07150715;
              3'h2: delta_pair = 32'h07130713;
              3'h3: delta_pair = 32'h07110711;
              3'h4: delta_pair = 32'h070f070f;
              3'h5: delta_pair = 32'h070c070c;
              3'h6: delta_pair = 32'h070a070a;
              3'h7: delta_pair = 32'h07080708;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h07060706;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07040704;
              3'h2: delta_pair = 32'h07020702;
              3'h3: delta_pair = 32'h07000700;
              3'h4: delta_pair = 32'h06fd06fd;
              3'h5: delta_pair = 32'h06f906f9;
              3'h6: delta_pair = 32'h06f606f6;
              3'h7: delta_pair = 32'h06f206f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h06ef06ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06eb06eb;
              3'h2: delta_pair = 32'h06e806e8;
              3'h3: delta_pair = 32'h06e506e5;
              3'h4: delta_pair = 32'h06e106e1;
              3'h5: delta_pair = 32'h06de06de;
              3'h6: delta_pair = 32'h06db06db;
              3'h7: delta_pair = 32'h06d806d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h06d506d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06d206d2;
              3'h2: delta_pair = 32'h06cf06cf;
              3'h3: delta_pair = 32'h06cc06cc;
              3'h4: delta_pair = 32'h06ca06ca;
              3'h5: delta_pair = 32'h06c706c7;
              3'h6: delta_pair = 32'h06c406c4;
              3'h7: delta_pair = 32'h06c206c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h06bf06bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06bd06bd;
              3'h2: delta_pair = 32'h06ba06ba;
              3'h3: delta_pair = 32'h06b806b8;
              3'h4: delta_pair = 32'h06b506b5;
              3'h5: delta_pair = 32'h06b306b3;
              3'h6: delta_pair = 32'h06b106b1;
              3'h7: delta_pair = 32'h06ae06ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h06ac06ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06aa06aa;
              3'h2: delta_pair = 32'h06a806a8;
              3'h3: delta_pair = 32'h06a506a5;
              3'h4: delta_pair = 32'h06a306a3;
              3'h5: delta_pair = 32'h06a106a1;
              3'h6: delta_pair = 32'h069f069f;
              3'h7: delta_pair = 32'h069d069d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h069b069b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06990699;
              3'h2: delta_pair = 32'h06980698;
              3'h3: delta_pair = 32'h06960696;
              3'h4: delta_pair = 32'h06940694;
              3'h5: delta_pair = 32'h06920692;
              3'h6: delta_pair = 32'h06900690;
              3'h7: delta_pair = 32'h068f068f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h068d068d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h068b068b;
              3'h2: delta_pair = 32'h06890689;
              3'h3: delta_pair = 32'h06880688;
              3'h4: delta_pair = 32'h06860686;
              3'h5: delta_pair = 32'h06850685;
              3'h6: delta_pair = 32'h06830683;
              3'h7: delta_pair = 32'h06820682;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6d: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h03fd03fd;
              3'h5: delta_pair = 32'h03f903f9;
              3'h6: delta_pair = 32'h03f603f6;
              3'h7: delta_pair = 32'h03f203f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03ef03ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03eb03eb;
              3'h2: delta_pair = 32'h03e803e8;
              3'h3: delta_pair = 32'h03e503e5;
              3'h4: delta_pair = 32'h03e103e1;
              3'h5: delta_pair = 32'h03de03de;
              3'h6: delta_pair = 32'h03db03db;
              3'h7: delta_pair = 32'h03d803d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d203d2;
              3'h2: delta_pair = 32'h03cf03cf;
              3'h3: delta_pair = 32'h03cc03cc;
              3'h4: delta_pair = 32'h03ca03ca;
              3'h5: delta_pair = 32'h03c703c7;
              3'h6: delta_pair = 32'h03c403c4;
              3'h7: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h03bf03bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03bd03bd;
              3'h2: delta_pair = 32'h03ba03ba;
              3'h3: delta_pair = 32'h03b803b8;
              3'h4: delta_pair = 32'h03b503b5;
              3'h5: delta_pair = 32'h03b303b3;
              3'h6: delta_pair = 32'h03b103b1;
              3'h7: delta_pair = 32'h03ae03ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h03ac03ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03aa03aa;
              3'h2: delta_pair = 32'h03a803a8;
              3'h3: delta_pair = 32'h03a503a5;
              3'h4: delta_pair = 32'h03a303a3;
              3'h5: delta_pair = 32'h03a103a1;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039d039d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h039b039b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03990399;
              3'h2: delta_pair = 32'h03980398;
              3'h3: delta_pair = 32'h03960396;
              3'h4: delta_pair = 32'h03940394;
              3'h5: delta_pair = 32'h03920392;
              3'h6: delta_pair = 32'h03900390;
              3'h7: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h038d038d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h038b038b;
              3'h2: delta_pair = 32'h03890389;
              3'h3: delta_pair = 32'h03880388;
              3'h4: delta_pair = 32'h03860386;
              3'h5: delta_pair = 32'h03850385;
              3'h6: delta_pair = 32'h03830383;
              3'h7: delta_pair = 32'h03820382;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6e: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h0efd0efd;
              3'h5: delta_pair = 32'h0ef90ef9;
              3'h6: delta_pair = 32'h0ef60ef6;
              3'h7: delta_pair = 32'h0ef20ef2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h0eef0eef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0eeb0eeb;
              3'h2: delta_pair = 32'h0ee80ee8;
              3'h3: delta_pair = 32'h0ee50ee5;
              3'h4: delta_pair = 32'h0ee10ee1;
              3'h5: delta_pair = 32'h0ede0ede;
              3'h6: delta_pair = 32'h0edb0edb;
              3'h7: delta_pair = 32'h0ed80ed8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h0ed50ed5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0ed20ed2;
              3'h2: delta_pair = 32'h0ecf0ecf;
              3'h3: delta_pair = 32'h0ecc0ecc;
              3'h4: delta_pair = 32'h0eca0eca;
              3'h5: delta_pair = 32'h0ec70ec7;
              3'h6: delta_pair = 32'h0ec40ec4;
              3'h7: delta_pair = 32'h0ec20ec2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h0ebf0ebf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0ebd0ebd;
              3'h2: delta_pair = 32'h0eba0eba;
              3'h3: delta_pair = 32'h0eb80eb8;
              3'h4: delta_pair = 32'h0eb50eb5;
              3'h5: delta_pair = 32'h0eb30eb3;
              3'h6: delta_pair = 32'h0eb10eb1;
              3'h7: delta_pair = 32'h0eae0eae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h0eac0eac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0eaa0eaa;
              3'h2: delta_pair = 32'h0ea80ea8;
              3'h3: delta_pair = 32'h0ea50ea5;
              3'h4: delta_pair = 32'h0ea30ea3;
              3'h5: delta_pair = 32'h0ea10ea1;
              3'h6: delta_pair = 32'h0e9f0e9f;
              3'h7: delta_pair = 32'h0e9d0e9d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h0e9b0e9b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0e990e99;
              3'h2: delta_pair = 32'h0e980e98;
              3'h3: delta_pair = 32'h0e960e96;
              3'h4: delta_pair = 32'h0e940e94;
              3'h5: delta_pair = 32'h0e920e92;
              3'h6: delta_pair = 32'h0e900e90;
              3'h7: delta_pair = 32'h0e8f0e8f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h0e8d0e8d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0e8b0e8b;
              3'h2: delta_pair = 32'h0e890e89;
              3'h3: delta_pair = 32'h0e880e88;
              3'h4: delta_pair = 32'h0e860e86;
              3'h5: delta_pair = 32'h0e850e85;
              3'h6: delta_pair = 32'h0e830e83;
              3'h7: delta_pair = 32'h0e820e82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6f: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h70: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03fa03fa;
              3'h2: delta_pair = 32'h03f403f4;
              3'h3: delta_pair = 32'h03ef03ef;
              3'h4: delta_pair = 32'h03e903e9;
              3'h5: delta_pair = 32'h03e403e4;
              3'h6: delta_pair = 32'h03df03df;
              3'h7: delta_pair = 32'h03da03da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d103d1;
              3'h2: delta_pair = 32'h03cc03cc;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03c403c4;
              3'h5: delta_pair = 32'h03c003c0;
              3'h6: delta_pair = 32'h03bc03bc;
              3'h7: delta_pair = 32'h03b803b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h03b403b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03b003b0;
              3'h2: delta_pair = 32'h03ad03ad;
              3'h3: delta_pair = 32'h03a903a9;
              3'h4: delta_pair = 32'h03a603a6;
              3'h5: delta_pair = 32'h03a203a2;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039c039c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h03990399;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03960396;
              3'h2: delta_pair = 32'h03930393;
              3'h3: delta_pair = 32'h03900390;
              3'h4: delta_pair = 32'h038d038d;
              3'h5: delta_pair = 32'h038b038b;
              3'h6: delta_pair = 32'h03880388;
              3'h7: delta_pair = 32'h03860386;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h03830383;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03810381;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h71: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h077d077d;
              3'h3: delta_pair = 32'h07780778;
              3'h4: delta_pair = 32'h07730773;
              3'h5: delta_pair = 32'h076f076f;
              3'h6: delta_pair = 32'h076b076b;
              3'h7: delta_pair = 32'h07670767;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h07620762;
            case (mant_lo3)
              3'h1: delta_pair = 32'h075e075e;
              3'h2: delta_pair = 32'h075b075b;
              3'h3: delta_pair = 32'h07570757;
              3'h4: delta_pair = 32'h07530753;
              3'h5: delta_pair = 32'h074f074f;
              3'h6: delta_pair = 32'h074c074c;
              3'h7: delta_pair = 32'h07480748;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h07450745;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07420742;
              3'h2: delta_pair = 32'h073e073e;
              3'h3: delta_pair = 32'h073b073b;
              3'h4: delta_pair = 32'h07380738;
              3'h5: delta_pair = 32'h07350735;
              3'h6: delta_pair = 32'h07320732;
              3'h7: delta_pair = 32'h072f072f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072a072a;
              3'h2: delta_pair = 32'h07270727;
              3'h3: delta_pair = 32'h07240724;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h071f071f;
              3'h6: delta_pair = 32'h071d071d;
              3'h7: delta_pair = 32'h071a071a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h07180718;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07150715;
              3'h2: delta_pair = 32'h07130713;
              3'h3: delta_pair = 32'h07110711;
              3'h4: delta_pair = 32'h070f070f;
              3'h5: delta_pair = 32'h070c070c;
              3'h6: delta_pair = 32'h070a070a;
              3'h7: delta_pair = 32'h07080708;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h07060706;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07040704;
              3'h2: delta_pair = 32'h07020702;
              3'h3: delta_pair = 32'h07000700;
              3'h4: delta_pair = 32'h07fd07fd;
              3'h5: delta_pair = 32'h07f907f9;
              3'h6: delta_pair = 32'h07f607f6;
              3'h7: delta_pair = 32'h07f207f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h07ef07ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07eb07eb;
              3'h2: delta_pair = 32'h07e807e8;
              3'h3: delta_pair = 32'h07e507e5;
              3'h4: delta_pair = 32'h07e107e1;
              3'h5: delta_pair = 32'h07de07de;
              3'h6: delta_pair = 32'h07db07db;
              3'h7: delta_pair = 32'h07d807d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h07d507d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07d207d2;
              3'h2: delta_pair = 32'h07cf07cf;
              3'h3: delta_pair = 32'h07cc07cc;
              3'h4: delta_pair = 32'h07ca07ca;
              3'h5: delta_pair = 32'h07c707c7;
              3'h6: delta_pair = 32'h07c407c4;
              3'h7: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h07bf07bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07bd07bd;
              3'h2: delta_pair = 32'h07ba07ba;
              3'h3: delta_pair = 32'h07b807b8;
              3'h4: delta_pair = 32'h07b507b5;
              3'h5: delta_pair = 32'h07b307b3;
              3'h6: delta_pair = 32'h07b107b1;
              3'h7: delta_pair = 32'h07ae07ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h07ac07ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07aa07aa;
              3'h2: delta_pair = 32'h07a807a8;
              3'h3: delta_pair = 32'h07a507a5;
              3'h4: delta_pair = 32'h07a307a3;
              3'h5: delta_pair = 32'h07a107a1;
              3'h6: delta_pair = 32'h079f079f;
              3'h7: delta_pair = 32'h079d079d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h079b079b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07990799;
              3'h2: delta_pair = 32'h07980798;
              3'h3: delta_pair = 32'h07960796;
              3'h4: delta_pair = 32'h07940794;
              3'h5: delta_pair = 32'h07920792;
              3'h6: delta_pair = 32'h07900790;
              3'h7: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h078d078d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h078b078b;
              3'h2: delta_pair = 32'h07890789;
              3'h3: delta_pair = 32'h07880788;
              3'h4: delta_pair = 32'h07860786;
              3'h5: delta_pair = 32'h07850785;
              3'h6: delta_pair = 32'h07830783;
              3'h7: delta_pair = 32'h07820782;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h72: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h73: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h74: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1ffa1ffa;
              3'h2: delta_pair = 32'h1ff41ff4;
              3'h3: delta_pair = 32'h1fef1fef;
              3'h4: delta_pair = 32'h1fe91fe9;
              3'h5: delta_pair = 32'h1fe41fe4;
              3'h6: delta_pair = 32'h1fdf1fdf;
              3'h7: delta_pair = 32'h1fda1fda;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h1fd51fd5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1fd11fd1;
              3'h2: delta_pair = 32'h1fcc1fcc;
              3'h3: delta_pair = 32'h1fc81fc8;
              3'h4: delta_pair = 32'h1fc41fc4;
              3'h5: delta_pair = 32'h1fc01fc0;
              3'h6: delta_pair = 32'h1fbc1fbc;
              3'h7: delta_pair = 32'h1fb81fb8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h1fb41fb4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1fb01fb0;
              3'h2: delta_pair = 32'h1fad1fad;
              3'h3: delta_pair = 32'h1fa91fa9;
              3'h4: delta_pair = 32'h1fa61fa6;
              3'h5: delta_pair = 32'h1fa21fa2;
              3'h6: delta_pair = 32'h1f9f1f9f;
              3'h7: delta_pair = 32'h1f9c1f9c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h1f991f99;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f961f96;
              3'h2: delta_pair = 32'h1f931f93;
              3'h3: delta_pair = 32'h1f901f90;
              3'h4: delta_pair = 32'h1f8d1f8d;
              3'h5: delta_pair = 32'h1f8b1f8b;
              3'h6: delta_pair = 32'h1f881f88;
              3'h7: delta_pair = 32'h1f861f86;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h1f831f83;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f811f81;
              3'h2: delta_pair = 32'h1f7d1f7d;
              3'h3: delta_pair = 32'h1f781f78;
              3'h4: delta_pair = 32'h1f731f73;
              3'h5: delta_pair = 32'h1f6f1f6f;
              3'h6: delta_pair = 32'h1f6b1f6b;
              3'h7: delta_pair = 32'h1f671f67;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h1f621f62;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f5e1f5e;
              3'h2: delta_pair = 32'h1f5b1f5b;
              3'h3: delta_pair = 32'h1f571f57;
              3'h4: delta_pair = 32'h1f531f53;
              3'h5: delta_pair = 32'h1f4f1f4f;
              3'h6: delta_pair = 32'h1f4c1f4c;
              3'h7: delta_pair = 32'h1f481f48;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h1f451f45;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f421f42;
              3'h2: delta_pair = 32'h1f3e1f3e;
              3'h3: delta_pair = 32'h1f3b1f3b;
              3'h4: delta_pair = 32'h1f381f38;
              3'h5: delta_pair = 32'h1f351f35;
              3'h6: delta_pair = 32'h1f321f32;
              3'h7: delta_pair = 32'h1f2f1f2f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h1f2c1f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f2a1f2a;
              3'h2: delta_pair = 32'h1f271f27;
              3'h3: delta_pair = 32'h1f241f24;
              3'h4: delta_pair = 32'h1f221f22;
              3'h5: delta_pair = 32'h1f1f1f1f;
              3'h6: delta_pair = 32'h1f1d1f1d;
              3'h7: delta_pair = 32'h1f1a1f1a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h1f181f18;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f151f15;
              3'h2: delta_pair = 32'h1f131f13;
              3'h3: delta_pair = 32'h1f111f11;
              3'h4: delta_pair = 32'h1f0f1f0f;
              3'h5: delta_pair = 32'h1f0c1f0c;
              3'h6: delta_pair = 32'h1f0a1f0a;
              3'h7: delta_pair = 32'h1f081f08;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h1f061f06;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f041f04;
              3'h2: delta_pair = 32'h1f021f02;
              3'h3: delta_pair = 32'h1f001f00;
              3'h4: delta_pair = 32'h1efd1efd;
              3'h5: delta_pair = 32'h1ef91ef9;
              3'h6: delta_pair = 32'h1ef61ef6;
              3'h7: delta_pair = 32'h1ef21ef2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h1eef1eef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1eeb1eeb;
              3'h2: delta_pair = 32'h1ee81ee8;
              3'h3: delta_pair = 32'h1ee51ee5;
              3'h4: delta_pair = 32'h1ee11ee1;
              3'h5: delta_pair = 32'h1ede1ede;
              3'h6: delta_pair = 32'h1edb1edb;
              3'h7: delta_pair = 32'h1ed81ed8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h1ed51ed5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1ed21ed2;
              3'h2: delta_pair = 32'h1ecf1ecf;
              3'h3: delta_pair = 32'h1ecc1ecc;
              3'h4: delta_pair = 32'h1eca1eca;
              3'h5: delta_pair = 32'h1ec71ec7;
              3'h6: delta_pair = 32'h1ec41ec4;
              3'h7: delta_pair = 32'h1ec21ec2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h1ebf1ebf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1ebd1ebd;
              3'h2: delta_pair = 32'h1eba1eba;
              3'h3: delta_pair = 32'h1eb81eb8;
              3'h4: delta_pair = 32'h1eb51eb5;
              3'h5: delta_pair = 32'h1eb31eb3;
              3'h6: delta_pair = 32'h1eb11eb1;
              3'h7: delta_pair = 32'h1eae1eae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h1eac1eac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1eaa1eaa;
              3'h2: delta_pair = 32'h1ea81ea8;
              3'h3: delta_pair = 32'h1ea51ea5;
              3'h4: delta_pair = 32'h1ea31ea3;
              3'h5: delta_pair = 32'h1ea11ea1;
              3'h6: delta_pair = 32'h1e9f1e9f;
              3'h7: delta_pair = 32'h1e9d1e9d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h1e9b1e9b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1e991e99;
              3'h2: delta_pair = 32'h1e981e98;
              3'h3: delta_pair = 32'h1e961e96;
              3'h4: delta_pair = 32'h1e941e94;
              3'h5: delta_pair = 32'h1e921e92;
              3'h6: delta_pair = 32'h1e901e90;
              3'h7: delta_pair = 32'h1e8f1e8f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h1e8d1e8d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1e8b1e8b;
              3'h2: delta_pair = 32'h1e891e89;
              3'h3: delta_pair = 32'h1e881e88;
              3'h4: delta_pair = 32'h1e861e86;
              3'h5: delta_pair = 32'h1e851e85;
              3'h6: delta_pair = 32'h1e831e83;
              3'h7: delta_pair = 32'h1e821e82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h75: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h03fd03fd;
              3'h5: delta_pair = 32'h03f903f9;
              3'h6: delta_pair = 32'h03f603f6;
              3'h7: delta_pair = 32'h03f203f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03ef03ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03eb03eb;
              3'h2: delta_pair = 32'h03e803e8;
              3'h3: delta_pair = 32'h03e503e5;
              3'h4: delta_pair = 32'h03e103e1;
              3'h5: delta_pair = 32'h03de03de;
              3'h6: delta_pair = 32'h03db03db;
              3'h7: delta_pair = 32'h03d803d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d203d2;
              3'h2: delta_pair = 32'h03cf03cf;
              3'h3: delta_pair = 32'h03cc03cc;
              3'h4: delta_pair = 32'h03ca03ca;
              3'h5: delta_pair = 32'h03c703c7;
              3'h6: delta_pair = 32'h03c403c4;
              3'h7: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h03bf03bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03bd03bd;
              3'h2: delta_pair = 32'h03ba03ba;
              3'h3: delta_pair = 32'h03b803b8;
              3'h4: delta_pair = 32'h03b503b5;
              3'h5: delta_pair = 32'h03b303b3;
              3'h6: delta_pair = 32'h03b103b1;
              3'h7: delta_pair = 32'h03ae03ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h03ac03ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03aa03aa;
              3'h2: delta_pair = 32'h03a803a8;
              3'h3: delta_pair = 32'h03a503a5;
              3'h4: delta_pair = 32'h03a303a3;
              3'h5: delta_pair = 32'h03a103a1;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039d039d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h039b039b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03990399;
              3'h2: delta_pair = 32'h03980398;
              3'h3: delta_pair = 32'h03960396;
              3'h4: delta_pair = 32'h03940394;
              3'h5: delta_pair = 32'h03920392;
              3'h6: delta_pair = 32'h03900390;
              3'h7: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h038d038d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h038b038b;
              3'h2: delta_pair = 32'h03890389;
              3'h3: delta_pair = 32'h03880388;
              3'h4: delta_pair = 32'h03860386;
              3'h5: delta_pair = 32'h03850385;
              3'h6: delta_pair = 32'h03830383;
              3'h7: delta_pair = 32'h03820382;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h76: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h06fd06fd;
              3'h5: delta_pair = 32'h06f906f9;
              3'h6: delta_pair = 32'h06f606f6;
              3'h7: delta_pair = 32'h06f206f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h06ef06ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06eb06eb;
              3'h2: delta_pair = 32'h06e806e8;
              3'h3: delta_pair = 32'h06e506e5;
              3'h4: delta_pair = 32'h06e106e1;
              3'h5: delta_pair = 32'h06de06de;
              3'h6: delta_pair = 32'h06db06db;
              3'h7: delta_pair = 32'h06d806d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h06d506d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06d206d2;
              3'h2: delta_pair = 32'h06cf06cf;
              3'h3: delta_pair = 32'h06cc06cc;
              3'h4: delta_pair = 32'h06ca06ca;
              3'h5: delta_pair = 32'h06c706c7;
              3'h6: delta_pair = 32'h06c406c4;
              3'h7: delta_pair = 32'h06c206c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h06bf06bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06bd06bd;
              3'h2: delta_pair = 32'h06ba06ba;
              3'h3: delta_pair = 32'h06b806b8;
              3'h4: delta_pair = 32'h06b506b5;
              3'h5: delta_pair = 32'h06b306b3;
              3'h6: delta_pair = 32'h06b106b1;
              3'h7: delta_pair = 32'h06ae06ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h06ac06ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06aa06aa;
              3'h2: delta_pair = 32'h06a806a8;
              3'h3: delta_pair = 32'h06a506a5;
              3'h4: delta_pair = 32'h06a306a3;
              3'h5: delta_pair = 32'h06a106a1;
              3'h6: delta_pair = 32'h069f069f;
              3'h7: delta_pair = 32'h069d069d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h069b069b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06990699;
              3'h2: delta_pair = 32'h06980698;
              3'h3: delta_pair = 32'h06960696;
              3'h4: delta_pair = 32'h06940694;
              3'h5: delta_pair = 32'h06920692;
              3'h6: delta_pair = 32'h06900690;
              3'h7: delta_pair = 32'h068f068f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h068d068d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h068b068b;
              3'h2: delta_pair = 32'h06890689;
              3'h3: delta_pair = 32'h06880688;
              3'h4: delta_pair = 32'h06860686;
              3'h5: delta_pair = 32'h06850685;
              3'h6: delta_pair = 32'h06830683;
              3'h7: delta_pair = 32'h06820682;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h77: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h78: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03fa03fa;
              3'h2: delta_pair = 32'h03f403f4;
              3'h3: delta_pair = 32'h03ef03ef;
              3'h4: delta_pair = 32'h03e903e9;
              3'h5: delta_pair = 32'h03e403e4;
              3'h6: delta_pair = 32'h03df03df;
              3'h7: delta_pair = 32'h03da03da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d103d1;
              3'h2: delta_pair = 32'h03cc03cc;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03c403c4;
              3'h5: delta_pair = 32'h03c003c0;
              3'h6: delta_pair = 32'h03bc03bc;
              3'h7: delta_pair = 32'h03b803b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h03b403b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03b003b0;
              3'h2: delta_pair = 32'h03ad03ad;
              3'h3: delta_pair = 32'h03a903a9;
              3'h4: delta_pair = 32'h03a603a6;
              3'h5: delta_pair = 32'h03a203a2;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039c039c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h03990399;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03960396;
              3'h2: delta_pair = 32'h03930393;
              3'h3: delta_pair = 32'h03900390;
              3'h4: delta_pair = 32'h038d038d;
              3'h5: delta_pair = 32'h038b038b;
              3'h6: delta_pair = 32'h03880388;
              3'h7: delta_pair = 32'h03860386;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h03830383;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03810381;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h79: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h0f7d0f7d;
              3'h3: delta_pair = 32'h0f780f78;
              3'h4: delta_pair = 32'h0f730f73;
              3'h5: delta_pair = 32'h0f6f0f6f;
              3'h6: delta_pair = 32'h0f6b0f6b;
              3'h7: delta_pair = 32'h0f670f67;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h0f620f62;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f5e0f5e;
              3'h2: delta_pair = 32'h0f5b0f5b;
              3'h3: delta_pair = 32'h0f570f57;
              3'h4: delta_pair = 32'h0f530f53;
              3'h5: delta_pair = 32'h0f4f0f4f;
              3'h6: delta_pair = 32'h0f4c0f4c;
              3'h7: delta_pair = 32'h0f480f48;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h0f450f45;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f420f42;
              3'h2: delta_pair = 32'h0f3e0f3e;
              3'h3: delta_pair = 32'h0f3b0f3b;
              3'h4: delta_pair = 32'h0f380f38;
              3'h5: delta_pair = 32'h0f350f35;
              3'h6: delta_pair = 32'h0f320f32;
              3'h7: delta_pair = 32'h0f2f0f2f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h0f2c0f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f2a0f2a;
              3'h2: delta_pair = 32'h0f270f27;
              3'h3: delta_pair = 32'h0f240f24;
              3'h4: delta_pair = 32'h0f220f22;
              3'h5: delta_pair = 32'h0f1f0f1f;
              3'h6: delta_pair = 32'h0f1d0f1d;
              3'h7: delta_pair = 32'h0f1a0f1a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h0f180f18;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f150f15;
              3'h2: delta_pair = 32'h0f130f13;
              3'h3: delta_pair = 32'h0f110f11;
              3'h4: delta_pair = 32'h0f0f0f0f;
              3'h5: delta_pair = 32'h0f0c0f0c;
              3'h6: delta_pair = 32'h0f0a0f0a;
              3'h7: delta_pair = 32'h0f080f08;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h0f060f06;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f040f04;
              3'h2: delta_pair = 32'h0f020f02;
              3'h3: delta_pair = 32'h0f000f00;
              3'h4: delta_pair = 32'h0ffd0ffd;
              3'h5: delta_pair = 32'h0ff90ff9;
              3'h6: delta_pair = 32'h0ff60ff6;
              3'h7: delta_pair = 32'h0ff20ff2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h0fef0fef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0feb0feb;
              3'h2: delta_pair = 32'h0fe80fe8;
              3'h3: delta_pair = 32'h0fe50fe5;
              3'h4: delta_pair = 32'h0fe10fe1;
              3'h5: delta_pair = 32'h0fde0fde;
              3'h6: delta_pair = 32'h0fdb0fdb;
              3'h7: delta_pair = 32'h0fd80fd8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h0fd50fd5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fd20fd2;
              3'h2: delta_pair = 32'h0fcf0fcf;
              3'h3: delta_pair = 32'h0fcc0fcc;
              3'h4: delta_pair = 32'h0fca0fca;
              3'h5: delta_pair = 32'h0fc70fc7;
              3'h6: delta_pair = 32'h0fc40fc4;
              3'h7: delta_pair = 32'h0fc20fc2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h0fbf0fbf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fbd0fbd;
              3'h2: delta_pair = 32'h0fba0fba;
              3'h3: delta_pair = 32'h0fb80fb8;
              3'h4: delta_pair = 32'h0fb50fb5;
              3'h5: delta_pair = 32'h0fb30fb3;
              3'h6: delta_pair = 32'h0fb10fb1;
              3'h7: delta_pair = 32'h0fae0fae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h0fac0fac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0faa0faa;
              3'h2: delta_pair = 32'h0fa80fa8;
              3'h3: delta_pair = 32'h0fa50fa5;
              3'h4: delta_pair = 32'h0fa30fa3;
              3'h5: delta_pair = 32'h0fa10fa1;
              3'h6: delta_pair = 32'h0f9f0f9f;
              3'h7: delta_pair = 32'h0f9d0f9d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h0f9b0f9b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f990f99;
              3'h2: delta_pair = 32'h0f980f98;
              3'h3: delta_pair = 32'h0f960f96;
              3'h4: delta_pair = 32'h0f940f94;
              3'h5: delta_pair = 32'h0f920f92;
              3'h6: delta_pair = 32'h0f900f90;
              3'h7: delta_pair = 32'h0f8f0f8f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h0f8d0f8d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f8b0f8b;
              3'h2: delta_pair = 32'h0f890f89;
              3'h3: delta_pair = 32'h0f880f88;
              3'h4: delta_pair = 32'h0f860f86;
              3'h5: delta_pair = 32'h0f850f85;
              3'h6: delta_pair = 32'h0f830f83;
              3'h7: delta_pair = 32'h0f820f82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7a: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7b: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7c: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07fa07fa;
              3'h2: delta_pair = 32'h07f407f4;
              3'h3: delta_pair = 32'h07ef07ef;
              3'h4: delta_pair = 32'h07e907e9;
              3'h5: delta_pair = 32'h07e407e4;
              3'h6: delta_pair = 32'h07df07df;
              3'h7: delta_pair = 32'h07da07da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h07d507d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07d107d1;
              3'h2: delta_pair = 32'h07cc07cc;
              3'h3: delta_pair = 32'h07c807c8;
              3'h4: delta_pair = 32'h07c407c4;
              3'h5: delta_pair = 32'h07c007c0;
              3'h6: delta_pair = 32'h07bc07bc;
              3'h7: delta_pair = 32'h07b807b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h07b407b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07b007b0;
              3'h2: delta_pair = 32'h07ad07ad;
              3'h3: delta_pair = 32'h07a907a9;
              3'h4: delta_pair = 32'h07a607a6;
              3'h5: delta_pair = 32'h07a207a2;
              3'h6: delta_pair = 32'h079f079f;
              3'h7: delta_pair = 32'h079c079c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h07990799;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07960796;
              3'h2: delta_pair = 32'h07930793;
              3'h3: delta_pair = 32'h07900790;
              3'h4: delta_pair = 32'h078d078d;
              3'h5: delta_pair = 32'h078b078b;
              3'h6: delta_pair = 32'h07880788;
              3'h7: delta_pair = 32'h07860786;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h07830783;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07810781;
              3'h2: delta_pair = 32'h077d077d;
              3'h3: delta_pair = 32'h07780778;
              3'h4: delta_pair = 32'h07730773;
              3'h5: delta_pair = 32'h076f076f;
              3'h6: delta_pair = 32'h076b076b;
              3'h7: delta_pair = 32'h07670767;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h07620762;
            case (mant_lo3)
              3'h1: delta_pair = 32'h075e075e;
              3'h2: delta_pair = 32'h075b075b;
              3'h3: delta_pair = 32'h07570757;
              3'h4: delta_pair = 32'h07530753;
              3'h5: delta_pair = 32'h074f074f;
              3'h6: delta_pair = 32'h074c074c;
              3'h7: delta_pair = 32'h07480748;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h07450745;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07420742;
              3'h2: delta_pair = 32'h073e073e;
              3'h3: delta_pair = 32'h073b073b;
              3'h4: delta_pair = 32'h07380738;
              3'h5: delta_pair = 32'h07350735;
              3'h6: delta_pair = 32'h07320732;
              3'h7: delta_pair = 32'h072f072f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072a072a;
              3'h2: delta_pair = 32'h07270727;
              3'h3: delta_pair = 32'h07240724;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h071f071f;
              3'h6: delta_pair = 32'h071d071d;
              3'h7: delta_pair = 32'h071a071a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h07180718;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07150715;
              3'h2: delta_pair = 32'h07130713;
              3'h3: delta_pair = 32'h07110711;
              3'h4: delta_pair = 32'h070f070f;
              3'h5: delta_pair = 32'h070c070c;
              3'h6: delta_pair = 32'h070a070a;
              3'h7: delta_pair = 32'h07080708;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h07060706;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07040704;
              3'h2: delta_pair = 32'h07020702;
              3'h3: delta_pair = 32'h07000700;
              3'h4: delta_pair = 32'h06fd06fd;
              3'h5: delta_pair = 32'h06f906f9;
              3'h6: delta_pair = 32'h06f606f6;
              3'h7: delta_pair = 32'h06f206f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h06ef06ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06eb06eb;
              3'h2: delta_pair = 32'h06e806e8;
              3'h3: delta_pair = 32'h06e506e5;
              3'h4: delta_pair = 32'h06e106e1;
              3'h5: delta_pair = 32'h06de06de;
              3'h6: delta_pair = 32'h06db06db;
              3'h7: delta_pair = 32'h06d806d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h06d506d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06d206d2;
              3'h2: delta_pair = 32'h06cf06cf;
              3'h3: delta_pair = 32'h06cc06cc;
              3'h4: delta_pair = 32'h06ca06ca;
              3'h5: delta_pair = 32'h06c706c7;
              3'h6: delta_pair = 32'h06c406c4;
              3'h7: delta_pair = 32'h06c206c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h06bf06bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06bd06bd;
              3'h2: delta_pair = 32'h06ba06ba;
              3'h3: delta_pair = 32'h06b806b8;
              3'h4: delta_pair = 32'h06b506b5;
              3'h5: delta_pair = 32'h06b306b3;
              3'h6: delta_pair = 32'h06b106b1;
              3'h7: delta_pair = 32'h06ae06ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h06ac06ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06aa06aa;
              3'h2: delta_pair = 32'h06a806a8;
              3'h3: delta_pair = 32'h06a506a5;
              3'h4: delta_pair = 32'h06a306a3;
              3'h5: delta_pair = 32'h06a106a1;
              3'h6: delta_pair = 32'h069f069f;
              3'h7: delta_pair = 32'h069d069d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h069b069b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06990699;
              3'h2: delta_pair = 32'h06980698;
              3'h3: delta_pair = 32'h06960696;
              3'h4: delta_pair = 32'h06940694;
              3'h5: delta_pair = 32'h06920692;
              3'h6: delta_pair = 32'h06900690;
              3'h7: delta_pair = 32'h068f068f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h068d068d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h068b068b;
              3'h2: delta_pair = 32'h06890689;
              3'h3: delta_pair = 32'h06880688;
              3'h4: delta_pair = 32'h06860686;
              3'h5: delta_pair = 32'h06850685;
              3'h6: delta_pair = 32'h06830683;
              3'h7: delta_pair = 32'h06820682;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7d: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h03fd03fd;
              3'h5: delta_pair = 32'h03f903f9;
              3'h6: delta_pair = 32'h03f603f6;
              3'h7: delta_pair = 32'h03f203f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03ef03ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03eb03eb;
              3'h2: delta_pair = 32'h03e803e8;
              3'h3: delta_pair = 32'h03e503e5;
              3'h4: delta_pair = 32'h03e103e1;
              3'h5: delta_pair = 32'h03de03de;
              3'h6: delta_pair = 32'h03db03db;
              3'h7: delta_pair = 32'h03d803d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d203d2;
              3'h2: delta_pair = 32'h03cf03cf;
              3'h3: delta_pair = 32'h03cc03cc;
              3'h4: delta_pair = 32'h03ca03ca;
              3'h5: delta_pair = 32'h03c703c7;
              3'h6: delta_pair = 32'h03c403c4;
              3'h7: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h03bf03bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03bd03bd;
              3'h2: delta_pair = 32'h03ba03ba;
              3'h3: delta_pair = 32'h03b803b8;
              3'h4: delta_pair = 32'h03b503b5;
              3'h5: delta_pair = 32'h03b303b3;
              3'h6: delta_pair = 32'h03b103b1;
              3'h7: delta_pair = 32'h03ae03ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h03ac03ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03aa03aa;
              3'h2: delta_pair = 32'h03a803a8;
              3'h3: delta_pair = 32'h03a503a5;
              3'h4: delta_pair = 32'h03a303a3;
              3'h5: delta_pair = 32'h03a103a1;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039d039d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h039b039b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03990399;
              3'h2: delta_pair = 32'h03980398;
              3'h3: delta_pair = 32'h03960396;
              3'h4: delta_pair = 32'h03940394;
              3'h5: delta_pair = 32'h03920392;
              3'h6: delta_pair = 32'h03900390;
              3'h7: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h038d038d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h038b038b;
              3'h2: delta_pair = 32'h03890389;
              3'h3: delta_pair = 32'h03880388;
              3'h4: delta_pair = 32'h03860386;
              3'h5: delta_pair = 32'h03850385;
              3'h6: delta_pair = 32'h03830383;
              3'h7: delta_pair = 32'h03820382;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7e: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h7efd7efd;
              3'h5: delta_pair = 32'h7ef97ef9;
              3'h6: delta_pair = 32'h7ef67ef6;
              3'h7: delta_pair = 32'h7ef27ef2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h7eef7eef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7eeb7eeb;
              3'h2: delta_pair = 32'h7ee87ee8;
              3'h3: delta_pair = 32'h7ee57ee5;
              3'h4: delta_pair = 32'h7ee17ee1;
              3'h5: delta_pair = 32'h7ede7ede;
              3'h6: delta_pair = 32'h7edb7edb;
              3'h7: delta_pair = 32'h7ed87ed8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h7ed57ed5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7ed27ed2;
              3'h2: delta_pair = 32'h7ecf7ecf;
              3'h3: delta_pair = 32'h7ecc7ecc;
              3'h4: delta_pair = 32'h7eca7eca;
              3'h5: delta_pair = 32'h7ec77ec7;
              3'h6: delta_pair = 32'h7ec47ec4;
              3'h7: delta_pair = 32'h7ec27ec2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h7ebf7ebf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7ebd7ebd;
              3'h2: delta_pair = 32'h7eba7eba;
              3'h3: delta_pair = 32'h7eb87eb8;
              3'h4: delta_pair = 32'h7eb57eb5;
              3'h5: delta_pair = 32'h7eb37eb3;
              3'h6: delta_pair = 32'h7eb17eb1;
              3'h7: delta_pair = 32'h7eae7eae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h7eac7eac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7eaa7eaa;
              3'h2: delta_pair = 32'h7ea87ea8;
              3'h3: delta_pair = 32'h7ea57ea5;
              3'h4: delta_pair = 32'h7ea37ea3;
              3'h5: delta_pair = 32'h7ea17ea1;
              3'h6: delta_pair = 32'h7e9f7e9f;
              3'h7: delta_pair = 32'h7e9d7e9d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h7e9b7e9b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7e997e99;
              3'h2: delta_pair = 32'h7e987e98;
              3'h3: delta_pair = 32'h7e967e96;
              3'h4: delta_pair = 32'h7e947e94;
              3'h5: delta_pair = 32'h7e927e92;
              3'h6: delta_pair = 32'h7e907e90;
              3'h7: delta_pair = 32'h7e8f7e8f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h7e8d7e8d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7e8b7e8b;
              3'h2: delta_pair = 32'h7e897e89;
              3'h3: delta_pair = 32'h7e887e88;
              3'h4: delta_pair = 32'h7e867e86;
              3'h5: delta_pair = 32'h7e857e85;
              3'h6: delta_pair = 32'h7e837e83;
              3'h7: delta_pair = 32'h7e827e82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7f: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h80: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03fa03fa;
              3'h2: delta_pair = 32'h03f403f4;
              3'h3: delta_pair = 32'h03ef03ef;
              3'h4: delta_pair = 32'h03e903e9;
              3'h5: delta_pair = 32'h03e403e4;
              3'h6: delta_pair = 32'h03df03df;
              3'h7: delta_pair = 32'h03da03da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d103d1;
              3'h2: delta_pair = 32'h03cc03cc;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03c403c4;
              3'h5: delta_pair = 32'h03c003c0;
              3'h6: delta_pair = 32'h03bc03bc;
              3'h7: delta_pair = 32'h03b803b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h03b403b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03b003b0;
              3'h2: delta_pair = 32'h03ad03ad;
              3'h3: delta_pair = 32'h03a903a9;
              3'h4: delta_pair = 32'h03a603a6;
              3'h5: delta_pair = 32'h03a203a2;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039c039c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h03990399;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03960396;
              3'h2: delta_pair = 32'h03930393;
              3'h3: delta_pair = 32'h03900390;
              3'h4: delta_pair = 32'h038d038d;
              3'h5: delta_pair = 32'h038b038b;
              3'h6: delta_pair = 32'h03880388;
              3'h7: delta_pair = 32'h03860386;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h03830383;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03810381;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h81: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h077d077d;
              3'h3: delta_pair = 32'h07780778;
              3'h4: delta_pair = 32'h07730773;
              3'h5: delta_pair = 32'h076f076f;
              3'h6: delta_pair = 32'h076b076b;
              3'h7: delta_pair = 32'h07670767;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h07620762;
            case (mant_lo3)
              3'h1: delta_pair = 32'h075e075e;
              3'h2: delta_pair = 32'h075b075b;
              3'h3: delta_pair = 32'h07570757;
              3'h4: delta_pair = 32'h07530753;
              3'h5: delta_pair = 32'h074f074f;
              3'h6: delta_pair = 32'h074c074c;
              3'h7: delta_pair = 32'h07480748;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h07450745;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07420742;
              3'h2: delta_pair = 32'h073e073e;
              3'h3: delta_pair = 32'h073b073b;
              3'h4: delta_pair = 32'h07380738;
              3'h5: delta_pair = 32'h07350735;
              3'h6: delta_pair = 32'h07320732;
              3'h7: delta_pair = 32'h072f072f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072a072a;
              3'h2: delta_pair = 32'h07270727;
              3'h3: delta_pair = 32'h07240724;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h071f071f;
              3'h6: delta_pair = 32'h071d071d;
              3'h7: delta_pair = 32'h071a071a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h07180718;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07150715;
              3'h2: delta_pair = 32'h07130713;
              3'h3: delta_pair = 32'h07110711;
              3'h4: delta_pair = 32'h070f070f;
              3'h5: delta_pair = 32'h070c070c;
              3'h6: delta_pair = 32'h070a070a;
              3'h7: delta_pair = 32'h07080708;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h07060706;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07040704;
              3'h2: delta_pair = 32'h07020702;
              3'h3: delta_pair = 32'h07000700;
              3'h4: delta_pair = 32'h07fd07fd;
              3'h5: delta_pair = 32'h07f907f9;
              3'h6: delta_pair = 32'h07f607f6;
              3'h7: delta_pair = 32'h07f207f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h07ef07ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07eb07eb;
              3'h2: delta_pair = 32'h07e807e8;
              3'h3: delta_pair = 32'h07e507e5;
              3'h4: delta_pair = 32'h07e107e1;
              3'h5: delta_pair = 32'h07de07de;
              3'h6: delta_pair = 32'h07db07db;
              3'h7: delta_pair = 32'h07d807d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h07d507d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07d207d2;
              3'h2: delta_pair = 32'h07cf07cf;
              3'h3: delta_pair = 32'h07cc07cc;
              3'h4: delta_pair = 32'h07ca07ca;
              3'h5: delta_pair = 32'h07c707c7;
              3'h6: delta_pair = 32'h07c407c4;
              3'h7: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h07bf07bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07bd07bd;
              3'h2: delta_pair = 32'h07ba07ba;
              3'h3: delta_pair = 32'h07b807b8;
              3'h4: delta_pair = 32'h07b507b5;
              3'h5: delta_pair = 32'h07b307b3;
              3'h6: delta_pair = 32'h07b107b1;
              3'h7: delta_pair = 32'h07ae07ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h07ac07ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07aa07aa;
              3'h2: delta_pair = 32'h07a807a8;
              3'h3: delta_pair = 32'h07a507a5;
              3'h4: delta_pair = 32'h07a307a3;
              3'h5: delta_pair = 32'h07a107a1;
              3'h6: delta_pair = 32'h079f079f;
              3'h7: delta_pair = 32'h079d079d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h079b079b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07990799;
              3'h2: delta_pair = 32'h07980798;
              3'h3: delta_pair = 32'h07960796;
              3'h4: delta_pair = 32'h07940794;
              3'h5: delta_pair = 32'h07920792;
              3'h6: delta_pair = 32'h07900790;
              3'h7: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h078d078d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h078b078b;
              3'h2: delta_pair = 32'h07890789;
              3'h3: delta_pair = 32'h07880788;
              3'h4: delta_pair = 32'h07860786;
              3'h5: delta_pair = 32'h07850785;
              3'h6: delta_pair = 32'h07830783;
              3'h7: delta_pair = 32'h07820782;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h82: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h83: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h84: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0ffa0ffa;
              3'h2: delta_pair = 32'h0ff40ff4;
              3'h3: delta_pair = 32'h0fef0fef;
              3'h4: delta_pair = 32'h0fe90fe9;
              3'h5: delta_pair = 32'h0fe40fe4;
              3'h6: delta_pair = 32'h0fdf0fdf;
              3'h7: delta_pair = 32'h0fda0fda;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h0fd50fd5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fd10fd1;
              3'h2: delta_pair = 32'h0fcc0fcc;
              3'h3: delta_pair = 32'h0fc80fc8;
              3'h4: delta_pair = 32'h0fc40fc4;
              3'h5: delta_pair = 32'h0fc00fc0;
              3'h6: delta_pair = 32'h0fbc0fbc;
              3'h7: delta_pair = 32'h0fb80fb8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h0fb40fb4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fb00fb0;
              3'h2: delta_pair = 32'h0fad0fad;
              3'h3: delta_pair = 32'h0fa90fa9;
              3'h4: delta_pair = 32'h0fa60fa6;
              3'h5: delta_pair = 32'h0fa20fa2;
              3'h6: delta_pair = 32'h0f9f0f9f;
              3'h7: delta_pair = 32'h0f9c0f9c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h0f990f99;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f960f96;
              3'h2: delta_pair = 32'h0f930f93;
              3'h3: delta_pair = 32'h0f900f90;
              3'h4: delta_pair = 32'h0f8d0f8d;
              3'h5: delta_pair = 32'h0f8b0f8b;
              3'h6: delta_pair = 32'h0f880f88;
              3'h7: delta_pair = 32'h0f860f86;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h0f830f83;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f810f81;
              3'h2: delta_pair = 32'h0f7d0f7d;
              3'h3: delta_pair = 32'h0f780f78;
              3'h4: delta_pair = 32'h0f730f73;
              3'h5: delta_pair = 32'h0f6f0f6f;
              3'h6: delta_pair = 32'h0f6b0f6b;
              3'h7: delta_pair = 32'h0f670f67;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h0f620f62;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f5e0f5e;
              3'h2: delta_pair = 32'h0f5b0f5b;
              3'h3: delta_pair = 32'h0f570f57;
              3'h4: delta_pair = 32'h0f530f53;
              3'h5: delta_pair = 32'h0f4f0f4f;
              3'h6: delta_pair = 32'h0f4c0f4c;
              3'h7: delta_pair = 32'h0f480f48;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h0f450f45;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f420f42;
              3'h2: delta_pair = 32'h0f3e0f3e;
              3'h3: delta_pair = 32'h0f3b0f3b;
              3'h4: delta_pair = 32'h0f380f38;
              3'h5: delta_pair = 32'h0f350f35;
              3'h6: delta_pair = 32'h0f320f32;
              3'h7: delta_pair = 32'h0f2f0f2f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h0f2c0f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f2a0f2a;
              3'h2: delta_pair = 32'h0f270f27;
              3'h3: delta_pair = 32'h0f240f24;
              3'h4: delta_pair = 32'h0f220f22;
              3'h5: delta_pair = 32'h0f1f0f1f;
              3'h6: delta_pair = 32'h0f1d0f1d;
              3'h7: delta_pair = 32'h0f1a0f1a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h0f180f18;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f150f15;
              3'h2: delta_pair = 32'h0f130f13;
              3'h3: delta_pair = 32'h0f110f11;
              3'h4: delta_pair = 32'h0f0f0f0f;
              3'h5: delta_pair = 32'h0f0c0f0c;
              3'h6: delta_pair = 32'h0f0a0f0a;
              3'h7: delta_pair = 32'h0f080f08;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h0f060f06;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f040f04;
              3'h2: delta_pair = 32'h0f020f02;
              3'h3: delta_pair = 32'h0f000f00;
              3'h4: delta_pair = 32'h0efd0efd;
              3'h5: delta_pair = 32'h0ef90ef9;
              3'h6: delta_pair = 32'h0ef60ef6;
              3'h7: delta_pair = 32'h0ef20ef2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h0eef0eef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0eeb0eeb;
              3'h2: delta_pair = 32'h0ee80ee8;
              3'h3: delta_pair = 32'h0ee50ee5;
              3'h4: delta_pair = 32'h0ee10ee1;
              3'h5: delta_pair = 32'h0ede0ede;
              3'h6: delta_pair = 32'h0edb0edb;
              3'h7: delta_pair = 32'h0ed80ed8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h0ed50ed5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0ed20ed2;
              3'h2: delta_pair = 32'h0ecf0ecf;
              3'h3: delta_pair = 32'h0ecc0ecc;
              3'h4: delta_pair = 32'h0eca0eca;
              3'h5: delta_pair = 32'h0ec70ec7;
              3'h6: delta_pair = 32'h0ec40ec4;
              3'h7: delta_pair = 32'h0ec20ec2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h0ebf0ebf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0ebd0ebd;
              3'h2: delta_pair = 32'h0eba0eba;
              3'h3: delta_pair = 32'h0eb80eb8;
              3'h4: delta_pair = 32'h0eb50eb5;
              3'h5: delta_pair = 32'h0eb30eb3;
              3'h6: delta_pair = 32'h0eb10eb1;
              3'h7: delta_pair = 32'h0eae0eae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h0eac0eac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0eaa0eaa;
              3'h2: delta_pair = 32'h0ea80ea8;
              3'h3: delta_pair = 32'h0ea50ea5;
              3'h4: delta_pair = 32'h0ea30ea3;
              3'h5: delta_pair = 32'h0ea10ea1;
              3'h6: delta_pair = 32'h0e9f0e9f;
              3'h7: delta_pair = 32'h0e9d0e9d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h0e9b0e9b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0e990e99;
              3'h2: delta_pair = 32'h0e980e98;
              3'h3: delta_pair = 32'h0e960e96;
              3'h4: delta_pair = 32'h0e940e94;
              3'h5: delta_pair = 32'h0e920e92;
              3'h6: delta_pair = 32'h0e900e90;
              3'h7: delta_pair = 32'h0e8f0e8f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h0e8d0e8d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0e8b0e8b;
              3'h2: delta_pair = 32'h0e890e89;
              3'h3: delta_pair = 32'h0e880e88;
              3'h4: delta_pair = 32'h0e860e86;
              3'h5: delta_pair = 32'h0e850e85;
              3'h6: delta_pair = 32'h0e830e83;
              3'h7: delta_pair = 32'h0e820e82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h85: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h03fd03fd;
              3'h5: delta_pair = 32'h03f903f9;
              3'h6: delta_pair = 32'h03f603f6;
              3'h7: delta_pair = 32'h03f203f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03ef03ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03eb03eb;
              3'h2: delta_pair = 32'h03e803e8;
              3'h3: delta_pair = 32'h03e503e5;
              3'h4: delta_pair = 32'h03e103e1;
              3'h5: delta_pair = 32'h03de03de;
              3'h6: delta_pair = 32'h03db03db;
              3'h7: delta_pair = 32'h03d803d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d203d2;
              3'h2: delta_pair = 32'h03cf03cf;
              3'h3: delta_pair = 32'h03cc03cc;
              3'h4: delta_pair = 32'h03ca03ca;
              3'h5: delta_pair = 32'h03c703c7;
              3'h6: delta_pair = 32'h03c403c4;
              3'h7: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h03bf03bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03bd03bd;
              3'h2: delta_pair = 32'h03ba03ba;
              3'h3: delta_pair = 32'h03b803b8;
              3'h4: delta_pair = 32'h03b503b5;
              3'h5: delta_pair = 32'h03b303b3;
              3'h6: delta_pair = 32'h03b103b1;
              3'h7: delta_pair = 32'h03ae03ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h03ac03ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03aa03aa;
              3'h2: delta_pair = 32'h03a803a8;
              3'h3: delta_pair = 32'h03a503a5;
              3'h4: delta_pair = 32'h03a303a3;
              3'h5: delta_pair = 32'h03a103a1;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039d039d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h039b039b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03990399;
              3'h2: delta_pair = 32'h03980398;
              3'h3: delta_pair = 32'h03960396;
              3'h4: delta_pair = 32'h03940394;
              3'h5: delta_pair = 32'h03920392;
              3'h6: delta_pair = 32'h03900390;
              3'h7: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h038d038d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h038b038b;
              3'h2: delta_pair = 32'h03890389;
              3'h3: delta_pair = 32'h03880388;
              3'h4: delta_pair = 32'h03860386;
              3'h5: delta_pair = 32'h03850385;
              3'h6: delta_pair = 32'h03830383;
              3'h7: delta_pair = 32'h03820382;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h86: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h06fd06fd;
              3'h5: delta_pair = 32'h06f906f9;
              3'h6: delta_pair = 32'h06f606f6;
              3'h7: delta_pair = 32'h06f206f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h06ef06ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06eb06eb;
              3'h2: delta_pair = 32'h06e806e8;
              3'h3: delta_pair = 32'h06e506e5;
              3'h4: delta_pair = 32'h06e106e1;
              3'h5: delta_pair = 32'h06de06de;
              3'h6: delta_pair = 32'h06db06db;
              3'h7: delta_pair = 32'h06d806d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h06d506d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06d206d2;
              3'h2: delta_pair = 32'h06cf06cf;
              3'h3: delta_pair = 32'h06cc06cc;
              3'h4: delta_pair = 32'h06ca06ca;
              3'h5: delta_pair = 32'h06c706c7;
              3'h6: delta_pair = 32'h06c406c4;
              3'h7: delta_pair = 32'h06c206c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h06bf06bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06bd06bd;
              3'h2: delta_pair = 32'h06ba06ba;
              3'h3: delta_pair = 32'h06b806b8;
              3'h4: delta_pair = 32'h06b506b5;
              3'h5: delta_pair = 32'h06b306b3;
              3'h6: delta_pair = 32'h06b106b1;
              3'h7: delta_pair = 32'h06ae06ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h06ac06ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06aa06aa;
              3'h2: delta_pair = 32'h06a806a8;
              3'h3: delta_pair = 32'h06a506a5;
              3'h4: delta_pair = 32'h06a306a3;
              3'h5: delta_pair = 32'h06a106a1;
              3'h6: delta_pair = 32'h069f069f;
              3'h7: delta_pair = 32'h069d069d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h069b069b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06990699;
              3'h2: delta_pair = 32'h06980698;
              3'h3: delta_pair = 32'h06960696;
              3'h4: delta_pair = 32'h06940694;
              3'h5: delta_pair = 32'h06920692;
              3'h6: delta_pair = 32'h06900690;
              3'h7: delta_pair = 32'h068f068f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h068d068d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h068b068b;
              3'h2: delta_pair = 32'h06890689;
              3'h3: delta_pair = 32'h06880688;
              3'h4: delta_pair = 32'h06860686;
              3'h5: delta_pair = 32'h06850685;
              3'h6: delta_pair = 32'h06830683;
              3'h7: delta_pair = 32'h06820682;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h87: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h88: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03fa03fa;
              3'h2: delta_pair = 32'h03f403f4;
              3'h3: delta_pair = 32'h03ef03ef;
              3'h4: delta_pair = 32'h03e903e9;
              3'h5: delta_pair = 32'h03e403e4;
              3'h6: delta_pair = 32'h03df03df;
              3'h7: delta_pair = 32'h03da03da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d103d1;
              3'h2: delta_pair = 32'h03cc03cc;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03c403c4;
              3'h5: delta_pair = 32'h03c003c0;
              3'h6: delta_pair = 32'h03bc03bc;
              3'h7: delta_pair = 32'h03b803b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h03b403b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03b003b0;
              3'h2: delta_pair = 32'h03ad03ad;
              3'h3: delta_pair = 32'h03a903a9;
              3'h4: delta_pair = 32'h03a603a6;
              3'h5: delta_pair = 32'h03a203a2;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039c039c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h03990399;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03960396;
              3'h2: delta_pair = 32'h03930393;
              3'h3: delta_pair = 32'h03900390;
              3'h4: delta_pair = 32'h038d038d;
              3'h5: delta_pair = 32'h038b038b;
              3'h6: delta_pair = 32'h03880388;
              3'h7: delta_pair = 32'h03860386;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h03830383;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03810381;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h89: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h1f7d1f7d;
              3'h3: delta_pair = 32'h1f781f78;
              3'h4: delta_pair = 32'h1f731f73;
              3'h5: delta_pair = 32'h1f6f1f6f;
              3'h6: delta_pair = 32'h1f6b1f6b;
              3'h7: delta_pair = 32'h1f671f67;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h1f621f62;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f5e1f5e;
              3'h2: delta_pair = 32'h1f5b1f5b;
              3'h3: delta_pair = 32'h1f571f57;
              3'h4: delta_pair = 32'h1f531f53;
              3'h5: delta_pair = 32'h1f4f1f4f;
              3'h6: delta_pair = 32'h1f4c1f4c;
              3'h7: delta_pair = 32'h1f481f48;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h1f451f45;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f421f42;
              3'h2: delta_pair = 32'h1f3e1f3e;
              3'h3: delta_pair = 32'h1f3b1f3b;
              3'h4: delta_pair = 32'h1f381f38;
              3'h5: delta_pair = 32'h1f351f35;
              3'h6: delta_pair = 32'h1f321f32;
              3'h7: delta_pair = 32'h1f2f1f2f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h1f2c1f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f2a1f2a;
              3'h2: delta_pair = 32'h1f271f27;
              3'h3: delta_pair = 32'h1f241f24;
              3'h4: delta_pair = 32'h1f221f22;
              3'h5: delta_pair = 32'h1f1f1f1f;
              3'h6: delta_pair = 32'h1f1d1f1d;
              3'h7: delta_pair = 32'h1f1a1f1a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h1f181f18;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f151f15;
              3'h2: delta_pair = 32'h1f131f13;
              3'h3: delta_pair = 32'h1f111f11;
              3'h4: delta_pair = 32'h1f0f1f0f;
              3'h5: delta_pair = 32'h1f0c1f0c;
              3'h6: delta_pair = 32'h1f0a1f0a;
              3'h7: delta_pair = 32'h1f081f08;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h1f061f06;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f041f04;
              3'h2: delta_pair = 32'h1f021f02;
              3'h3: delta_pair = 32'h1f001f00;
              3'h4: delta_pair = 32'h1ffd1ffd;
              3'h5: delta_pair = 32'h1ff91ff9;
              3'h6: delta_pair = 32'h1ff61ff6;
              3'h7: delta_pair = 32'h1ff21ff2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h1fef1fef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1feb1feb;
              3'h2: delta_pair = 32'h1fe81fe8;
              3'h3: delta_pair = 32'h1fe51fe5;
              3'h4: delta_pair = 32'h1fe11fe1;
              3'h5: delta_pair = 32'h1fde1fde;
              3'h6: delta_pair = 32'h1fdb1fdb;
              3'h7: delta_pair = 32'h1fd81fd8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h1fd51fd5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1fd21fd2;
              3'h2: delta_pair = 32'h1fcf1fcf;
              3'h3: delta_pair = 32'h1fcc1fcc;
              3'h4: delta_pair = 32'h1fca1fca;
              3'h5: delta_pair = 32'h1fc71fc7;
              3'h6: delta_pair = 32'h1fc41fc4;
              3'h7: delta_pair = 32'h1fc21fc2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h1fbf1fbf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1fbd1fbd;
              3'h2: delta_pair = 32'h1fba1fba;
              3'h3: delta_pair = 32'h1fb81fb8;
              3'h4: delta_pair = 32'h1fb51fb5;
              3'h5: delta_pair = 32'h1fb31fb3;
              3'h6: delta_pair = 32'h1fb11fb1;
              3'h7: delta_pair = 32'h1fae1fae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h1fac1fac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1faa1faa;
              3'h2: delta_pair = 32'h1fa81fa8;
              3'h3: delta_pair = 32'h1fa51fa5;
              3'h4: delta_pair = 32'h1fa31fa3;
              3'h5: delta_pair = 32'h1fa11fa1;
              3'h6: delta_pair = 32'h1f9f1f9f;
              3'h7: delta_pair = 32'h1f9d1f9d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h1f9b1f9b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f991f99;
              3'h2: delta_pair = 32'h1f981f98;
              3'h3: delta_pair = 32'h1f961f96;
              3'h4: delta_pair = 32'h1f941f94;
              3'h5: delta_pair = 32'h1f921f92;
              3'h6: delta_pair = 32'h1f901f90;
              3'h7: delta_pair = 32'h1f8f1f8f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h1f8d1f8d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f8b1f8b;
              3'h2: delta_pair = 32'h1f891f89;
              3'h3: delta_pair = 32'h1f881f88;
              3'h4: delta_pair = 32'h1f861f86;
              3'h5: delta_pair = 32'h1f851f85;
              3'h6: delta_pair = 32'h1f831f83;
              3'h7: delta_pair = 32'h1f821f82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8a: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8b: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8c: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07fa07fa;
              3'h2: delta_pair = 32'h07f407f4;
              3'h3: delta_pair = 32'h07ef07ef;
              3'h4: delta_pair = 32'h07e907e9;
              3'h5: delta_pair = 32'h07e407e4;
              3'h6: delta_pair = 32'h07df07df;
              3'h7: delta_pair = 32'h07da07da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h07d507d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07d107d1;
              3'h2: delta_pair = 32'h07cc07cc;
              3'h3: delta_pair = 32'h07c807c8;
              3'h4: delta_pair = 32'h07c407c4;
              3'h5: delta_pair = 32'h07c007c0;
              3'h6: delta_pair = 32'h07bc07bc;
              3'h7: delta_pair = 32'h07b807b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h07b407b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07b007b0;
              3'h2: delta_pair = 32'h07ad07ad;
              3'h3: delta_pair = 32'h07a907a9;
              3'h4: delta_pair = 32'h07a607a6;
              3'h5: delta_pair = 32'h07a207a2;
              3'h6: delta_pair = 32'h079f079f;
              3'h7: delta_pair = 32'h079c079c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h07990799;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07960796;
              3'h2: delta_pair = 32'h07930793;
              3'h3: delta_pair = 32'h07900790;
              3'h4: delta_pair = 32'h078d078d;
              3'h5: delta_pair = 32'h078b078b;
              3'h6: delta_pair = 32'h07880788;
              3'h7: delta_pair = 32'h07860786;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h07830783;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07810781;
              3'h2: delta_pair = 32'h077d077d;
              3'h3: delta_pair = 32'h07780778;
              3'h4: delta_pair = 32'h07730773;
              3'h5: delta_pair = 32'h076f076f;
              3'h6: delta_pair = 32'h076b076b;
              3'h7: delta_pair = 32'h07670767;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h07620762;
            case (mant_lo3)
              3'h1: delta_pair = 32'h075e075e;
              3'h2: delta_pair = 32'h075b075b;
              3'h3: delta_pair = 32'h07570757;
              3'h4: delta_pair = 32'h07530753;
              3'h5: delta_pair = 32'h074f074f;
              3'h6: delta_pair = 32'h074c074c;
              3'h7: delta_pair = 32'h07480748;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h07450745;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07420742;
              3'h2: delta_pair = 32'h073e073e;
              3'h3: delta_pair = 32'h073b073b;
              3'h4: delta_pair = 32'h07380738;
              3'h5: delta_pair = 32'h07350735;
              3'h6: delta_pair = 32'h07320732;
              3'h7: delta_pair = 32'h072f072f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072a072a;
              3'h2: delta_pair = 32'h07270727;
              3'h3: delta_pair = 32'h07240724;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h071f071f;
              3'h6: delta_pair = 32'h071d071d;
              3'h7: delta_pair = 32'h071a071a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h07180718;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07150715;
              3'h2: delta_pair = 32'h07130713;
              3'h3: delta_pair = 32'h07110711;
              3'h4: delta_pair = 32'h070f070f;
              3'h5: delta_pair = 32'h070c070c;
              3'h6: delta_pair = 32'h070a070a;
              3'h7: delta_pair = 32'h07080708;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h07060706;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07040704;
              3'h2: delta_pair = 32'h07020702;
              3'h3: delta_pair = 32'h07000700;
              3'h4: delta_pair = 32'h06fd06fd;
              3'h5: delta_pair = 32'h06f906f9;
              3'h6: delta_pair = 32'h06f606f6;
              3'h7: delta_pair = 32'h06f206f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h06ef06ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06eb06eb;
              3'h2: delta_pair = 32'h06e806e8;
              3'h3: delta_pair = 32'h06e506e5;
              3'h4: delta_pair = 32'h06e106e1;
              3'h5: delta_pair = 32'h06de06de;
              3'h6: delta_pair = 32'h06db06db;
              3'h7: delta_pair = 32'h06d806d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h06d506d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06d206d2;
              3'h2: delta_pair = 32'h06cf06cf;
              3'h3: delta_pair = 32'h06cc06cc;
              3'h4: delta_pair = 32'h06ca06ca;
              3'h5: delta_pair = 32'h06c706c7;
              3'h6: delta_pair = 32'h06c406c4;
              3'h7: delta_pair = 32'h06c206c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h06bf06bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06bd06bd;
              3'h2: delta_pair = 32'h06ba06ba;
              3'h3: delta_pair = 32'h06b806b8;
              3'h4: delta_pair = 32'h06b506b5;
              3'h5: delta_pair = 32'h06b306b3;
              3'h6: delta_pair = 32'h06b106b1;
              3'h7: delta_pair = 32'h06ae06ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h06ac06ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06aa06aa;
              3'h2: delta_pair = 32'h06a806a8;
              3'h3: delta_pair = 32'h06a506a5;
              3'h4: delta_pair = 32'h06a306a3;
              3'h5: delta_pair = 32'h06a106a1;
              3'h6: delta_pair = 32'h069f069f;
              3'h7: delta_pair = 32'h069d069d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h069b069b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06990699;
              3'h2: delta_pair = 32'h06980698;
              3'h3: delta_pair = 32'h06960696;
              3'h4: delta_pair = 32'h06940694;
              3'h5: delta_pair = 32'h06920692;
              3'h6: delta_pair = 32'h06900690;
              3'h7: delta_pair = 32'h068f068f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h068d068d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h068b068b;
              3'h2: delta_pair = 32'h06890689;
              3'h3: delta_pair = 32'h06880688;
              3'h4: delta_pair = 32'h06860686;
              3'h5: delta_pair = 32'h06850685;
              3'h6: delta_pair = 32'h06830683;
              3'h7: delta_pair = 32'h06820682;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8d: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h03fd03fd;
              3'h5: delta_pair = 32'h03f903f9;
              3'h6: delta_pair = 32'h03f603f6;
              3'h7: delta_pair = 32'h03f203f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03ef03ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03eb03eb;
              3'h2: delta_pair = 32'h03e803e8;
              3'h3: delta_pair = 32'h03e503e5;
              3'h4: delta_pair = 32'h03e103e1;
              3'h5: delta_pair = 32'h03de03de;
              3'h6: delta_pair = 32'h03db03db;
              3'h7: delta_pair = 32'h03d803d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d203d2;
              3'h2: delta_pair = 32'h03cf03cf;
              3'h3: delta_pair = 32'h03cc03cc;
              3'h4: delta_pair = 32'h03ca03ca;
              3'h5: delta_pair = 32'h03c703c7;
              3'h6: delta_pair = 32'h03c403c4;
              3'h7: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h03bf03bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03bd03bd;
              3'h2: delta_pair = 32'h03ba03ba;
              3'h3: delta_pair = 32'h03b803b8;
              3'h4: delta_pair = 32'h03b503b5;
              3'h5: delta_pair = 32'h03b303b3;
              3'h6: delta_pair = 32'h03b103b1;
              3'h7: delta_pair = 32'h03ae03ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h03ac03ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03aa03aa;
              3'h2: delta_pair = 32'h03a803a8;
              3'h3: delta_pair = 32'h03a503a5;
              3'h4: delta_pair = 32'h03a303a3;
              3'h5: delta_pair = 32'h03a103a1;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039d039d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h039b039b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03990399;
              3'h2: delta_pair = 32'h03980398;
              3'h3: delta_pair = 32'h03960396;
              3'h4: delta_pair = 32'h03940394;
              3'h5: delta_pair = 32'h03920392;
              3'h6: delta_pair = 32'h03900390;
              3'h7: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h038d038d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h038b038b;
              3'h2: delta_pair = 32'h03890389;
              3'h3: delta_pair = 32'h03880388;
              3'h4: delta_pair = 32'h03860386;
              3'h5: delta_pair = 32'h03850385;
              3'h6: delta_pair = 32'h03830383;
              3'h7: delta_pair = 32'h03820382;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8e: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h0efd0efd;
              3'h5: delta_pair = 32'h0ef90ef9;
              3'h6: delta_pair = 32'h0ef60ef6;
              3'h7: delta_pair = 32'h0ef20ef2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h0eef0eef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0eeb0eeb;
              3'h2: delta_pair = 32'h0ee80ee8;
              3'h3: delta_pair = 32'h0ee50ee5;
              3'h4: delta_pair = 32'h0ee10ee1;
              3'h5: delta_pair = 32'h0ede0ede;
              3'h6: delta_pair = 32'h0edb0edb;
              3'h7: delta_pair = 32'h0ed80ed8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h0ed50ed5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0ed20ed2;
              3'h2: delta_pair = 32'h0ecf0ecf;
              3'h3: delta_pair = 32'h0ecc0ecc;
              3'h4: delta_pair = 32'h0eca0eca;
              3'h5: delta_pair = 32'h0ec70ec7;
              3'h6: delta_pair = 32'h0ec40ec4;
              3'h7: delta_pair = 32'h0ec20ec2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h0ebf0ebf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0ebd0ebd;
              3'h2: delta_pair = 32'h0eba0eba;
              3'h3: delta_pair = 32'h0eb80eb8;
              3'h4: delta_pair = 32'h0eb50eb5;
              3'h5: delta_pair = 32'h0eb30eb3;
              3'h6: delta_pair = 32'h0eb10eb1;
              3'h7: delta_pair = 32'h0eae0eae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h0eac0eac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0eaa0eaa;
              3'h2: delta_pair = 32'h0ea80ea8;
              3'h3: delta_pair = 32'h0ea50ea5;
              3'h4: delta_pair = 32'h0ea30ea3;
              3'h5: delta_pair = 32'h0ea10ea1;
              3'h6: delta_pair = 32'h0e9f0e9f;
              3'h7: delta_pair = 32'h0e9d0e9d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h0e9b0e9b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0e990e99;
              3'h2: delta_pair = 32'h0e980e98;
              3'h3: delta_pair = 32'h0e960e96;
              3'h4: delta_pair = 32'h0e940e94;
              3'h5: delta_pair = 32'h0e920e92;
              3'h6: delta_pair = 32'h0e900e90;
              3'h7: delta_pair = 32'h0e8f0e8f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h0e8d0e8d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0e8b0e8b;
              3'h2: delta_pair = 32'h0e890e89;
              3'h3: delta_pair = 32'h0e880e88;
              3'h4: delta_pair = 32'h0e860e86;
              3'h5: delta_pair = 32'h0e850e85;
              3'h6: delta_pair = 32'h0e830e83;
              3'h7: delta_pair = 32'h0e820e82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8f: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h90: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03fa03fa;
              3'h2: delta_pair = 32'h03f403f4;
              3'h3: delta_pair = 32'h03ef03ef;
              3'h4: delta_pair = 32'h03e903e9;
              3'h5: delta_pair = 32'h03e403e4;
              3'h6: delta_pair = 32'h03df03df;
              3'h7: delta_pair = 32'h03da03da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d103d1;
              3'h2: delta_pair = 32'h03cc03cc;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03c403c4;
              3'h5: delta_pair = 32'h03c003c0;
              3'h6: delta_pair = 32'h03bc03bc;
              3'h7: delta_pair = 32'h03b803b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h03b403b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03b003b0;
              3'h2: delta_pair = 32'h03ad03ad;
              3'h3: delta_pair = 32'h03a903a9;
              3'h4: delta_pair = 32'h03a603a6;
              3'h5: delta_pair = 32'h03a203a2;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039c039c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h03990399;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03960396;
              3'h2: delta_pair = 32'h03930393;
              3'h3: delta_pair = 32'h03900390;
              3'h4: delta_pair = 32'h038d038d;
              3'h5: delta_pair = 32'h038b038b;
              3'h6: delta_pair = 32'h03880388;
              3'h7: delta_pair = 32'h03860386;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h03830383;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03810381;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h91: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h077d077d;
              3'h3: delta_pair = 32'h07780778;
              3'h4: delta_pair = 32'h07730773;
              3'h5: delta_pair = 32'h076f076f;
              3'h6: delta_pair = 32'h076b076b;
              3'h7: delta_pair = 32'h07670767;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h07620762;
            case (mant_lo3)
              3'h1: delta_pair = 32'h075e075e;
              3'h2: delta_pair = 32'h075b075b;
              3'h3: delta_pair = 32'h07570757;
              3'h4: delta_pair = 32'h07530753;
              3'h5: delta_pair = 32'h074f074f;
              3'h6: delta_pair = 32'h074c074c;
              3'h7: delta_pair = 32'h07480748;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h07450745;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07420742;
              3'h2: delta_pair = 32'h073e073e;
              3'h3: delta_pair = 32'h073b073b;
              3'h4: delta_pair = 32'h07380738;
              3'h5: delta_pair = 32'h07350735;
              3'h6: delta_pair = 32'h07320732;
              3'h7: delta_pair = 32'h072f072f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072a072a;
              3'h2: delta_pair = 32'h07270727;
              3'h3: delta_pair = 32'h07240724;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h071f071f;
              3'h6: delta_pair = 32'h071d071d;
              3'h7: delta_pair = 32'h071a071a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h07180718;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07150715;
              3'h2: delta_pair = 32'h07130713;
              3'h3: delta_pair = 32'h07110711;
              3'h4: delta_pair = 32'h070f070f;
              3'h5: delta_pair = 32'h070c070c;
              3'h6: delta_pair = 32'h070a070a;
              3'h7: delta_pair = 32'h07080708;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h07060706;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07040704;
              3'h2: delta_pair = 32'h07020702;
              3'h3: delta_pair = 32'h07000700;
              3'h4: delta_pair = 32'h07fd07fd;
              3'h5: delta_pair = 32'h07f907f9;
              3'h6: delta_pair = 32'h07f607f6;
              3'h7: delta_pair = 32'h07f207f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h07ef07ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07eb07eb;
              3'h2: delta_pair = 32'h07e807e8;
              3'h3: delta_pair = 32'h07e507e5;
              3'h4: delta_pair = 32'h07e107e1;
              3'h5: delta_pair = 32'h07de07de;
              3'h6: delta_pair = 32'h07db07db;
              3'h7: delta_pair = 32'h07d807d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h07d507d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07d207d2;
              3'h2: delta_pair = 32'h07cf07cf;
              3'h3: delta_pair = 32'h07cc07cc;
              3'h4: delta_pair = 32'h07ca07ca;
              3'h5: delta_pair = 32'h07c707c7;
              3'h6: delta_pair = 32'h07c407c4;
              3'h7: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h07bf07bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07bd07bd;
              3'h2: delta_pair = 32'h07ba07ba;
              3'h3: delta_pair = 32'h07b807b8;
              3'h4: delta_pair = 32'h07b507b5;
              3'h5: delta_pair = 32'h07b307b3;
              3'h6: delta_pair = 32'h07b107b1;
              3'h7: delta_pair = 32'h07ae07ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h07ac07ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07aa07aa;
              3'h2: delta_pair = 32'h07a807a8;
              3'h3: delta_pair = 32'h07a507a5;
              3'h4: delta_pair = 32'h07a307a3;
              3'h5: delta_pair = 32'h07a107a1;
              3'h6: delta_pair = 32'h079f079f;
              3'h7: delta_pair = 32'h079d079d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h079b079b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07990799;
              3'h2: delta_pair = 32'h07980798;
              3'h3: delta_pair = 32'h07960796;
              3'h4: delta_pair = 32'h07940794;
              3'h5: delta_pair = 32'h07920792;
              3'h6: delta_pair = 32'h07900790;
              3'h7: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h078d078d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h078b078b;
              3'h2: delta_pair = 32'h07890789;
              3'h3: delta_pair = 32'h07880788;
              3'h4: delta_pair = 32'h07860786;
              3'h5: delta_pair = 32'h07850785;
              3'h6: delta_pair = 32'h07830783;
              3'h7: delta_pair = 32'h07820782;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h92: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h93: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h94: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3ffa3ffa;
              3'h2: delta_pair = 32'h3ff43ff4;
              3'h3: delta_pair = 32'h3fef3fef;
              3'h4: delta_pair = 32'h3fe93fe9;
              3'h5: delta_pair = 32'h3fe43fe4;
              3'h6: delta_pair = 32'h3fdf3fdf;
              3'h7: delta_pair = 32'h3fda3fda;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h3fd53fd5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3fd13fd1;
              3'h2: delta_pair = 32'h3fcc3fcc;
              3'h3: delta_pair = 32'h3fc83fc8;
              3'h4: delta_pair = 32'h3fc43fc4;
              3'h5: delta_pair = 32'h3fc03fc0;
              3'h6: delta_pair = 32'h3fbc3fbc;
              3'h7: delta_pair = 32'h3fb83fb8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h3fb43fb4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3fb03fb0;
              3'h2: delta_pair = 32'h3fad3fad;
              3'h3: delta_pair = 32'h3fa93fa9;
              3'h4: delta_pair = 32'h3fa63fa6;
              3'h5: delta_pair = 32'h3fa23fa2;
              3'h6: delta_pair = 32'h3f9f3f9f;
              3'h7: delta_pair = 32'h3f9c3f9c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h3f993f99;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f963f96;
              3'h2: delta_pair = 32'h3f933f93;
              3'h3: delta_pair = 32'h3f903f90;
              3'h4: delta_pair = 32'h3f8d3f8d;
              3'h5: delta_pair = 32'h3f8b3f8b;
              3'h6: delta_pair = 32'h3f883f88;
              3'h7: delta_pair = 32'h3f863f86;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h3f833f83;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f813f81;
              3'h2: delta_pair = 32'h3f7d3f7d;
              3'h3: delta_pair = 32'h3f783f78;
              3'h4: delta_pair = 32'h3f733f73;
              3'h5: delta_pair = 32'h3f6f3f6f;
              3'h6: delta_pair = 32'h3f6b3f6b;
              3'h7: delta_pair = 32'h3f673f67;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h3f623f62;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f5e3f5e;
              3'h2: delta_pair = 32'h3f5b3f5b;
              3'h3: delta_pair = 32'h3f573f57;
              3'h4: delta_pair = 32'h3f533f53;
              3'h5: delta_pair = 32'h3f4f3f4f;
              3'h6: delta_pair = 32'h3f4c3f4c;
              3'h7: delta_pair = 32'h3f483f48;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h3f453f45;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f423f42;
              3'h2: delta_pair = 32'h3f3e3f3e;
              3'h3: delta_pair = 32'h3f3b3f3b;
              3'h4: delta_pair = 32'h3f383f38;
              3'h5: delta_pair = 32'h3f353f35;
              3'h6: delta_pair = 32'h3f323f32;
              3'h7: delta_pair = 32'h3f2f3f2f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h3f2c3f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f2a3f2a;
              3'h2: delta_pair = 32'h3f273f27;
              3'h3: delta_pair = 32'h3f243f24;
              3'h4: delta_pair = 32'h3f223f22;
              3'h5: delta_pair = 32'h3f1f3f1f;
              3'h6: delta_pair = 32'h3f1d3f1d;
              3'h7: delta_pair = 32'h3f1a3f1a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h3f183f18;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f153f15;
              3'h2: delta_pair = 32'h3f133f13;
              3'h3: delta_pair = 32'h3f113f11;
              3'h4: delta_pair = 32'h3f0f3f0f;
              3'h5: delta_pair = 32'h3f0c3f0c;
              3'h6: delta_pair = 32'h3f0a3f0a;
              3'h7: delta_pair = 32'h3f083f08;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h3f063f06;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f043f04;
              3'h2: delta_pair = 32'h3f023f02;
              3'h3: delta_pair = 32'h3f003f00;
              3'h4: delta_pair = 32'h3efd3efd;
              3'h5: delta_pair = 32'h3ef93ef9;
              3'h6: delta_pair = 32'h3ef63ef6;
              3'h7: delta_pair = 32'h3ef23ef2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h3eef3eef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3eeb3eeb;
              3'h2: delta_pair = 32'h3ee83ee8;
              3'h3: delta_pair = 32'h3ee53ee5;
              3'h4: delta_pair = 32'h3ee13ee1;
              3'h5: delta_pair = 32'h3ede3ede;
              3'h6: delta_pair = 32'h3edb3edb;
              3'h7: delta_pair = 32'h3ed83ed8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h3ed53ed5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3ed23ed2;
              3'h2: delta_pair = 32'h3ecf3ecf;
              3'h3: delta_pair = 32'h3ecc3ecc;
              3'h4: delta_pair = 32'h3eca3eca;
              3'h5: delta_pair = 32'h3ec73ec7;
              3'h6: delta_pair = 32'h3ec43ec4;
              3'h7: delta_pair = 32'h3ec23ec2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h3ebf3ebf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3ebd3ebd;
              3'h2: delta_pair = 32'h3eba3eba;
              3'h3: delta_pair = 32'h3eb83eb8;
              3'h4: delta_pair = 32'h3eb53eb5;
              3'h5: delta_pair = 32'h3eb33eb3;
              3'h6: delta_pair = 32'h3eb13eb1;
              3'h7: delta_pair = 32'h3eae3eae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h3eac3eac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3eaa3eaa;
              3'h2: delta_pair = 32'h3ea83ea8;
              3'h3: delta_pair = 32'h3ea53ea5;
              3'h4: delta_pair = 32'h3ea33ea3;
              3'h5: delta_pair = 32'h3ea13ea1;
              3'h6: delta_pair = 32'h3e9f3e9f;
              3'h7: delta_pair = 32'h3e9d3e9d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h3e9b3e9b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3e993e99;
              3'h2: delta_pair = 32'h3e983e98;
              3'h3: delta_pair = 32'h3e963e96;
              3'h4: delta_pair = 32'h3e943e94;
              3'h5: delta_pair = 32'h3e923e92;
              3'h6: delta_pair = 32'h3e903e90;
              3'h7: delta_pair = 32'h3e8f3e8f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h3e8d3e8d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3e8b3e8b;
              3'h2: delta_pair = 32'h3e893e89;
              3'h3: delta_pair = 32'h3e883e88;
              3'h4: delta_pair = 32'h3e863e86;
              3'h5: delta_pair = 32'h3e853e85;
              3'h6: delta_pair = 32'h3e833e83;
              3'h7: delta_pair = 32'h3e823e82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h95: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h03fd03fd;
              3'h5: delta_pair = 32'h03f903f9;
              3'h6: delta_pair = 32'h03f603f6;
              3'h7: delta_pair = 32'h03f203f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03ef03ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03eb03eb;
              3'h2: delta_pair = 32'h03e803e8;
              3'h3: delta_pair = 32'h03e503e5;
              3'h4: delta_pair = 32'h03e103e1;
              3'h5: delta_pair = 32'h03de03de;
              3'h6: delta_pair = 32'h03db03db;
              3'h7: delta_pair = 32'h03d803d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d203d2;
              3'h2: delta_pair = 32'h03cf03cf;
              3'h3: delta_pair = 32'h03cc03cc;
              3'h4: delta_pair = 32'h03ca03ca;
              3'h5: delta_pair = 32'h03c703c7;
              3'h6: delta_pair = 32'h03c403c4;
              3'h7: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h03bf03bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03bd03bd;
              3'h2: delta_pair = 32'h03ba03ba;
              3'h3: delta_pair = 32'h03b803b8;
              3'h4: delta_pair = 32'h03b503b5;
              3'h5: delta_pair = 32'h03b303b3;
              3'h6: delta_pair = 32'h03b103b1;
              3'h7: delta_pair = 32'h03ae03ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h03ac03ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03aa03aa;
              3'h2: delta_pair = 32'h03a803a8;
              3'h3: delta_pair = 32'h03a503a5;
              3'h4: delta_pair = 32'h03a303a3;
              3'h5: delta_pair = 32'h03a103a1;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039d039d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h039b039b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03990399;
              3'h2: delta_pair = 32'h03980398;
              3'h3: delta_pair = 32'h03960396;
              3'h4: delta_pair = 32'h03940394;
              3'h5: delta_pair = 32'h03920392;
              3'h6: delta_pair = 32'h03900390;
              3'h7: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h038d038d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h038b038b;
              3'h2: delta_pair = 32'h03890389;
              3'h3: delta_pair = 32'h03880388;
              3'h4: delta_pair = 32'h03860386;
              3'h5: delta_pair = 32'h03850385;
              3'h6: delta_pair = 32'h03830383;
              3'h7: delta_pair = 32'h03820382;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h96: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h06fd06fd;
              3'h5: delta_pair = 32'h06f906f9;
              3'h6: delta_pair = 32'h06f606f6;
              3'h7: delta_pair = 32'h06f206f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h06ef06ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06eb06eb;
              3'h2: delta_pair = 32'h06e806e8;
              3'h3: delta_pair = 32'h06e506e5;
              3'h4: delta_pair = 32'h06e106e1;
              3'h5: delta_pair = 32'h06de06de;
              3'h6: delta_pair = 32'h06db06db;
              3'h7: delta_pair = 32'h06d806d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h06d506d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06d206d2;
              3'h2: delta_pair = 32'h06cf06cf;
              3'h3: delta_pair = 32'h06cc06cc;
              3'h4: delta_pair = 32'h06ca06ca;
              3'h5: delta_pair = 32'h06c706c7;
              3'h6: delta_pair = 32'h06c406c4;
              3'h7: delta_pair = 32'h06c206c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h06bf06bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06bd06bd;
              3'h2: delta_pair = 32'h06ba06ba;
              3'h3: delta_pair = 32'h06b806b8;
              3'h4: delta_pair = 32'h06b506b5;
              3'h5: delta_pair = 32'h06b306b3;
              3'h6: delta_pair = 32'h06b106b1;
              3'h7: delta_pair = 32'h06ae06ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h06ac06ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06aa06aa;
              3'h2: delta_pair = 32'h06a806a8;
              3'h3: delta_pair = 32'h06a506a5;
              3'h4: delta_pair = 32'h06a306a3;
              3'h5: delta_pair = 32'h06a106a1;
              3'h6: delta_pair = 32'h069f069f;
              3'h7: delta_pair = 32'h069d069d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h069b069b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06990699;
              3'h2: delta_pair = 32'h06980698;
              3'h3: delta_pair = 32'h06960696;
              3'h4: delta_pair = 32'h06940694;
              3'h5: delta_pair = 32'h06920692;
              3'h6: delta_pair = 32'h06900690;
              3'h7: delta_pair = 32'h068f068f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h068d068d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h068b068b;
              3'h2: delta_pair = 32'h06890689;
              3'h3: delta_pair = 32'h06880688;
              3'h4: delta_pair = 32'h06860686;
              3'h5: delta_pair = 32'h06850685;
              3'h6: delta_pair = 32'h06830683;
              3'h7: delta_pair = 32'h06820682;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h97: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h98: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03fa03fa;
              3'h2: delta_pair = 32'h03f403f4;
              3'h3: delta_pair = 32'h03ef03ef;
              3'h4: delta_pair = 32'h03e903e9;
              3'h5: delta_pair = 32'h03e403e4;
              3'h6: delta_pair = 32'h03df03df;
              3'h7: delta_pair = 32'h03da03da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d103d1;
              3'h2: delta_pair = 32'h03cc03cc;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03c403c4;
              3'h5: delta_pair = 32'h03c003c0;
              3'h6: delta_pair = 32'h03bc03bc;
              3'h7: delta_pair = 32'h03b803b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h03b403b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03b003b0;
              3'h2: delta_pair = 32'h03ad03ad;
              3'h3: delta_pair = 32'h03a903a9;
              3'h4: delta_pair = 32'h03a603a6;
              3'h5: delta_pair = 32'h03a203a2;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039c039c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h03990399;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03960396;
              3'h2: delta_pair = 32'h03930393;
              3'h3: delta_pair = 32'h03900390;
              3'h4: delta_pair = 32'h038d038d;
              3'h5: delta_pair = 32'h038b038b;
              3'h6: delta_pair = 32'h03880388;
              3'h7: delta_pair = 32'h03860386;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h03830383;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03810381;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h99: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h0f7d0f7d;
              3'h3: delta_pair = 32'h0f780f78;
              3'h4: delta_pair = 32'h0f730f73;
              3'h5: delta_pair = 32'h0f6f0f6f;
              3'h6: delta_pair = 32'h0f6b0f6b;
              3'h7: delta_pair = 32'h0f670f67;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h0f620f62;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f5e0f5e;
              3'h2: delta_pair = 32'h0f5b0f5b;
              3'h3: delta_pair = 32'h0f570f57;
              3'h4: delta_pair = 32'h0f530f53;
              3'h5: delta_pair = 32'h0f4f0f4f;
              3'h6: delta_pair = 32'h0f4c0f4c;
              3'h7: delta_pair = 32'h0f480f48;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h0f450f45;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f420f42;
              3'h2: delta_pair = 32'h0f3e0f3e;
              3'h3: delta_pair = 32'h0f3b0f3b;
              3'h4: delta_pair = 32'h0f380f38;
              3'h5: delta_pair = 32'h0f350f35;
              3'h6: delta_pair = 32'h0f320f32;
              3'h7: delta_pair = 32'h0f2f0f2f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h0f2c0f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f2a0f2a;
              3'h2: delta_pair = 32'h0f270f27;
              3'h3: delta_pair = 32'h0f240f24;
              3'h4: delta_pair = 32'h0f220f22;
              3'h5: delta_pair = 32'h0f1f0f1f;
              3'h6: delta_pair = 32'h0f1d0f1d;
              3'h7: delta_pair = 32'h0f1a0f1a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h0f180f18;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f150f15;
              3'h2: delta_pair = 32'h0f130f13;
              3'h3: delta_pair = 32'h0f110f11;
              3'h4: delta_pair = 32'h0f0f0f0f;
              3'h5: delta_pair = 32'h0f0c0f0c;
              3'h6: delta_pair = 32'h0f0a0f0a;
              3'h7: delta_pair = 32'h0f080f08;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h0f060f06;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f040f04;
              3'h2: delta_pair = 32'h0f020f02;
              3'h3: delta_pair = 32'h0f000f00;
              3'h4: delta_pair = 32'h0ffd0ffd;
              3'h5: delta_pair = 32'h0ff90ff9;
              3'h6: delta_pair = 32'h0ff60ff6;
              3'h7: delta_pair = 32'h0ff20ff2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h0fef0fef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0feb0feb;
              3'h2: delta_pair = 32'h0fe80fe8;
              3'h3: delta_pair = 32'h0fe50fe5;
              3'h4: delta_pair = 32'h0fe10fe1;
              3'h5: delta_pair = 32'h0fde0fde;
              3'h6: delta_pair = 32'h0fdb0fdb;
              3'h7: delta_pair = 32'h0fd80fd8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h0fd50fd5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fd20fd2;
              3'h2: delta_pair = 32'h0fcf0fcf;
              3'h3: delta_pair = 32'h0fcc0fcc;
              3'h4: delta_pair = 32'h0fca0fca;
              3'h5: delta_pair = 32'h0fc70fc7;
              3'h6: delta_pair = 32'h0fc40fc4;
              3'h7: delta_pair = 32'h0fc20fc2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h0fbf0fbf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fbd0fbd;
              3'h2: delta_pair = 32'h0fba0fba;
              3'h3: delta_pair = 32'h0fb80fb8;
              3'h4: delta_pair = 32'h0fb50fb5;
              3'h5: delta_pair = 32'h0fb30fb3;
              3'h6: delta_pair = 32'h0fb10fb1;
              3'h7: delta_pair = 32'h0fae0fae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h0fac0fac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0faa0faa;
              3'h2: delta_pair = 32'h0fa80fa8;
              3'h3: delta_pair = 32'h0fa50fa5;
              3'h4: delta_pair = 32'h0fa30fa3;
              3'h5: delta_pair = 32'h0fa10fa1;
              3'h6: delta_pair = 32'h0f9f0f9f;
              3'h7: delta_pair = 32'h0f9d0f9d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h0f9b0f9b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f990f99;
              3'h2: delta_pair = 32'h0f980f98;
              3'h3: delta_pair = 32'h0f960f96;
              3'h4: delta_pair = 32'h0f940f94;
              3'h5: delta_pair = 32'h0f920f92;
              3'h6: delta_pair = 32'h0f900f90;
              3'h7: delta_pair = 32'h0f8f0f8f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h0f8d0f8d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f8b0f8b;
              3'h2: delta_pair = 32'h0f890f89;
              3'h3: delta_pair = 32'h0f880f88;
              3'h4: delta_pair = 32'h0f860f86;
              3'h5: delta_pair = 32'h0f850f85;
              3'h6: delta_pair = 32'h0f830f83;
              3'h7: delta_pair = 32'h0f820f82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9a: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9b: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9c: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07fa07fa;
              3'h2: delta_pair = 32'h07f407f4;
              3'h3: delta_pair = 32'h07ef07ef;
              3'h4: delta_pair = 32'h07e907e9;
              3'h5: delta_pair = 32'h07e407e4;
              3'h6: delta_pair = 32'h07df07df;
              3'h7: delta_pair = 32'h07da07da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h07d507d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07d107d1;
              3'h2: delta_pair = 32'h07cc07cc;
              3'h3: delta_pair = 32'h07c807c8;
              3'h4: delta_pair = 32'h07c407c4;
              3'h5: delta_pair = 32'h07c007c0;
              3'h6: delta_pair = 32'h07bc07bc;
              3'h7: delta_pair = 32'h07b807b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h07b407b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07b007b0;
              3'h2: delta_pair = 32'h07ad07ad;
              3'h3: delta_pair = 32'h07a907a9;
              3'h4: delta_pair = 32'h07a607a6;
              3'h5: delta_pair = 32'h07a207a2;
              3'h6: delta_pair = 32'h079f079f;
              3'h7: delta_pair = 32'h079c079c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h07990799;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07960796;
              3'h2: delta_pair = 32'h07930793;
              3'h3: delta_pair = 32'h07900790;
              3'h4: delta_pair = 32'h078d078d;
              3'h5: delta_pair = 32'h078b078b;
              3'h6: delta_pair = 32'h07880788;
              3'h7: delta_pair = 32'h07860786;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h07830783;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07810781;
              3'h2: delta_pair = 32'h077d077d;
              3'h3: delta_pair = 32'h07780778;
              3'h4: delta_pair = 32'h07730773;
              3'h5: delta_pair = 32'h076f076f;
              3'h6: delta_pair = 32'h076b076b;
              3'h7: delta_pair = 32'h07670767;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h07620762;
            case (mant_lo3)
              3'h1: delta_pair = 32'h075e075e;
              3'h2: delta_pair = 32'h075b075b;
              3'h3: delta_pair = 32'h07570757;
              3'h4: delta_pair = 32'h07530753;
              3'h5: delta_pair = 32'h074f074f;
              3'h6: delta_pair = 32'h074c074c;
              3'h7: delta_pair = 32'h07480748;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h07450745;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07420742;
              3'h2: delta_pair = 32'h073e073e;
              3'h3: delta_pair = 32'h073b073b;
              3'h4: delta_pair = 32'h07380738;
              3'h5: delta_pair = 32'h07350735;
              3'h6: delta_pair = 32'h07320732;
              3'h7: delta_pair = 32'h072f072f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072a072a;
              3'h2: delta_pair = 32'h07270727;
              3'h3: delta_pair = 32'h07240724;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h071f071f;
              3'h6: delta_pair = 32'h071d071d;
              3'h7: delta_pair = 32'h071a071a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h07180718;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07150715;
              3'h2: delta_pair = 32'h07130713;
              3'h3: delta_pair = 32'h07110711;
              3'h4: delta_pair = 32'h070f070f;
              3'h5: delta_pair = 32'h070c070c;
              3'h6: delta_pair = 32'h070a070a;
              3'h7: delta_pair = 32'h07080708;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h07060706;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07040704;
              3'h2: delta_pair = 32'h07020702;
              3'h3: delta_pair = 32'h07000700;
              3'h4: delta_pair = 32'h06fd06fd;
              3'h5: delta_pair = 32'h06f906f9;
              3'h6: delta_pair = 32'h06f606f6;
              3'h7: delta_pair = 32'h06f206f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h06ef06ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06eb06eb;
              3'h2: delta_pair = 32'h06e806e8;
              3'h3: delta_pair = 32'h06e506e5;
              3'h4: delta_pair = 32'h06e106e1;
              3'h5: delta_pair = 32'h06de06de;
              3'h6: delta_pair = 32'h06db06db;
              3'h7: delta_pair = 32'h06d806d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h06d506d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06d206d2;
              3'h2: delta_pair = 32'h06cf06cf;
              3'h3: delta_pair = 32'h06cc06cc;
              3'h4: delta_pair = 32'h06ca06ca;
              3'h5: delta_pair = 32'h06c706c7;
              3'h6: delta_pair = 32'h06c406c4;
              3'h7: delta_pair = 32'h06c206c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h06bf06bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06bd06bd;
              3'h2: delta_pair = 32'h06ba06ba;
              3'h3: delta_pair = 32'h06b806b8;
              3'h4: delta_pair = 32'h06b506b5;
              3'h5: delta_pair = 32'h06b306b3;
              3'h6: delta_pair = 32'h06b106b1;
              3'h7: delta_pair = 32'h06ae06ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h06ac06ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06aa06aa;
              3'h2: delta_pair = 32'h06a806a8;
              3'h3: delta_pair = 32'h06a506a5;
              3'h4: delta_pair = 32'h06a306a3;
              3'h5: delta_pair = 32'h06a106a1;
              3'h6: delta_pair = 32'h069f069f;
              3'h7: delta_pair = 32'h069d069d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h069b069b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06990699;
              3'h2: delta_pair = 32'h06980698;
              3'h3: delta_pair = 32'h06960696;
              3'h4: delta_pair = 32'h06940694;
              3'h5: delta_pair = 32'h06920692;
              3'h6: delta_pair = 32'h06900690;
              3'h7: delta_pair = 32'h068f068f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h068d068d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h068b068b;
              3'h2: delta_pair = 32'h06890689;
              3'h3: delta_pair = 32'h06880688;
              3'h4: delta_pair = 32'h06860686;
              3'h5: delta_pair = 32'h06850685;
              3'h6: delta_pair = 32'h06830683;
              3'h7: delta_pair = 32'h06820682;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9d: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h03fd03fd;
              3'h5: delta_pair = 32'h03f903f9;
              3'h6: delta_pair = 32'h03f603f6;
              3'h7: delta_pair = 32'h03f203f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03ef03ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03eb03eb;
              3'h2: delta_pair = 32'h03e803e8;
              3'h3: delta_pair = 32'h03e503e5;
              3'h4: delta_pair = 32'h03e103e1;
              3'h5: delta_pair = 32'h03de03de;
              3'h6: delta_pair = 32'h03db03db;
              3'h7: delta_pair = 32'h03d803d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d203d2;
              3'h2: delta_pair = 32'h03cf03cf;
              3'h3: delta_pair = 32'h03cc03cc;
              3'h4: delta_pair = 32'h03ca03ca;
              3'h5: delta_pair = 32'h03c703c7;
              3'h6: delta_pair = 32'h03c403c4;
              3'h7: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h03bf03bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03bd03bd;
              3'h2: delta_pair = 32'h03ba03ba;
              3'h3: delta_pair = 32'h03b803b8;
              3'h4: delta_pair = 32'h03b503b5;
              3'h5: delta_pair = 32'h03b303b3;
              3'h6: delta_pair = 32'h03b103b1;
              3'h7: delta_pair = 32'h03ae03ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h03ac03ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03aa03aa;
              3'h2: delta_pair = 32'h03a803a8;
              3'h3: delta_pair = 32'h03a503a5;
              3'h4: delta_pair = 32'h03a303a3;
              3'h5: delta_pair = 32'h03a103a1;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039d039d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h039b039b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03990399;
              3'h2: delta_pair = 32'h03980398;
              3'h3: delta_pair = 32'h03960396;
              3'h4: delta_pair = 32'h03940394;
              3'h5: delta_pair = 32'h03920392;
              3'h6: delta_pair = 32'h03900390;
              3'h7: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h038d038d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h038b038b;
              3'h2: delta_pair = 32'h03890389;
              3'h3: delta_pair = 32'h03880388;
              3'h4: delta_pair = 32'h03860386;
              3'h5: delta_pair = 32'h03850385;
              3'h6: delta_pair = 32'h03830383;
              3'h7: delta_pair = 32'h03820382;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9e: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h1efd1efd;
              3'h5: delta_pair = 32'h1ef91ef9;
              3'h6: delta_pair = 32'h1ef61ef6;
              3'h7: delta_pair = 32'h1ef21ef2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h1eef1eef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1eeb1eeb;
              3'h2: delta_pair = 32'h1ee81ee8;
              3'h3: delta_pair = 32'h1ee51ee5;
              3'h4: delta_pair = 32'h1ee11ee1;
              3'h5: delta_pair = 32'h1ede1ede;
              3'h6: delta_pair = 32'h1edb1edb;
              3'h7: delta_pair = 32'h1ed81ed8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h1ed51ed5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1ed21ed2;
              3'h2: delta_pair = 32'h1ecf1ecf;
              3'h3: delta_pair = 32'h1ecc1ecc;
              3'h4: delta_pair = 32'h1eca1eca;
              3'h5: delta_pair = 32'h1ec71ec7;
              3'h6: delta_pair = 32'h1ec41ec4;
              3'h7: delta_pair = 32'h1ec21ec2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h1ebf1ebf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1ebd1ebd;
              3'h2: delta_pair = 32'h1eba1eba;
              3'h3: delta_pair = 32'h1eb81eb8;
              3'h4: delta_pair = 32'h1eb51eb5;
              3'h5: delta_pair = 32'h1eb31eb3;
              3'h6: delta_pair = 32'h1eb11eb1;
              3'h7: delta_pair = 32'h1eae1eae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h1eac1eac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1eaa1eaa;
              3'h2: delta_pair = 32'h1ea81ea8;
              3'h3: delta_pair = 32'h1ea51ea5;
              3'h4: delta_pair = 32'h1ea31ea3;
              3'h5: delta_pair = 32'h1ea11ea1;
              3'h6: delta_pair = 32'h1e9f1e9f;
              3'h7: delta_pair = 32'h1e9d1e9d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h1e9b1e9b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1e991e99;
              3'h2: delta_pair = 32'h1e981e98;
              3'h3: delta_pair = 32'h1e961e96;
              3'h4: delta_pair = 32'h1e941e94;
              3'h5: delta_pair = 32'h1e921e92;
              3'h6: delta_pair = 32'h1e901e90;
              3'h7: delta_pair = 32'h1e8f1e8f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h1e8d1e8d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1e8b1e8b;
              3'h2: delta_pair = 32'h1e891e89;
              3'h3: delta_pair = 32'h1e881e88;
              3'h4: delta_pair = 32'h1e861e86;
              3'h5: delta_pair = 32'h1e851e85;
              3'h6: delta_pair = 32'h1e831e83;
              3'h7: delta_pair = 32'h1e821e82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9f: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha0: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03fa03fa;
              3'h2: delta_pair = 32'h03f403f4;
              3'h3: delta_pair = 32'h03ef03ef;
              3'h4: delta_pair = 32'h03e903e9;
              3'h5: delta_pair = 32'h03e403e4;
              3'h6: delta_pair = 32'h03df03df;
              3'h7: delta_pair = 32'h03da03da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d103d1;
              3'h2: delta_pair = 32'h03cc03cc;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03c403c4;
              3'h5: delta_pair = 32'h03c003c0;
              3'h6: delta_pair = 32'h03bc03bc;
              3'h7: delta_pair = 32'h03b803b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h03b403b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03b003b0;
              3'h2: delta_pair = 32'h03ad03ad;
              3'h3: delta_pair = 32'h03a903a9;
              3'h4: delta_pair = 32'h03a603a6;
              3'h5: delta_pair = 32'h03a203a2;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039c039c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h03990399;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03960396;
              3'h2: delta_pair = 32'h03930393;
              3'h3: delta_pair = 32'h03900390;
              3'h4: delta_pair = 32'h038d038d;
              3'h5: delta_pair = 32'h038b038b;
              3'h6: delta_pair = 32'h03880388;
              3'h7: delta_pair = 32'h03860386;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h03830383;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03810381;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha1: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h077d077d;
              3'h3: delta_pair = 32'h07780778;
              3'h4: delta_pair = 32'h07730773;
              3'h5: delta_pair = 32'h076f076f;
              3'h6: delta_pair = 32'h076b076b;
              3'h7: delta_pair = 32'h07670767;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h07620762;
            case (mant_lo3)
              3'h1: delta_pair = 32'h075e075e;
              3'h2: delta_pair = 32'h075b075b;
              3'h3: delta_pair = 32'h07570757;
              3'h4: delta_pair = 32'h07530753;
              3'h5: delta_pair = 32'h074f074f;
              3'h6: delta_pair = 32'h074c074c;
              3'h7: delta_pair = 32'h07480748;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h07450745;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07420742;
              3'h2: delta_pair = 32'h073e073e;
              3'h3: delta_pair = 32'h073b073b;
              3'h4: delta_pair = 32'h07380738;
              3'h5: delta_pair = 32'h07350735;
              3'h6: delta_pair = 32'h07320732;
              3'h7: delta_pair = 32'h072f072f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072a072a;
              3'h2: delta_pair = 32'h07270727;
              3'h3: delta_pair = 32'h07240724;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h071f071f;
              3'h6: delta_pair = 32'h071d071d;
              3'h7: delta_pair = 32'h071a071a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h07180718;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07150715;
              3'h2: delta_pair = 32'h07130713;
              3'h3: delta_pair = 32'h07110711;
              3'h4: delta_pair = 32'h070f070f;
              3'h5: delta_pair = 32'h070c070c;
              3'h6: delta_pair = 32'h070a070a;
              3'h7: delta_pair = 32'h07080708;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h07060706;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07040704;
              3'h2: delta_pair = 32'h07020702;
              3'h3: delta_pair = 32'h07000700;
              3'h4: delta_pair = 32'h07fd07fd;
              3'h5: delta_pair = 32'h07f907f9;
              3'h6: delta_pair = 32'h07f607f6;
              3'h7: delta_pair = 32'h07f207f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h07ef07ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07eb07eb;
              3'h2: delta_pair = 32'h07e807e8;
              3'h3: delta_pair = 32'h07e507e5;
              3'h4: delta_pair = 32'h07e107e1;
              3'h5: delta_pair = 32'h07de07de;
              3'h6: delta_pair = 32'h07db07db;
              3'h7: delta_pair = 32'h07d807d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h07d507d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07d207d2;
              3'h2: delta_pair = 32'h07cf07cf;
              3'h3: delta_pair = 32'h07cc07cc;
              3'h4: delta_pair = 32'h07ca07ca;
              3'h5: delta_pair = 32'h07c707c7;
              3'h6: delta_pair = 32'h07c407c4;
              3'h7: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h07bf07bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07bd07bd;
              3'h2: delta_pair = 32'h07ba07ba;
              3'h3: delta_pair = 32'h07b807b8;
              3'h4: delta_pair = 32'h07b507b5;
              3'h5: delta_pair = 32'h07b307b3;
              3'h6: delta_pair = 32'h07b107b1;
              3'h7: delta_pair = 32'h07ae07ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h07ac07ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07aa07aa;
              3'h2: delta_pair = 32'h07a807a8;
              3'h3: delta_pair = 32'h07a507a5;
              3'h4: delta_pair = 32'h07a307a3;
              3'h5: delta_pair = 32'h07a107a1;
              3'h6: delta_pair = 32'h079f079f;
              3'h7: delta_pair = 32'h079d079d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h079b079b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07990799;
              3'h2: delta_pair = 32'h07980798;
              3'h3: delta_pair = 32'h07960796;
              3'h4: delta_pair = 32'h07940794;
              3'h5: delta_pair = 32'h07920792;
              3'h6: delta_pair = 32'h07900790;
              3'h7: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h078d078d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h078b078b;
              3'h2: delta_pair = 32'h07890789;
              3'h3: delta_pair = 32'h07880788;
              3'h4: delta_pair = 32'h07860786;
              3'h5: delta_pair = 32'h07850785;
              3'h6: delta_pair = 32'h07830783;
              3'h7: delta_pair = 32'h07820782;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha2: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha3: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha4: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0ffa0ffa;
              3'h2: delta_pair = 32'h0ff40ff4;
              3'h3: delta_pair = 32'h0fef0fef;
              3'h4: delta_pair = 32'h0fe90fe9;
              3'h5: delta_pair = 32'h0fe40fe4;
              3'h6: delta_pair = 32'h0fdf0fdf;
              3'h7: delta_pair = 32'h0fda0fda;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h0fd50fd5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fd10fd1;
              3'h2: delta_pair = 32'h0fcc0fcc;
              3'h3: delta_pair = 32'h0fc80fc8;
              3'h4: delta_pair = 32'h0fc40fc4;
              3'h5: delta_pair = 32'h0fc00fc0;
              3'h6: delta_pair = 32'h0fbc0fbc;
              3'h7: delta_pair = 32'h0fb80fb8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h0fb40fb4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fb00fb0;
              3'h2: delta_pair = 32'h0fad0fad;
              3'h3: delta_pair = 32'h0fa90fa9;
              3'h4: delta_pair = 32'h0fa60fa6;
              3'h5: delta_pair = 32'h0fa20fa2;
              3'h6: delta_pair = 32'h0f9f0f9f;
              3'h7: delta_pair = 32'h0f9c0f9c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h0f990f99;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f960f96;
              3'h2: delta_pair = 32'h0f930f93;
              3'h3: delta_pair = 32'h0f900f90;
              3'h4: delta_pair = 32'h0f8d0f8d;
              3'h5: delta_pair = 32'h0f8b0f8b;
              3'h6: delta_pair = 32'h0f880f88;
              3'h7: delta_pair = 32'h0f860f86;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h0f830f83;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f810f81;
              3'h2: delta_pair = 32'h0f7d0f7d;
              3'h3: delta_pair = 32'h0f780f78;
              3'h4: delta_pair = 32'h0f730f73;
              3'h5: delta_pair = 32'h0f6f0f6f;
              3'h6: delta_pair = 32'h0f6b0f6b;
              3'h7: delta_pair = 32'h0f670f67;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h0f620f62;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f5e0f5e;
              3'h2: delta_pair = 32'h0f5b0f5b;
              3'h3: delta_pair = 32'h0f570f57;
              3'h4: delta_pair = 32'h0f530f53;
              3'h5: delta_pair = 32'h0f4f0f4f;
              3'h6: delta_pair = 32'h0f4c0f4c;
              3'h7: delta_pair = 32'h0f480f48;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h0f450f45;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f420f42;
              3'h2: delta_pair = 32'h0f3e0f3e;
              3'h3: delta_pair = 32'h0f3b0f3b;
              3'h4: delta_pair = 32'h0f380f38;
              3'h5: delta_pair = 32'h0f350f35;
              3'h6: delta_pair = 32'h0f320f32;
              3'h7: delta_pair = 32'h0f2f0f2f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h0f2c0f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f2a0f2a;
              3'h2: delta_pair = 32'h0f270f27;
              3'h3: delta_pair = 32'h0f240f24;
              3'h4: delta_pair = 32'h0f220f22;
              3'h5: delta_pair = 32'h0f1f0f1f;
              3'h6: delta_pair = 32'h0f1d0f1d;
              3'h7: delta_pair = 32'h0f1a0f1a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h0f180f18;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f150f15;
              3'h2: delta_pair = 32'h0f130f13;
              3'h3: delta_pair = 32'h0f110f11;
              3'h4: delta_pair = 32'h0f0f0f0f;
              3'h5: delta_pair = 32'h0f0c0f0c;
              3'h6: delta_pair = 32'h0f0a0f0a;
              3'h7: delta_pair = 32'h0f080f08;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h0f060f06;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f040f04;
              3'h2: delta_pair = 32'h0f020f02;
              3'h3: delta_pair = 32'h0f000f00;
              3'h4: delta_pair = 32'h0efd0efd;
              3'h5: delta_pair = 32'h0ef90ef9;
              3'h6: delta_pair = 32'h0ef60ef6;
              3'h7: delta_pair = 32'h0ef20ef2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h0eef0eef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0eeb0eeb;
              3'h2: delta_pair = 32'h0ee80ee8;
              3'h3: delta_pair = 32'h0ee50ee5;
              3'h4: delta_pair = 32'h0ee10ee1;
              3'h5: delta_pair = 32'h0ede0ede;
              3'h6: delta_pair = 32'h0edb0edb;
              3'h7: delta_pair = 32'h0ed80ed8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h0ed50ed5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0ed20ed2;
              3'h2: delta_pair = 32'h0ecf0ecf;
              3'h3: delta_pair = 32'h0ecc0ecc;
              3'h4: delta_pair = 32'h0eca0eca;
              3'h5: delta_pair = 32'h0ec70ec7;
              3'h6: delta_pair = 32'h0ec40ec4;
              3'h7: delta_pair = 32'h0ec20ec2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h0ebf0ebf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0ebd0ebd;
              3'h2: delta_pair = 32'h0eba0eba;
              3'h3: delta_pair = 32'h0eb80eb8;
              3'h4: delta_pair = 32'h0eb50eb5;
              3'h5: delta_pair = 32'h0eb30eb3;
              3'h6: delta_pair = 32'h0eb10eb1;
              3'h7: delta_pair = 32'h0eae0eae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h0eac0eac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0eaa0eaa;
              3'h2: delta_pair = 32'h0ea80ea8;
              3'h3: delta_pair = 32'h0ea50ea5;
              3'h4: delta_pair = 32'h0ea30ea3;
              3'h5: delta_pair = 32'h0ea10ea1;
              3'h6: delta_pair = 32'h0e9f0e9f;
              3'h7: delta_pair = 32'h0e9d0e9d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h0e9b0e9b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0e990e99;
              3'h2: delta_pair = 32'h0e980e98;
              3'h3: delta_pair = 32'h0e960e96;
              3'h4: delta_pair = 32'h0e940e94;
              3'h5: delta_pair = 32'h0e920e92;
              3'h6: delta_pair = 32'h0e900e90;
              3'h7: delta_pair = 32'h0e8f0e8f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h0e8d0e8d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0e8b0e8b;
              3'h2: delta_pair = 32'h0e890e89;
              3'h3: delta_pair = 32'h0e880e88;
              3'h4: delta_pair = 32'h0e860e86;
              3'h5: delta_pair = 32'h0e850e85;
              3'h6: delta_pair = 32'h0e830e83;
              3'h7: delta_pair = 32'h0e820e82;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha5: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h03fd03fd;
              3'h5: delta_pair = 32'h03f903f9;
              3'h6: delta_pair = 32'h03f603f6;
              3'h7: delta_pair = 32'h03f203f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03ef03ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03eb03eb;
              3'h2: delta_pair = 32'h03e803e8;
              3'h3: delta_pair = 32'h03e503e5;
              3'h4: delta_pair = 32'h03e103e1;
              3'h5: delta_pair = 32'h03de03de;
              3'h6: delta_pair = 32'h03db03db;
              3'h7: delta_pair = 32'h03d803d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d203d2;
              3'h2: delta_pair = 32'h03cf03cf;
              3'h3: delta_pair = 32'h03cc03cc;
              3'h4: delta_pair = 32'h03ca03ca;
              3'h5: delta_pair = 32'h03c703c7;
              3'h6: delta_pair = 32'h03c403c4;
              3'h7: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h03bf03bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03bd03bd;
              3'h2: delta_pair = 32'h03ba03ba;
              3'h3: delta_pair = 32'h03b803b8;
              3'h4: delta_pair = 32'h03b503b5;
              3'h5: delta_pair = 32'h03b303b3;
              3'h6: delta_pair = 32'h03b103b1;
              3'h7: delta_pair = 32'h03ae03ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h03ac03ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03aa03aa;
              3'h2: delta_pair = 32'h03a803a8;
              3'h3: delta_pair = 32'h03a503a5;
              3'h4: delta_pair = 32'h03a303a3;
              3'h5: delta_pair = 32'h03a103a1;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039d039d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h039b039b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03990399;
              3'h2: delta_pair = 32'h03980398;
              3'h3: delta_pair = 32'h03960396;
              3'h4: delta_pair = 32'h03940394;
              3'h5: delta_pair = 32'h03920392;
              3'h6: delta_pair = 32'h03900390;
              3'h7: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h038d038d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h038b038b;
              3'h2: delta_pair = 32'h03890389;
              3'h3: delta_pair = 32'h03880388;
              3'h4: delta_pair = 32'h03860386;
              3'h5: delta_pair = 32'h03850385;
              3'h6: delta_pair = 32'h03830383;
              3'h7: delta_pair = 32'h03820382;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha6: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01fa01fa;
              3'h2: delta_pair = 32'h01f401f4;
              3'h3: delta_pair = 32'h01ef01ef;
              3'h4: delta_pair = 32'h01e901e9;
              3'h5: delta_pair = 32'h01e401e4;
              3'h6: delta_pair = 32'h01df01df;
              3'h7: delta_pair = 32'h01da01da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d101d1;
              3'h2: delta_pair = 32'h01cc01cc;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01c401c4;
              3'h5: delta_pair = 32'h01c001c0;
              3'h6: delta_pair = 32'h01bc01bc;
              3'h7: delta_pair = 32'h01b801b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01b401b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01b001b0;
              3'h2: delta_pair = 32'h01ad01ad;
              3'h3: delta_pair = 32'h01a901a9;
              3'h4: delta_pair = 32'h01a601a6;
              3'h5: delta_pair = 32'h01a201a2;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019c019c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01990199;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01960196;
              3'h2: delta_pair = 32'h01930193;
              3'h3: delta_pair = 32'h01900190;
              3'h4: delta_pair = 32'h018d018d;
              3'h5: delta_pair = 32'h018b018b;
              3'h6: delta_pair = 32'h01880188;
              3'h7: delta_pair = 32'h01860186;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h01830183;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01810181;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h06fd06fd;
              3'h5: delta_pair = 32'h06f906f9;
              3'h6: delta_pair = 32'h06f606f6;
              3'h7: delta_pair = 32'h06f206f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h06ef06ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06eb06eb;
              3'h2: delta_pair = 32'h06e806e8;
              3'h3: delta_pair = 32'h06e506e5;
              3'h4: delta_pair = 32'h06e106e1;
              3'h5: delta_pair = 32'h06de06de;
              3'h6: delta_pair = 32'h06db06db;
              3'h7: delta_pair = 32'h06d806d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h06d506d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06d206d2;
              3'h2: delta_pair = 32'h06cf06cf;
              3'h3: delta_pair = 32'h06cc06cc;
              3'h4: delta_pair = 32'h06ca06ca;
              3'h5: delta_pair = 32'h06c706c7;
              3'h6: delta_pair = 32'h06c406c4;
              3'h7: delta_pair = 32'h06c206c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h06bf06bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06bd06bd;
              3'h2: delta_pair = 32'h06ba06ba;
              3'h3: delta_pair = 32'h06b806b8;
              3'h4: delta_pair = 32'h06b506b5;
              3'h5: delta_pair = 32'h06b306b3;
              3'h6: delta_pair = 32'h06b106b1;
              3'h7: delta_pair = 32'h06ae06ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h06ac06ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06aa06aa;
              3'h2: delta_pair = 32'h06a806a8;
              3'h3: delta_pair = 32'h06a506a5;
              3'h4: delta_pair = 32'h06a306a3;
              3'h5: delta_pair = 32'h06a106a1;
              3'h6: delta_pair = 32'h069f069f;
              3'h7: delta_pair = 32'h069d069d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h069b069b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h06990699;
              3'h2: delta_pair = 32'h06980698;
              3'h3: delta_pair = 32'h06960696;
              3'h4: delta_pair = 32'h06940694;
              3'h5: delta_pair = 32'h06920692;
              3'h6: delta_pair = 32'h06900690;
              3'h7: delta_pair = 32'h068f068f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h068d068d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h068b068b;
              3'h2: delta_pair = 32'h06890689;
              3'h3: delta_pair = 32'h06880688;
              3'h4: delta_pair = 32'h06860686;
              3'h5: delta_pair = 32'h06850685;
              3'h6: delta_pair = 32'h06830683;
              3'h7: delta_pair = 32'h06820682;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha7: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00fa00fa;
              3'h2: delta_pair = 32'h00f400f4;
              3'h3: delta_pair = 32'h00ef00ef;
              3'h4: delta_pair = 32'h00e900e9;
              3'h5: delta_pair = 32'h00e400e4;
              3'h6: delta_pair = 32'h00df00df;
              3'h7: delta_pair = 32'h00da00da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00d500d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00d100d1;
              3'h2: delta_pair = 32'h00cc00cc;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00c400c4;
              3'h5: delta_pair = 32'h00c000c0;
              3'h6: delta_pair = 32'h00bc00bc;
              3'h7: delta_pair = 32'h00b800b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00b400b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00b000b0;
              3'h2: delta_pair = 32'h00ad00ad;
              3'h3: delta_pair = 32'h00a900a9;
              3'h4: delta_pair = 32'h00a600a6;
              3'h5: delta_pair = 32'h00a200a2;
              3'h6: delta_pair = 32'h009f009f;
              3'h7: delta_pair = 32'h009c009c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00990099;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00960096;
              3'h2: delta_pair = 32'h00930093;
              3'h3: delta_pair = 32'h00900090;
              3'h4: delta_pair = 32'h008d008d;
              3'h5: delta_pair = 32'h008b008b;
              3'h6: delta_pair = 32'h00880088;
              3'h7: delta_pair = 32'h00860086;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h00830083;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00810081;
              3'h2: delta_pair = 32'h017d017d;
              3'h3: delta_pair = 32'h01780178;
              3'h4: delta_pair = 32'h01730173;
              3'h5: delta_pair = 32'h016f016f;
              3'h6: delta_pair = 32'h016b016b;
              3'h7: delta_pair = 32'h01670167;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01620162;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015e015e;
              3'h2: delta_pair = 32'h015b015b;
              3'h3: delta_pair = 32'h01570157;
              3'h4: delta_pair = 32'h01530153;
              3'h5: delta_pair = 32'h014f014f;
              3'h6: delta_pair = 32'h014c014c;
              3'h7: delta_pair = 32'h01480148;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01450145;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01420142;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h013b013b;
              3'h4: delta_pair = 32'h01380138;
              3'h5: delta_pair = 32'h01350135;
              3'h6: delta_pair = 32'h01320132;
              3'h7: delta_pair = 32'h012f012f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012a012a;
              3'h2: delta_pair = 32'h01270127;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h011f011f;
              3'h6: delta_pair = 32'h011d011d;
              3'h7: delta_pair = 32'h011a011a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01180118;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01150115;
              3'h2: delta_pair = 32'h01130113;
              3'h3: delta_pair = 32'h01110111;
              3'h4: delta_pair = 32'h010f010f;
              3'h5: delta_pair = 32'h010c010c;
              3'h6: delta_pair = 32'h010a010a;
              3'h7: delta_pair = 32'h01080108;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01060106;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01040104;
              3'h2: delta_pair = 32'h01020102;
              3'h3: delta_pair = 32'h01000100;
              3'h4: delta_pair = 32'h01fd01fd;
              3'h5: delta_pair = 32'h01f901f9;
              3'h6: delta_pair = 32'h01f601f6;
              3'h7: delta_pair = 32'h01f201f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01ef01ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01eb01eb;
              3'h2: delta_pair = 32'h01e801e8;
              3'h3: delta_pair = 32'h01e501e5;
              3'h4: delta_pair = 32'h01e101e1;
              3'h5: delta_pair = 32'h01de01de;
              3'h6: delta_pair = 32'h01db01db;
              3'h7: delta_pair = 32'h01d801d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h01d501d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01d201d2;
              3'h2: delta_pair = 32'h01cf01cf;
              3'h3: delta_pair = 32'h01cc01cc;
              3'h4: delta_pair = 32'h01ca01ca;
              3'h5: delta_pair = 32'h01c701c7;
              3'h6: delta_pair = 32'h01c401c4;
              3'h7: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h01bf01bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01bd01bd;
              3'h2: delta_pair = 32'h01ba01ba;
              3'h3: delta_pair = 32'h01b801b8;
              3'h4: delta_pair = 32'h01b501b5;
              3'h5: delta_pair = 32'h01b301b3;
              3'h6: delta_pair = 32'h01b101b1;
              3'h7: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h01ac01ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01aa01aa;
              3'h2: delta_pair = 32'h01a801a8;
              3'h3: delta_pair = 32'h01a501a5;
              3'h4: delta_pair = 32'h01a301a3;
              3'h5: delta_pair = 32'h01a101a1;
              3'h6: delta_pair = 32'h019f019f;
              3'h7: delta_pair = 32'h019d019d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h019b019b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01990199;
              3'h2: delta_pair = 32'h01980198;
              3'h3: delta_pair = 32'h01960196;
              3'h4: delta_pair = 32'h01940194;
              3'h5: delta_pair = 32'h01920192;
              3'h6: delta_pair = 32'h01900190;
              3'h7: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h018d018d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h018b018b;
              3'h2: delta_pair = 32'h01890189;
              3'h3: delta_pair = 32'h01880188;
              3'h4: delta_pair = 32'h01860186;
              3'h5: delta_pair = 32'h01850185;
              3'h6: delta_pair = 32'h01830183;
              3'h7: delta_pair = 32'h01820182;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha8: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03fa03fa;
              3'h2: delta_pair = 32'h03f403f4;
              3'h3: delta_pair = 32'h03ef03ef;
              3'h4: delta_pair = 32'h03e903e9;
              3'h5: delta_pair = 32'h03e403e4;
              3'h6: delta_pair = 32'h03df03df;
              3'h7: delta_pair = 32'h03da03da;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h03d503d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03d103d1;
              3'h2: delta_pair = 32'h03cc03cc;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03c403c4;
              3'h5: delta_pair = 32'h03c003c0;
              3'h6: delta_pair = 32'h03bc03bc;
              3'h7: delta_pair = 32'h03b803b8;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h03b403b4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03b003b0;
              3'h2: delta_pair = 32'h03ad03ad;
              3'h3: delta_pair = 32'h03a903a9;
              3'h4: delta_pair = 32'h03a603a6;
              3'h5: delta_pair = 32'h03a203a2;
              3'h6: delta_pair = 32'h039f039f;
              3'h7: delta_pair = 32'h039c039c;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h03990399;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03960396;
              3'h2: delta_pair = 32'h03930393;
              3'h3: delta_pair = 32'h03900390;
              3'h4: delta_pair = 32'h038d038d;
              3'h5: delta_pair = 32'h038b038b;
              3'h6: delta_pair = 32'h03880388;
              3'h7: delta_pair = 32'h03860386;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h03830383;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03810381;
              3'h2: delta_pair = 32'h037d037d;
              3'h3: delta_pair = 32'h03780378;
              3'h4: delta_pair = 32'h03730373;
              3'h5: delta_pair = 32'h036f036f;
              3'h6: delta_pair = 32'h036b036b;
              3'h7: delta_pair = 32'h03670367;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03620362;
            case (mant_lo3)
              3'h1: delta_pair = 32'h035e035e;
              3'h2: delta_pair = 32'h035b035b;
              3'h3: delta_pair = 32'h03570357;
              3'h4: delta_pair = 32'h03530353;
              3'h5: delta_pair = 32'h034f034f;
              3'h6: delta_pair = 32'h034c034c;
              3'h7: delta_pair = 32'h03480348;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03450345;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03420342;
              3'h2: delta_pair = 32'h033e033e;
              3'h3: delta_pair = 32'h033b033b;
              3'h4: delta_pair = 32'h03380338;
              3'h5: delta_pair = 32'h03350335;
              3'h6: delta_pair = 32'h03320332;
              3'h7: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032a032a;
              3'h2: delta_pair = 32'h03270327;
              3'h3: delta_pair = 32'h03240324;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h031f031f;
              3'h6: delta_pair = 32'h031d031d;
              3'h7: delta_pair = 32'h031a031a;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03180318;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03150315;
              3'h2: delta_pair = 32'h03130313;
              3'h3: delta_pair = 32'h03110311;
              3'h4: delta_pair = 32'h030f030f;
              3'h5: delta_pair = 32'h030c030c;
              3'h6: delta_pair = 32'h030a030a;
              3'h7: delta_pair = 32'h03080308;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03060306;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03040304;
              3'h2: delta_pair = 32'h03020302;
              3'h3: delta_pair = 32'h03000300;
              3'h4: delta_pair = 32'h02fd02fd;
              3'h5: delta_pair = 32'h02f902f9;
              3'h6: delta_pair = 32'h02f602f6;
              3'h7: delta_pair = 32'h02f202f2;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h02ef02ef;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02eb02eb;
              3'h2: delta_pair = 32'h02e802e8;
              3'h3: delta_pair = 32'h02e502e5;
              3'h4: delta_pair = 32'h02e102e1;
              3'h5: delta_pair = 32'h02de02de;
              3'h6: delta_pair = 32'h02db02db;
              3'h7: delta_pair = 32'h02d802d8;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h02d502d5;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02d202d2;
              3'h2: delta_pair = 32'h02cf02cf;
              3'h3: delta_pair = 32'h02cc02cc;
              3'h4: delta_pair = 32'h02ca02ca;
              3'h5: delta_pair = 32'h02c702c7;
              3'h6: delta_pair = 32'h02c402c4;
              3'h7: delta_pair = 32'h02c202c2;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h02bf02bf;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02bd02bd;
              3'h2: delta_pair = 32'h02ba02ba;
              3'h3: delta_pair = 32'h02b802b8;
              3'h4: delta_pair = 32'h02b502b5;
              3'h5: delta_pair = 32'h02b302b3;
              3'h6: delta_pair = 32'h02b102b1;
              3'h7: delta_pair = 32'h02ae02ae;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h02ac02ac;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02aa02aa;
              3'h2: delta_pair = 32'h02a802a8;
              3'h3: delta_pair = 32'h02a502a5;
              3'h4: delta_pair = 32'h02a302a3;
              3'h5: delta_pair = 32'h02a102a1;
              3'h6: delta_pair = 32'h029f029f;
              3'h7: delta_pair = 32'h029d029d;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h029b029b;
            case (mant_lo3)
              3'h1: delta_pair = 32'h02990299;
              3'h2: delta_pair = 32'h02980298;
              3'h3: delta_pair = 32'h02960296;
              3'h4: delta_pair = 32'h02940294;
              3'h5: delta_pair = 32'h02920292;
              3'h6: delta_pair = 32'h02900290;
              3'h7: delta_pair = 32'h028f028f;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h028d028d;
            case (mant_lo3)
              3'h1: delta_pair = 32'h028b028b;
              3'h2: delta_pair = 32'h02890289;
              3'h3: delta_pair = 32'h02880288;
              3'h4: delta_pair = 32'h02860286;
              3'h5: delta_pair = 32'h02850285;
              3'h6: delta_pair = 32'h02830283;
              3'h7: delta_pair = 32'h02820282;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha9: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00800080;
            case (mant_lo3)
              3'h0: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h00800080;
          end
          4'h2: begin
            delta_pair = 32'h00800080;
          end
          4'h3: begin
            delta_pair = 32'h00800080;
          end
          4'h4: begin
            delta_pair = 32'h00800080;
          end
          4'h5: begin
            delta_pair = 32'h00800080;
          end
          4'h6: begin
            delta_pair = 32'h00800080;
          end
          4'h7: begin
            delta_pair = 32'h00800080;
          end
          4'h8: begin
            delta_pair = 32'h00800080;
          end
          4'h9: begin
            delta_pair = 32'h00800080;
          end
          4'ha: begin
            delta_pair = 32'h00800080;
          end
          4'hb: begin
            delta_pair = 32'h00800080;
          end
          4'hc: begin
            delta_pair = 32'h00800080;
          end
          4'hd: begin
            delta_pair = 32'h00800080;
          end
          4'he: begin
            delta_pair = 32'h00800080;
          end
          4'hf: begin
            delta_pair = 32'h00800080;
          end
          default: begin end
        endcase
      end
      8'hff: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'hffc07fc0;
            case (mant_lo3)
              3'h0: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'hffc07fc0;
          end
          4'h2: begin
            delta_pair = 32'hffc07fc0;
          end
          4'h3: begin
            delta_pair = 32'hffc07fc0;
          end
          4'h4: begin
            delta_pair = 32'hffc07fc0;
          end
          4'h5: begin
            delta_pair = 32'hffc07fc0;
          end
          4'h6: begin
            delta_pair = 32'hffc07fc0;
          end
          4'h7: begin
            delta_pair = 32'hffc07fc0;
          end
          4'h8: begin
            delta_pair = 32'hffc07fc0;
          end
          4'h9: begin
            delta_pair = 32'hffc07fc0;
          end
          4'ha: begin
            delta_pair = 32'hffc07fc0;
          end
          4'hb: begin
            delta_pair = 32'hffc07fc0;
          end
          4'hc: begin
            delta_pair = 32'hffc07fc0;
          end
          4'hd: begin
            delta_pair = 32'hffc07fc0;
          end
          4'he: begin
            delta_pair = 32'hffc07fc0;
          end
          4'hf: begin
            delta_pair = 32'hffc07fc0;
          end
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  wire [31:0] pair = base_pair ^ delta_pair;
  assign out = sign ? pair[31:16] : pair[15:0];
endmodule
