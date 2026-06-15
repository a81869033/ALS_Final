module ex216_r94_bf16_cube_delta_pair_mode_hilo4_cube_bit14_boundary(in, out);
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
      8'h00: base_pair = 32'h80000000;
      8'h01: base_pair = 32'h80000000;
      8'h02: base_pair = 32'h80000000;
      8'h03: base_pair = 32'h80000000;
      8'h04: base_pair = 32'h80000000;
      8'h05: base_pair = 32'h80000000;
      8'h06: base_pair = 32'h80000000;
      8'h07: base_pair = 32'h80000000;
      8'h08: base_pair = 32'h80000000;
      8'h09: base_pair = 32'h80000000;
      8'h0a: base_pair = 32'h80000000;
      8'h0b: base_pair = 32'h80000000;
      8'h0c: base_pair = 32'h80000000;
      8'h0d: base_pair = 32'h80000000;
      8'h0e: base_pair = 32'h80000000;
      8'h0f: base_pair = 32'h80000000;
      8'h10: base_pair = 32'h80000000;
      8'h11: base_pair = 32'h80000000;
      8'h12: base_pair = 32'h80000000;
      8'h13: base_pair = 32'h80000000;
      8'h14: base_pair = 32'h80000000;
      8'h15: base_pair = 32'h80000000;
      8'h16: base_pair = 32'h80000000;
      8'h17: base_pair = 32'h80000000;
      8'h18: base_pair = 32'h80000000;
      8'h19: base_pair = 32'h80000000;
      8'h1a: base_pair = 32'h80000000;
      8'h1b: base_pair = 32'h80000000;
      8'h1c: base_pair = 32'h80000000;
      8'h1d: base_pair = 32'h80000000;
      8'h1e: base_pair = 32'h80000000;
      8'h1f: base_pair = 32'h80000000;
      8'h20: base_pair = 32'h80000000;
      8'h21: base_pair = 32'h80000000;
      8'h22: base_pair = 32'h80000000;
      8'h23: base_pair = 32'h80000000;
      8'h24: base_pair = 32'h80000000;
      8'h25: base_pair = 32'h80000000;
      8'h26: base_pair = 32'h80000000;
      8'h27: base_pair = 32'h80000000;
      8'h28: base_pair = 32'h80000000;
      8'h29: base_pair = 32'h80000000;
      8'h2a: base_pair = 32'h80000000;
      8'h2b: base_pair = 32'h80000000;
      8'h2c: base_pair = 32'h80000000;
      8'h2d: base_pair = 32'h80000000;
      8'h2e: base_pair = 32'h80000000;
      8'h2f: base_pair = 32'h80000000;
      8'h30: base_pair = 32'h80000000;
      8'h31: base_pair = 32'h80000000;
      8'h32: base_pair = 32'h80000000;
      8'h33: base_pair = 32'h80000000;
      8'h34: base_pair = 32'h80000000;
      8'h35: base_pair = 32'h80000000;
      8'h36: base_pair = 32'h80000000;
      8'h37: base_pair = 32'h80000000;
      8'h38: base_pair = 32'h80000000;
      8'h39: base_pair = 32'h80000000;
      8'h3a: base_pair = 32'h80000000;
      8'h3b: base_pair = 32'h80000000;
      8'h3c: base_pair = 32'h80000000;
      8'h3d: base_pair = 32'h80000000;
      8'h3e: base_pair = 32'h80000000;
      8'h3f: base_pair = 32'h80000000;
      8'h40: base_pair = 32'h80000000;
      8'h41: base_pair = 32'h80000000;
      8'h42: base_pair = 32'h80000000;
      8'h43: base_pair = 32'h80000000;
      8'h44: base_pair = 32'h80000000;
      8'h45: base_pair = 32'h80000000;
      8'h46: base_pair = 32'h80000000;
      8'h47: base_pair = 32'h80000000;
      8'h48: base_pair = 32'h80000000;
      8'h49: base_pair = 32'h80000000;
      8'h4a: base_pair = 32'h80000000;
      8'h4b: base_pair = 32'h80000000;
      8'h4c: base_pair = 32'h80000000;
      8'h4d: base_pair = 32'h80000000;
      8'h4e: base_pair = 32'h80000000;
      8'h4f: base_pair = 32'h80000000;
      8'h50: base_pair = 32'h80000000;
      8'h51: base_pair = 32'h80000000;
      8'h52: base_pair = 32'h80000000;
      8'h53: base_pair = 32'h80000000;
      8'h54: base_pair = 32'h80000000;
      8'h55: base_pair = 32'h80800080;
      8'h56: base_pair = 32'h82000200;
      8'h57: base_pair = 32'h83800380;
      8'h58: base_pair = 32'h85000500;
      8'h59: base_pair = 32'h86800680;
      8'h5a: base_pair = 32'h88000800;
      8'h5b: base_pair = 32'h89800980;
      8'h5c: base_pair = 32'h8b000b00;
      8'h5d: base_pair = 32'h8c800c80;
      8'h5e: base_pair = 32'h8e000e00;
      8'h5f: base_pair = 32'h8f800f80;
      8'h60: base_pair = 32'h91001100;
      8'h61: base_pair = 32'h92801280;
      8'h62: base_pair = 32'h94001400;
      8'h63: base_pair = 32'h95801580;
      8'h64: base_pair = 32'h97001700;
      8'h65: base_pair = 32'h98801880;
      8'h66: base_pair = 32'h9a001a00;
      8'h67: base_pair = 32'h9b801b80;
      8'h68: base_pair = 32'h9d001d00;
      8'h69: base_pair = 32'h9e801e80;
      8'h6a: base_pair = 32'ha0002000;
      8'h6b: base_pair = 32'ha1802180;
      8'h6c: base_pair = 32'ha3002300;
      8'h6d: base_pair = 32'ha4802480;
      8'h6e: base_pair = 32'ha6002600;
      8'h6f: base_pair = 32'ha7802780;
      8'h70: base_pair = 32'ha9002900;
      8'h71: base_pair = 32'haa802a80;
      8'h72: base_pair = 32'hac002c00;
      8'h73: base_pair = 32'had802d80;
      8'h74: base_pair = 32'haf002f00;
      8'h75: base_pair = 32'hb0803080;
      8'h76: base_pair = 32'hb2003200;
      8'h77: base_pair = 32'hb3803380;
      8'h78: base_pair = 32'hb5003500;
      8'h79: base_pair = 32'hb6803680;
      8'h7a: base_pair = 32'hb8003800;
      8'h7b: base_pair = 32'hb9803980;
      8'h7c: base_pair = 32'hbb003b00;
      8'h7d: base_pair = 32'hbc803c80;
      8'h7e: base_pair = 32'hbe003e00;
      8'h7f: base_pair = 32'hbf803f80;
      8'h80: base_pair = 32'hc1004100;
      8'h81: base_pair = 32'hc2804280;
      8'h82: base_pair = 32'hc4004400;
      8'h83: base_pair = 32'hc5804580;
      8'h84: base_pair = 32'hc7004700;
      8'h85: base_pair = 32'hc8804880;
      8'h86: base_pair = 32'hca004a00;
      8'h87: base_pair = 32'hcb804b80;
      8'h88: base_pair = 32'hcd004d00;
      8'h89: base_pair = 32'hce804e80;
      8'h8a: base_pair = 32'hd0005000;
      8'h8b: base_pair = 32'hd1805180;
      8'h8c: base_pair = 32'hd3005300;
      8'h8d: base_pair = 32'hd4805480;
      8'h8e: base_pair = 32'hd6005600;
      8'h8f: base_pair = 32'hd7805780;
      8'h90: base_pair = 32'hd9005900;
      8'h91: base_pair = 32'hda805a80;
      8'h92: base_pair = 32'hdc005c00;
      8'h93: base_pair = 32'hdd805d80;
      8'h94: base_pair = 32'hdf005f00;
      8'h95: base_pair = 32'he0806080;
      8'h96: base_pair = 32'he2006200;
      8'h97: base_pair = 32'he3806380;
      8'h98: base_pair = 32'he5006500;
      8'h99: base_pair = 32'he6806680;
      8'h9a: base_pair = 32'he8006800;
      8'h9b: base_pair = 32'he9806980;
      8'h9c: base_pair = 32'heb006b00;
      8'h9d: base_pair = 32'hec806c80;
      8'h9e: base_pair = 32'hee006e00;
      8'h9f: base_pair = 32'hef806f80;
      8'ha0: base_pair = 32'hf1007100;
      8'ha1: base_pair = 32'hf2807280;
      8'ha2: base_pair = 32'hf4007400;
      8'ha3: base_pair = 32'hf5807580;
      8'ha4: base_pair = 32'hf7007700;
      8'ha5: base_pair = 32'hf8807880;
      8'ha6: base_pair = 32'hfa007a00;
      8'ha7: base_pair = 32'hfb807b80;
      8'ha8: base_pair = 32'hfd007d00;
      8'ha9: base_pair = 32'hff807f80;
      8'haa: base_pair = 32'hff807f80;
      8'hab: base_pair = 32'hff807f80;
      8'hac: base_pair = 32'hff807f80;
      8'had: base_pair = 32'hff807f80;
      8'hae: base_pair = 32'hff807f80;
      8'haf: base_pair = 32'hff807f80;
      8'hb0: base_pair = 32'hff807f80;
      8'hb1: base_pair = 32'hff807f80;
      8'hb2: base_pair = 32'hff807f80;
      8'hb3: base_pair = 32'hff807f80;
      8'hb4: base_pair = 32'hff807f80;
      8'hb5: base_pair = 32'hff807f80;
      8'hb6: base_pair = 32'hff807f80;
      8'hb7: base_pair = 32'hff807f80;
      8'hb8: base_pair = 32'hff807f80;
      8'hb9: base_pair = 32'hff807f80;
      8'hba: base_pair = 32'hff807f80;
      8'hbb: base_pair = 32'hff807f80;
      8'hbc: base_pair = 32'hff807f80;
      8'hbd: base_pair = 32'hff807f80;
      8'hbe: base_pair = 32'hff807f80;
      8'hbf: base_pair = 32'hff807f80;
      8'hc0: base_pair = 32'hff807f80;
      8'hc1: base_pair = 32'hff807f80;
      8'hc2: base_pair = 32'hff807f80;
      8'hc3: base_pair = 32'hff807f80;
      8'hc4: base_pair = 32'hff807f80;
      8'hc5: base_pair = 32'hff807f80;
      8'hc6: base_pair = 32'hff807f80;
      8'hc7: base_pair = 32'hff807f80;
      8'hc8: base_pair = 32'hff807f80;
      8'hc9: base_pair = 32'hff807f80;
      8'hca: base_pair = 32'hff807f80;
      8'hcb: base_pair = 32'hff807f80;
      8'hcc: base_pair = 32'hff807f80;
      8'hcd: base_pair = 32'hff807f80;
      8'hce: base_pair = 32'hff807f80;
      8'hcf: base_pair = 32'hff807f80;
      8'hd0: base_pair = 32'hff807f80;
      8'hd1: base_pair = 32'hff807f80;
      8'hd2: base_pair = 32'hff807f80;
      8'hd3: base_pair = 32'hff807f80;
      8'hd4: base_pair = 32'hff807f80;
      8'hd5: base_pair = 32'hff807f80;
      8'hd6: base_pair = 32'hff807f80;
      8'hd7: base_pair = 32'hff807f80;
      8'hd8: base_pair = 32'hff807f80;
      8'hd9: base_pair = 32'hff807f80;
      8'hda: base_pair = 32'hff807f80;
      8'hdb: base_pair = 32'hff807f80;
      8'hdc: base_pair = 32'hff807f80;
      8'hdd: base_pair = 32'hff807f80;
      8'hde: base_pair = 32'hff807f80;
      8'hdf: base_pair = 32'hff807f80;
      8'he0: base_pair = 32'hff807f80;
      8'he1: base_pair = 32'hff807f80;
      8'he2: base_pair = 32'hff807f80;
      8'he3: base_pair = 32'hff807f80;
      8'he4: base_pair = 32'hff807f80;
      8'he5: base_pair = 32'hff807f80;
      8'he6: base_pair = 32'hff807f80;
      8'he7: base_pair = 32'hff807f80;
      8'he8: base_pair = 32'hff807f80;
      8'he9: base_pair = 32'hff807f80;
      8'hea: base_pair = 32'hff807f80;
      8'heb: base_pair = 32'hff807f80;
      8'hec: base_pair = 32'hff807f80;
      8'hed: base_pair = 32'hff807f80;
      8'hee: base_pair = 32'hff807f80;
      8'hef: base_pair = 32'hff807f80;
      8'hf0: base_pair = 32'hff807f80;
      8'hf1: base_pair = 32'hff807f80;
      8'hf2: base_pair = 32'hff807f80;
      8'hf3: base_pair = 32'hff807f80;
      8'hf4: base_pair = 32'hff807f80;
      8'hf5: base_pair = 32'hff807f80;
      8'hf6: base_pair = 32'hff807f80;
      8'hf7: base_pair = 32'hff807f80;
      8'hf8: base_pair = 32'hff807f80;
      8'hf9: base_pair = 32'hff807f80;
      8'hfa: base_pair = 32'hff807f80;
      8'hfb: base_pair = 32'hff807f80;
      8'hfc: base_pair = 32'hff807f80;
      8'hfd: base_pair = 32'hff807f80;
      8'hfe: base_pair = 32'hff807f80;
      8'hff: base_pair = 32'h7fc07fc0;
      default: base_pair = 32'h00000000;
    endcase
  end
  always @* begin
    delta_pair = 32'h00000000;
    case (exp)
      8'h55: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h07820782;
              3'h3: delta_pair = 32'h07840784;
              3'h4: delta_pair = 32'h07870787;
              3'h5: delta_pair = 32'h07890789;
              3'h6: delta_pair = 32'h078c078c;
              3'h7: delta_pair = 32'h078e078e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h07910791;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07930793;
              3'h2: delta_pair = 32'h07960796;
              3'h3: delta_pair = 32'h07990799;
              3'h4: delta_pair = 32'h079b079b;
              3'h5: delta_pair = 32'h079e079e;
              3'h6: delta_pair = 32'h07a107a1;
              3'h7: delta_pair = 32'h07a407a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h07a607a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07a907a9;
              3'h2: delta_pair = 32'h07ac07ac;
              3'h3: delta_pair = 32'h07af07af;
              3'h4: delta_pair = 32'h07b207b2;
              3'h5: delta_pair = 32'h07b507b5;
              3'h6: delta_pair = 32'h07b807b8;
              3'h7: delta_pair = 32'h07bb07bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h07be07be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07c107c1;
              3'h2: delta_pair = 32'h07c407c4;
              3'h3: delta_pair = 32'h07c807c8;
              3'h4: delta_pair = 32'h07cb07cb;
              3'h5: delta_pair = 32'h07ce07ce;
              3'h6: delta_pair = 32'h07d107d1;
              3'h7: delta_pair = 32'h07d507d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h07d807d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07db07db;
              3'h2: delta_pair = 32'h07df07df;
              3'h3: delta_pair = 32'h07e207e2;
              3'h4: delta_pair = 32'h07e607e6;
              3'h5: delta_pair = 32'h07e907e9;
              3'h6: delta_pair = 32'h07ed07ed;
              3'h7: delta_pair = 32'h07f007f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h07f407f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07f807f8;
              3'h2: delta_pair = 32'h07fc07fc;
              3'h3: delta_pair = 32'h07ff07ff;
              3'h4: delta_pair = 32'h07020702;
              3'h5: delta_pair = 32'h07030703;
              3'h6: delta_pair = 32'h07050705;
              3'h7: delta_pair = 32'h07070707;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h07090709;
            case (mant_lo3)
              3'h1: delta_pair = 32'h070b070b;
              3'h2: delta_pair = 32'h070d070d;
              3'h3: delta_pair = 32'h070f070f;
              3'h4: delta_pair = 32'h07110711;
              3'h5: delta_pair = 32'h07130713;
              3'h6: delta_pair = 32'h07160716;
              3'h7: delta_pair = 32'h07180718;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h071a071a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h071c071c;
              3'h2: delta_pair = 32'h071e071e;
              3'h3: delta_pair = 32'h07200720;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h07250725;
              3'h6: delta_pair = 32'h07270727;
              3'h7: delta_pair = 32'h07290729;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072e072e;
              3'h2: delta_pair = 32'h07300730;
              3'h3: delta_pair = 32'h07320732;
              3'h4: delta_pair = 32'h07350735;
              3'h5: delta_pair = 32'h07370737;
              3'h6: delta_pair = 32'h073a073a;
              3'h7: delta_pair = 32'h073c073c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h073f073f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07410741;
              3'h2: delta_pair = 32'h07440744;
              3'h3: delta_pair = 32'h07460746;
              3'h4: delta_pair = 32'h07490749;
              3'h5: delta_pair = 32'h074b074b;
              3'h6: delta_pair = 32'h074e074e;
              3'h7: delta_pair = 32'h07500750;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h07530753;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07560756;
              3'h2: delta_pair = 32'h07580758;
              3'h3: delta_pair = 32'h075b075b;
              3'h4: delta_pair = 32'h075e075e;
              3'h5: delta_pair = 32'h07600760;
              3'h6: delta_pair = 32'h07630763;
              3'h7: delta_pair = 32'h07660766;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h07690769;
            case (mant_lo3)
              3'h1: delta_pair = 32'h076c076c;
              3'h2: delta_pair = 32'h076e076e;
              3'h3: delta_pair = 32'h07710771;
              3'h4: delta_pair = 32'h07740774;
              3'h5: delta_pair = 32'h07770777;
              3'h6: delta_pair = 32'h077a077a;
              3'h7: delta_pair = 32'h077d077d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h03820382;
              3'h3: delta_pair = 32'h03840384;
              3'h4: delta_pair = 32'h03870387;
              3'h5: delta_pair = 32'h03890389;
              3'h6: delta_pair = 32'h038c038c;
              3'h7: delta_pair = 32'h038e038e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03910391;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03930393;
              3'h2: delta_pair = 32'h03960396;
              3'h3: delta_pair = 32'h03990399;
              3'h4: delta_pair = 32'h039b039b;
              3'h5: delta_pair = 32'h039e039e;
              3'h6: delta_pair = 32'h03a103a1;
              3'h7: delta_pair = 32'h03a403a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03a603a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03a903a9;
              3'h2: delta_pair = 32'h03ac03ac;
              3'h3: delta_pair = 32'h03af03af;
              3'h4: delta_pair = 32'h03b203b2;
              3'h5: delta_pair = 32'h03b503b5;
              3'h6: delta_pair = 32'h03b803b8;
              3'h7: delta_pair = 32'h03bb03bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h03be03be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03c103c1;
              3'h2: delta_pair = 32'h03c403c4;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03cb03cb;
              3'h5: delta_pair = 32'h03ce03ce;
              3'h6: delta_pair = 32'h03d103d1;
              3'h7: delta_pair = 32'h03d503d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03d803d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03db03db;
              3'h2: delta_pair = 32'h03df03df;
              3'h3: delta_pair = 32'h03e203e2;
              3'h4: delta_pair = 32'h03e603e6;
              3'h5: delta_pair = 32'h03e903e9;
              3'h6: delta_pair = 32'h03ed03ed;
              3'h7: delta_pair = 32'h03f003f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03f403f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03f803f8;
              3'h2: delta_pair = 32'h03fc03fc;
              3'h3: delta_pair = 32'h03ff03ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h07020702;
              3'h5: delta_pair = 32'h07030703;
              3'h6: delta_pair = 32'h07050705;
              3'h7: delta_pair = 32'h07070707;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h07090709;
            case (mant_lo3)
              3'h1: delta_pair = 32'h070b070b;
              3'h2: delta_pair = 32'h070d070d;
              3'h3: delta_pair = 32'h070f070f;
              3'h4: delta_pair = 32'h07110711;
              3'h5: delta_pair = 32'h07130713;
              3'h6: delta_pair = 32'h07160716;
              3'h7: delta_pair = 32'h07180718;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h071a071a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h071c071c;
              3'h2: delta_pair = 32'h071e071e;
              3'h3: delta_pair = 32'h07200720;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h07250725;
              3'h6: delta_pair = 32'h07270727;
              3'h7: delta_pair = 32'h07290729;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072e072e;
              3'h2: delta_pair = 32'h07300730;
              3'h3: delta_pair = 32'h07320732;
              3'h4: delta_pair = 32'h07350735;
              3'h5: delta_pair = 32'h07370737;
              3'h6: delta_pair = 32'h073a073a;
              3'h7: delta_pair = 32'h073c073c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h073f073f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07410741;
              3'h2: delta_pair = 32'h07440744;
              3'h3: delta_pair = 32'h07460746;
              3'h4: delta_pair = 32'h07490749;
              3'h5: delta_pair = 32'h074b074b;
              3'h6: delta_pair = 32'h074e074e;
              3'h7: delta_pair = 32'h07500750;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h07530753;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07560756;
              3'h2: delta_pair = 32'h07580758;
              3'h3: delta_pair = 32'h075b075b;
              3'h4: delta_pair = 32'h075e075e;
              3'h5: delta_pair = 32'h07600760;
              3'h6: delta_pair = 32'h07630763;
              3'h7: delta_pair = 32'h07660766;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h07690769;
            case (mant_lo3)
              3'h1: delta_pair = 32'h076c076c;
              3'h2: delta_pair = 32'h076e076e;
              3'h3: delta_pair = 32'h07710771;
              3'h4: delta_pair = 32'h07740774;
              3'h5: delta_pair = 32'h07770777;
              3'h6: delta_pair = 32'h077a077a;
              3'h7: delta_pair = 32'h077d077d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h1f821f82;
              3'h3: delta_pair = 32'h1f841f84;
              3'h4: delta_pair = 32'h1f871f87;
              3'h5: delta_pair = 32'h1f891f89;
              3'h6: delta_pair = 32'h1f8c1f8c;
              3'h7: delta_pair = 32'h1f8e1f8e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h1f911f91;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f931f93;
              3'h2: delta_pair = 32'h1f961f96;
              3'h3: delta_pair = 32'h1f991f99;
              3'h4: delta_pair = 32'h1f9b1f9b;
              3'h5: delta_pair = 32'h1f9e1f9e;
              3'h6: delta_pair = 32'h1fa11fa1;
              3'h7: delta_pair = 32'h1fa41fa4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h1fa61fa6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1fa91fa9;
              3'h2: delta_pair = 32'h1fac1fac;
              3'h3: delta_pair = 32'h1faf1faf;
              3'h4: delta_pair = 32'h1fb21fb2;
              3'h5: delta_pair = 32'h1fb51fb5;
              3'h6: delta_pair = 32'h1fb81fb8;
              3'h7: delta_pair = 32'h1fbb1fbb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h1fbe1fbe;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1fc11fc1;
              3'h2: delta_pair = 32'h1fc41fc4;
              3'h3: delta_pair = 32'h1fc81fc8;
              3'h4: delta_pair = 32'h1fcb1fcb;
              3'h5: delta_pair = 32'h1fce1fce;
              3'h6: delta_pair = 32'h1fd11fd1;
              3'h7: delta_pair = 32'h1fd51fd5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h1fd81fd8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1fdb1fdb;
              3'h2: delta_pair = 32'h1fdf1fdf;
              3'h3: delta_pair = 32'h1fe21fe2;
              3'h4: delta_pair = 32'h1fe61fe6;
              3'h5: delta_pair = 32'h1fe91fe9;
              3'h6: delta_pair = 32'h1fed1fed;
              3'h7: delta_pair = 32'h1ff01ff0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h1ff41ff4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1ff81ff8;
              3'h2: delta_pair = 32'h1ffc1ffc;
              3'h3: delta_pair = 32'h1fff1fff;
              3'h4: delta_pair = 32'h1f021f02;
              3'h5: delta_pair = 32'h1f031f03;
              3'h6: delta_pair = 32'h1f051f05;
              3'h7: delta_pair = 32'h1f071f07;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h1f091f09;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f0b1f0b;
              3'h2: delta_pair = 32'h1f0d1f0d;
              3'h3: delta_pair = 32'h1f0f1f0f;
              3'h4: delta_pair = 32'h1f111f11;
              3'h5: delta_pair = 32'h1f131f13;
              3'h6: delta_pair = 32'h1f161f16;
              3'h7: delta_pair = 32'h1f181f18;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h1f1a1f1a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f1c1f1c;
              3'h2: delta_pair = 32'h1f1e1f1e;
              3'h3: delta_pair = 32'h1f201f20;
              3'h4: delta_pair = 32'h1f221f22;
              3'h5: delta_pair = 32'h1f251f25;
              3'h6: delta_pair = 32'h1f271f27;
              3'h7: delta_pair = 32'h1f291f29;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h1f2c1f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f2e1f2e;
              3'h2: delta_pair = 32'h1f301f30;
              3'h3: delta_pair = 32'h1f321f32;
              3'h4: delta_pair = 32'h1f351f35;
              3'h5: delta_pair = 32'h1f371f37;
              3'h6: delta_pair = 32'h1f3a1f3a;
              3'h7: delta_pair = 32'h1f3c1f3c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h1f3f1f3f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f411f41;
              3'h2: delta_pair = 32'h1f441f44;
              3'h3: delta_pair = 32'h1f461f46;
              3'h4: delta_pair = 32'h1f491f49;
              3'h5: delta_pair = 32'h1f4b1f4b;
              3'h6: delta_pair = 32'h1f4e1f4e;
              3'h7: delta_pair = 32'h1f501f50;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h1f531f53;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f561f56;
              3'h2: delta_pair = 32'h1f581f58;
              3'h3: delta_pair = 32'h1f5b1f5b;
              3'h4: delta_pair = 32'h1f5e1f5e;
              3'h5: delta_pair = 32'h1f601f60;
              3'h6: delta_pair = 32'h1f631f63;
              3'h7: delta_pair = 32'h1f661f66;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h1f691f69;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f6c1f6c;
              3'h2: delta_pair = 32'h1f6e1f6e;
              3'h3: delta_pair = 32'h1f711f71;
              3'h4: delta_pair = 32'h1f741f74;
              3'h5: delta_pair = 32'h1f771f77;
              3'h6: delta_pair = 32'h1f7a1f7a;
              3'h7: delta_pair = 32'h1f7d1f7d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h03820382;
              3'h3: delta_pair = 32'h03840384;
              3'h4: delta_pair = 32'h03870387;
              3'h5: delta_pair = 32'h03890389;
              3'h6: delta_pair = 32'h038c038c;
              3'h7: delta_pair = 32'h038e038e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03910391;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03930393;
              3'h2: delta_pair = 32'h03960396;
              3'h3: delta_pair = 32'h03990399;
              3'h4: delta_pair = 32'h039b039b;
              3'h5: delta_pair = 32'h039e039e;
              3'h6: delta_pair = 32'h03a103a1;
              3'h7: delta_pair = 32'h03a403a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03a603a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03a903a9;
              3'h2: delta_pair = 32'h03ac03ac;
              3'h3: delta_pair = 32'h03af03af;
              3'h4: delta_pair = 32'h03b203b2;
              3'h5: delta_pair = 32'h03b503b5;
              3'h6: delta_pair = 32'h03b803b8;
              3'h7: delta_pair = 32'h03bb03bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h03be03be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03c103c1;
              3'h2: delta_pair = 32'h03c403c4;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03cb03cb;
              3'h5: delta_pair = 32'h03ce03ce;
              3'h6: delta_pair = 32'h03d103d1;
              3'h7: delta_pair = 32'h03d503d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03d803d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03db03db;
              3'h2: delta_pair = 32'h03df03df;
              3'h3: delta_pair = 32'h03e203e2;
              3'h4: delta_pair = 32'h03e603e6;
              3'h5: delta_pair = 32'h03e903e9;
              3'h6: delta_pair = 32'h03ed03ed;
              3'h7: delta_pair = 32'h03f003f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03f403f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03f803f8;
              3'h2: delta_pair = 32'h03fc03fc;
              3'h3: delta_pair = 32'h03ff03ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h0f020f02;
              3'h5: delta_pair = 32'h0f030f03;
              3'h6: delta_pair = 32'h0f050f05;
              3'h7: delta_pair = 32'h0f070f07;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h0f090f09;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f0b0f0b;
              3'h2: delta_pair = 32'h0f0d0f0d;
              3'h3: delta_pair = 32'h0f0f0f0f;
              3'h4: delta_pair = 32'h0f110f11;
              3'h5: delta_pair = 32'h0f130f13;
              3'h6: delta_pair = 32'h0f160f16;
              3'h7: delta_pair = 32'h0f180f18;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h0f1a0f1a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f1c0f1c;
              3'h2: delta_pair = 32'h0f1e0f1e;
              3'h3: delta_pair = 32'h0f200f20;
              3'h4: delta_pair = 32'h0f220f22;
              3'h5: delta_pair = 32'h0f250f25;
              3'h6: delta_pair = 32'h0f270f27;
              3'h7: delta_pair = 32'h0f290f29;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h0f2c0f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f2e0f2e;
              3'h2: delta_pair = 32'h0f300f30;
              3'h3: delta_pair = 32'h0f320f32;
              3'h4: delta_pair = 32'h0f350f35;
              3'h5: delta_pair = 32'h0f370f37;
              3'h6: delta_pair = 32'h0f3a0f3a;
              3'h7: delta_pair = 32'h0f3c0f3c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h0f3f0f3f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f410f41;
              3'h2: delta_pair = 32'h0f440f44;
              3'h3: delta_pair = 32'h0f460f46;
              3'h4: delta_pair = 32'h0f490f49;
              3'h5: delta_pair = 32'h0f4b0f4b;
              3'h6: delta_pair = 32'h0f4e0f4e;
              3'h7: delta_pair = 32'h0f500f50;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h0f530f53;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f560f56;
              3'h2: delta_pair = 32'h0f580f58;
              3'h3: delta_pair = 32'h0f5b0f5b;
              3'h4: delta_pair = 32'h0f5e0f5e;
              3'h5: delta_pair = 32'h0f600f60;
              3'h6: delta_pair = 32'h0f630f63;
              3'h7: delta_pair = 32'h0f660f66;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h0f690f69;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f6c0f6c;
              3'h2: delta_pair = 32'h0f6e0f6e;
              3'h3: delta_pair = 32'h0f710f71;
              3'h4: delta_pair = 32'h0f740f74;
              3'h5: delta_pair = 32'h0f770f77;
              3'h6: delta_pair = 32'h0f7a0f7a;
              3'h7: delta_pair = 32'h0f7d0f7d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h07820782;
              3'h3: delta_pair = 32'h07840784;
              3'h4: delta_pair = 32'h07870787;
              3'h5: delta_pair = 32'h07890789;
              3'h6: delta_pair = 32'h078c078c;
              3'h7: delta_pair = 32'h078e078e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h07910791;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07930793;
              3'h2: delta_pair = 32'h07960796;
              3'h3: delta_pair = 32'h07990799;
              3'h4: delta_pair = 32'h079b079b;
              3'h5: delta_pair = 32'h079e079e;
              3'h6: delta_pair = 32'h07a107a1;
              3'h7: delta_pair = 32'h07a407a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h07a607a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07a907a9;
              3'h2: delta_pair = 32'h07ac07ac;
              3'h3: delta_pair = 32'h07af07af;
              3'h4: delta_pair = 32'h07b207b2;
              3'h5: delta_pair = 32'h07b507b5;
              3'h6: delta_pair = 32'h07b807b8;
              3'h7: delta_pair = 32'h07bb07bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h07be07be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07c107c1;
              3'h2: delta_pair = 32'h07c407c4;
              3'h3: delta_pair = 32'h07c807c8;
              3'h4: delta_pair = 32'h07cb07cb;
              3'h5: delta_pair = 32'h07ce07ce;
              3'h6: delta_pair = 32'h07d107d1;
              3'h7: delta_pair = 32'h07d507d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h07d807d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07db07db;
              3'h2: delta_pair = 32'h07df07df;
              3'h3: delta_pair = 32'h07e207e2;
              3'h4: delta_pair = 32'h07e607e6;
              3'h5: delta_pair = 32'h07e907e9;
              3'h6: delta_pair = 32'h07ed07ed;
              3'h7: delta_pair = 32'h07f007f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h07f407f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07f807f8;
              3'h2: delta_pair = 32'h07fc07fc;
              3'h3: delta_pair = 32'h07ff07ff;
              3'h4: delta_pair = 32'h07020702;
              3'h5: delta_pair = 32'h07030703;
              3'h6: delta_pair = 32'h07050705;
              3'h7: delta_pair = 32'h07070707;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h07090709;
            case (mant_lo3)
              3'h1: delta_pair = 32'h070b070b;
              3'h2: delta_pair = 32'h070d070d;
              3'h3: delta_pair = 32'h070f070f;
              3'h4: delta_pair = 32'h07110711;
              3'h5: delta_pair = 32'h07130713;
              3'h6: delta_pair = 32'h07160716;
              3'h7: delta_pair = 32'h07180718;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h071a071a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h071c071c;
              3'h2: delta_pair = 32'h071e071e;
              3'h3: delta_pair = 32'h07200720;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h07250725;
              3'h6: delta_pair = 32'h07270727;
              3'h7: delta_pair = 32'h07290729;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072e072e;
              3'h2: delta_pair = 32'h07300730;
              3'h3: delta_pair = 32'h07320732;
              3'h4: delta_pair = 32'h07350735;
              3'h5: delta_pair = 32'h07370737;
              3'h6: delta_pair = 32'h073a073a;
              3'h7: delta_pair = 32'h073c073c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h073f073f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07410741;
              3'h2: delta_pair = 32'h07440744;
              3'h3: delta_pair = 32'h07460746;
              3'h4: delta_pair = 32'h07490749;
              3'h5: delta_pair = 32'h074b074b;
              3'h6: delta_pair = 32'h074e074e;
              3'h7: delta_pair = 32'h07500750;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h07530753;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07560756;
              3'h2: delta_pair = 32'h07580758;
              3'h3: delta_pair = 32'h075b075b;
              3'h4: delta_pair = 32'h075e075e;
              3'h5: delta_pair = 32'h07600760;
              3'h6: delta_pair = 32'h07630763;
              3'h7: delta_pair = 32'h07660766;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h07690769;
            case (mant_lo3)
              3'h1: delta_pair = 32'h076c076c;
              3'h2: delta_pair = 32'h076e076e;
              3'h3: delta_pair = 32'h07710771;
              3'h4: delta_pair = 32'h07740774;
              3'h5: delta_pair = 32'h07770777;
              3'h6: delta_pair = 32'h077a077a;
              3'h7: delta_pair = 32'h077d077d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h03820382;
              3'h3: delta_pair = 32'h03840384;
              3'h4: delta_pair = 32'h03870387;
              3'h5: delta_pair = 32'h03890389;
              3'h6: delta_pair = 32'h038c038c;
              3'h7: delta_pair = 32'h038e038e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03910391;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03930393;
              3'h2: delta_pair = 32'h03960396;
              3'h3: delta_pair = 32'h03990399;
              3'h4: delta_pair = 32'h039b039b;
              3'h5: delta_pair = 32'h039e039e;
              3'h6: delta_pair = 32'h03a103a1;
              3'h7: delta_pair = 32'h03a403a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03a603a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03a903a9;
              3'h2: delta_pair = 32'h03ac03ac;
              3'h3: delta_pair = 32'h03af03af;
              3'h4: delta_pair = 32'h03b203b2;
              3'h5: delta_pair = 32'h03b503b5;
              3'h6: delta_pair = 32'h03b803b8;
              3'h7: delta_pair = 32'h03bb03bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h03be03be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03c103c1;
              3'h2: delta_pair = 32'h03c403c4;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03cb03cb;
              3'h5: delta_pair = 32'h03ce03ce;
              3'h6: delta_pair = 32'h03d103d1;
              3'h7: delta_pair = 32'h03d503d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03d803d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03db03db;
              3'h2: delta_pair = 32'h03df03df;
              3'h3: delta_pair = 32'h03e203e2;
              3'h4: delta_pair = 32'h03e603e6;
              3'h5: delta_pair = 32'h03e903e9;
              3'h6: delta_pair = 32'h03ed03ed;
              3'h7: delta_pair = 32'h03f003f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03f403f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03f803f8;
              3'h2: delta_pair = 32'h03fc03fc;
              3'h3: delta_pair = 32'h03ff03ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h07020702;
              3'h5: delta_pair = 32'h07030703;
              3'h6: delta_pair = 32'h07050705;
              3'h7: delta_pair = 32'h07070707;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h07090709;
            case (mant_lo3)
              3'h1: delta_pair = 32'h070b070b;
              3'h2: delta_pair = 32'h070d070d;
              3'h3: delta_pair = 32'h070f070f;
              3'h4: delta_pair = 32'h07110711;
              3'h5: delta_pair = 32'h07130713;
              3'h6: delta_pair = 32'h07160716;
              3'h7: delta_pair = 32'h07180718;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h071a071a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h071c071c;
              3'h2: delta_pair = 32'h071e071e;
              3'h3: delta_pair = 32'h07200720;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h07250725;
              3'h6: delta_pair = 32'h07270727;
              3'h7: delta_pair = 32'h07290729;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072e072e;
              3'h2: delta_pair = 32'h07300730;
              3'h3: delta_pair = 32'h07320732;
              3'h4: delta_pair = 32'h07350735;
              3'h5: delta_pair = 32'h07370737;
              3'h6: delta_pair = 32'h073a073a;
              3'h7: delta_pair = 32'h073c073c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h073f073f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07410741;
              3'h2: delta_pair = 32'h07440744;
              3'h3: delta_pair = 32'h07460746;
              3'h4: delta_pair = 32'h07490749;
              3'h5: delta_pair = 32'h074b074b;
              3'h6: delta_pair = 32'h074e074e;
              3'h7: delta_pair = 32'h07500750;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h07530753;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07560756;
              3'h2: delta_pair = 32'h07580758;
              3'h3: delta_pair = 32'h075b075b;
              3'h4: delta_pair = 32'h075e075e;
              3'h5: delta_pair = 32'h07600760;
              3'h6: delta_pair = 32'h07630763;
              3'h7: delta_pair = 32'h07660766;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h07690769;
            case (mant_lo3)
              3'h1: delta_pair = 32'h076c076c;
              3'h2: delta_pair = 32'h076e076e;
              3'h3: delta_pair = 32'h07710771;
              3'h4: delta_pair = 32'h07740774;
              3'h5: delta_pair = 32'h07770777;
              3'h6: delta_pair = 32'h077a077a;
              3'h7: delta_pair = 32'h077d077d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h0f820f82;
              3'h3: delta_pair = 32'h0f840f84;
              3'h4: delta_pair = 32'h0f870f87;
              3'h5: delta_pair = 32'h0f890f89;
              3'h6: delta_pair = 32'h0f8c0f8c;
              3'h7: delta_pair = 32'h0f8e0f8e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h0f910f91;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f930f93;
              3'h2: delta_pair = 32'h0f960f96;
              3'h3: delta_pair = 32'h0f990f99;
              3'h4: delta_pair = 32'h0f9b0f9b;
              3'h5: delta_pair = 32'h0f9e0f9e;
              3'h6: delta_pair = 32'h0fa10fa1;
              3'h7: delta_pair = 32'h0fa40fa4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h0fa60fa6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fa90fa9;
              3'h2: delta_pair = 32'h0fac0fac;
              3'h3: delta_pair = 32'h0faf0faf;
              3'h4: delta_pair = 32'h0fb20fb2;
              3'h5: delta_pair = 32'h0fb50fb5;
              3'h6: delta_pair = 32'h0fb80fb8;
              3'h7: delta_pair = 32'h0fbb0fbb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h0fbe0fbe;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fc10fc1;
              3'h2: delta_pair = 32'h0fc40fc4;
              3'h3: delta_pair = 32'h0fc80fc8;
              3'h4: delta_pair = 32'h0fcb0fcb;
              3'h5: delta_pair = 32'h0fce0fce;
              3'h6: delta_pair = 32'h0fd10fd1;
              3'h7: delta_pair = 32'h0fd50fd5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h0fd80fd8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fdb0fdb;
              3'h2: delta_pair = 32'h0fdf0fdf;
              3'h3: delta_pair = 32'h0fe20fe2;
              3'h4: delta_pair = 32'h0fe60fe6;
              3'h5: delta_pair = 32'h0fe90fe9;
              3'h6: delta_pair = 32'h0fed0fed;
              3'h7: delta_pair = 32'h0ff00ff0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h0ff40ff4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0ff80ff8;
              3'h2: delta_pair = 32'h0ffc0ffc;
              3'h3: delta_pair = 32'h0fff0fff;
              3'h4: delta_pair = 32'h0f020f02;
              3'h5: delta_pair = 32'h0f030f03;
              3'h6: delta_pair = 32'h0f050f05;
              3'h7: delta_pair = 32'h0f070f07;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h0f090f09;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f0b0f0b;
              3'h2: delta_pair = 32'h0f0d0f0d;
              3'h3: delta_pair = 32'h0f0f0f0f;
              3'h4: delta_pair = 32'h0f110f11;
              3'h5: delta_pair = 32'h0f130f13;
              3'h6: delta_pair = 32'h0f160f16;
              3'h7: delta_pair = 32'h0f180f18;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h0f1a0f1a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f1c0f1c;
              3'h2: delta_pair = 32'h0f1e0f1e;
              3'h3: delta_pair = 32'h0f200f20;
              3'h4: delta_pair = 32'h0f220f22;
              3'h5: delta_pair = 32'h0f250f25;
              3'h6: delta_pair = 32'h0f270f27;
              3'h7: delta_pair = 32'h0f290f29;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h0f2c0f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f2e0f2e;
              3'h2: delta_pair = 32'h0f300f30;
              3'h3: delta_pair = 32'h0f320f32;
              3'h4: delta_pair = 32'h0f350f35;
              3'h5: delta_pair = 32'h0f370f37;
              3'h6: delta_pair = 32'h0f3a0f3a;
              3'h7: delta_pair = 32'h0f3c0f3c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h0f3f0f3f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f410f41;
              3'h2: delta_pair = 32'h0f440f44;
              3'h3: delta_pair = 32'h0f460f46;
              3'h4: delta_pair = 32'h0f490f49;
              3'h5: delta_pair = 32'h0f4b0f4b;
              3'h6: delta_pair = 32'h0f4e0f4e;
              3'h7: delta_pair = 32'h0f500f50;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h0f530f53;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f560f56;
              3'h2: delta_pair = 32'h0f580f58;
              3'h3: delta_pair = 32'h0f5b0f5b;
              3'h4: delta_pair = 32'h0f5e0f5e;
              3'h5: delta_pair = 32'h0f600f60;
              3'h6: delta_pair = 32'h0f630f63;
              3'h7: delta_pair = 32'h0f660f66;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h0f690f69;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f6c0f6c;
              3'h2: delta_pair = 32'h0f6e0f6e;
              3'h3: delta_pair = 32'h0f710f71;
              3'h4: delta_pair = 32'h0f740f74;
              3'h5: delta_pair = 32'h0f770f77;
              3'h6: delta_pair = 32'h0f7a0f7a;
              3'h7: delta_pair = 32'h0f7d0f7d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h03820382;
              3'h3: delta_pair = 32'h03840384;
              3'h4: delta_pair = 32'h03870387;
              3'h5: delta_pair = 32'h03890389;
              3'h6: delta_pair = 32'h038c038c;
              3'h7: delta_pair = 32'h038e038e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03910391;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03930393;
              3'h2: delta_pair = 32'h03960396;
              3'h3: delta_pair = 32'h03990399;
              3'h4: delta_pair = 32'h039b039b;
              3'h5: delta_pair = 32'h039e039e;
              3'h6: delta_pair = 32'h03a103a1;
              3'h7: delta_pair = 32'h03a403a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03a603a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03a903a9;
              3'h2: delta_pair = 32'h03ac03ac;
              3'h3: delta_pair = 32'h03af03af;
              3'h4: delta_pair = 32'h03b203b2;
              3'h5: delta_pair = 32'h03b503b5;
              3'h6: delta_pair = 32'h03b803b8;
              3'h7: delta_pair = 32'h03bb03bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h03be03be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03c103c1;
              3'h2: delta_pair = 32'h03c403c4;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03cb03cb;
              3'h5: delta_pair = 32'h03ce03ce;
              3'h6: delta_pair = 32'h03d103d1;
              3'h7: delta_pair = 32'h03d503d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03d803d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03db03db;
              3'h2: delta_pair = 32'h03df03df;
              3'h3: delta_pair = 32'h03e203e2;
              3'h4: delta_pair = 32'h03e603e6;
              3'h5: delta_pair = 32'h03e903e9;
              3'h6: delta_pair = 32'h03ed03ed;
              3'h7: delta_pair = 32'h03f003f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03f403f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03f803f8;
              3'h2: delta_pair = 32'h03fc03fc;
              3'h3: delta_pair = 32'h03ff03ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h1f021f02;
              3'h5: delta_pair = 32'h1f031f03;
              3'h6: delta_pair = 32'h1f051f05;
              3'h7: delta_pair = 32'h1f071f07;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h1f091f09;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f0b1f0b;
              3'h2: delta_pair = 32'h1f0d1f0d;
              3'h3: delta_pair = 32'h1f0f1f0f;
              3'h4: delta_pair = 32'h1f111f11;
              3'h5: delta_pair = 32'h1f131f13;
              3'h6: delta_pair = 32'h1f161f16;
              3'h7: delta_pair = 32'h1f181f18;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h1f1a1f1a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f1c1f1c;
              3'h2: delta_pair = 32'h1f1e1f1e;
              3'h3: delta_pair = 32'h1f201f20;
              3'h4: delta_pair = 32'h1f221f22;
              3'h5: delta_pair = 32'h1f251f25;
              3'h6: delta_pair = 32'h1f271f27;
              3'h7: delta_pair = 32'h1f291f29;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h1f2c1f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f2e1f2e;
              3'h2: delta_pair = 32'h1f301f30;
              3'h3: delta_pair = 32'h1f321f32;
              3'h4: delta_pair = 32'h1f351f35;
              3'h5: delta_pair = 32'h1f371f37;
              3'h6: delta_pair = 32'h1f3a1f3a;
              3'h7: delta_pair = 32'h1f3c1f3c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h1f3f1f3f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f411f41;
              3'h2: delta_pair = 32'h1f441f44;
              3'h3: delta_pair = 32'h1f461f46;
              3'h4: delta_pair = 32'h1f491f49;
              3'h5: delta_pair = 32'h1f4b1f4b;
              3'h6: delta_pair = 32'h1f4e1f4e;
              3'h7: delta_pair = 32'h1f501f50;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h1f531f53;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f561f56;
              3'h2: delta_pair = 32'h1f581f58;
              3'h3: delta_pair = 32'h1f5b1f5b;
              3'h4: delta_pair = 32'h1f5e1f5e;
              3'h5: delta_pair = 32'h1f601f60;
              3'h6: delta_pair = 32'h1f631f63;
              3'h7: delta_pair = 32'h1f661f66;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h1f691f69;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f6c1f6c;
              3'h2: delta_pair = 32'h1f6e1f6e;
              3'h3: delta_pair = 32'h1f711f71;
              3'h4: delta_pair = 32'h1f741f74;
              3'h5: delta_pair = 32'h1f771f77;
              3'h6: delta_pair = 32'h1f7a1f7a;
              3'h7: delta_pair = 32'h1f7d1f7d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h07820782;
              3'h3: delta_pair = 32'h07840784;
              3'h4: delta_pair = 32'h07870787;
              3'h5: delta_pair = 32'h07890789;
              3'h6: delta_pair = 32'h078c078c;
              3'h7: delta_pair = 32'h078e078e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h07910791;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07930793;
              3'h2: delta_pair = 32'h07960796;
              3'h3: delta_pair = 32'h07990799;
              3'h4: delta_pair = 32'h079b079b;
              3'h5: delta_pair = 32'h079e079e;
              3'h6: delta_pair = 32'h07a107a1;
              3'h7: delta_pair = 32'h07a407a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h07a607a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07a907a9;
              3'h2: delta_pair = 32'h07ac07ac;
              3'h3: delta_pair = 32'h07af07af;
              3'h4: delta_pair = 32'h07b207b2;
              3'h5: delta_pair = 32'h07b507b5;
              3'h6: delta_pair = 32'h07b807b8;
              3'h7: delta_pair = 32'h07bb07bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h07be07be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07c107c1;
              3'h2: delta_pair = 32'h07c407c4;
              3'h3: delta_pair = 32'h07c807c8;
              3'h4: delta_pair = 32'h07cb07cb;
              3'h5: delta_pair = 32'h07ce07ce;
              3'h6: delta_pair = 32'h07d107d1;
              3'h7: delta_pair = 32'h07d507d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h07d807d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07db07db;
              3'h2: delta_pair = 32'h07df07df;
              3'h3: delta_pair = 32'h07e207e2;
              3'h4: delta_pair = 32'h07e607e6;
              3'h5: delta_pair = 32'h07e907e9;
              3'h6: delta_pair = 32'h07ed07ed;
              3'h7: delta_pair = 32'h07f007f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h07f407f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07f807f8;
              3'h2: delta_pair = 32'h07fc07fc;
              3'h3: delta_pair = 32'h07ff07ff;
              3'h4: delta_pair = 32'h07020702;
              3'h5: delta_pair = 32'h07030703;
              3'h6: delta_pair = 32'h07050705;
              3'h7: delta_pair = 32'h07070707;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h07090709;
            case (mant_lo3)
              3'h1: delta_pair = 32'h070b070b;
              3'h2: delta_pair = 32'h070d070d;
              3'h3: delta_pair = 32'h070f070f;
              3'h4: delta_pair = 32'h07110711;
              3'h5: delta_pair = 32'h07130713;
              3'h6: delta_pair = 32'h07160716;
              3'h7: delta_pair = 32'h07180718;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h071a071a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h071c071c;
              3'h2: delta_pair = 32'h071e071e;
              3'h3: delta_pair = 32'h07200720;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h07250725;
              3'h6: delta_pair = 32'h07270727;
              3'h7: delta_pair = 32'h07290729;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072e072e;
              3'h2: delta_pair = 32'h07300730;
              3'h3: delta_pair = 32'h07320732;
              3'h4: delta_pair = 32'h07350735;
              3'h5: delta_pair = 32'h07370737;
              3'h6: delta_pair = 32'h073a073a;
              3'h7: delta_pair = 32'h073c073c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h073f073f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07410741;
              3'h2: delta_pair = 32'h07440744;
              3'h3: delta_pair = 32'h07460746;
              3'h4: delta_pair = 32'h07490749;
              3'h5: delta_pair = 32'h074b074b;
              3'h6: delta_pair = 32'h074e074e;
              3'h7: delta_pair = 32'h07500750;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h07530753;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07560756;
              3'h2: delta_pair = 32'h07580758;
              3'h3: delta_pair = 32'h075b075b;
              3'h4: delta_pair = 32'h075e075e;
              3'h5: delta_pair = 32'h07600760;
              3'h6: delta_pair = 32'h07630763;
              3'h7: delta_pair = 32'h07660766;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h07690769;
            case (mant_lo3)
              3'h1: delta_pair = 32'h076c076c;
              3'h2: delta_pair = 32'h076e076e;
              3'h3: delta_pair = 32'h07710771;
              3'h4: delta_pair = 32'h07740774;
              3'h5: delta_pair = 32'h07770777;
              3'h6: delta_pair = 32'h077a077a;
              3'h7: delta_pair = 32'h077d077d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h03820382;
              3'h3: delta_pair = 32'h03840384;
              3'h4: delta_pair = 32'h03870387;
              3'h5: delta_pair = 32'h03890389;
              3'h6: delta_pair = 32'h038c038c;
              3'h7: delta_pair = 32'h038e038e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03910391;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03930393;
              3'h2: delta_pair = 32'h03960396;
              3'h3: delta_pair = 32'h03990399;
              3'h4: delta_pair = 32'h039b039b;
              3'h5: delta_pair = 32'h039e039e;
              3'h6: delta_pair = 32'h03a103a1;
              3'h7: delta_pair = 32'h03a403a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03a603a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03a903a9;
              3'h2: delta_pair = 32'h03ac03ac;
              3'h3: delta_pair = 32'h03af03af;
              3'h4: delta_pair = 32'h03b203b2;
              3'h5: delta_pair = 32'h03b503b5;
              3'h6: delta_pair = 32'h03b803b8;
              3'h7: delta_pair = 32'h03bb03bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h03be03be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03c103c1;
              3'h2: delta_pair = 32'h03c403c4;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03cb03cb;
              3'h5: delta_pair = 32'h03ce03ce;
              3'h6: delta_pair = 32'h03d103d1;
              3'h7: delta_pair = 32'h03d503d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03d803d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03db03db;
              3'h2: delta_pair = 32'h03df03df;
              3'h3: delta_pair = 32'h03e203e2;
              3'h4: delta_pair = 32'h03e603e6;
              3'h5: delta_pair = 32'h03e903e9;
              3'h6: delta_pair = 32'h03ed03ed;
              3'h7: delta_pair = 32'h03f003f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03f403f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03f803f8;
              3'h2: delta_pair = 32'h03fc03fc;
              3'h3: delta_pair = 32'h03ff03ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h07020702;
              3'h5: delta_pair = 32'h07030703;
              3'h6: delta_pair = 32'h07050705;
              3'h7: delta_pair = 32'h07070707;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h07090709;
            case (mant_lo3)
              3'h1: delta_pair = 32'h070b070b;
              3'h2: delta_pair = 32'h070d070d;
              3'h3: delta_pair = 32'h070f070f;
              3'h4: delta_pair = 32'h07110711;
              3'h5: delta_pair = 32'h07130713;
              3'h6: delta_pair = 32'h07160716;
              3'h7: delta_pair = 32'h07180718;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h071a071a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h071c071c;
              3'h2: delta_pair = 32'h071e071e;
              3'h3: delta_pair = 32'h07200720;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h07250725;
              3'h6: delta_pair = 32'h07270727;
              3'h7: delta_pair = 32'h07290729;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072e072e;
              3'h2: delta_pair = 32'h07300730;
              3'h3: delta_pair = 32'h07320732;
              3'h4: delta_pair = 32'h07350735;
              3'h5: delta_pair = 32'h07370737;
              3'h6: delta_pair = 32'h073a073a;
              3'h7: delta_pair = 32'h073c073c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h073f073f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07410741;
              3'h2: delta_pair = 32'h07440744;
              3'h3: delta_pair = 32'h07460746;
              3'h4: delta_pair = 32'h07490749;
              3'h5: delta_pair = 32'h074b074b;
              3'h6: delta_pair = 32'h074e074e;
              3'h7: delta_pair = 32'h07500750;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h07530753;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07560756;
              3'h2: delta_pair = 32'h07580758;
              3'h3: delta_pair = 32'h075b075b;
              3'h4: delta_pair = 32'h075e075e;
              3'h5: delta_pair = 32'h07600760;
              3'h6: delta_pair = 32'h07630763;
              3'h7: delta_pair = 32'h07660766;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h07690769;
            case (mant_lo3)
              3'h1: delta_pair = 32'h076c076c;
              3'h2: delta_pair = 32'h076e076e;
              3'h3: delta_pair = 32'h07710771;
              3'h4: delta_pair = 32'h07740774;
              3'h5: delta_pair = 32'h07770777;
              3'h6: delta_pair = 32'h077a077a;
              3'h7: delta_pair = 32'h077d077d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h7f827f82;
              3'h3: delta_pair = 32'h7f847f84;
              3'h4: delta_pair = 32'h7f877f87;
              3'h5: delta_pair = 32'h7f897f89;
              3'h6: delta_pair = 32'h7f8c7f8c;
              3'h7: delta_pair = 32'h7f8e7f8e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h7f917f91;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7f937f93;
              3'h2: delta_pair = 32'h7f967f96;
              3'h3: delta_pair = 32'h7f997f99;
              3'h4: delta_pair = 32'h7f9b7f9b;
              3'h5: delta_pair = 32'h7f9e7f9e;
              3'h6: delta_pair = 32'h7fa17fa1;
              3'h7: delta_pair = 32'h7fa47fa4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h7fa67fa6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7fa97fa9;
              3'h2: delta_pair = 32'h7fac7fac;
              3'h3: delta_pair = 32'h7faf7faf;
              3'h4: delta_pair = 32'h7fb27fb2;
              3'h5: delta_pair = 32'h7fb57fb5;
              3'h6: delta_pair = 32'h7fb87fb8;
              3'h7: delta_pair = 32'h7fbb7fbb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h7fbe7fbe;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7fc17fc1;
              3'h2: delta_pair = 32'h7fc47fc4;
              3'h3: delta_pair = 32'h7fc87fc8;
              3'h4: delta_pair = 32'h7fcb7fcb;
              3'h5: delta_pair = 32'h7fce7fce;
              3'h6: delta_pair = 32'h7fd17fd1;
              3'h7: delta_pair = 32'h7fd57fd5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h7fd87fd8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7fdb7fdb;
              3'h2: delta_pair = 32'h7fdf7fdf;
              3'h3: delta_pair = 32'h7fe27fe2;
              3'h4: delta_pair = 32'h7fe67fe6;
              3'h5: delta_pair = 32'h7fe97fe9;
              3'h6: delta_pair = 32'h7fed7fed;
              3'h7: delta_pair = 32'h7ff07ff0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h7ff47ff4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7ff87ff8;
              3'h2: delta_pair = 32'h7ffc7ffc;
              3'h3: delta_pair = 32'h7fff7fff;
              3'h4: delta_pair = 32'h7f027f02;
              3'h5: delta_pair = 32'h7f037f03;
              3'h6: delta_pair = 32'h7f057f05;
              3'h7: delta_pair = 32'h7f077f07;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h7f097f09;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7f0b7f0b;
              3'h2: delta_pair = 32'h7f0d7f0d;
              3'h3: delta_pair = 32'h7f0f7f0f;
              3'h4: delta_pair = 32'h7f117f11;
              3'h5: delta_pair = 32'h7f137f13;
              3'h6: delta_pair = 32'h7f167f16;
              3'h7: delta_pair = 32'h7f187f18;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h7f1a7f1a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7f1c7f1c;
              3'h2: delta_pair = 32'h7f1e7f1e;
              3'h3: delta_pair = 32'h7f207f20;
              3'h4: delta_pair = 32'h7f227f22;
              3'h5: delta_pair = 32'h7f257f25;
              3'h6: delta_pair = 32'h7f277f27;
              3'h7: delta_pair = 32'h7f297f29;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h7f2c7f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7f2e7f2e;
              3'h2: delta_pair = 32'h7f307f30;
              3'h3: delta_pair = 32'h7f327f32;
              3'h4: delta_pair = 32'h7f357f35;
              3'h5: delta_pair = 32'h7f377f37;
              3'h6: delta_pair = 32'h7f3a7f3a;
              3'h7: delta_pair = 32'h7f3c7f3c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h7f3f7f3f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7f417f41;
              3'h2: delta_pair = 32'h7f447f44;
              3'h3: delta_pair = 32'h7f467f46;
              3'h4: delta_pair = 32'h7f497f49;
              3'h5: delta_pair = 32'h7f4b7f4b;
              3'h6: delta_pair = 32'h7f4e7f4e;
              3'h7: delta_pair = 32'h7f507f50;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h7f537f53;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7f567f56;
              3'h2: delta_pair = 32'h7f587f58;
              3'h3: delta_pair = 32'h7f5b7f5b;
              3'h4: delta_pair = 32'h7f5e7f5e;
              3'h5: delta_pair = 32'h7f607f60;
              3'h6: delta_pair = 32'h7f637f63;
              3'h7: delta_pair = 32'h7f667f66;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h7f697f69;
            case (mant_lo3)
              3'h1: delta_pair = 32'h7f6c7f6c;
              3'h2: delta_pair = 32'h7f6e7f6e;
              3'h3: delta_pair = 32'h7f717f71;
              3'h4: delta_pair = 32'h7f747f74;
              3'h5: delta_pair = 32'h7f777f77;
              3'h6: delta_pair = 32'h7f7a7f7a;
              3'h7: delta_pair = 32'h7f7d7f7d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h03820382;
              3'h3: delta_pair = 32'h03840384;
              3'h4: delta_pair = 32'h03870387;
              3'h5: delta_pair = 32'h03890389;
              3'h6: delta_pair = 32'h038c038c;
              3'h7: delta_pair = 32'h038e038e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03910391;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03930393;
              3'h2: delta_pair = 32'h03960396;
              3'h3: delta_pair = 32'h03990399;
              3'h4: delta_pair = 32'h039b039b;
              3'h5: delta_pair = 32'h039e039e;
              3'h6: delta_pair = 32'h03a103a1;
              3'h7: delta_pair = 32'h03a403a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03a603a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03a903a9;
              3'h2: delta_pair = 32'h03ac03ac;
              3'h3: delta_pair = 32'h03af03af;
              3'h4: delta_pair = 32'h03b203b2;
              3'h5: delta_pair = 32'h03b503b5;
              3'h6: delta_pair = 32'h03b803b8;
              3'h7: delta_pair = 32'h03bb03bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h03be03be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03c103c1;
              3'h2: delta_pair = 32'h03c403c4;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03cb03cb;
              3'h5: delta_pair = 32'h03ce03ce;
              3'h6: delta_pair = 32'h03d103d1;
              3'h7: delta_pair = 32'h03d503d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03d803d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03db03db;
              3'h2: delta_pair = 32'h03df03df;
              3'h3: delta_pair = 32'h03e203e2;
              3'h4: delta_pair = 32'h03e603e6;
              3'h5: delta_pair = 32'h03e903e9;
              3'h6: delta_pair = 32'h03ed03ed;
              3'h7: delta_pair = 32'h03f003f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03f403f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03f803f8;
              3'h2: delta_pair = 32'h03fc03fc;
              3'h3: delta_pair = 32'h03ff03ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h0f020f02;
              3'h5: delta_pair = 32'h0f030f03;
              3'h6: delta_pair = 32'h0f050f05;
              3'h7: delta_pair = 32'h0f070f07;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h0f090f09;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f0b0f0b;
              3'h2: delta_pair = 32'h0f0d0f0d;
              3'h3: delta_pair = 32'h0f0f0f0f;
              3'h4: delta_pair = 32'h0f110f11;
              3'h5: delta_pair = 32'h0f130f13;
              3'h6: delta_pair = 32'h0f160f16;
              3'h7: delta_pair = 32'h0f180f18;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h0f1a0f1a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f1c0f1c;
              3'h2: delta_pair = 32'h0f1e0f1e;
              3'h3: delta_pair = 32'h0f200f20;
              3'h4: delta_pair = 32'h0f220f22;
              3'h5: delta_pair = 32'h0f250f25;
              3'h6: delta_pair = 32'h0f270f27;
              3'h7: delta_pair = 32'h0f290f29;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h0f2c0f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f2e0f2e;
              3'h2: delta_pair = 32'h0f300f30;
              3'h3: delta_pair = 32'h0f320f32;
              3'h4: delta_pair = 32'h0f350f35;
              3'h5: delta_pair = 32'h0f370f37;
              3'h6: delta_pair = 32'h0f3a0f3a;
              3'h7: delta_pair = 32'h0f3c0f3c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h0f3f0f3f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f410f41;
              3'h2: delta_pair = 32'h0f440f44;
              3'h3: delta_pair = 32'h0f460f46;
              3'h4: delta_pair = 32'h0f490f49;
              3'h5: delta_pair = 32'h0f4b0f4b;
              3'h6: delta_pair = 32'h0f4e0f4e;
              3'h7: delta_pair = 32'h0f500f50;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h0f530f53;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f560f56;
              3'h2: delta_pair = 32'h0f580f58;
              3'h3: delta_pair = 32'h0f5b0f5b;
              3'h4: delta_pair = 32'h0f5e0f5e;
              3'h5: delta_pair = 32'h0f600f60;
              3'h6: delta_pair = 32'h0f630f63;
              3'h7: delta_pair = 32'h0f660f66;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h0f690f69;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f6c0f6c;
              3'h2: delta_pair = 32'h0f6e0f6e;
              3'h3: delta_pair = 32'h0f710f71;
              3'h4: delta_pair = 32'h0f740f74;
              3'h5: delta_pair = 32'h0f770f77;
              3'h6: delta_pair = 32'h0f7a0f7a;
              3'h7: delta_pair = 32'h0f7d0f7d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h07820782;
              3'h3: delta_pair = 32'h07840784;
              3'h4: delta_pair = 32'h07870787;
              3'h5: delta_pair = 32'h07890789;
              3'h6: delta_pair = 32'h078c078c;
              3'h7: delta_pair = 32'h078e078e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h07910791;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07930793;
              3'h2: delta_pair = 32'h07960796;
              3'h3: delta_pair = 32'h07990799;
              3'h4: delta_pair = 32'h079b079b;
              3'h5: delta_pair = 32'h079e079e;
              3'h6: delta_pair = 32'h07a107a1;
              3'h7: delta_pair = 32'h07a407a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h07a607a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07a907a9;
              3'h2: delta_pair = 32'h07ac07ac;
              3'h3: delta_pair = 32'h07af07af;
              3'h4: delta_pair = 32'h07b207b2;
              3'h5: delta_pair = 32'h07b507b5;
              3'h6: delta_pair = 32'h07b807b8;
              3'h7: delta_pair = 32'h07bb07bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h07be07be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07c107c1;
              3'h2: delta_pair = 32'h07c407c4;
              3'h3: delta_pair = 32'h07c807c8;
              3'h4: delta_pair = 32'h07cb07cb;
              3'h5: delta_pair = 32'h07ce07ce;
              3'h6: delta_pair = 32'h07d107d1;
              3'h7: delta_pair = 32'h07d507d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h07d807d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07db07db;
              3'h2: delta_pair = 32'h07df07df;
              3'h3: delta_pair = 32'h07e207e2;
              3'h4: delta_pair = 32'h07e607e6;
              3'h5: delta_pair = 32'h07e907e9;
              3'h6: delta_pair = 32'h07ed07ed;
              3'h7: delta_pair = 32'h07f007f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h07f407f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07f807f8;
              3'h2: delta_pair = 32'h07fc07fc;
              3'h3: delta_pair = 32'h07ff07ff;
              3'h4: delta_pair = 32'h07020702;
              3'h5: delta_pair = 32'h07030703;
              3'h6: delta_pair = 32'h07050705;
              3'h7: delta_pair = 32'h07070707;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h07090709;
            case (mant_lo3)
              3'h1: delta_pair = 32'h070b070b;
              3'h2: delta_pair = 32'h070d070d;
              3'h3: delta_pair = 32'h070f070f;
              3'h4: delta_pair = 32'h07110711;
              3'h5: delta_pair = 32'h07130713;
              3'h6: delta_pair = 32'h07160716;
              3'h7: delta_pair = 32'h07180718;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h071a071a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h071c071c;
              3'h2: delta_pair = 32'h071e071e;
              3'h3: delta_pair = 32'h07200720;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h07250725;
              3'h6: delta_pair = 32'h07270727;
              3'h7: delta_pair = 32'h07290729;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072e072e;
              3'h2: delta_pair = 32'h07300730;
              3'h3: delta_pair = 32'h07320732;
              3'h4: delta_pair = 32'h07350735;
              3'h5: delta_pair = 32'h07370737;
              3'h6: delta_pair = 32'h073a073a;
              3'h7: delta_pair = 32'h073c073c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h073f073f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07410741;
              3'h2: delta_pair = 32'h07440744;
              3'h3: delta_pair = 32'h07460746;
              3'h4: delta_pair = 32'h07490749;
              3'h5: delta_pair = 32'h074b074b;
              3'h6: delta_pair = 32'h074e074e;
              3'h7: delta_pair = 32'h07500750;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h07530753;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07560756;
              3'h2: delta_pair = 32'h07580758;
              3'h3: delta_pair = 32'h075b075b;
              3'h4: delta_pair = 32'h075e075e;
              3'h5: delta_pair = 32'h07600760;
              3'h6: delta_pair = 32'h07630763;
              3'h7: delta_pair = 32'h07660766;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h07690769;
            case (mant_lo3)
              3'h1: delta_pair = 32'h076c076c;
              3'h2: delta_pair = 32'h076e076e;
              3'h3: delta_pair = 32'h07710771;
              3'h4: delta_pair = 32'h07740774;
              3'h5: delta_pair = 32'h07770777;
              3'h6: delta_pair = 32'h077a077a;
              3'h7: delta_pair = 32'h077d077d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h03820382;
              3'h3: delta_pair = 32'h03840384;
              3'h4: delta_pair = 32'h03870387;
              3'h5: delta_pair = 32'h03890389;
              3'h6: delta_pair = 32'h038c038c;
              3'h7: delta_pair = 32'h038e038e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03910391;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03930393;
              3'h2: delta_pair = 32'h03960396;
              3'h3: delta_pair = 32'h03990399;
              3'h4: delta_pair = 32'h039b039b;
              3'h5: delta_pair = 32'h039e039e;
              3'h6: delta_pair = 32'h03a103a1;
              3'h7: delta_pair = 32'h03a403a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03a603a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03a903a9;
              3'h2: delta_pair = 32'h03ac03ac;
              3'h3: delta_pair = 32'h03af03af;
              3'h4: delta_pair = 32'h03b203b2;
              3'h5: delta_pair = 32'h03b503b5;
              3'h6: delta_pair = 32'h03b803b8;
              3'h7: delta_pair = 32'h03bb03bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h03be03be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03c103c1;
              3'h2: delta_pair = 32'h03c403c4;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03cb03cb;
              3'h5: delta_pair = 32'h03ce03ce;
              3'h6: delta_pair = 32'h03d103d1;
              3'h7: delta_pair = 32'h03d503d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03d803d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03db03db;
              3'h2: delta_pair = 32'h03df03df;
              3'h3: delta_pair = 32'h03e203e2;
              3'h4: delta_pair = 32'h03e603e6;
              3'h5: delta_pair = 32'h03e903e9;
              3'h6: delta_pair = 32'h03ed03ed;
              3'h7: delta_pair = 32'h03f003f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03f403f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03f803f8;
              3'h2: delta_pair = 32'h03fc03fc;
              3'h3: delta_pair = 32'h03ff03ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h07020702;
              3'h5: delta_pair = 32'h07030703;
              3'h6: delta_pair = 32'h07050705;
              3'h7: delta_pair = 32'h07070707;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h07090709;
            case (mant_lo3)
              3'h1: delta_pair = 32'h070b070b;
              3'h2: delta_pair = 32'h070d070d;
              3'h3: delta_pair = 32'h070f070f;
              3'h4: delta_pair = 32'h07110711;
              3'h5: delta_pair = 32'h07130713;
              3'h6: delta_pair = 32'h07160716;
              3'h7: delta_pair = 32'h07180718;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h071a071a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h071c071c;
              3'h2: delta_pair = 32'h071e071e;
              3'h3: delta_pair = 32'h07200720;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h07250725;
              3'h6: delta_pair = 32'h07270727;
              3'h7: delta_pair = 32'h07290729;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072e072e;
              3'h2: delta_pair = 32'h07300730;
              3'h3: delta_pair = 32'h07320732;
              3'h4: delta_pair = 32'h07350735;
              3'h5: delta_pair = 32'h07370737;
              3'h6: delta_pair = 32'h073a073a;
              3'h7: delta_pair = 32'h073c073c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h073f073f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07410741;
              3'h2: delta_pair = 32'h07440744;
              3'h3: delta_pair = 32'h07460746;
              3'h4: delta_pair = 32'h07490749;
              3'h5: delta_pair = 32'h074b074b;
              3'h6: delta_pair = 32'h074e074e;
              3'h7: delta_pair = 32'h07500750;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h07530753;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07560756;
              3'h2: delta_pair = 32'h07580758;
              3'h3: delta_pair = 32'h075b075b;
              3'h4: delta_pair = 32'h075e075e;
              3'h5: delta_pair = 32'h07600760;
              3'h6: delta_pair = 32'h07630763;
              3'h7: delta_pair = 32'h07660766;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h07690769;
            case (mant_lo3)
              3'h1: delta_pair = 32'h076c076c;
              3'h2: delta_pair = 32'h076e076e;
              3'h3: delta_pair = 32'h07710771;
              3'h4: delta_pair = 32'h07740774;
              3'h5: delta_pair = 32'h07770777;
              3'h6: delta_pair = 32'h077a077a;
              3'h7: delta_pair = 32'h077d077d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h0f820f82;
              3'h3: delta_pair = 32'h0f840f84;
              3'h4: delta_pair = 32'h0f870f87;
              3'h5: delta_pair = 32'h0f890f89;
              3'h6: delta_pair = 32'h0f8c0f8c;
              3'h7: delta_pair = 32'h0f8e0f8e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h0f910f91;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f930f93;
              3'h2: delta_pair = 32'h0f960f96;
              3'h3: delta_pair = 32'h0f990f99;
              3'h4: delta_pair = 32'h0f9b0f9b;
              3'h5: delta_pair = 32'h0f9e0f9e;
              3'h6: delta_pair = 32'h0fa10fa1;
              3'h7: delta_pair = 32'h0fa40fa4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h0fa60fa6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fa90fa9;
              3'h2: delta_pair = 32'h0fac0fac;
              3'h3: delta_pair = 32'h0faf0faf;
              3'h4: delta_pair = 32'h0fb20fb2;
              3'h5: delta_pair = 32'h0fb50fb5;
              3'h6: delta_pair = 32'h0fb80fb8;
              3'h7: delta_pair = 32'h0fbb0fbb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h0fbe0fbe;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fc10fc1;
              3'h2: delta_pair = 32'h0fc40fc4;
              3'h3: delta_pair = 32'h0fc80fc8;
              3'h4: delta_pair = 32'h0fcb0fcb;
              3'h5: delta_pair = 32'h0fce0fce;
              3'h6: delta_pair = 32'h0fd10fd1;
              3'h7: delta_pair = 32'h0fd50fd5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h0fd80fd8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0fdb0fdb;
              3'h2: delta_pair = 32'h0fdf0fdf;
              3'h3: delta_pair = 32'h0fe20fe2;
              3'h4: delta_pair = 32'h0fe60fe6;
              3'h5: delta_pair = 32'h0fe90fe9;
              3'h6: delta_pair = 32'h0fed0fed;
              3'h7: delta_pair = 32'h0ff00ff0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h0ff40ff4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0ff80ff8;
              3'h2: delta_pair = 32'h0ffc0ffc;
              3'h3: delta_pair = 32'h0fff0fff;
              3'h4: delta_pair = 32'h0f020f02;
              3'h5: delta_pair = 32'h0f030f03;
              3'h6: delta_pair = 32'h0f050f05;
              3'h7: delta_pair = 32'h0f070f07;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h0f090f09;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f0b0f0b;
              3'h2: delta_pair = 32'h0f0d0f0d;
              3'h3: delta_pair = 32'h0f0f0f0f;
              3'h4: delta_pair = 32'h0f110f11;
              3'h5: delta_pair = 32'h0f130f13;
              3'h6: delta_pair = 32'h0f160f16;
              3'h7: delta_pair = 32'h0f180f18;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h0f1a0f1a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f1c0f1c;
              3'h2: delta_pair = 32'h0f1e0f1e;
              3'h3: delta_pair = 32'h0f200f20;
              3'h4: delta_pair = 32'h0f220f22;
              3'h5: delta_pair = 32'h0f250f25;
              3'h6: delta_pair = 32'h0f270f27;
              3'h7: delta_pair = 32'h0f290f29;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h0f2c0f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f2e0f2e;
              3'h2: delta_pair = 32'h0f300f30;
              3'h3: delta_pair = 32'h0f320f32;
              3'h4: delta_pair = 32'h0f350f35;
              3'h5: delta_pair = 32'h0f370f37;
              3'h6: delta_pair = 32'h0f3a0f3a;
              3'h7: delta_pair = 32'h0f3c0f3c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h0f3f0f3f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f410f41;
              3'h2: delta_pair = 32'h0f440f44;
              3'h3: delta_pair = 32'h0f460f46;
              3'h4: delta_pair = 32'h0f490f49;
              3'h5: delta_pair = 32'h0f4b0f4b;
              3'h6: delta_pair = 32'h0f4e0f4e;
              3'h7: delta_pair = 32'h0f500f50;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h0f530f53;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f560f56;
              3'h2: delta_pair = 32'h0f580f58;
              3'h3: delta_pair = 32'h0f5b0f5b;
              3'h4: delta_pair = 32'h0f5e0f5e;
              3'h5: delta_pair = 32'h0f600f60;
              3'h6: delta_pair = 32'h0f630f63;
              3'h7: delta_pair = 32'h0f660f66;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h0f690f69;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f6c0f6c;
              3'h2: delta_pair = 32'h0f6e0f6e;
              3'h3: delta_pair = 32'h0f710f71;
              3'h4: delta_pair = 32'h0f740f74;
              3'h5: delta_pair = 32'h0f770f77;
              3'h6: delta_pair = 32'h0f7a0f7a;
              3'h7: delta_pair = 32'h0f7d0f7d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h03820382;
              3'h3: delta_pair = 32'h03840384;
              3'h4: delta_pair = 32'h03870387;
              3'h5: delta_pair = 32'h03890389;
              3'h6: delta_pair = 32'h038c038c;
              3'h7: delta_pair = 32'h038e038e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03910391;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03930393;
              3'h2: delta_pair = 32'h03960396;
              3'h3: delta_pair = 32'h03990399;
              3'h4: delta_pair = 32'h039b039b;
              3'h5: delta_pair = 32'h039e039e;
              3'h6: delta_pair = 32'h03a103a1;
              3'h7: delta_pair = 32'h03a403a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03a603a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03a903a9;
              3'h2: delta_pair = 32'h03ac03ac;
              3'h3: delta_pair = 32'h03af03af;
              3'h4: delta_pair = 32'h03b203b2;
              3'h5: delta_pair = 32'h03b503b5;
              3'h6: delta_pair = 32'h03b803b8;
              3'h7: delta_pair = 32'h03bb03bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h03be03be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03c103c1;
              3'h2: delta_pair = 32'h03c403c4;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03cb03cb;
              3'h5: delta_pair = 32'h03ce03ce;
              3'h6: delta_pair = 32'h03d103d1;
              3'h7: delta_pair = 32'h03d503d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03d803d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03db03db;
              3'h2: delta_pair = 32'h03df03df;
              3'h3: delta_pair = 32'h03e203e2;
              3'h4: delta_pair = 32'h03e603e6;
              3'h5: delta_pair = 32'h03e903e9;
              3'h6: delta_pair = 32'h03ed03ed;
              3'h7: delta_pair = 32'h03f003f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03f403f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03f803f8;
              3'h2: delta_pair = 32'h03fc03fc;
              3'h3: delta_pair = 32'h03ff03ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h3f023f02;
              3'h5: delta_pair = 32'h3f033f03;
              3'h6: delta_pair = 32'h3f053f05;
              3'h7: delta_pair = 32'h3f073f07;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h3f093f09;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f0b3f0b;
              3'h2: delta_pair = 32'h3f0d3f0d;
              3'h3: delta_pair = 32'h3f0f3f0f;
              3'h4: delta_pair = 32'h3f113f11;
              3'h5: delta_pair = 32'h3f133f13;
              3'h6: delta_pair = 32'h3f163f16;
              3'h7: delta_pair = 32'h3f183f18;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h3f1a3f1a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f1c3f1c;
              3'h2: delta_pair = 32'h3f1e3f1e;
              3'h3: delta_pair = 32'h3f203f20;
              3'h4: delta_pair = 32'h3f223f22;
              3'h5: delta_pair = 32'h3f253f25;
              3'h6: delta_pair = 32'h3f273f27;
              3'h7: delta_pair = 32'h3f293f29;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h3f2c3f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f2e3f2e;
              3'h2: delta_pair = 32'h3f303f30;
              3'h3: delta_pair = 32'h3f323f32;
              3'h4: delta_pair = 32'h3f353f35;
              3'h5: delta_pair = 32'h3f373f37;
              3'h6: delta_pair = 32'h3f3a3f3a;
              3'h7: delta_pair = 32'h3f3c3f3c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h3f3f3f3f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f413f41;
              3'h2: delta_pair = 32'h3f443f44;
              3'h3: delta_pair = 32'h3f463f46;
              3'h4: delta_pair = 32'h3f493f49;
              3'h5: delta_pair = 32'h3f4b3f4b;
              3'h6: delta_pair = 32'h3f4e3f4e;
              3'h7: delta_pair = 32'h3f503f50;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h3f533f53;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f563f56;
              3'h2: delta_pair = 32'h3f583f58;
              3'h3: delta_pair = 32'h3f5b3f5b;
              3'h4: delta_pair = 32'h3f5e3f5e;
              3'h5: delta_pair = 32'h3f603f60;
              3'h6: delta_pair = 32'h3f633f63;
              3'h7: delta_pair = 32'h3f663f66;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h3f693f69;
            case (mant_lo3)
              3'h1: delta_pair = 32'h3f6c3f6c;
              3'h2: delta_pair = 32'h3f6e3f6e;
              3'h3: delta_pair = 32'h3f713f71;
              3'h4: delta_pair = 32'h3f743f74;
              3'h5: delta_pair = 32'h3f773f77;
              3'h6: delta_pair = 32'h3f7a3f7a;
              3'h7: delta_pair = 32'h3f7d3f7d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h07820782;
              3'h3: delta_pair = 32'h07840784;
              3'h4: delta_pair = 32'h07870787;
              3'h5: delta_pair = 32'h07890789;
              3'h6: delta_pair = 32'h078c078c;
              3'h7: delta_pair = 32'h078e078e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h07910791;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07930793;
              3'h2: delta_pair = 32'h07960796;
              3'h3: delta_pair = 32'h07990799;
              3'h4: delta_pair = 32'h079b079b;
              3'h5: delta_pair = 32'h079e079e;
              3'h6: delta_pair = 32'h07a107a1;
              3'h7: delta_pair = 32'h07a407a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h07a607a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07a907a9;
              3'h2: delta_pair = 32'h07ac07ac;
              3'h3: delta_pair = 32'h07af07af;
              3'h4: delta_pair = 32'h07b207b2;
              3'h5: delta_pair = 32'h07b507b5;
              3'h6: delta_pair = 32'h07b807b8;
              3'h7: delta_pair = 32'h07bb07bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h07be07be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07c107c1;
              3'h2: delta_pair = 32'h07c407c4;
              3'h3: delta_pair = 32'h07c807c8;
              3'h4: delta_pair = 32'h07cb07cb;
              3'h5: delta_pair = 32'h07ce07ce;
              3'h6: delta_pair = 32'h07d107d1;
              3'h7: delta_pair = 32'h07d507d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h07d807d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07db07db;
              3'h2: delta_pair = 32'h07df07df;
              3'h3: delta_pair = 32'h07e207e2;
              3'h4: delta_pair = 32'h07e607e6;
              3'h5: delta_pair = 32'h07e907e9;
              3'h6: delta_pair = 32'h07ed07ed;
              3'h7: delta_pair = 32'h07f007f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h07f407f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07f807f8;
              3'h2: delta_pair = 32'h07fc07fc;
              3'h3: delta_pair = 32'h07ff07ff;
              3'h4: delta_pair = 32'h07020702;
              3'h5: delta_pair = 32'h07030703;
              3'h6: delta_pair = 32'h07050705;
              3'h7: delta_pair = 32'h07070707;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h07090709;
            case (mant_lo3)
              3'h1: delta_pair = 32'h070b070b;
              3'h2: delta_pair = 32'h070d070d;
              3'h3: delta_pair = 32'h070f070f;
              3'h4: delta_pair = 32'h07110711;
              3'h5: delta_pair = 32'h07130713;
              3'h6: delta_pair = 32'h07160716;
              3'h7: delta_pair = 32'h07180718;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h071a071a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h071c071c;
              3'h2: delta_pair = 32'h071e071e;
              3'h3: delta_pair = 32'h07200720;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h07250725;
              3'h6: delta_pair = 32'h07270727;
              3'h7: delta_pair = 32'h07290729;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072e072e;
              3'h2: delta_pair = 32'h07300730;
              3'h3: delta_pair = 32'h07320732;
              3'h4: delta_pair = 32'h07350735;
              3'h5: delta_pair = 32'h07370737;
              3'h6: delta_pair = 32'h073a073a;
              3'h7: delta_pair = 32'h073c073c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h073f073f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07410741;
              3'h2: delta_pair = 32'h07440744;
              3'h3: delta_pair = 32'h07460746;
              3'h4: delta_pair = 32'h07490749;
              3'h5: delta_pair = 32'h074b074b;
              3'h6: delta_pair = 32'h074e074e;
              3'h7: delta_pair = 32'h07500750;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h07530753;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07560756;
              3'h2: delta_pair = 32'h07580758;
              3'h3: delta_pair = 32'h075b075b;
              3'h4: delta_pair = 32'h075e075e;
              3'h5: delta_pair = 32'h07600760;
              3'h6: delta_pair = 32'h07630763;
              3'h7: delta_pair = 32'h07660766;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h07690769;
            case (mant_lo3)
              3'h1: delta_pair = 32'h076c076c;
              3'h2: delta_pair = 32'h076e076e;
              3'h3: delta_pair = 32'h07710771;
              3'h4: delta_pair = 32'h07740774;
              3'h5: delta_pair = 32'h07770777;
              3'h6: delta_pair = 32'h077a077a;
              3'h7: delta_pair = 32'h077d077d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h03820382;
              3'h3: delta_pair = 32'h03840384;
              3'h4: delta_pair = 32'h03870387;
              3'h5: delta_pair = 32'h03890389;
              3'h6: delta_pair = 32'h038c038c;
              3'h7: delta_pair = 32'h038e038e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03910391;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03930393;
              3'h2: delta_pair = 32'h03960396;
              3'h3: delta_pair = 32'h03990399;
              3'h4: delta_pair = 32'h039b039b;
              3'h5: delta_pair = 32'h039e039e;
              3'h6: delta_pair = 32'h03a103a1;
              3'h7: delta_pair = 32'h03a403a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03a603a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03a903a9;
              3'h2: delta_pair = 32'h03ac03ac;
              3'h3: delta_pair = 32'h03af03af;
              3'h4: delta_pair = 32'h03b203b2;
              3'h5: delta_pair = 32'h03b503b5;
              3'h6: delta_pair = 32'h03b803b8;
              3'h7: delta_pair = 32'h03bb03bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h03be03be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03c103c1;
              3'h2: delta_pair = 32'h03c403c4;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03cb03cb;
              3'h5: delta_pair = 32'h03ce03ce;
              3'h6: delta_pair = 32'h03d103d1;
              3'h7: delta_pair = 32'h03d503d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03d803d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03db03db;
              3'h2: delta_pair = 32'h03df03df;
              3'h3: delta_pair = 32'h03e203e2;
              3'h4: delta_pair = 32'h03e603e6;
              3'h5: delta_pair = 32'h03e903e9;
              3'h6: delta_pair = 32'h03ed03ed;
              3'h7: delta_pair = 32'h03f003f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03f403f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03f803f8;
              3'h2: delta_pair = 32'h03fc03fc;
              3'h3: delta_pair = 32'h03ff03ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h07020702;
              3'h5: delta_pair = 32'h07030703;
              3'h6: delta_pair = 32'h07050705;
              3'h7: delta_pair = 32'h07070707;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h07090709;
            case (mant_lo3)
              3'h1: delta_pair = 32'h070b070b;
              3'h2: delta_pair = 32'h070d070d;
              3'h3: delta_pair = 32'h070f070f;
              3'h4: delta_pair = 32'h07110711;
              3'h5: delta_pair = 32'h07130713;
              3'h6: delta_pair = 32'h07160716;
              3'h7: delta_pair = 32'h07180718;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h071a071a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h071c071c;
              3'h2: delta_pair = 32'h071e071e;
              3'h3: delta_pair = 32'h07200720;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h07250725;
              3'h6: delta_pair = 32'h07270727;
              3'h7: delta_pair = 32'h07290729;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072e072e;
              3'h2: delta_pair = 32'h07300730;
              3'h3: delta_pair = 32'h07320732;
              3'h4: delta_pair = 32'h07350735;
              3'h5: delta_pair = 32'h07370737;
              3'h6: delta_pair = 32'h073a073a;
              3'h7: delta_pair = 32'h073c073c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h073f073f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07410741;
              3'h2: delta_pair = 32'h07440744;
              3'h3: delta_pair = 32'h07460746;
              3'h4: delta_pair = 32'h07490749;
              3'h5: delta_pair = 32'h074b074b;
              3'h6: delta_pair = 32'h074e074e;
              3'h7: delta_pair = 32'h07500750;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h07530753;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07560756;
              3'h2: delta_pair = 32'h07580758;
              3'h3: delta_pair = 32'h075b075b;
              3'h4: delta_pair = 32'h075e075e;
              3'h5: delta_pair = 32'h07600760;
              3'h6: delta_pair = 32'h07630763;
              3'h7: delta_pair = 32'h07660766;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h07690769;
            case (mant_lo3)
              3'h1: delta_pair = 32'h076c076c;
              3'h2: delta_pair = 32'h076e076e;
              3'h3: delta_pair = 32'h07710771;
              3'h4: delta_pair = 32'h07740774;
              3'h5: delta_pair = 32'h07770777;
              3'h6: delta_pair = 32'h077a077a;
              3'h7: delta_pair = 32'h077d077d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h1f821f82;
              3'h3: delta_pair = 32'h1f841f84;
              3'h4: delta_pair = 32'h1f871f87;
              3'h5: delta_pair = 32'h1f891f89;
              3'h6: delta_pair = 32'h1f8c1f8c;
              3'h7: delta_pair = 32'h1f8e1f8e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h1f911f91;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f931f93;
              3'h2: delta_pair = 32'h1f961f96;
              3'h3: delta_pair = 32'h1f991f99;
              3'h4: delta_pair = 32'h1f9b1f9b;
              3'h5: delta_pair = 32'h1f9e1f9e;
              3'h6: delta_pair = 32'h1fa11fa1;
              3'h7: delta_pair = 32'h1fa41fa4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h1fa61fa6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1fa91fa9;
              3'h2: delta_pair = 32'h1fac1fac;
              3'h3: delta_pair = 32'h1faf1faf;
              3'h4: delta_pair = 32'h1fb21fb2;
              3'h5: delta_pair = 32'h1fb51fb5;
              3'h6: delta_pair = 32'h1fb81fb8;
              3'h7: delta_pair = 32'h1fbb1fbb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h1fbe1fbe;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1fc11fc1;
              3'h2: delta_pair = 32'h1fc41fc4;
              3'h3: delta_pair = 32'h1fc81fc8;
              3'h4: delta_pair = 32'h1fcb1fcb;
              3'h5: delta_pair = 32'h1fce1fce;
              3'h6: delta_pair = 32'h1fd11fd1;
              3'h7: delta_pair = 32'h1fd51fd5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h1fd81fd8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1fdb1fdb;
              3'h2: delta_pair = 32'h1fdf1fdf;
              3'h3: delta_pair = 32'h1fe21fe2;
              3'h4: delta_pair = 32'h1fe61fe6;
              3'h5: delta_pair = 32'h1fe91fe9;
              3'h6: delta_pair = 32'h1fed1fed;
              3'h7: delta_pair = 32'h1ff01ff0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h1ff41ff4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1ff81ff8;
              3'h2: delta_pair = 32'h1ffc1ffc;
              3'h3: delta_pair = 32'h1fff1fff;
              3'h4: delta_pair = 32'h1f021f02;
              3'h5: delta_pair = 32'h1f031f03;
              3'h6: delta_pair = 32'h1f051f05;
              3'h7: delta_pair = 32'h1f071f07;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h1f091f09;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f0b1f0b;
              3'h2: delta_pair = 32'h1f0d1f0d;
              3'h3: delta_pair = 32'h1f0f1f0f;
              3'h4: delta_pair = 32'h1f111f11;
              3'h5: delta_pair = 32'h1f131f13;
              3'h6: delta_pair = 32'h1f161f16;
              3'h7: delta_pair = 32'h1f181f18;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h1f1a1f1a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f1c1f1c;
              3'h2: delta_pair = 32'h1f1e1f1e;
              3'h3: delta_pair = 32'h1f201f20;
              3'h4: delta_pair = 32'h1f221f22;
              3'h5: delta_pair = 32'h1f251f25;
              3'h6: delta_pair = 32'h1f271f27;
              3'h7: delta_pair = 32'h1f291f29;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h1f2c1f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f2e1f2e;
              3'h2: delta_pair = 32'h1f301f30;
              3'h3: delta_pair = 32'h1f321f32;
              3'h4: delta_pair = 32'h1f351f35;
              3'h5: delta_pair = 32'h1f371f37;
              3'h6: delta_pair = 32'h1f3a1f3a;
              3'h7: delta_pair = 32'h1f3c1f3c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h1f3f1f3f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f411f41;
              3'h2: delta_pair = 32'h1f441f44;
              3'h3: delta_pair = 32'h1f461f46;
              3'h4: delta_pair = 32'h1f491f49;
              3'h5: delta_pair = 32'h1f4b1f4b;
              3'h6: delta_pair = 32'h1f4e1f4e;
              3'h7: delta_pair = 32'h1f501f50;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h1f531f53;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f561f56;
              3'h2: delta_pair = 32'h1f581f58;
              3'h3: delta_pair = 32'h1f5b1f5b;
              3'h4: delta_pair = 32'h1f5e1f5e;
              3'h5: delta_pair = 32'h1f601f60;
              3'h6: delta_pair = 32'h1f631f63;
              3'h7: delta_pair = 32'h1f661f66;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h1f691f69;
            case (mant_lo3)
              3'h1: delta_pair = 32'h1f6c1f6c;
              3'h2: delta_pair = 32'h1f6e1f6e;
              3'h3: delta_pair = 32'h1f711f71;
              3'h4: delta_pair = 32'h1f741f74;
              3'h5: delta_pair = 32'h1f771f77;
              3'h6: delta_pair = 32'h1f7a1f7a;
              3'h7: delta_pair = 32'h1f7d1f7d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h03820382;
              3'h3: delta_pair = 32'h03840384;
              3'h4: delta_pair = 32'h03870387;
              3'h5: delta_pair = 32'h03890389;
              3'h6: delta_pair = 32'h038c038c;
              3'h7: delta_pair = 32'h038e038e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h03910391;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03930393;
              3'h2: delta_pair = 32'h03960396;
              3'h3: delta_pair = 32'h03990399;
              3'h4: delta_pair = 32'h039b039b;
              3'h5: delta_pair = 32'h039e039e;
              3'h6: delta_pair = 32'h03a103a1;
              3'h7: delta_pair = 32'h03a403a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h03a603a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03a903a9;
              3'h2: delta_pair = 32'h03ac03ac;
              3'h3: delta_pair = 32'h03af03af;
              3'h4: delta_pair = 32'h03b203b2;
              3'h5: delta_pair = 32'h03b503b5;
              3'h6: delta_pair = 32'h03b803b8;
              3'h7: delta_pair = 32'h03bb03bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h03be03be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03c103c1;
              3'h2: delta_pair = 32'h03c403c4;
              3'h3: delta_pair = 32'h03c803c8;
              3'h4: delta_pair = 32'h03cb03cb;
              3'h5: delta_pair = 32'h03ce03ce;
              3'h6: delta_pair = 32'h03d103d1;
              3'h7: delta_pair = 32'h03d503d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h03d803d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03db03db;
              3'h2: delta_pair = 32'h03df03df;
              3'h3: delta_pair = 32'h03e203e2;
              3'h4: delta_pair = 32'h03e603e6;
              3'h5: delta_pair = 32'h03e903e9;
              3'h6: delta_pair = 32'h03ed03ed;
              3'h7: delta_pair = 32'h03f003f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h03f403f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03f803f8;
              3'h2: delta_pair = 32'h03fc03fc;
              3'h3: delta_pair = 32'h03ff03ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h0f020f02;
              3'h5: delta_pair = 32'h0f030f03;
              3'h6: delta_pair = 32'h0f050f05;
              3'h7: delta_pair = 32'h0f070f07;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h0f090f09;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f0b0f0b;
              3'h2: delta_pair = 32'h0f0d0f0d;
              3'h3: delta_pair = 32'h0f0f0f0f;
              3'h4: delta_pair = 32'h0f110f11;
              3'h5: delta_pair = 32'h0f130f13;
              3'h6: delta_pair = 32'h0f160f16;
              3'h7: delta_pair = 32'h0f180f18;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h0f1a0f1a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f1c0f1c;
              3'h2: delta_pair = 32'h0f1e0f1e;
              3'h3: delta_pair = 32'h0f200f20;
              3'h4: delta_pair = 32'h0f220f22;
              3'h5: delta_pair = 32'h0f250f25;
              3'h6: delta_pair = 32'h0f270f27;
              3'h7: delta_pair = 32'h0f290f29;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h0f2c0f2c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f2e0f2e;
              3'h2: delta_pair = 32'h0f300f30;
              3'h3: delta_pair = 32'h0f320f32;
              3'h4: delta_pair = 32'h0f350f35;
              3'h5: delta_pair = 32'h0f370f37;
              3'h6: delta_pair = 32'h0f3a0f3a;
              3'h7: delta_pair = 32'h0f3c0f3c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h0f3f0f3f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f410f41;
              3'h2: delta_pair = 32'h0f440f44;
              3'h3: delta_pair = 32'h0f460f46;
              3'h4: delta_pair = 32'h0f490f49;
              3'h5: delta_pair = 32'h0f4b0f4b;
              3'h6: delta_pair = 32'h0f4e0f4e;
              3'h7: delta_pair = 32'h0f500f50;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h0f530f53;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f560f56;
              3'h2: delta_pair = 32'h0f580f58;
              3'h3: delta_pair = 32'h0f5b0f5b;
              3'h4: delta_pair = 32'h0f5e0f5e;
              3'h5: delta_pair = 32'h0f600f60;
              3'h6: delta_pair = 32'h0f630f63;
              3'h7: delta_pair = 32'h0f660f66;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h0f690f69;
            case (mant_lo3)
              3'h1: delta_pair = 32'h0f6c0f6c;
              3'h2: delta_pair = 32'h0f6e0f6e;
              3'h3: delta_pair = 32'h0f710f71;
              3'h4: delta_pair = 32'h0f740f74;
              3'h5: delta_pair = 32'h0f770f77;
              3'h6: delta_pair = 32'h0f7a0f7a;
              3'h7: delta_pair = 32'h0f7d0f7d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h01820182;
              3'h3: delta_pair = 32'h01840184;
              3'h4: delta_pair = 32'h01870187;
              3'h5: delta_pair = 32'h01890189;
              3'h6: delta_pair = 32'h018c018c;
              3'h7: delta_pair = 32'h018e018e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h01910191;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01930193;
              3'h2: delta_pair = 32'h01960196;
              3'h3: delta_pair = 32'h01990199;
              3'h4: delta_pair = 32'h019b019b;
              3'h5: delta_pair = 32'h019e019e;
              3'h6: delta_pair = 32'h01a101a1;
              3'h7: delta_pair = 32'h01a401a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h01a601a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01a901a9;
              3'h2: delta_pair = 32'h01ac01ac;
              3'h3: delta_pair = 32'h01af01af;
              3'h4: delta_pair = 32'h01b201b2;
              3'h5: delta_pair = 32'h01b501b5;
              3'h6: delta_pair = 32'h01b801b8;
              3'h7: delta_pair = 32'h01bb01bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h01be01be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01c101c1;
              3'h2: delta_pair = 32'h01c401c4;
              3'h3: delta_pair = 32'h01c801c8;
              3'h4: delta_pair = 32'h01cb01cb;
              3'h5: delta_pair = 32'h01ce01ce;
              3'h6: delta_pair = 32'h01d101d1;
              3'h7: delta_pair = 32'h01d501d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h01d801d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01db01db;
              3'h2: delta_pair = 32'h01df01df;
              3'h3: delta_pair = 32'h01e201e2;
              3'h4: delta_pair = 32'h01e601e6;
              3'h5: delta_pair = 32'h01e901e9;
              3'h6: delta_pair = 32'h01ed01ed;
              3'h7: delta_pair = 32'h01f001f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01f801f8;
              3'h2: delta_pair = 32'h01fc01fc;
              3'h3: delta_pair = 32'h01ff01ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h01020102;
              3'h5: delta_pair = 32'h01030103;
              3'h6: delta_pair = 32'h01050105;
              3'h7: delta_pair = 32'h01070107;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h01090109;
            case (mant_lo3)
              3'h1: delta_pair = 32'h010b010b;
              3'h2: delta_pair = 32'h010d010d;
              3'h3: delta_pair = 32'h010f010f;
              3'h4: delta_pair = 32'h01110111;
              3'h5: delta_pair = 32'h01130113;
              3'h6: delta_pair = 32'h01160116;
              3'h7: delta_pair = 32'h01180118;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011c011c;
              3'h2: delta_pair = 32'h011e011e;
              3'h3: delta_pair = 32'h01200120;
              3'h4: delta_pair = 32'h01220122;
              3'h5: delta_pair = 32'h01250125;
              3'h6: delta_pair = 32'h01270127;
              3'h7: delta_pair = 32'h01290129;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h012c012c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h012e012e;
              3'h2: delta_pair = 32'h01300130;
              3'h3: delta_pair = 32'h01320132;
              3'h4: delta_pair = 32'h01350135;
              3'h5: delta_pair = 32'h01370137;
              3'h6: delta_pair = 32'h013a013a;
              3'h7: delta_pair = 32'h013c013c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h013f013f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01410141;
              3'h2: delta_pair = 32'h01440144;
              3'h3: delta_pair = 32'h01460146;
              3'h4: delta_pair = 32'h01490149;
              3'h5: delta_pair = 32'h014b014b;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01500150;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h01530153;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01560156;
              3'h2: delta_pair = 32'h01580158;
              3'h3: delta_pair = 32'h015b015b;
              3'h4: delta_pair = 32'h015e015e;
              3'h5: delta_pair = 32'h01600160;
              3'h6: delta_pair = 32'h01630163;
              3'h7: delta_pair = 32'h01660166;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h01690169;
            case (mant_lo3)
              3'h1: delta_pair = 32'h016c016c;
              3'h2: delta_pair = 32'h016e016e;
              3'h3: delta_pair = 32'h01710171;
              3'h4: delta_pair = 32'h01740174;
              3'h5: delta_pair = 32'h01770177;
              3'h6: delta_pair = 32'h017a017a;
              3'h7: delta_pair = 32'h017d017d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h07820782;
              3'h3: delta_pair = 32'h07840784;
              3'h4: delta_pair = 32'h07870787;
              3'h5: delta_pair = 32'h07890789;
              3'h6: delta_pair = 32'h078c078c;
              3'h7: delta_pair = 32'h078e078e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h07910791;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07930793;
              3'h2: delta_pair = 32'h07960796;
              3'h3: delta_pair = 32'h07990799;
              3'h4: delta_pair = 32'h079b079b;
              3'h5: delta_pair = 32'h079e079e;
              3'h6: delta_pair = 32'h07a107a1;
              3'h7: delta_pair = 32'h07a407a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h07a607a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07a907a9;
              3'h2: delta_pair = 32'h07ac07ac;
              3'h3: delta_pair = 32'h07af07af;
              3'h4: delta_pair = 32'h07b207b2;
              3'h5: delta_pair = 32'h07b507b5;
              3'h6: delta_pair = 32'h07b807b8;
              3'h7: delta_pair = 32'h07bb07bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h07be07be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07c107c1;
              3'h2: delta_pair = 32'h07c407c4;
              3'h3: delta_pair = 32'h07c807c8;
              3'h4: delta_pair = 32'h07cb07cb;
              3'h5: delta_pair = 32'h07ce07ce;
              3'h6: delta_pair = 32'h07d107d1;
              3'h7: delta_pair = 32'h07d507d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h07d807d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07db07db;
              3'h2: delta_pair = 32'h07df07df;
              3'h3: delta_pair = 32'h07e207e2;
              3'h4: delta_pair = 32'h07e607e6;
              3'h5: delta_pair = 32'h07e907e9;
              3'h6: delta_pair = 32'h07ed07ed;
              3'h7: delta_pair = 32'h07f007f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h07f407f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07f807f8;
              3'h2: delta_pair = 32'h07fc07fc;
              3'h3: delta_pair = 32'h07ff07ff;
              3'h4: delta_pair = 32'h07020702;
              3'h5: delta_pair = 32'h07030703;
              3'h6: delta_pair = 32'h07050705;
              3'h7: delta_pair = 32'h07070707;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h07090709;
            case (mant_lo3)
              3'h1: delta_pair = 32'h070b070b;
              3'h2: delta_pair = 32'h070d070d;
              3'h3: delta_pair = 32'h070f070f;
              3'h4: delta_pair = 32'h07110711;
              3'h5: delta_pair = 32'h07130713;
              3'h6: delta_pair = 32'h07160716;
              3'h7: delta_pair = 32'h07180718;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h071a071a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h071c071c;
              3'h2: delta_pair = 32'h071e071e;
              3'h3: delta_pair = 32'h07200720;
              3'h4: delta_pair = 32'h07220722;
              3'h5: delta_pair = 32'h07250725;
              3'h6: delta_pair = 32'h07270727;
              3'h7: delta_pair = 32'h07290729;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h072c072c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h072e072e;
              3'h2: delta_pair = 32'h07300730;
              3'h3: delta_pair = 32'h07320732;
              3'h4: delta_pair = 32'h07350735;
              3'h5: delta_pair = 32'h07370737;
              3'h6: delta_pair = 32'h073a073a;
              3'h7: delta_pair = 32'h073c073c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h073f073f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07410741;
              3'h2: delta_pair = 32'h07440744;
              3'h3: delta_pair = 32'h07460746;
              3'h4: delta_pair = 32'h07490749;
              3'h5: delta_pair = 32'h074b074b;
              3'h6: delta_pair = 32'h074e074e;
              3'h7: delta_pair = 32'h07500750;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h07530753;
            case (mant_lo3)
              3'h1: delta_pair = 32'h07560756;
              3'h2: delta_pair = 32'h07580758;
              3'h3: delta_pair = 32'h075b075b;
              3'h4: delta_pair = 32'h075e075e;
              3'h5: delta_pair = 32'h07600760;
              3'h6: delta_pair = 32'h07630763;
              3'h7: delta_pair = 32'h07660766;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h07690769;
            case (mant_lo3)
              3'h1: delta_pair = 32'h076c076c;
              3'h2: delta_pair = 32'h076e076e;
              3'h3: delta_pair = 32'h07710771;
              3'h4: delta_pair = 32'h07740774;
              3'h5: delta_pair = 32'h07770777;
              3'h6: delta_pair = 32'h077a077a;
              3'h7: delta_pair = 32'h077d077d;
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
              3'h1: delta_pair = 32'h00030003;
              3'h2: delta_pair = 32'h00060006;
              3'h3: delta_pair = 32'h00090009;
              3'h4: delta_pair = 32'h000c000c;
              3'h5: delta_pair = 32'h00100010;
              3'h6: delta_pair = 32'h00130013;
              3'h7: delta_pair = 32'h00160016;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h001a001a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h001d001d;
              3'h2: delta_pair = 32'h00200020;
              3'h3: delta_pair = 32'h00240024;
              3'h4: delta_pair = 32'h00270027;
              3'h5: delta_pair = 32'h002b002b;
              3'h6: delta_pair = 32'h002f002f;
              3'h7: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h00360036;
            case (mant_lo3)
              3'h1: delta_pair = 32'h003a003a;
              3'h2: delta_pair = 32'h003e003e;
              3'h3: delta_pair = 32'h00420042;
              3'h4: delta_pair = 32'h00460046;
              3'h5: delta_pair = 32'h004a004a;
              3'h6: delta_pair = 32'h004e004e;
              3'h7: delta_pair = 32'h00520052;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h00560056;
            case (mant_lo3)
              3'h1: delta_pair = 32'h005b005b;
              3'h2: delta_pair = 32'h005f005f;
              3'h3: delta_pair = 32'h00630063;
              3'h4: delta_pair = 32'h00680068;
              3'h5: delta_pair = 32'h006c006c;
              3'h6: delta_pair = 32'h00710071;
              3'h7: delta_pair = 32'h00750075;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h007a007a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h007f007f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00f400f4;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              3'h4: delta_pair = 32'h03020302;
              3'h5: delta_pair = 32'h03030303;
              3'h6: delta_pair = 32'h03050305;
              3'h7: delta_pair = 32'h03070307;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h03090309;
            case (mant_lo3)
              3'h1: delta_pair = 32'h030b030b;
              3'h2: delta_pair = 32'h030d030d;
              3'h3: delta_pair = 32'h030f030f;
              3'h4: delta_pair = 32'h03110311;
              3'h5: delta_pair = 32'h03130313;
              3'h6: delta_pair = 32'h03160316;
              3'h7: delta_pair = 32'h03180318;
              default: begin end
            endcase
          end
          4'hb: begin
            delta_pair = 32'h031a031a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h031c031c;
              3'h2: delta_pair = 32'h031e031e;
              3'h3: delta_pair = 32'h03200320;
              3'h4: delta_pair = 32'h03220322;
              3'h5: delta_pair = 32'h03250325;
              3'h6: delta_pair = 32'h03270327;
              3'h7: delta_pair = 32'h03290329;
              default: begin end
            endcase
          end
          4'hc: begin
            delta_pair = 32'h032c032c;
            case (mant_lo3)
              3'h1: delta_pair = 32'h032e032e;
              3'h2: delta_pair = 32'h03300330;
              3'h3: delta_pair = 32'h03320332;
              3'h4: delta_pair = 32'h03350335;
              3'h5: delta_pair = 32'h03370337;
              3'h6: delta_pair = 32'h033a033a;
              3'h7: delta_pair = 32'h033c033c;
              default: begin end
            endcase
          end
          4'hd: begin
            delta_pair = 32'h033f033f;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03410341;
              3'h2: delta_pair = 32'h03440344;
              3'h3: delta_pair = 32'h03460346;
              3'h4: delta_pair = 32'h03490349;
              3'h5: delta_pair = 32'h034b034b;
              3'h6: delta_pair = 32'h034e034e;
              3'h7: delta_pair = 32'h03500350;
              default: begin end
            endcase
          end
          4'he: begin
            delta_pair = 32'h03530353;
            case (mant_lo3)
              3'h1: delta_pair = 32'h03560356;
              3'h2: delta_pair = 32'h03580358;
              3'h3: delta_pair = 32'h035b035b;
              3'h4: delta_pair = 32'h035e035e;
              3'h5: delta_pair = 32'h03600360;
              3'h6: delta_pair = 32'h03630363;
              3'h7: delta_pair = 32'h03660366;
              default: begin end
            endcase
          end
          4'hf: begin
            delta_pair = 32'h03690369;
            case (mant_lo3)
              3'h1: delta_pair = 32'h036c036c;
              3'h2: delta_pair = 32'h036e036e;
              3'h3: delta_pair = 32'h03710371;
              3'h4: delta_pair = 32'h03740374;
              3'h5: delta_pair = 32'h03770377;
              3'h6: delta_pair = 32'h037a037a;
              3'h7: delta_pair = 32'h037d037d;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha9: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h01000100;
            case (mant_lo3)
              3'h1: delta_pair = 32'h01030103;
              3'h2: delta_pair = 32'h01060106;
              3'h3: delta_pair = 32'h01090109;
              3'h4: delta_pair = 32'h010c010c;
              3'h5: delta_pair = 32'h01100110;
              3'h6: delta_pair = 32'h01130113;
              3'h7: delta_pair = 32'h01160116;
              default: begin end
            endcase
          end
          4'h1: begin
            delta_pair = 32'h011a011a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h011d011d;
              3'h2: delta_pair = 32'h01200120;
              3'h3: delta_pair = 32'h01240124;
              3'h4: delta_pair = 32'h01270127;
              3'h5: delta_pair = 32'h012b012b;
              3'h6: delta_pair = 32'h012f012f;
              3'h7: delta_pair = 32'h01320132;
              default: begin end
            endcase
          end
          4'h2: begin
            delta_pair = 32'h01360136;
            case (mant_lo3)
              3'h1: delta_pair = 32'h013a013a;
              3'h2: delta_pair = 32'h013e013e;
              3'h3: delta_pair = 32'h01420142;
              3'h4: delta_pair = 32'h01460146;
              3'h5: delta_pair = 32'h014a014a;
              3'h6: delta_pair = 32'h014e014e;
              3'h7: delta_pair = 32'h01520152;
              default: begin end
            endcase
          end
          4'h3: begin
            delta_pair = 32'h01560156;
            case (mant_lo3)
              3'h1: delta_pair = 32'h015b015b;
              3'h2: delta_pair = 32'h015f015f;
              3'h3: delta_pair = 32'h01630163;
              3'h4: delta_pair = 32'h01680168;
              3'h5: delta_pair = 32'h016c016c;
              3'h6: delta_pair = 32'h01710171;
              3'h7: delta_pair = 32'h01750175;
              default: begin end
            endcase
          end
          4'h4: begin
            delta_pair = 32'h017a017a;
            case (mant_lo3)
              3'h1: delta_pair = 32'h017f017f;
              3'h2: delta_pair = 32'h00820082;
              3'h3: delta_pair = 32'h00840084;
              3'h4: delta_pair = 32'h00870087;
              3'h5: delta_pair = 32'h00890089;
              3'h6: delta_pair = 32'h008c008c;
              3'h7: delta_pair = 32'h008e008e;
              default: begin end
            endcase
          end
          4'h5: begin
            delta_pair = 32'h00910091;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00930093;
              3'h2: delta_pair = 32'h00960096;
              3'h3: delta_pair = 32'h00990099;
              3'h4: delta_pair = 32'h009b009b;
              3'h5: delta_pair = 32'h009e009e;
              3'h6: delta_pair = 32'h00a100a1;
              3'h7: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          4'h6: begin
            delta_pair = 32'h00a600a6;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00a900a9;
              3'h2: delta_pair = 32'h00ac00ac;
              3'h3: delta_pair = 32'h00af00af;
              3'h4: delta_pair = 32'h00b200b2;
              3'h5: delta_pair = 32'h00b500b5;
              3'h6: delta_pair = 32'h00b800b8;
              3'h7: delta_pair = 32'h00bb00bb;
              default: begin end
            endcase
          end
          4'h7: begin
            delta_pair = 32'h00be00be;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00c100c1;
              3'h2: delta_pair = 32'h00c400c4;
              3'h3: delta_pair = 32'h00c800c8;
              3'h4: delta_pair = 32'h00cb00cb;
              3'h5: delta_pair = 32'h00ce00ce;
              3'h6: delta_pair = 32'h00d100d1;
              3'h7: delta_pair = 32'h00d500d5;
              default: begin end
            endcase
          end
          4'h8: begin
            delta_pair = 32'h00d800d8;
            case (mant_lo3)
              3'h1: delta_pair = 32'h00db00db;
              3'h2: delta_pair = 32'h00df00df;
              3'h3: delta_pair = 32'h00e200e2;
              3'h4: delta_pair = 32'h00e600e6;
              3'h5: delta_pair = 32'h00e900e9;
              3'h6: delta_pair = 32'h00ed00ed;
              3'h7: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          4'h9: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h0: delta_pair = 32'h00f400f4;
              3'h1: delta_pair = 32'h00f800f8;
              3'h2: delta_pair = 32'h00fc00fc;
              3'h3: delta_pair = 32'h00ff00ff;
              default: begin end
            endcase
          end
          4'ha: begin
            delta_pair = 32'h00000000;
          end
          4'hb: begin
            delta_pair = 32'h00000000;
          end
          4'hc: begin
            delta_pair = 32'h00000000;
          end
          4'hd: begin
            delta_pair = 32'h00000000;
          end
          4'he: begin
            delta_pair = 32'h00000000;
          end
          4'hf: begin
            delta_pair = 32'h00000000;
          end
          default: begin end
        endcase
      end
      8'hff: begin
        case (mant_hi4)
          4'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo3)
              3'h0: delta_pair = 32'h80400040;
              default: begin end
            endcase
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
          end
          4'h5: begin
            delta_pair = 32'h00000000;
          end
          4'h6: begin
            delta_pair = 32'h00000000;
          end
          4'h7: begin
            delta_pair = 32'h00000000;
          end
          4'h8: begin
            delta_pair = 32'h00000000;
          end
          4'h9: begin
            delta_pair = 32'h00000000;
          end
          4'ha: begin
            delta_pair = 32'h00000000;
          end
          4'hb: begin
            delta_pair = 32'h00000000;
          end
          4'hc: begin
            delta_pair = 32'h00000000;
          end
          4'hd: begin
            delta_pair = 32'h00000000;
          end
          4'he: begin
            delta_pair = 32'h00000000;
          end
          4'hf: begin
            delta_pair = 32'h00000000;
          end
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  wire [31:0] pair = base_pair ^ delta_pair;
  wire [15:0] out_base = sign ? pair[31:16] : pair[15:0];
  wire out_bit14_boundary = (exp >= 8'd128) || (exp == 8'd127 && mant >= 7'd34);
  assign out = {out_base[15], out_bit14_boundary, out_base[13:0]};
endmodule
