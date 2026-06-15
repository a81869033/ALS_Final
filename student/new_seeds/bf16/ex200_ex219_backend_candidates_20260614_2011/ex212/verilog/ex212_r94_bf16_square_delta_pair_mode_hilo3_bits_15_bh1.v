module ex212_r94_bf16_square_delta_pair_mode_hilo3_bits_15_bh1(in, out);
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
      8'h00: base_pair = 32'h00000000;
      8'h01: base_pair = 32'h00000000;
      8'h02: base_pair = 32'h00000000;
      8'h03: base_pair = 32'h00000000;
      8'h04: base_pair = 32'h00000000;
      8'h05: base_pair = 32'h00000000;
      8'h06: base_pair = 32'h00000000;
      8'h07: base_pair = 32'h00000000;
      8'h08: base_pair = 32'h00000000;
      8'h09: base_pair = 32'h00000000;
      8'h0a: base_pair = 32'h00000000;
      8'h0b: base_pair = 32'h00000000;
      8'h0c: base_pair = 32'h00000000;
      8'h0d: base_pair = 32'h00000000;
      8'h0e: base_pair = 32'h00000000;
      8'h0f: base_pair = 32'h00000000;
      8'h10: base_pair = 32'h00000000;
      8'h11: base_pair = 32'h00000000;
      8'h12: base_pair = 32'h00000000;
      8'h13: base_pair = 32'h00000000;
      8'h14: base_pair = 32'h00000000;
      8'h15: base_pair = 32'h00000000;
      8'h16: base_pair = 32'h00000000;
      8'h17: base_pair = 32'h00000000;
      8'h18: base_pair = 32'h00000000;
      8'h19: base_pair = 32'h00000000;
      8'h1a: base_pair = 32'h00000000;
      8'h1b: base_pair = 32'h00000000;
      8'h1c: base_pair = 32'h00000000;
      8'h1d: base_pair = 32'h00000000;
      8'h1e: base_pair = 32'h00000000;
      8'h1f: base_pair = 32'h00000000;
      8'h20: base_pair = 32'h00000000;
      8'h21: base_pair = 32'h00000000;
      8'h22: base_pair = 32'h00000000;
      8'h23: base_pair = 32'h00000000;
      8'h24: base_pair = 32'h00000000;
      8'h25: base_pair = 32'h00000000;
      8'h26: base_pair = 32'h00000000;
      8'h27: base_pair = 32'h00000000;
      8'h28: base_pair = 32'h00000000;
      8'h29: base_pair = 32'h00000000;
      8'h2a: base_pair = 32'h00000000;
      8'h2b: base_pair = 32'h00000000;
      8'h2c: base_pair = 32'h00000000;
      8'h2d: base_pair = 32'h00000000;
      8'h2e: base_pair = 32'h00000000;
      8'h2f: base_pair = 32'h00000000;
      8'h30: base_pair = 32'h00000000;
      8'h31: base_pair = 32'h00000000;
      8'h32: base_pair = 32'h00000000;
      8'h33: base_pair = 32'h00000000;
      8'h34: base_pair = 32'h00000000;
      8'h35: base_pair = 32'h00000000;
      8'h36: base_pair = 32'h00000000;
      8'h37: base_pair = 32'h00000000;
      8'h38: base_pair = 32'h00000000;
      8'h39: base_pair = 32'h00000000;
      8'h3a: base_pair = 32'h00000000;
      8'h3b: base_pair = 32'h00000000;
      8'h3c: base_pair = 32'h00000000;
      8'h3d: base_pair = 32'h00000000;
      8'h3e: base_pair = 32'h00000000;
      8'h3f: base_pair = 32'h00000000;
      8'h40: base_pair = 32'h00800080;
      8'h41: base_pair = 32'h01800180;
      8'h42: base_pair = 32'h02800280;
      8'h43: base_pair = 32'h03800380;
      8'h44: base_pair = 32'h04800480;
      8'h45: base_pair = 32'h05800580;
      8'h46: base_pair = 32'h06800680;
      8'h47: base_pair = 32'h07800780;
      8'h48: base_pair = 32'h08800880;
      8'h49: base_pair = 32'h09800980;
      8'h4a: base_pair = 32'h0a800a80;
      8'h4b: base_pair = 32'h0b800b80;
      8'h4c: base_pair = 32'h0c800c80;
      8'h4d: base_pair = 32'h0d800d80;
      8'h4e: base_pair = 32'h0e800e80;
      8'h4f: base_pair = 32'h0f800f80;
      8'h50: base_pair = 32'h10801080;
      8'h51: base_pair = 32'h11801180;
      8'h52: base_pair = 32'h12801280;
      8'h53: base_pair = 32'h13801380;
      8'h54: base_pair = 32'h14801480;
      8'h55: base_pair = 32'h15801580;
      8'h56: base_pair = 32'h16801680;
      8'h57: base_pair = 32'h17801780;
      8'h58: base_pair = 32'h18801880;
      8'h59: base_pair = 32'h19801980;
      8'h5a: base_pair = 32'h1a801a80;
      8'h5b: base_pair = 32'h1b801b80;
      8'h5c: base_pair = 32'h1c801c80;
      8'h5d: base_pair = 32'h1d801d80;
      8'h5e: base_pair = 32'h1e801e80;
      8'h5f: base_pair = 32'h1f801f80;
      8'h60: base_pair = 32'h20802080;
      8'h61: base_pair = 32'h21802180;
      8'h62: base_pair = 32'h22802280;
      8'h63: base_pair = 32'h23802380;
      8'h64: base_pair = 32'h24802480;
      8'h65: base_pair = 32'h25802580;
      8'h66: base_pair = 32'h26802680;
      8'h67: base_pair = 32'h27802780;
      8'h68: base_pair = 32'h28802880;
      8'h69: base_pair = 32'h29802980;
      8'h6a: base_pair = 32'h2a802a80;
      8'h6b: base_pair = 32'h2b802b80;
      8'h6c: base_pair = 32'h2c802c80;
      8'h6d: base_pair = 32'h2d802d80;
      8'h6e: base_pair = 32'h2e802e80;
      8'h6f: base_pair = 32'h2f802f80;
      8'h70: base_pair = 32'h30803080;
      8'h71: base_pair = 32'h31803180;
      8'h72: base_pair = 32'h32803280;
      8'h73: base_pair = 32'h33803380;
      8'h74: base_pair = 32'h34803480;
      8'h75: base_pair = 32'h35803580;
      8'h76: base_pair = 32'h36803680;
      8'h77: base_pair = 32'h37803780;
      8'h78: base_pair = 32'h38803880;
      8'h79: base_pair = 32'h39803980;
      8'h7a: base_pair = 32'h3a803a80;
      8'h7b: base_pair = 32'h3b803b80;
      8'h7c: base_pair = 32'h3c803c80;
      8'h7d: base_pair = 32'h3d803d80;
      8'h7e: base_pair = 32'h3e803e80;
      8'h7f: base_pair = 32'h3f803f80;
      8'h80: base_pair = 32'h40804080;
      8'h81: base_pair = 32'h41804180;
      8'h82: base_pair = 32'h42804280;
      8'h83: base_pair = 32'h43804380;
      8'h84: base_pair = 32'h44804480;
      8'h85: base_pair = 32'h45804580;
      8'h86: base_pair = 32'h46804680;
      8'h87: base_pair = 32'h47804780;
      8'h88: base_pair = 32'h48804880;
      8'h89: base_pair = 32'h49804980;
      8'h8a: base_pair = 32'h4a804a80;
      8'h8b: base_pair = 32'h4b804b80;
      8'h8c: base_pair = 32'h4c804c80;
      8'h8d: base_pair = 32'h4d804d80;
      8'h8e: base_pair = 32'h4e804e80;
      8'h8f: base_pair = 32'h4f804f80;
      8'h90: base_pair = 32'h50805080;
      8'h91: base_pair = 32'h51805180;
      8'h92: base_pair = 32'h52805280;
      8'h93: base_pair = 32'h53805380;
      8'h94: base_pair = 32'h54805480;
      8'h95: base_pair = 32'h55805580;
      8'h96: base_pair = 32'h56805680;
      8'h97: base_pair = 32'h57805780;
      8'h98: base_pair = 32'h58805880;
      8'h99: base_pair = 32'h59805980;
      8'h9a: base_pair = 32'h5a805a80;
      8'h9b: base_pair = 32'h5b805b80;
      8'h9c: base_pair = 32'h5c805c80;
      8'h9d: base_pair = 32'h5d805d80;
      8'h9e: base_pair = 32'h5e805e80;
      8'h9f: base_pair = 32'h5f805f80;
      8'ha0: base_pair = 32'h60806080;
      8'ha1: base_pair = 32'h61806180;
      8'ha2: base_pair = 32'h62806280;
      8'ha3: base_pair = 32'h63806380;
      8'ha4: base_pair = 32'h64806480;
      8'ha5: base_pair = 32'h65806580;
      8'ha6: base_pair = 32'h66806680;
      8'ha7: base_pair = 32'h67806780;
      8'ha8: base_pair = 32'h68806880;
      8'ha9: base_pair = 32'h69806980;
      8'haa: base_pair = 32'h6a806a80;
      8'hab: base_pair = 32'h6b806b80;
      8'hac: base_pair = 32'h6c806c80;
      8'had: base_pair = 32'h6d806d80;
      8'hae: base_pair = 32'h6e806e80;
      8'haf: base_pair = 32'h6f806f80;
      8'hb0: base_pair = 32'h70807080;
      8'hb1: base_pair = 32'h71807180;
      8'hb2: base_pair = 32'h72807280;
      8'hb3: base_pair = 32'h73807380;
      8'hb4: base_pair = 32'h74807480;
      8'hb5: base_pair = 32'h75807580;
      8'hb6: base_pair = 32'h76807680;
      8'hb7: base_pair = 32'h77807780;
      8'hb8: base_pair = 32'h78807880;
      8'hb9: base_pair = 32'h79807980;
      8'hba: base_pair = 32'h7a807a80;
      8'hbb: base_pair = 32'h7b807b80;
      8'hbc: base_pair = 32'h7c807c80;
      8'hbd: base_pair = 32'h7d807d80;
      8'hbe: base_pair = 32'h7e807e80;
      8'hbf: base_pair = 32'h7f807f80;
      8'hc0: base_pair = 32'h7f807f80;
      8'hc1: base_pair = 32'h7f807f80;
      8'hc2: base_pair = 32'h7f807f80;
      8'hc3: base_pair = 32'h7f807f80;
      8'hc4: base_pair = 32'h7f807f80;
      8'hc5: base_pair = 32'h7f807f80;
      8'hc6: base_pair = 32'h7f807f80;
      8'hc7: base_pair = 32'h7f807f80;
      8'hc8: base_pair = 32'h7f807f80;
      8'hc9: base_pair = 32'h7f807f80;
      8'hca: base_pair = 32'h7f807f80;
      8'hcb: base_pair = 32'h7f807f80;
      8'hcc: base_pair = 32'h7f807f80;
      8'hcd: base_pair = 32'h7f807f80;
      8'hce: base_pair = 32'h7f807f80;
      8'hcf: base_pair = 32'h7f807f80;
      8'hd0: base_pair = 32'h7f807f80;
      8'hd1: base_pair = 32'h7f807f80;
      8'hd2: base_pair = 32'h7f807f80;
      8'hd3: base_pair = 32'h7f807f80;
      8'hd4: base_pair = 32'h7f807f80;
      8'hd5: base_pair = 32'h7f807f80;
      8'hd6: base_pair = 32'h7f807f80;
      8'hd7: base_pair = 32'h7f807f80;
      8'hd8: base_pair = 32'h7f807f80;
      8'hd9: base_pair = 32'h7f807f80;
      8'hda: base_pair = 32'h7f807f80;
      8'hdb: base_pair = 32'h7f807f80;
      8'hdc: base_pair = 32'h7f807f80;
      8'hdd: base_pair = 32'h7f807f80;
      8'hde: base_pair = 32'h7f807f80;
      8'hdf: base_pair = 32'h7f807f80;
      8'he0: base_pair = 32'h7f807f80;
      8'he1: base_pair = 32'h7f807f80;
      8'he2: base_pair = 32'h7f807f80;
      8'he3: base_pair = 32'h7f807f80;
      8'he4: base_pair = 32'h7f807f80;
      8'he5: base_pair = 32'h7f807f80;
      8'he6: base_pair = 32'h7f807f80;
      8'he7: base_pair = 32'h7f807f80;
      8'he8: base_pair = 32'h7f807f80;
      8'he9: base_pair = 32'h7f807f80;
      8'hea: base_pair = 32'h7f807f80;
      8'heb: base_pair = 32'h7f807f80;
      8'hec: base_pair = 32'h7f807f80;
      8'hed: base_pair = 32'h7f807f80;
      8'hee: base_pair = 32'h7f807f80;
      8'hef: base_pair = 32'h7f807f80;
      8'hf0: base_pair = 32'h7f807f80;
      8'hf1: base_pair = 32'h7f807f80;
      8'hf2: base_pair = 32'h7f807f80;
      8'hf3: base_pair = 32'h7f807f80;
      8'hf4: base_pair = 32'h7f807f80;
      8'hf5: base_pair = 32'h7f807f80;
      8'hf6: base_pair = 32'h7f807f80;
      8'hf7: base_pair = 32'h7f807f80;
      8'hf8: base_pair = 32'h7f807f80;
      8'hf9: base_pair = 32'h7f807f80;
      8'hfa: base_pair = 32'h7f807f80;
      8'hfb: base_pair = 32'h7f807f80;
      8'hfc: base_pair = 32'h7f807f80;
      8'hfd: base_pair = 32'h7f807f80;
      8'hfe: base_pair = 32'h7f807f80;
      8'hff: base_pair = 32'h7fc07fc0;
      default: base_pair = 32'h00000000;
    endcase
  end
  always @* begin
    delta_pair = 32'h00000000;
    case (exp)
      8'h40: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h41: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h42: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h43: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h07800780;
              4'h6: delta_pair = 32'h07810781;
              4'h7: delta_pair = 32'h07830783;
              4'h8: delta_pair = 32'h07840784;
              4'h9: delta_pair = 32'h07860786;
              4'ha: delta_pair = 32'h07870787;
              4'hb: delta_pair = 32'h07890789;
              4'hc: delta_pair = 32'h078a078a;
              4'hd: delta_pair = 32'h078c078c;
              4'he: delta_pair = 32'h078d078d;
              4'hf: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h07900790;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07920792;
              4'h2: delta_pair = 32'h07930793;
              4'h3: delta_pair = 32'h07950795;
              4'h4: delta_pair = 32'h07960796;
              4'h5: delta_pair = 32'h07980798;
              4'h6: delta_pair = 32'h07990799;
              4'h7: delta_pair = 32'h079b079b;
              4'h8: delta_pair = 32'h079c079c;
              4'h9: delta_pair = 32'h079e079e;
              4'ha: delta_pair = 32'h079f079f;
              4'hb: delta_pair = 32'h07a107a1;
              4'hc: delta_pair = 32'h07a307a3;
              4'hd: delta_pair = 32'h07a407a4;
              4'he: delta_pair = 32'h07a607a6;
              4'hf: delta_pair = 32'h07a707a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h07a907a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07ab07ab;
              4'h2: delta_pair = 32'h07ac07ac;
              4'h3: delta_pair = 32'h07ae07ae;
              4'h4: delta_pair = 32'h07b007b0;
              4'h5: delta_pair = 32'h07b107b1;
              4'h6: delta_pair = 32'h07b307b3;
              4'h7: delta_pair = 32'h07b507b5;
              4'h8: delta_pair = 32'h07b607b6;
              4'h9: delta_pair = 32'h07b807b8;
              4'ha: delta_pair = 32'h07ba07ba;
              4'hb: delta_pair = 32'h07bb07bb;
              4'hc: delta_pair = 32'h07bd07bd;
              4'hd: delta_pair = 32'h07bf07bf;
              4'he: delta_pair = 32'h07c107c1;
              4'hf: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h07c407c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07c607c6;
              4'h2: delta_pair = 32'h07c807c8;
              4'h3: delta_pair = 32'h07c907c9;
              4'h4: delta_pair = 32'h07cb07cb;
              4'h5: delta_pair = 32'h07cd07cd;
              4'h6: delta_pair = 32'h07cf07cf;
              4'h7: delta_pair = 32'h07d007d0;
              4'h8: delta_pair = 32'h07d207d2;
              4'h9: delta_pair = 32'h07d407d4;
              4'ha: delta_pair = 32'h07d607d6;
              4'hb: delta_pair = 32'h07d807d8;
              4'hc: delta_pair = 32'h07da07da;
              4'hd: delta_pair = 32'h07db07db;
              4'he: delta_pair = 32'h07dd07dd;
              4'hf: delta_pair = 32'h07df07df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h07e107e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07e307e3;
              4'h2: delta_pair = 32'h07e507e5;
              4'h3: delta_pair = 32'h07e707e7;
              4'h4: delta_pair = 32'h07e907e9;
              4'h5: delta_pair = 32'h07ea07ea;
              4'h6: delta_pair = 32'h07ec07ec;
              4'h7: delta_pair = 32'h07ee07ee;
              4'h8: delta_pair = 32'h07f007f0;
              4'h9: delta_pair = 32'h07f207f2;
              4'ha: delta_pair = 32'h07f407f4;
              4'hb: delta_pair = 32'h07f607f6;
              4'hc: delta_pair = 32'h07f807f8;
              4'hd: delta_pair = 32'h07fa07fa;
              4'he: delta_pair = 32'h07fc07fc;
              4'hf: delta_pair = 32'h07fe07fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h44: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h45: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h46: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h47: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h0f800f80;
              4'h6: delta_pair = 32'h0f810f81;
              4'h7: delta_pair = 32'h0f830f83;
              4'h8: delta_pair = 32'h0f840f84;
              4'h9: delta_pair = 32'h0f860f86;
              4'ha: delta_pair = 32'h0f870f87;
              4'hb: delta_pair = 32'h0f890f89;
              4'hc: delta_pair = 32'h0f8a0f8a;
              4'hd: delta_pair = 32'h0f8c0f8c;
              4'he: delta_pair = 32'h0f8d0f8d;
              4'hf: delta_pair = 32'h0f8f0f8f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0f900f90;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0f920f92;
              4'h2: delta_pair = 32'h0f930f93;
              4'h3: delta_pair = 32'h0f950f95;
              4'h4: delta_pair = 32'h0f960f96;
              4'h5: delta_pair = 32'h0f980f98;
              4'h6: delta_pair = 32'h0f990f99;
              4'h7: delta_pair = 32'h0f9b0f9b;
              4'h8: delta_pair = 32'h0f9c0f9c;
              4'h9: delta_pair = 32'h0f9e0f9e;
              4'ha: delta_pair = 32'h0f9f0f9f;
              4'hb: delta_pair = 32'h0fa10fa1;
              4'hc: delta_pair = 32'h0fa30fa3;
              4'hd: delta_pair = 32'h0fa40fa4;
              4'he: delta_pair = 32'h0fa60fa6;
              4'hf: delta_pair = 32'h0fa70fa7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0fa90fa9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fab0fab;
              4'h2: delta_pair = 32'h0fac0fac;
              4'h3: delta_pair = 32'h0fae0fae;
              4'h4: delta_pair = 32'h0fb00fb0;
              4'h5: delta_pair = 32'h0fb10fb1;
              4'h6: delta_pair = 32'h0fb30fb3;
              4'h7: delta_pair = 32'h0fb50fb5;
              4'h8: delta_pair = 32'h0fb60fb6;
              4'h9: delta_pair = 32'h0fb80fb8;
              4'ha: delta_pair = 32'h0fba0fba;
              4'hb: delta_pair = 32'h0fbb0fbb;
              4'hc: delta_pair = 32'h0fbd0fbd;
              4'hd: delta_pair = 32'h0fbf0fbf;
              4'he: delta_pair = 32'h0fc10fc1;
              4'hf: delta_pair = 32'h0fc20fc2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0fc40fc4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fc60fc6;
              4'h2: delta_pair = 32'h0fc80fc8;
              4'h3: delta_pair = 32'h0fc90fc9;
              4'h4: delta_pair = 32'h0fcb0fcb;
              4'h5: delta_pair = 32'h0fcd0fcd;
              4'h6: delta_pair = 32'h0fcf0fcf;
              4'h7: delta_pair = 32'h0fd00fd0;
              4'h8: delta_pair = 32'h0fd20fd2;
              4'h9: delta_pair = 32'h0fd40fd4;
              4'ha: delta_pair = 32'h0fd60fd6;
              4'hb: delta_pair = 32'h0fd80fd8;
              4'hc: delta_pair = 32'h0fda0fda;
              4'hd: delta_pair = 32'h0fdb0fdb;
              4'he: delta_pair = 32'h0fdd0fdd;
              4'hf: delta_pair = 32'h0fdf0fdf;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0fe10fe1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fe30fe3;
              4'h2: delta_pair = 32'h0fe50fe5;
              4'h3: delta_pair = 32'h0fe70fe7;
              4'h4: delta_pair = 32'h0fe90fe9;
              4'h5: delta_pair = 32'h0fea0fea;
              4'h6: delta_pair = 32'h0fec0fec;
              4'h7: delta_pair = 32'h0fee0fee;
              4'h8: delta_pair = 32'h0ff00ff0;
              4'h9: delta_pair = 32'h0ff20ff2;
              4'ha: delta_pair = 32'h0ff40ff4;
              4'hb: delta_pair = 32'h0ff60ff6;
              4'hc: delta_pair = 32'h0ff80ff8;
              4'hd: delta_pair = 32'h0ffa0ffa;
              4'he: delta_pair = 32'h0ffc0ffc;
              4'hf: delta_pair = 32'h0ffe0ffe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h48: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h49: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h4a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h4b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h07800780;
              4'h6: delta_pair = 32'h07810781;
              4'h7: delta_pair = 32'h07830783;
              4'h8: delta_pair = 32'h07840784;
              4'h9: delta_pair = 32'h07860786;
              4'ha: delta_pair = 32'h07870787;
              4'hb: delta_pair = 32'h07890789;
              4'hc: delta_pair = 32'h078a078a;
              4'hd: delta_pair = 32'h078c078c;
              4'he: delta_pair = 32'h078d078d;
              4'hf: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h07900790;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07920792;
              4'h2: delta_pair = 32'h07930793;
              4'h3: delta_pair = 32'h07950795;
              4'h4: delta_pair = 32'h07960796;
              4'h5: delta_pair = 32'h07980798;
              4'h6: delta_pair = 32'h07990799;
              4'h7: delta_pair = 32'h079b079b;
              4'h8: delta_pair = 32'h079c079c;
              4'h9: delta_pair = 32'h079e079e;
              4'ha: delta_pair = 32'h079f079f;
              4'hb: delta_pair = 32'h07a107a1;
              4'hc: delta_pair = 32'h07a307a3;
              4'hd: delta_pair = 32'h07a407a4;
              4'he: delta_pair = 32'h07a607a6;
              4'hf: delta_pair = 32'h07a707a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h07a907a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07ab07ab;
              4'h2: delta_pair = 32'h07ac07ac;
              4'h3: delta_pair = 32'h07ae07ae;
              4'h4: delta_pair = 32'h07b007b0;
              4'h5: delta_pair = 32'h07b107b1;
              4'h6: delta_pair = 32'h07b307b3;
              4'h7: delta_pair = 32'h07b507b5;
              4'h8: delta_pair = 32'h07b607b6;
              4'h9: delta_pair = 32'h07b807b8;
              4'ha: delta_pair = 32'h07ba07ba;
              4'hb: delta_pair = 32'h07bb07bb;
              4'hc: delta_pair = 32'h07bd07bd;
              4'hd: delta_pair = 32'h07bf07bf;
              4'he: delta_pair = 32'h07c107c1;
              4'hf: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h07c407c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07c607c6;
              4'h2: delta_pair = 32'h07c807c8;
              4'h3: delta_pair = 32'h07c907c9;
              4'h4: delta_pair = 32'h07cb07cb;
              4'h5: delta_pair = 32'h07cd07cd;
              4'h6: delta_pair = 32'h07cf07cf;
              4'h7: delta_pair = 32'h07d007d0;
              4'h8: delta_pair = 32'h07d207d2;
              4'h9: delta_pair = 32'h07d407d4;
              4'ha: delta_pair = 32'h07d607d6;
              4'hb: delta_pair = 32'h07d807d8;
              4'hc: delta_pair = 32'h07da07da;
              4'hd: delta_pair = 32'h07db07db;
              4'he: delta_pair = 32'h07dd07dd;
              4'hf: delta_pair = 32'h07df07df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h07e107e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07e307e3;
              4'h2: delta_pair = 32'h07e507e5;
              4'h3: delta_pair = 32'h07e707e7;
              4'h4: delta_pair = 32'h07e907e9;
              4'h5: delta_pair = 32'h07ea07ea;
              4'h6: delta_pair = 32'h07ec07ec;
              4'h7: delta_pair = 32'h07ee07ee;
              4'h8: delta_pair = 32'h07f007f0;
              4'h9: delta_pair = 32'h07f207f2;
              4'ha: delta_pair = 32'h07f407f4;
              4'hb: delta_pair = 32'h07f607f6;
              4'hc: delta_pair = 32'h07f807f8;
              4'hd: delta_pair = 32'h07fa07fa;
              4'he: delta_pair = 32'h07fc07fc;
              4'hf: delta_pair = 32'h07fe07fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h4c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h4d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h4e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h4f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h1f801f80;
              4'h6: delta_pair = 32'h1f811f81;
              4'h7: delta_pair = 32'h1f831f83;
              4'h8: delta_pair = 32'h1f841f84;
              4'h9: delta_pair = 32'h1f861f86;
              4'ha: delta_pair = 32'h1f871f87;
              4'hb: delta_pair = 32'h1f891f89;
              4'hc: delta_pair = 32'h1f8a1f8a;
              4'hd: delta_pair = 32'h1f8c1f8c;
              4'he: delta_pair = 32'h1f8d1f8d;
              4'hf: delta_pair = 32'h1f8f1f8f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h1f901f90;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1f921f92;
              4'h2: delta_pair = 32'h1f931f93;
              4'h3: delta_pair = 32'h1f951f95;
              4'h4: delta_pair = 32'h1f961f96;
              4'h5: delta_pair = 32'h1f981f98;
              4'h6: delta_pair = 32'h1f991f99;
              4'h7: delta_pair = 32'h1f9b1f9b;
              4'h8: delta_pair = 32'h1f9c1f9c;
              4'h9: delta_pair = 32'h1f9e1f9e;
              4'ha: delta_pair = 32'h1f9f1f9f;
              4'hb: delta_pair = 32'h1fa11fa1;
              4'hc: delta_pair = 32'h1fa31fa3;
              4'hd: delta_pair = 32'h1fa41fa4;
              4'he: delta_pair = 32'h1fa61fa6;
              4'hf: delta_pair = 32'h1fa71fa7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h1fa91fa9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1fab1fab;
              4'h2: delta_pair = 32'h1fac1fac;
              4'h3: delta_pair = 32'h1fae1fae;
              4'h4: delta_pair = 32'h1fb01fb0;
              4'h5: delta_pair = 32'h1fb11fb1;
              4'h6: delta_pair = 32'h1fb31fb3;
              4'h7: delta_pair = 32'h1fb51fb5;
              4'h8: delta_pair = 32'h1fb61fb6;
              4'h9: delta_pair = 32'h1fb81fb8;
              4'ha: delta_pair = 32'h1fba1fba;
              4'hb: delta_pair = 32'h1fbb1fbb;
              4'hc: delta_pair = 32'h1fbd1fbd;
              4'hd: delta_pair = 32'h1fbf1fbf;
              4'he: delta_pair = 32'h1fc11fc1;
              4'hf: delta_pair = 32'h1fc21fc2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h1fc41fc4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1fc61fc6;
              4'h2: delta_pair = 32'h1fc81fc8;
              4'h3: delta_pair = 32'h1fc91fc9;
              4'h4: delta_pair = 32'h1fcb1fcb;
              4'h5: delta_pair = 32'h1fcd1fcd;
              4'h6: delta_pair = 32'h1fcf1fcf;
              4'h7: delta_pair = 32'h1fd01fd0;
              4'h8: delta_pair = 32'h1fd21fd2;
              4'h9: delta_pair = 32'h1fd41fd4;
              4'ha: delta_pair = 32'h1fd61fd6;
              4'hb: delta_pair = 32'h1fd81fd8;
              4'hc: delta_pair = 32'h1fda1fda;
              4'hd: delta_pair = 32'h1fdb1fdb;
              4'he: delta_pair = 32'h1fdd1fdd;
              4'hf: delta_pair = 32'h1fdf1fdf;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h1fe11fe1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1fe31fe3;
              4'h2: delta_pair = 32'h1fe51fe5;
              4'h3: delta_pair = 32'h1fe71fe7;
              4'h4: delta_pair = 32'h1fe91fe9;
              4'h5: delta_pair = 32'h1fea1fea;
              4'h6: delta_pair = 32'h1fec1fec;
              4'h7: delta_pair = 32'h1fee1fee;
              4'h8: delta_pair = 32'h1ff01ff0;
              4'h9: delta_pair = 32'h1ff21ff2;
              4'ha: delta_pair = 32'h1ff41ff4;
              4'hb: delta_pair = 32'h1ff61ff6;
              4'hc: delta_pair = 32'h1ff81ff8;
              4'hd: delta_pair = 32'h1ffa1ffa;
              4'he: delta_pair = 32'h1ffc1ffc;
              4'hf: delta_pair = 32'h1ffe1ffe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h50: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h51: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h52: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h53: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h07800780;
              4'h6: delta_pair = 32'h07810781;
              4'h7: delta_pair = 32'h07830783;
              4'h8: delta_pair = 32'h07840784;
              4'h9: delta_pair = 32'h07860786;
              4'ha: delta_pair = 32'h07870787;
              4'hb: delta_pair = 32'h07890789;
              4'hc: delta_pair = 32'h078a078a;
              4'hd: delta_pair = 32'h078c078c;
              4'he: delta_pair = 32'h078d078d;
              4'hf: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h07900790;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07920792;
              4'h2: delta_pair = 32'h07930793;
              4'h3: delta_pair = 32'h07950795;
              4'h4: delta_pair = 32'h07960796;
              4'h5: delta_pair = 32'h07980798;
              4'h6: delta_pair = 32'h07990799;
              4'h7: delta_pair = 32'h079b079b;
              4'h8: delta_pair = 32'h079c079c;
              4'h9: delta_pair = 32'h079e079e;
              4'ha: delta_pair = 32'h079f079f;
              4'hb: delta_pair = 32'h07a107a1;
              4'hc: delta_pair = 32'h07a307a3;
              4'hd: delta_pair = 32'h07a407a4;
              4'he: delta_pair = 32'h07a607a6;
              4'hf: delta_pair = 32'h07a707a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h07a907a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07ab07ab;
              4'h2: delta_pair = 32'h07ac07ac;
              4'h3: delta_pair = 32'h07ae07ae;
              4'h4: delta_pair = 32'h07b007b0;
              4'h5: delta_pair = 32'h07b107b1;
              4'h6: delta_pair = 32'h07b307b3;
              4'h7: delta_pair = 32'h07b507b5;
              4'h8: delta_pair = 32'h07b607b6;
              4'h9: delta_pair = 32'h07b807b8;
              4'ha: delta_pair = 32'h07ba07ba;
              4'hb: delta_pair = 32'h07bb07bb;
              4'hc: delta_pair = 32'h07bd07bd;
              4'hd: delta_pair = 32'h07bf07bf;
              4'he: delta_pair = 32'h07c107c1;
              4'hf: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h07c407c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07c607c6;
              4'h2: delta_pair = 32'h07c807c8;
              4'h3: delta_pair = 32'h07c907c9;
              4'h4: delta_pair = 32'h07cb07cb;
              4'h5: delta_pair = 32'h07cd07cd;
              4'h6: delta_pair = 32'h07cf07cf;
              4'h7: delta_pair = 32'h07d007d0;
              4'h8: delta_pair = 32'h07d207d2;
              4'h9: delta_pair = 32'h07d407d4;
              4'ha: delta_pair = 32'h07d607d6;
              4'hb: delta_pair = 32'h07d807d8;
              4'hc: delta_pair = 32'h07da07da;
              4'hd: delta_pair = 32'h07db07db;
              4'he: delta_pair = 32'h07dd07dd;
              4'hf: delta_pair = 32'h07df07df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h07e107e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07e307e3;
              4'h2: delta_pair = 32'h07e507e5;
              4'h3: delta_pair = 32'h07e707e7;
              4'h4: delta_pair = 32'h07e907e9;
              4'h5: delta_pair = 32'h07ea07ea;
              4'h6: delta_pair = 32'h07ec07ec;
              4'h7: delta_pair = 32'h07ee07ee;
              4'h8: delta_pair = 32'h07f007f0;
              4'h9: delta_pair = 32'h07f207f2;
              4'ha: delta_pair = 32'h07f407f4;
              4'hb: delta_pair = 32'h07f607f6;
              4'hc: delta_pair = 32'h07f807f8;
              4'hd: delta_pair = 32'h07fa07fa;
              4'he: delta_pair = 32'h07fc07fc;
              4'hf: delta_pair = 32'h07fe07fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h54: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h55: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h56: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h57: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h0f800f80;
              4'h6: delta_pair = 32'h0f810f81;
              4'h7: delta_pair = 32'h0f830f83;
              4'h8: delta_pair = 32'h0f840f84;
              4'h9: delta_pair = 32'h0f860f86;
              4'ha: delta_pair = 32'h0f870f87;
              4'hb: delta_pair = 32'h0f890f89;
              4'hc: delta_pair = 32'h0f8a0f8a;
              4'hd: delta_pair = 32'h0f8c0f8c;
              4'he: delta_pair = 32'h0f8d0f8d;
              4'hf: delta_pair = 32'h0f8f0f8f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0f900f90;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0f920f92;
              4'h2: delta_pair = 32'h0f930f93;
              4'h3: delta_pair = 32'h0f950f95;
              4'h4: delta_pair = 32'h0f960f96;
              4'h5: delta_pair = 32'h0f980f98;
              4'h6: delta_pair = 32'h0f990f99;
              4'h7: delta_pair = 32'h0f9b0f9b;
              4'h8: delta_pair = 32'h0f9c0f9c;
              4'h9: delta_pair = 32'h0f9e0f9e;
              4'ha: delta_pair = 32'h0f9f0f9f;
              4'hb: delta_pair = 32'h0fa10fa1;
              4'hc: delta_pair = 32'h0fa30fa3;
              4'hd: delta_pair = 32'h0fa40fa4;
              4'he: delta_pair = 32'h0fa60fa6;
              4'hf: delta_pair = 32'h0fa70fa7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0fa90fa9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fab0fab;
              4'h2: delta_pair = 32'h0fac0fac;
              4'h3: delta_pair = 32'h0fae0fae;
              4'h4: delta_pair = 32'h0fb00fb0;
              4'h5: delta_pair = 32'h0fb10fb1;
              4'h6: delta_pair = 32'h0fb30fb3;
              4'h7: delta_pair = 32'h0fb50fb5;
              4'h8: delta_pair = 32'h0fb60fb6;
              4'h9: delta_pair = 32'h0fb80fb8;
              4'ha: delta_pair = 32'h0fba0fba;
              4'hb: delta_pair = 32'h0fbb0fbb;
              4'hc: delta_pair = 32'h0fbd0fbd;
              4'hd: delta_pair = 32'h0fbf0fbf;
              4'he: delta_pair = 32'h0fc10fc1;
              4'hf: delta_pair = 32'h0fc20fc2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0fc40fc4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fc60fc6;
              4'h2: delta_pair = 32'h0fc80fc8;
              4'h3: delta_pair = 32'h0fc90fc9;
              4'h4: delta_pair = 32'h0fcb0fcb;
              4'h5: delta_pair = 32'h0fcd0fcd;
              4'h6: delta_pair = 32'h0fcf0fcf;
              4'h7: delta_pair = 32'h0fd00fd0;
              4'h8: delta_pair = 32'h0fd20fd2;
              4'h9: delta_pair = 32'h0fd40fd4;
              4'ha: delta_pair = 32'h0fd60fd6;
              4'hb: delta_pair = 32'h0fd80fd8;
              4'hc: delta_pair = 32'h0fda0fda;
              4'hd: delta_pair = 32'h0fdb0fdb;
              4'he: delta_pair = 32'h0fdd0fdd;
              4'hf: delta_pair = 32'h0fdf0fdf;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0fe10fe1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fe30fe3;
              4'h2: delta_pair = 32'h0fe50fe5;
              4'h3: delta_pair = 32'h0fe70fe7;
              4'h4: delta_pair = 32'h0fe90fe9;
              4'h5: delta_pair = 32'h0fea0fea;
              4'h6: delta_pair = 32'h0fec0fec;
              4'h7: delta_pair = 32'h0fee0fee;
              4'h8: delta_pair = 32'h0ff00ff0;
              4'h9: delta_pair = 32'h0ff20ff2;
              4'ha: delta_pair = 32'h0ff40ff4;
              4'hb: delta_pair = 32'h0ff60ff6;
              4'hc: delta_pair = 32'h0ff80ff8;
              4'hd: delta_pair = 32'h0ffa0ffa;
              4'he: delta_pair = 32'h0ffc0ffc;
              4'hf: delta_pair = 32'h0ffe0ffe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h58: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h59: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h5a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h5b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h07800780;
              4'h6: delta_pair = 32'h07810781;
              4'h7: delta_pair = 32'h07830783;
              4'h8: delta_pair = 32'h07840784;
              4'h9: delta_pair = 32'h07860786;
              4'ha: delta_pair = 32'h07870787;
              4'hb: delta_pair = 32'h07890789;
              4'hc: delta_pair = 32'h078a078a;
              4'hd: delta_pair = 32'h078c078c;
              4'he: delta_pair = 32'h078d078d;
              4'hf: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h07900790;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07920792;
              4'h2: delta_pair = 32'h07930793;
              4'h3: delta_pair = 32'h07950795;
              4'h4: delta_pair = 32'h07960796;
              4'h5: delta_pair = 32'h07980798;
              4'h6: delta_pair = 32'h07990799;
              4'h7: delta_pair = 32'h079b079b;
              4'h8: delta_pair = 32'h079c079c;
              4'h9: delta_pair = 32'h079e079e;
              4'ha: delta_pair = 32'h079f079f;
              4'hb: delta_pair = 32'h07a107a1;
              4'hc: delta_pair = 32'h07a307a3;
              4'hd: delta_pair = 32'h07a407a4;
              4'he: delta_pair = 32'h07a607a6;
              4'hf: delta_pair = 32'h07a707a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h07a907a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07ab07ab;
              4'h2: delta_pair = 32'h07ac07ac;
              4'h3: delta_pair = 32'h07ae07ae;
              4'h4: delta_pair = 32'h07b007b0;
              4'h5: delta_pair = 32'h07b107b1;
              4'h6: delta_pair = 32'h07b307b3;
              4'h7: delta_pair = 32'h07b507b5;
              4'h8: delta_pair = 32'h07b607b6;
              4'h9: delta_pair = 32'h07b807b8;
              4'ha: delta_pair = 32'h07ba07ba;
              4'hb: delta_pair = 32'h07bb07bb;
              4'hc: delta_pair = 32'h07bd07bd;
              4'hd: delta_pair = 32'h07bf07bf;
              4'he: delta_pair = 32'h07c107c1;
              4'hf: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h07c407c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07c607c6;
              4'h2: delta_pair = 32'h07c807c8;
              4'h3: delta_pair = 32'h07c907c9;
              4'h4: delta_pair = 32'h07cb07cb;
              4'h5: delta_pair = 32'h07cd07cd;
              4'h6: delta_pair = 32'h07cf07cf;
              4'h7: delta_pair = 32'h07d007d0;
              4'h8: delta_pair = 32'h07d207d2;
              4'h9: delta_pair = 32'h07d407d4;
              4'ha: delta_pair = 32'h07d607d6;
              4'hb: delta_pair = 32'h07d807d8;
              4'hc: delta_pair = 32'h07da07da;
              4'hd: delta_pair = 32'h07db07db;
              4'he: delta_pair = 32'h07dd07dd;
              4'hf: delta_pair = 32'h07df07df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h07e107e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07e307e3;
              4'h2: delta_pair = 32'h07e507e5;
              4'h3: delta_pair = 32'h07e707e7;
              4'h4: delta_pair = 32'h07e907e9;
              4'h5: delta_pair = 32'h07ea07ea;
              4'h6: delta_pair = 32'h07ec07ec;
              4'h7: delta_pair = 32'h07ee07ee;
              4'h8: delta_pair = 32'h07f007f0;
              4'h9: delta_pair = 32'h07f207f2;
              4'ha: delta_pair = 32'h07f407f4;
              4'hb: delta_pair = 32'h07f607f6;
              4'hc: delta_pair = 32'h07f807f8;
              4'hd: delta_pair = 32'h07fa07fa;
              4'he: delta_pair = 32'h07fc07fc;
              4'hf: delta_pair = 32'h07fe07fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h5c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h5d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h5e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h5f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h3f803f80;
              4'h6: delta_pair = 32'h3f813f81;
              4'h7: delta_pair = 32'h3f833f83;
              4'h8: delta_pair = 32'h3f843f84;
              4'h9: delta_pair = 32'h3f863f86;
              4'ha: delta_pair = 32'h3f873f87;
              4'hb: delta_pair = 32'h3f893f89;
              4'hc: delta_pair = 32'h3f8a3f8a;
              4'hd: delta_pair = 32'h3f8c3f8c;
              4'he: delta_pair = 32'h3f8d3f8d;
              4'hf: delta_pair = 32'h3f8f3f8f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h3f903f90;
            case (mant_lo4)
              4'h1: delta_pair = 32'h3f923f92;
              4'h2: delta_pair = 32'h3f933f93;
              4'h3: delta_pair = 32'h3f953f95;
              4'h4: delta_pair = 32'h3f963f96;
              4'h5: delta_pair = 32'h3f983f98;
              4'h6: delta_pair = 32'h3f993f99;
              4'h7: delta_pair = 32'h3f9b3f9b;
              4'h8: delta_pair = 32'h3f9c3f9c;
              4'h9: delta_pair = 32'h3f9e3f9e;
              4'ha: delta_pair = 32'h3f9f3f9f;
              4'hb: delta_pair = 32'h3fa13fa1;
              4'hc: delta_pair = 32'h3fa33fa3;
              4'hd: delta_pair = 32'h3fa43fa4;
              4'he: delta_pair = 32'h3fa63fa6;
              4'hf: delta_pair = 32'h3fa73fa7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h3fa93fa9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h3fab3fab;
              4'h2: delta_pair = 32'h3fac3fac;
              4'h3: delta_pair = 32'h3fae3fae;
              4'h4: delta_pair = 32'h3fb03fb0;
              4'h5: delta_pair = 32'h3fb13fb1;
              4'h6: delta_pair = 32'h3fb33fb3;
              4'h7: delta_pair = 32'h3fb53fb5;
              4'h8: delta_pair = 32'h3fb63fb6;
              4'h9: delta_pair = 32'h3fb83fb8;
              4'ha: delta_pair = 32'h3fba3fba;
              4'hb: delta_pair = 32'h3fbb3fbb;
              4'hc: delta_pair = 32'h3fbd3fbd;
              4'hd: delta_pair = 32'h3fbf3fbf;
              4'he: delta_pair = 32'h3fc13fc1;
              4'hf: delta_pair = 32'h3fc23fc2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h3fc43fc4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h3fc63fc6;
              4'h2: delta_pair = 32'h3fc83fc8;
              4'h3: delta_pair = 32'h3fc93fc9;
              4'h4: delta_pair = 32'h3fcb3fcb;
              4'h5: delta_pair = 32'h3fcd3fcd;
              4'h6: delta_pair = 32'h3fcf3fcf;
              4'h7: delta_pair = 32'h3fd03fd0;
              4'h8: delta_pair = 32'h3fd23fd2;
              4'h9: delta_pair = 32'h3fd43fd4;
              4'ha: delta_pair = 32'h3fd63fd6;
              4'hb: delta_pair = 32'h3fd83fd8;
              4'hc: delta_pair = 32'h3fda3fda;
              4'hd: delta_pair = 32'h3fdb3fdb;
              4'he: delta_pair = 32'h3fdd3fdd;
              4'hf: delta_pair = 32'h3fdf3fdf;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h3fe13fe1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h3fe33fe3;
              4'h2: delta_pair = 32'h3fe53fe5;
              4'h3: delta_pair = 32'h3fe73fe7;
              4'h4: delta_pair = 32'h3fe93fe9;
              4'h5: delta_pair = 32'h3fea3fea;
              4'h6: delta_pair = 32'h3fec3fec;
              4'h7: delta_pair = 32'h3fee3fee;
              4'h8: delta_pair = 32'h3ff03ff0;
              4'h9: delta_pair = 32'h3ff23ff2;
              4'ha: delta_pair = 32'h3ff43ff4;
              4'hb: delta_pair = 32'h3ff63ff6;
              4'hc: delta_pair = 32'h3ff83ff8;
              4'hd: delta_pair = 32'h3ffa3ffa;
              4'he: delta_pair = 32'h3ffc3ffc;
              4'hf: delta_pair = 32'h3ffe3ffe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h60: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h61: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h62: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h63: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h07800780;
              4'h6: delta_pair = 32'h07810781;
              4'h7: delta_pair = 32'h07830783;
              4'h8: delta_pair = 32'h07840784;
              4'h9: delta_pair = 32'h07860786;
              4'ha: delta_pair = 32'h07870787;
              4'hb: delta_pair = 32'h07890789;
              4'hc: delta_pair = 32'h078a078a;
              4'hd: delta_pair = 32'h078c078c;
              4'he: delta_pair = 32'h078d078d;
              4'hf: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h07900790;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07920792;
              4'h2: delta_pair = 32'h07930793;
              4'h3: delta_pair = 32'h07950795;
              4'h4: delta_pair = 32'h07960796;
              4'h5: delta_pair = 32'h07980798;
              4'h6: delta_pair = 32'h07990799;
              4'h7: delta_pair = 32'h079b079b;
              4'h8: delta_pair = 32'h079c079c;
              4'h9: delta_pair = 32'h079e079e;
              4'ha: delta_pair = 32'h079f079f;
              4'hb: delta_pair = 32'h07a107a1;
              4'hc: delta_pair = 32'h07a307a3;
              4'hd: delta_pair = 32'h07a407a4;
              4'he: delta_pair = 32'h07a607a6;
              4'hf: delta_pair = 32'h07a707a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h07a907a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07ab07ab;
              4'h2: delta_pair = 32'h07ac07ac;
              4'h3: delta_pair = 32'h07ae07ae;
              4'h4: delta_pair = 32'h07b007b0;
              4'h5: delta_pair = 32'h07b107b1;
              4'h6: delta_pair = 32'h07b307b3;
              4'h7: delta_pair = 32'h07b507b5;
              4'h8: delta_pair = 32'h07b607b6;
              4'h9: delta_pair = 32'h07b807b8;
              4'ha: delta_pair = 32'h07ba07ba;
              4'hb: delta_pair = 32'h07bb07bb;
              4'hc: delta_pair = 32'h07bd07bd;
              4'hd: delta_pair = 32'h07bf07bf;
              4'he: delta_pair = 32'h07c107c1;
              4'hf: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h07c407c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07c607c6;
              4'h2: delta_pair = 32'h07c807c8;
              4'h3: delta_pair = 32'h07c907c9;
              4'h4: delta_pair = 32'h07cb07cb;
              4'h5: delta_pair = 32'h07cd07cd;
              4'h6: delta_pair = 32'h07cf07cf;
              4'h7: delta_pair = 32'h07d007d0;
              4'h8: delta_pair = 32'h07d207d2;
              4'h9: delta_pair = 32'h07d407d4;
              4'ha: delta_pair = 32'h07d607d6;
              4'hb: delta_pair = 32'h07d807d8;
              4'hc: delta_pair = 32'h07da07da;
              4'hd: delta_pair = 32'h07db07db;
              4'he: delta_pair = 32'h07dd07dd;
              4'hf: delta_pair = 32'h07df07df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h07e107e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07e307e3;
              4'h2: delta_pair = 32'h07e507e5;
              4'h3: delta_pair = 32'h07e707e7;
              4'h4: delta_pair = 32'h07e907e9;
              4'h5: delta_pair = 32'h07ea07ea;
              4'h6: delta_pair = 32'h07ec07ec;
              4'h7: delta_pair = 32'h07ee07ee;
              4'h8: delta_pair = 32'h07f007f0;
              4'h9: delta_pair = 32'h07f207f2;
              4'ha: delta_pair = 32'h07f407f4;
              4'hb: delta_pair = 32'h07f607f6;
              4'hc: delta_pair = 32'h07f807f8;
              4'hd: delta_pair = 32'h07fa07fa;
              4'he: delta_pair = 32'h07fc07fc;
              4'hf: delta_pair = 32'h07fe07fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h64: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h65: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h66: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h67: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h0f800f80;
              4'h6: delta_pair = 32'h0f810f81;
              4'h7: delta_pair = 32'h0f830f83;
              4'h8: delta_pair = 32'h0f840f84;
              4'h9: delta_pair = 32'h0f860f86;
              4'ha: delta_pair = 32'h0f870f87;
              4'hb: delta_pair = 32'h0f890f89;
              4'hc: delta_pair = 32'h0f8a0f8a;
              4'hd: delta_pair = 32'h0f8c0f8c;
              4'he: delta_pair = 32'h0f8d0f8d;
              4'hf: delta_pair = 32'h0f8f0f8f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0f900f90;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0f920f92;
              4'h2: delta_pair = 32'h0f930f93;
              4'h3: delta_pair = 32'h0f950f95;
              4'h4: delta_pair = 32'h0f960f96;
              4'h5: delta_pair = 32'h0f980f98;
              4'h6: delta_pair = 32'h0f990f99;
              4'h7: delta_pair = 32'h0f9b0f9b;
              4'h8: delta_pair = 32'h0f9c0f9c;
              4'h9: delta_pair = 32'h0f9e0f9e;
              4'ha: delta_pair = 32'h0f9f0f9f;
              4'hb: delta_pair = 32'h0fa10fa1;
              4'hc: delta_pair = 32'h0fa30fa3;
              4'hd: delta_pair = 32'h0fa40fa4;
              4'he: delta_pair = 32'h0fa60fa6;
              4'hf: delta_pair = 32'h0fa70fa7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0fa90fa9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fab0fab;
              4'h2: delta_pair = 32'h0fac0fac;
              4'h3: delta_pair = 32'h0fae0fae;
              4'h4: delta_pair = 32'h0fb00fb0;
              4'h5: delta_pair = 32'h0fb10fb1;
              4'h6: delta_pair = 32'h0fb30fb3;
              4'h7: delta_pair = 32'h0fb50fb5;
              4'h8: delta_pair = 32'h0fb60fb6;
              4'h9: delta_pair = 32'h0fb80fb8;
              4'ha: delta_pair = 32'h0fba0fba;
              4'hb: delta_pair = 32'h0fbb0fbb;
              4'hc: delta_pair = 32'h0fbd0fbd;
              4'hd: delta_pair = 32'h0fbf0fbf;
              4'he: delta_pair = 32'h0fc10fc1;
              4'hf: delta_pair = 32'h0fc20fc2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0fc40fc4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fc60fc6;
              4'h2: delta_pair = 32'h0fc80fc8;
              4'h3: delta_pair = 32'h0fc90fc9;
              4'h4: delta_pair = 32'h0fcb0fcb;
              4'h5: delta_pair = 32'h0fcd0fcd;
              4'h6: delta_pair = 32'h0fcf0fcf;
              4'h7: delta_pair = 32'h0fd00fd0;
              4'h8: delta_pair = 32'h0fd20fd2;
              4'h9: delta_pair = 32'h0fd40fd4;
              4'ha: delta_pair = 32'h0fd60fd6;
              4'hb: delta_pair = 32'h0fd80fd8;
              4'hc: delta_pair = 32'h0fda0fda;
              4'hd: delta_pair = 32'h0fdb0fdb;
              4'he: delta_pair = 32'h0fdd0fdd;
              4'hf: delta_pair = 32'h0fdf0fdf;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0fe10fe1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fe30fe3;
              4'h2: delta_pair = 32'h0fe50fe5;
              4'h3: delta_pair = 32'h0fe70fe7;
              4'h4: delta_pair = 32'h0fe90fe9;
              4'h5: delta_pair = 32'h0fea0fea;
              4'h6: delta_pair = 32'h0fec0fec;
              4'h7: delta_pair = 32'h0fee0fee;
              4'h8: delta_pair = 32'h0ff00ff0;
              4'h9: delta_pair = 32'h0ff20ff2;
              4'ha: delta_pair = 32'h0ff40ff4;
              4'hb: delta_pair = 32'h0ff60ff6;
              4'hc: delta_pair = 32'h0ff80ff8;
              4'hd: delta_pair = 32'h0ffa0ffa;
              4'he: delta_pair = 32'h0ffc0ffc;
              4'hf: delta_pair = 32'h0ffe0ffe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h68: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h69: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h07800780;
              4'h6: delta_pair = 32'h07810781;
              4'h7: delta_pair = 32'h07830783;
              4'h8: delta_pair = 32'h07840784;
              4'h9: delta_pair = 32'h07860786;
              4'ha: delta_pair = 32'h07870787;
              4'hb: delta_pair = 32'h07890789;
              4'hc: delta_pair = 32'h078a078a;
              4'hd: delta_pair = 32'h078c078c;
              4'he: delta_pair = 32'h078d078d;
              4'hf: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h07900790;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07920792;
              4'h2: delta_pair = 32'h07930793;
              4'h3: delta_pair = 32'h07950795;
              4'h4: delta_pair = 32'h07960796;
              4'h5: delta_pair = 32'h07980798;
              4'h6: delta_pair = 32'h07990799;
              4'h7: delta_pair = 32'h079b079b;
              4'h8: delta_pair = 32'h079c079c;
              4'h9: delta_pair = 32'h079e079e;
              4'ha: delta_pair = 32'h079f079f;
              4'hb: delta_pair = 32'h07a107a1;
              4'hc: delta_pair = 32'h07a307a3;
              4'hd: delta_pair = 32'h07a407a4;
              4'he: delta_pair = 32'h07a607a6;
              4'hf: delta_pair = 32'h07a707a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h07a907a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07ab07ab;
              4'h2: delta_pair = 32'h07ac07ac;
              4'h3: delta_pair = 32'h07ae07ae;
              4'h4: delta_pair = 32'h07b007b0;
              4'h5: delta_pair = 32'h07b107b1;
              4'h6: delta_pair = 32'h07b307b3;
              4'h7: delta_pair = 32'h07b507b5;
              4'h8: delta_pair = 32'h07b607b6;
              4'h9: delta_pair = 32'h07b807b8;
              4'ha: delta_pair = 32'h07ba07ba;
              4'hb: delta_pair = 32'h07bb07bb;
              4'hc: delta_pair = 32'h07bd07bd;
              4'hd: delta_pair = 32'h07bf07bf;
              4'he: delta_pair = 32'h07c107c1;
              4'hf: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h07c407c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07c607c6;
              4'h2: delta_pair = 32'h07c807c8;
              4'h3: delta_pair = 32'h07c907c9;
              4'h4: delta_pair = 32'h07cb07cb;
              4'h5: delta_pair = 32'h07cd07cd;
              4'h6: delta_pair = 32'h07cf07cf;
              4'h7: delta_pair = 32'h07d007d0;
              4'h8: delta_pair = 32'h07d207d2;
              4'h9: delta_pair = 32'h07d407d4;
              4'ha: delta_pair = 32'h07d607d6;
              4'hb: delta_pair = 32'h07d807d8;
              4'hc: delta_pair = 32'h07da07da;
              4'hd: delta_pair = 32'h07db07db;
              4'he: delta_pair = 32'h07dd07dd;
              4'hf: delta_pair = 32'h07df07df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h07e107e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07e307e3;
              4'h2: delta_pair = 32'h07e507e5;
              4'h3: delta_pair = 32'h07e707e7;
              4'h4: delta_pair = 32'h07e907e9;
              4'h5: delta_pair = 32'h07ea07ea;
              4'h6: delta_pair = 32'h07ec07ec;
              4'h7: delta_pair = 32'h07ee07ee;
              4'h8: delta_pair = 32'h07f007f0;
              4'h9: delta_pair = 32'h07f207f2;
              4'ha: delta_pair = 32'h07f407f4;
              4'hb: delta_pair = 32'h07f607f6;
              4'hc: delta_pair = 32'h07f807f8;
              4'hd: delta_pair = 32'h07fa07fa;
              4'he: delta_pair = 32'h07fc07fc;
              4'hf: delta_pair = 32'h07fe07fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h6f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h1f801f80;
              4'h6: delta_pair = 32'h1f811f81;
              4'h7: delta_pair = 32'h1f831f83;
              4'h8: delta_pair = 32'h1f841f84;
              4'h9: delta_pair = 32'h1f861f86;
              4'ha: delta_pair = 32'h1f871f87;
              4'hb: delta_pair = 32'h1f891f89;
              4'hc: delta_pair = 32'h1f8a1f8a;
              4'hd: delta_pair = 32'h1f8c1f8c;
              4'he: delta_pair = 32'h1f8d1f8d;
              4'hf: delta_pair = 32'h1f8f1f8f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h1f901f90;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1f921f92;
              4'h2: delta_pair = 32'h1f931f93;
              4'h3: delta_pair = 32'h1f951f95;
              4'h4: delta_pair = 32'h1f961f96;
              4'h5: delta_pair = 32'h1f981f98;
              4'h6: delta_pair = 32'h1f991f99;
              4'h7: delta_pair = 32'h1f9b1f9b;
              4'h8: delta_pair = 32'h1f9c1f9c;
              4'h9: delta_pair = 32'h1f9e1f9e;
              4'ha: delta_pair = 32'h1f9f1f9f;
              4'hb: delta_pair = 32'h1fa11fa1;
              4'hc: delta_pair = 32'h1fa31fa3;
              4'hd: delta_pair = 32'h1fa41fa4;
              4'he: delta_pair = 32'h1fa61fa6;
              4'hf: delta_pair = 32'h1fa71fa7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h1fa91fa9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1fab1fab;
              4'h2: delta_pair = 32'h1fac1fac;
              4'h3: delta_pair = 32'h1fae1fae;
              4'h4: delta_pair = 32'h1fb01fb0;
              4'h5: delta_pair = 32'h1fb11fb1;
              4'h6: delta_pair = 32'h1fb31fb3;
              4'h7: delta_pair = 32'h1fb51fb5;
              4'h8: delta_pair = 32'h1fb61fb6;
              4'h9: delta_pair = 32'h1fb81fb8;
              4'ha: delta_pair = 32'h1fba1fba;
              4'hb: delta_pair = 32'h1fbb1fbb;
              4'hc: delta_pair = 32'h1fbd1fbd;
              4'hd: delta_pair = 32'h1fbf1fbf;
              4'he: delta_pair = 32'h1fc11fc1;
              4'hf: delta_pair = 32'h1fc21fc2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h1fc41fc4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1fc61fc6;
              4'h2: delta_pair = 32'h1fc81fc8;
              4'h3: delta_pair = 32'h1fc91fc9;
              4'h4: delta_pair = 32'h1fcb1fcb;
              4'h5: delta_pair = 32'h1fcd1fcd;
              4'h6: delta_pair = 32'h1fcf1fcf;
              4'h7: delta_pair = 32'h1fd01fd0;
              4'h8: delta_pair = 32'h1fd21fd2;
              4'h9: delta_pair = 32'h1fd41fd4;
              4'ha: delta_pair = 32'h1fd61fd6;
              4'hb: delta_pair = 32'h1fd81fd8;
              4'hc: delta_pair = 32'h1fda1fda;
              4'hd: delta_pair = 32'h1fdb1fdb;
              4'he: delta_pair = 32'h1fdd1fdd;
              4'hf: delta_pair = 32'h1fdf1fdf;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h1fe11fe1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1fe31fe3;
              4'h2: delta_pair = 32'h1fe51fe5;
              4'h3: delta_pair = 32'h1fe71fe7;
              4'h4: delta_pair = 32'h1fe91fe9;
              4'h5: delta_pair = 32'h1fea1fea;
              4'h6: delta_pair = 32'h1fec1fec;
              4'h7: delta_pair = 32'h1fee1fee;
              4'h8: delta_pair = 32'h1ff01ff0;
              4'h9: delta_pair = 32'h1ff21ff2;
              4'ha: delta_pair = 32'h1ff41ff4;
              4'hb: delta_pair = 32'h1ff61ff6;
              4'hc: delta_pair = 32'h1ff81ff8;
              4'hd: delta_pair = 32'h1ffa1ffa;
              4'he: delta_pair = 32'h1ffc1ffc;
              4'hf: delta_pair = 32'h1ffe1ffe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h70: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h71: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h72: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h73: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h07800780;
              4'h6: delta_pair = 32'h07810781;
              4'h7: delta_pair = 32'h07830783;
              4'h8: delta_pair = 32'h07840784;
              4'h9: delta_pair = 32'h07860786;
              4'ha: delta_pair = 32'h07870787;
              4'hb: delta_pair = 32'h07890789;
              4'hc: delta_pair = 32'h078a078a;
              4'hd: delta_pair = 32'h078c078c;
              4'he: delta_pair = 32'h078d078d;
              4'hf: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h07900790;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07920792;
              4'h2: delta_pair = 32'h07930793;
              4'h3: delta_pair = 32'h07950795;
              4'h4: delta_pair = 32'h07960796;
              4'h5: delta_pair = 32'h07980798;
              4'h6: delta_pair = 32'h07990799;
              4'h7: delta_pair = 32'h079b079b;
              4'h8: delta_pair = 32'h079c079c;
              4'h9: delta_pair = 32'h079e079e;
              4'ha: delta_pair = 32'h079f079f;
              4'hb: delta_pair = 32'h07a107a1;
              4'hc: delta_pair = 32'h07a307a3;
              4'hd: delta_pair = 32'h07a407a4;
              4'he: delta_pair = 32'h07a607a6;
              4'hf: delta_pair = 32'h07a707a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h07a907a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07ab07ab;
              4'h2: delta_pair = 32'h07ac07ac;
              4'h3: delta_pair = 32'h07ae07ae;
              4'h4: delta_pair = 32'h07b007b0;
              4'h5: delta_pair = 32'h07b107b1;
              4'h6: delta_pair = 32'h07b307b3;
              4'h7: delta_pair = 32'h07b507b5;
              4'h8: delta_pair = 32'h07b607b6;
              4'h9: delta_pair = 32'h07b807b8;
              4'ha: delta_pair = 32'h07ba07ba;
              4'hb: delta_pair = 32'h07bb07bb;
              4'hc: delta_pair = 32'h07bd07bd;
              4'hd: delta_pair = 32'h07bf07bf;
              4'he: delta_pair = 32'h07c107c1;
              4'hf: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h07c407c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07c607c6;
              4'h2: delta_pair = 32'h07c807c8;
              4'h3: delta_pair = 32'h07c907c9;
              4'h4: delta_pair = 32'h07cb07cb;
              4'h5: delta_pair = 32'h07cd07cd;
              4'h6: delta_pair = 32'h07cf07cf;
              4'h7: delta_pair = 32'h07d007d0;
              4'h8: delta_pair = 32'h07d207d2;
              4'h9: delta_pair = 32'h07d407d4;
              4'ha: delta_pair = 32'h07d607d6;
              4'hb: delta_pair = 32'h07d807d8;
              4'hc: delta_pair = 32'h07da07da;
              4'hd: delta_pair = 32'h07db07db;
              4'he: delta_pair = 32'h07dd07dd;
              4'hf: delta_pair = 32'h07df07df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h07e107e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07e307e3;
              4'h2: delta_pair = 32'h07e507e5;
              4'h3: delta_pair = 32'h07e707e7;
              4'h4: delta_pair = 32'h07e907e9;
              4'h5: delta_pair = 32'h07ea07ea;
              4'h6: delta_pair = 32'h07ec07ec;
              4'h7: delta_pair = 32'h07ee07ee;
              4'h8: delta_pair = 32'h07f007f0;
              4'h9: delta_pair = 32'h07f207f2;
              4'ha: delta_pair = 32'h07f407f4;
              4'hb: delta_pair = 32'h07f607f6;
              4'hc: delta_pair = 32'h07f807f8;
              4'hd: delta_pair = 32'h07fa07fa;
              4'he: delta_pair = 32'h07fc07fc;
              4'hf: delta_pair = 32'h07fe07fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h74: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h75: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h76: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h77: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h0f800f80;
              4'h6: delta_pair = 32'h0f810f81;
              4'h7: delta_pair = 32'h0f830f83;
              4'h8: delta_pair = 32'h0f840f84;
              4'h9: delta_pair = 32'h0f860f86;
              4'ha: delta_pair = 32'h0f870f87;
              4'hb: delta_pair = 32'h0f890f89;
              4'hc: delta_pair = 32'h0f8a0f8a;
              4'hd: delta_pair = 32'h0f8c0f8c;
              4'he: delta_pair = 32'h0f8d0f8d;
              4'hf: delta_pair = 32'h0f8f0f8f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0f900f90;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0f920f92;
              4'h2: delta_pair = 32'h0f930f93;
              4'h3: delta_pair = 32'h0f950f95;
              4'h4: delta_pair = 32'h0f960f96;
              4'h5: delta_pair = 32'h0f980f98;
              4'h6: delta_pair = 32'h0f990f99;
              4'h7: delta_pair = 32'h0f9b0f9b;
              4'h8: delta_pair = 32'h0f9c0f9c;
              4'h9: delta_pair = 32'h0f9e0f9e;
              4'ha: delta_pair = 32'h0f9f0f9f;
              4'hb: delta_pair = 32'h0fa10fa1;
              4'hc: delta_pair = 32'h0fa30fa3;
              4'hd: delta_pair = 32'h0fa40fa4;
              4'he: delta_pair = 32'h0fa60fa6;
              4'hf: delta_pair = 32'h0fa70fa7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0fa90fa9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fab0fab;
              4'h2: delta_pair = 32'h0fac0fac;
              4'h3: delta_pair = 32'h0fae0fae;
              4'h4: delta_pair = 32'h0fb00fb0;
              4'h5: delta_pair = 32'h0fb10fb1;
              4'h6: delta_pair = 32'h0fb30fb3;
              4'h7: delta_pair = 32'h0fb50fb5;
              4'h8: delta_pair = 32'h0fb60fb6;
              4'h9: delta_pair = 32'h0fb80fb8;
              4'ha: delta_pair = 32'h0fba0fba;
              4'hb: delta_pair = 32'h0fbb0fbb;
              4'hc: delta_pair = 32'h0fbd0fbd;
              4'hd: delta_pair = 32'h0fbf0fbf;
              4'he: delta_pair = 32'h0fc10fc1;
              4'hf: delta_pair = 32'h0fc20fc2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0fc40fc4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fc60fc6;
              4'h2: delta_pair = 32'h0fc80fc8;
              4'h3: delta_pair = 32'h0fc90fc9;
              4'h4: delta_pair = 32'h0fcb0fcb;
              4'h5: delta_pair = 32'h0fcd0fcd;
              4'h6: delta_pair = 32'h0fcf0fcf;
              4'h7: delta_pair = 32'h0fd00fd0;
              4'h8: delta_pair = 32'h0fd20fd2;
              4'h9: delta_pair = 32'h0fd40fd4;
              4'ha: delta_pair = 32'h0fd60fd6;
              4'hb: delta_pair = 32'h0fd80fd8;
              4'hc: delta_pair = 32'h0fda0fda;
              4'hd: delta_pair = 32'h0fdb0fdb;
              4'he: delta_pair = 32'h0fdd0fdd;
              4'hf: delta_pair = 32'h0fdf0fdf;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0fe10fe1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fe30fe3;
              4'h2: delta_pair = 32'h0fe50fe5;
              4'h3: delta_pair = 32'h0fe70fe7;
              4'h4: delta_pair = 32'h0fe90fe9;
              4'h5: delta_pair = 32'h0fea0fea;
              4'h6: delta_pair = 32'h0fec0fec;
              4'h7: delta_pair = 32'h0fee0fee;
              4'h8: delta_pair = 32'h0ff00ff0;
              4'h9: delta_pair = 32'h0ff20ff2;
              4'ha: delta_pair = 32'h0ff40ff4;
              4'hb: delta_pair = 32'h0ff60ff6;
              4'hc: delta_pair = 32'h0ff80ff8;
              4'hd: delta_pair = 32'h0ffa0ffa;
              4'he: delta_pair = 32'h0ffc0ffc;
              4'hf: delta_pair = 32'h0ffe0ffe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h78: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h79: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h07800780;
              4'h6: delta_pair = 32'h07810781;
              4'h7: delta_pair = 32'h07830783;
              4'h8: delta_pair = 32'h07840784;
              4'h9: delta_pair = 32'h07860786;
              4'ha: delta_pair = 32'h07870787;
              4'hb: delta_pair = 32'h07890789;
              4'hc: delta_pair = 32'h078a078a;
              4'hd: delta_pair = 32'h078c078c;
              4'he: delta_pair = 32'h078d078d;
              4'hf: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h07900790;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07920792;
              4'h2: delta_pair = 32'h07930793;
              4'h3: delta_pair = 32'h07950795;
              4'h4: delta_pair = 32'h07960796;
              4'h5: delta_pair = 32'h07980798;
              4'h6: delta_pair = 32'h07990799;
              4'h7: delta_pair = 32'h079b079b;
              4'h8: delta_pair = 32'h079c079c;
              4'h9: delta_pair = 32'h079e079e;
              4'ha: delta_pair = 32'h079f079f;
              4'hb: delta_pair = 32'h07a107a1;
              4'hc: delta_pair = 32'h07a307a3;
              4'hd: delta_pair = 32'h07a407a4;
              4'he: delta_pair = 32'h07a607a6;
              4'hf: delta_pair = 32'h07a707a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h07a907a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07ab07ab;
              4'h2: delta_pair = 32'h07ac07ac;
              4'h3: delta_pair = 32'h07ae07ae;
              4'h4: delta_pair = 32'h07b007b0;
              4'h5: delta_pair = 32'h07b107b1;
              4'h6: delta_pair = 32'h07b307b3;
              4'h7: delta_pair = 32'h07b507b5;
              4'h8: delta_pair = 32'h07b607b6;
              4'h9: delta_pair = 32'h07b807b8;
              4'ha: delta_pair = 32'h07ba07ba;
              4'hb: delta_pair = 32'h07bb07bb;
              4'hc: delta_pair = 32'h07bd07bd;
              4'hd: delta_pair = 32'h07bf07bf;
              4'he: delta_pair = 32'h07c107c1;
              4'hf: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h07c407c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07c607c6;
              4'h2: delta_pair = 32'h07c807c8;
              4'h3: delta_pair = 32'h07c907c9;
              4'h4: delta_pair = 32'h07cb07cb;
              4'h5: delta_pair = 32'h07cd07cd;
              4'h6: delta_pair = 32'h07cf07cf;
              4'h7: delta_pair = 32'h07d007d0;
              4'h8: delta_pair = 32'h07d207d2;
              4'h9: delta_pair = 32'h07d407d4;
              4'ha: delta_pair = 32'h07d607d6;
              4'hb: delta_pair = 32'h07d807d8;
              4'hc: delta_pair = 32'h07da07da;
              4'hd: delta_pair = 32'h07db07db;
              4'he: delta_pair = 32'h07dd07dd;
              4'hf: delta_pair = 32'h07df07df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h07e107e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07e307e3;
              4'h2: delta_pair = 32'h07e507e5;
              4'h3: delta_pair = 32'h07e707e7;
              4'h4: delta_pair = 32'h07e907e9;
              4'h5: delta_pair = 32'h07ea07ea;
              4'h6: delta_pair = 32'h07ec07ec;
              4'h7: delta_pair = 32'h07ee07ee;
              4'h8: delta_pair = 32'h07f007f0;
              4'h9: delta_pair = 32'h07f207f2;
              4'ha: delta_pair = 32'h07f407f4;
              4'hb: delta_pair = 32'h07f607f6;
              4'hc: delta_pair = 32'h07f807f8;
              4'hd: delta_pair = 32'h07fa07fa;
              4'he: delta_pair = 32'h07fc07fc;
              4'hf: delta_pair = 32'h07fe07fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h7f807f80;
              4'h6: delta_pair = 32'h7f817f81;
              4'h7: delta_pair = 32'h7f837f83;
              4'h8: delta_pair = 32'h7f847f84;
              4'h9: delta_pair = 32'h7f867f86;
              4'ha: delta_pair = 32'h7f877f87;
              4'hb: delta_pair = 32'h7f897f89;
              4'hc: delta_pair = 32'h7f8a7f8a;
              4'hd: delta_pair = 32'h7f8c7f8c;
              4'he: delta_pair = 32'h7f8d7f8d;
              4'hf: delta_pair = 32'h7f8f7f8f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h7f907f90;
            case (mant_lo4)
              4'h1: delta_pair = 32'h7f927f92;
              4'h2: delta_pair = 32'h7f937f93;
              4'h3: delta_pair = 32'h7f957f95;
              4'h4: delta_pair = 32'h7f967f96;
              4'h5: delta_pair = 32'h7f987f98;
              4'h6: delta_pair = 32'h7f997f99;
              4'h7: delta_pair = 32'h7f9b7f9b;
              4'h8: delta_pair = 32'h7f9c7f9c;
              4'h9: delta_pair = 32'h7f9e7f9e;
              4'ha: delta_pair = 32'h7f9f7f9f;
              4'hb: delta_pair = 32'h7fa17fa1;
              4'hc: delta_pair = 32'h7fa37fa3;
              4'hd: delta_pair = 32'h7fa47fa4;
              4'he: delta_pair = 32'h7fa67fa6;
              4'hf: delta_pair = 32'h7fa77fa7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h7fa97fa9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h7fab7fab;
              4'h2: delta_pair = 32'h7fac7fac;
              4'h3: delta_pair = 32'h7fae7fae;
              4'h4: delta_pair = 32'h7fb07fb0;
              4'h5: delta_pair = 32'h7fb17fb1;
              4'h6: delta_pair = 32'h7fb37fb3;
              4'h7: delta_pair = 32'h7fb57fb5;
              4'h8: delta_pair = 32'h7fb67fb6;
              4'h9: delta_pair = 32'h7fb87fb8;
              4'ha: delta_pair = 32'h7fba7fba;
              4'hb: delta_pair = 32'h7fbb7fbb;
              4'hc: delta_pair = 32'h7fbd7fbd;
              4'hd: delta_pair = 32'h7fbf7fbf;
              4'he: delta_pair = 32'h7fc17fc1;
              4'hf: delta_pair = 32'h7fc27fc2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h7fc47fc4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h7fc67fc6;
              4'h2: delta_pair = 32'h7fc87fc8;
              4'h3: delta_pair = 32'h7fc97fc9;
              4'h4: delta_pair = 32'h7fcb7fcb;
              4'h5: delta_pair = 32'h7fcd7fcd;
              4'h6: delta_pair = 32'h7fcf7fcf;
              4'h7: delta_pair = 32'h7fd07fd0;
              4'h8: delta_pair = 32'h7fd27fd2;
              4'h9: delta_pair = 32'h7fd47fd4;
              4'ha: delta_pair = 32'h7fd67fd6;
              4'hb: delta_pair = 32'h7fd87fd8;
              4'hc: delta_pair = 32'h7fda7fda;
              4'hd: delta_pair = 32'h7fdb7fdb;
              4'he: delta_pair = 32'h7fdd7fdd;
              4'hf: delta_pair = 32'h7fdf7fdf;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h7fe17fe1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h7fe37fe3;
              4'h2: delta_pair = 32'h7fe57fe5;
              4'h3: delta_pair = 32'h7fe77fe7;
              4'h4: delta_pair = 32'h7fe97fe9;
              4'h5: delta_pair = 32'h7fea7fea;
              4'h6: delta_pair = 32'h7fec7fec;
              4'h7: delta_pair = 32'h7fee7fee;
              4'h8: delta_pair = 32'h7ff07ff0;
              4'h9: delta_pair = 32'h7ff27ff2;
              4'ha: delta_pair = 32'h7ff47ff4;
              4'hb: delta_pair = 32'h7ff67ff6;
              4'hc: delta_pair = 32'h7ff87ff8;
              4'hd: delta_pair = 32'h7ffa7ffa;
              4'he: delta_pair = 32'h7ffc7ffc;
              4'hf: delta_pair = 32'h7ffe7ffe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h80: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h81: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h82: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h83: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h07800780;
              4'h6: delta_pair = 32'h07810781;
              4'h7: delta_pair = 32'h07830783;
              4'h8: delta_pair = 32'h07840784;
              4'h9: delta_pair = 32'h07860786;
              4'ha: delta_pair = 32'h07870787;
              4'hb: delta_pair = 32'h07890789;
              4'hc: delta_pair = 32'h078a078a;
              4'hd: delta_pair = 32'h078c078c;
              4'he: delta_pair = 32'h078d078d;
              4'hf: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h07900790;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07920792;
              4'h2: delta_pair = 32'h07930793;
              4'h3: delta_pair = 32'h07950795;
              4'h4: delta_pair = 32'h07960796;
              4'h5: delta_pair = 32'h07980798;
              4'h6: delta_pair = 32'h07990799;
              4'h7: delta_pair = 32'h079b079b;
              4'h8: delta_pair = 32'h079c079c;
              4'h9: delta_pair = 32'h079e079e;
              4'ha: delta_pair = 32'h079f079f;
              4'hb: delta_pair = 32'h07a107a1;
              4'hc: delta_pair = 32'h07a307a3;
              4'hd: delta_pair = 32'h07a407a4;
              4'he: delta_pair = 32'h07a607a6;
              4'hf: delta_pair = 32'h07a707a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h07a907a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07ab07ab;
              4'h2: delta_pair = 32'h07ac07ac;
              4'h3: delta_pair = 32'h07ae07ae;
              4'h4: delta_pair = 32'h07b007b0;
              4'h5: delta_pair = 32'h07b107b1;
              4'h6: delta_pair = 32'h07b307b3;
              4'h7: delta_pair = 32'h07b507b5;
              4'h8: delta_pair = 32'h07b607b6;
              4'h9: delta_pair = 32'h07b807b8;
              4'ha: delta_pair = 32'h07ba07ba;
              4'hb: delta_pair = 32'h07bb07bb;
              4'hc: delta_pair = 32'h07bd07bd;
              4'hd: delta_pair = 32'h07bf07bf;
              4'he: delta_pair = 32'h07c107c1;
              4'hf: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h07c407c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07c607c6;
              4'h2: delta_pair = 32'h07c807c8;
              4'h3: delta_pair = 32'h07c907c9;
              4'h4: delta_pair = 32'h07cb07cb;
              4'h5: delta_pair = 32'h07cd07cd;
              4'h6: delta_pair = 32'h07cf07cf;
              4'h7: delta_pair = 32'h07d007d0;
              4'h8: delta_pair = 32'h07d207d2;
              4'h9: delta_pair = 32'h07d407d4;
              4'ha: delta_pair = 32'h07d607d6;
              4'hb: delta_pair = 32'h07d807d8;
              4'hc: delta_pair = 32'h07da07da;
              4'hd: delta_pair = 32'h07db07db;
              4'he: delta_pair = 32'h07dd07dd;
              4'hf: delta_pair = 32'h07df07df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h07e107e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07e307e3;
              4'h2: delta_pair = 32'h07e507e5;
              4'h3: delta_pair = 32'h07e707e7;
              4'h4: delta_pair = 32'h07e907e9;
              4'h5: delta_pair = 32'h07ea07ea;
              4'h6: delta_pair = 32'h07ec07ec;
              4'h7: delta_pair = 32'h07ee07ee;
              4'h8: delta_pair = 32'h07f007f0;
              4'h9: delta_pair = 32'h07f207f2;
              4'ha: delta_pair = 32'h07f407f4;
              4'hb: delta_pair = 32'h07f607f6;
              4'hc: delta_pair = 32'h07f807f8;
              4'hd: delta_pair = 32'h07fa07fa;
              4'he: delta_pair = 32'h07fc07fc;
              4'hf: delta_pair = 32'h07fe07fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h84: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h85: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h86: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h87: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h0f800f80;
              4'h6: delta_pair = 32'h0f810f81;
              4'h7: delta_pair = 32'h0f830f83;
              4'h8: delta_pair = 32'h0f840f84;
              4'h9: delta_pair = 32'h0f860f86;
              4'ha: delta_pair = 32'h0f870f87;
              4'hb: delta_pair = 32'h0f890f89;
              4'hc: delta_pair = 32'h0f8a0f8a;
              4'hd: delta_pair = 32'h0f8c0f8c;
              4'he: delta_pair = 32'h0f8d0f8d;
              4'hf: delta_pair = 32'h0f8f0f8f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0f900f90;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0f920f92;
              4'h2: delta_pair = 32'h0f930f93;
              4'h3: delta_pair = 32'h0f950f95;
              4'h4: delta_pair = 32'h0f960f96;
              4'h5: delta_pair = 32'h0f980f98;
              4'h6: delta_pair = 32'h0f990f99;
              4'h7: delta_pair = 32'h0f9b0f9b;
              4'h8: delta_pair = 32'h0f9c0f9c;
              4'h9: delta_pair = 32'h0f9e0f9e;
              4'ha: delta_pair = 32'h0f9f0f9f;
              4'hb: delta_pair = 32'h0fa10fa1;
              4'hc: delta_pair = 32'h0fa30fa3;
              4'hd: delta_pair = 32'h0fa40fa4;
              4'he: delta_pair = 32'h0fa60fa6;
              4'hf: delta_pair = 32'h0fa70fa7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0fa90fa9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fab0fab;
              4'h2: delta_pair = 32'h0fac0fac;
              4'h3: delta_pair = 32'h0fae0fae;
              4'h4: delta_pair = 32'h0fb00fb0;
              4'h5: delta_pair = 32'h0fb10fb1;
              4'h6: delta_pair = 32'h0fb30fb3;
              4'h7: delta_pair = 32'h0fb50fb5;
              4'h8: delta_pair = 32'h0fb60fb6;
              4'h9: delta_pair = 32'h0fb80fb8;
              4'ha: delta_pair = 32'h0fba0fba;
              4'hb: delta_pair = 32'h0fbb0fbb;
              4'hc: delta_pair = 32'h0fbd0fbd;
              4'hd: delta_pair = 32'h0fbf0fbf;
              4'he: delta_pair = 32'h0fc10fc1;
              4'hf: delta_pair = 32'h0fc20fc2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0fc40fc4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fc60fc6;
              4'h2: delta_pair = 32'h0fc80fc8;
              4'h3: delta_pair = 32'h0fc90fc9;
              4'h4: delta_pair = 32'h0fcb0fcb;
              4'h5: delta_pair = 32'h0fcd0fcd;
              4'h6: delta_pair = 32'h0fcf0fcf;
              4'h7: delta_pair = 32'h0fd00fd0;
              4'h8: delta_pair = 32'h0fd20fd2;
              4'h9: delta_pair = 32'h0fd40fd4;
              4'ha: delta_pair = 32'h0fd60fd6;
              4'hb: delta_pair = 32'h0fd80fd8;
              4'hc: delta_pair = 32'h0fda0fda;
              4'hd: delta_pair = 32'h0fdb0fdb;
              4'he: delta_pair = 32'h0fdd0fdd;
              4'hf: delta_pair = 32'h0fdf0fdf;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0fe10fe1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fe30fe3;
              4'h2: delta_pair = 32'h0fe50fe5;
              4'h3: delta_pair = 32'h0fe70fe7;
              4'h4: delta_pair = 32'h0fe90fe9;
              4'h5: delta_pair = 32'h0fea0fea;
              4'h6: delta_pair = 32'h0fec0fec;
              4'h7: delta_pair = 32'h0fee0fee;
              4'h8: delta_pair = 32'h0ff00ff0;
              4'h9: delta_pair = 32'h0ff20ff2;
              4'ha: delta_pair = 32'h0ff40ff4;
              4'hb: delta_pair = 32'h0ff60ff6;
              4'hc: delta_pair = 32'h0ff80ff8;
              4'hd: delta_pair = 32'h0ffa0ffa;
              4'he: delta_pair = 32'h0ffc0ffc;
              4'hf: delta_pair = 32'h0ffe0ffe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h88: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h89: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h07800780;
              4'h6: delta_pair = 32'h07810781;
              4'h7: delta_pair = 32'h07830783;
              4'h8: delta_pair = 32'h07840784;
              4'h9: delta_pair = 32'h07860786;
              4'ha: delta_pair = 32'h07870787;
              4'hb: delta_pair = 32'h07890789;
              4'hc: delta_pair = 32'h078a078a;
              4'hd: delta_pair = 32'h078c078c;
              4'he: delta_pair = 32'h078d078d;
              4'hf: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h07900790;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07920792;
              4'h2: delta_pair = 32'h07930793;
              4'h3: delta_pair = 32'h07950795;
              4'h4: delta_pair = 32'h07960796;
              4'h5: delta_pair = 32'h07980798;
              4'h6: delta_pair = 32'h07990799;
              4'h7: delta_pair = 32'h079b079b;
              4'h8: delta_pair = 32'h079c079c;
              4'h9: delta_pair = 32'h079e079e;
              4'ha: delta_pair = 32'h079f079f;
              4'hb: delta_pair = 32'h07a107a1;
              4'hc: delta_pair = 32'h07a307a3;
              4'hd: delta_pair = 32'h07a407a4;
              4'he: delta_pair = 32'h07a607a6;
              4'hf: delta_pair = 32'h07a707a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h07a907a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07ab07ab;
              4'h2: delta_pair = 32'h07ac07ac;
              4'h3: delta_pair = 32'h07ae07ae;
              4'h4: delta_pair = 32'h07b007b0;
              4'h5: delta_pair = 32'h07b107b1;
              4'h6: delta_pair = 32'h07b307b3;
              4'h7: delta_pair = 32'h07b507b5;
              4'h8: delta_pair = 32'h07b607b6;
              4'h9: delta_pair = 32'h07b807b8;
              4'ha: delta_pair = 32'h07ba07ba;
              4'hb: delta_pair = 32'h07bb07bb;
              4'hc: delta_pair = 32'h07bd07bd;
              4'hd: delta_pair = 32'h07bf07bf;
              4'he: delta_pair = 32'h07c107c1;
              4'hf: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h07c407c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07c607c6;
              4'h2: delta_pair = 32'h07c807c8;
              4'h3: delta_pair = 32'h07c907c9;
              4'h4: delta_pair = 32'h07cb07cb;
              4'h5: delta_pair = 32'h07cd07cd;
              4'h6: delta_pair = 32'h07cf07cf;
              4'h7: delta_pair = 32'h07d007d0;
              4'h8: delta_pair = 32'h07d207d2;
              4'h9: delta_pair = 32'h07d407d4;
              4'ha: delta_pair = 32'h07d607d6;
              4'hb: delta_pair = 32'h07d807d8;
              4'hc: delta_pair = 32'h07da07da;
              4'hd: delta_pair = 32'h07db07db;
              4'he: delta_pair = 32'h07dd07dd;
              4'hf: delta_pair = 32'h07df07df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h07e107e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07e307e3;
              4'h2: delta_pair = 32'h07e507e5;
              4'h3: delta_pair = 32'h07e707e7;
              4'h4: delta_pair = 32'h07e907e9;
              4'h5: delta_pair = 32'h07ea07ea;
              4'h6: delta_pair = 32'h07ec07ec;
              4'h7: delta_pair = 32'h07ee07ee;
              4'h8: delta_pair = 32'h07f007f0;
              4'h9: delta_pair = 32'h07f207f2;
              4'ha: delta_pair = 32'h07f407f4;
              4'hb: delta_pair = 32'h07f607f6;
              4'hc: delta_pair = 32'h07f807f8;
              4'hd: delta_pair = 32'h07fa07fa;
              4'he: delta_pair = 32'h07fc07fc;
              4'hf: delta_pair = 32'h07fe07fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h8f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h1f801f80;
              4'h6: delta_pair = 32'h1f811f81;
              4'h7: delta_pair = 32'h1f831f83;
              4'h8: delta_pair = 32'h1f841f84;
              4'h9: delta_pair = 32'h1f861f86;
              4'ha: delta_pair = 32'h1f871f87;
              4'hb: delta_pair = 32'h1f891f89;
              4'hc: delta_pair = 32'h1f8a1f8a;
              4'hd: delta_pair = 32'h1f8c1f8c;
              4'he: delta_pair = 32'h1f8d1f8d;
              4'hf: delta_pair = 32'h1f8f1f8f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h1f901f90;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1f921f92;
              4'h2: delta_pair = 32'h1f931f93;
              4'h3: delta_pair = 32'h1f951f95;
              4'h4: delta_pair = 32'h1f961f96;
              4'h5: delta_pair = 32'h1f981f98;
              4'h6: delta_pair = 32'h1f991f99;
              4'h7: delta_pair = 32'h1f9b1f9b;
              4'h8: delta_pair = 32'h1f9c1f9c;
              4'h9: delta_pair = 32'h1f9e1f9e;
              4'ha: delta_pair = 32'h1f9f1f9f;
              4'hb: delta_pair = 32'h1fa11fa1;
              4'hc: delta_pair = 32'h1fa31fa3;
              4'hd: delta_pair = 32'h1fa41fa4;
              4'he: delta_pair = 32'h1fa61fa6;
              4'hf: delta_pair = 32'h1fa71fa7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h1fa91fa9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1fab1fab;
              4'h2: delta_pair = 32'h1fac1fac;
              4'h3: delta_pair = 32'h1fae1fae;
              4'h4: delta_pair = 32'h1fb01fb0;
              4'h5: delta_pair = 32'h1fb11fb1;
              4'h6: delta_pair = 32'h1fb31fb3;
              4'h7: delta_pair = 32'h1fb51fb5;
              4'h8: delta_pair = 32'h1fb61fb6;
              4'h9: delta_pair = 32'h1fb81fb8;
              4'ha: delta_pair = 32'h1fba1fba;
              4'hb: delta_pair = 32'h1fbb1fbb;
              4'hc: delta_pair = 32'h1fbd1fbd;
              4'hd: delta_pair = 32'h1fbf1fbf;
              4'he: delta_pair = 32'h1fc11fc1;
              4'hf: delta_pair = 32'h1fc21fc2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h1fc41fc4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1fc61fc6;
              4'h2: delta_pair = 32'h1fc81fc8;
              4'h3: delta_pair = 32'h1fc91fc9;
              4'h4: delta_pair = 32'h1fcb1fcb;
              4'h5: delta_pair = 32'h1fcd1fcd;
              4'h6: delta_pair = 32'h1fcf1fcf;
              4'h7: delta_pair = 32'h1fd01fd0;
              4'h8: delta_pair = 32'h1fd21fd2;
              4'h9: delta_pair = 32'h1fd41fd4;
              4'ha: delta_pair = 32'h1fd61fd6;
              4'hb: delta_pair = 32'h1fd81fd8;
              4'hc: delta_pair = 32'h1fda1fda;
              4'hd: delta_pair = 32'h1fdb1fdb;
              4'he: delta_pair = 32'h1fdd1fdd;
              4'hf: delta_pair = 32'h1fdf1fdf;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h1fe11fe1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1fe31fe3;
              4'h2: delta_pair = 32'h1fe51fe5;
              4'h3: delta_pair = 32'h1fe71fe7;
              4'h4: delta_pair = 32'h1fe91fe9;
              4'h5: delta_pair = 32'h1fea1fea;
              4'h6: delta_pair = 32'h1fec1fec;
              4'h7: delta_pair = 32'h1fee1fee;
              4'h8: delta_pair = 32'h1ff01ff0;
              4'h9: delta_pair = 32'h1ff21ff2;
              4'ha: delta_pair = 32'h1ff41ff4;
              4'hb: delta_pair = 32'h1ff61ff6;
              4'hc: delta_pair = 32'h1ff81ff8;
              4'hd: delta_pair = 32'h1ffa1ffa;
              4'he: delta_pair = 32'h1ffc1ffc;
              4'hf: delta_pair = 32'h1ffe1ffe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h90: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h91: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h92: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h93: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h07800780;
              4'h6: delta_pair = 32'h07810781;
              4'h7: delta_pair = 32'h07830783;
              4'h8: delta_pair = 32'h07840784;
              4'h9: delta_pair = 32'h07860786;
              4'ha: delta_pair = 32'h07870787;
              4'hb: delta_pair = 32'h07890789;
              4'hc: delta_pair = 32'h078a078a;
              4'hd: delta_pair = 32'h078c078c;
              4'he: delta_pair = 32'h078d078d;
              4'hf: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h07900790;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07920792;
              4'h2: delta_pair = 32'h07930793;
              4'h3: delta_pair = 32'h07950795;
              4'h4: delta_pair = 32'h07960796;
              4'h5: delta_pair = 32'h07980798;
              4'h6: delta_pair = 32'h07990799;
              4'h7: delta_pair = 32'h079b079b;
              4'h8: delta_pair = 32'h079c079c;
              4'h9: delta_pair = 32'h079e079e;
              4'ha: delta_pair = 32'h079f079f;
              4'hb: delta_pair = 32'h07a107a1;
              4'hc: delta_pair = 32'h07a307a3;
              4'hd: delta_pair = 32'h07a407a4;
              4'he: delta_pair = 32'h07a607a6;
              4'hf: delta_pair = 32'h07a707a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h07a907a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07ab07ab;
              4'h2: delta_pair = 32'h07ac07ac;
              4'h3: delta_pair = 32'h07ae07ae;
              4'h4: delta_pair = 32'h07b007b0;
              4'h5: delta_pair = 32'h07b107b1;
              4'h6: delta_pair = 32'h07b307b3;
              4'h7: delta_pair = 32'h07b507b5;
              4'h8: delta_pair = 32'h07b607b6;
              4'h9: delta_pair = 32'h07b807b8;
              4'ha: delta_pair = 32'h07ba07ba;
              4'hb: delta_pair = 32'h07bb07bb;
              4'hc: delta_pair = 32'h07bd07bd;
              4'hd: delta_pair = 32'h07bf07bf;
              4'he: delta_pair = 32'h07c107c1;
              4'hf: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h07c407c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07c607c6;
              4'h2: delta_pair = 32'h07c807c8;
              4'h3: delta_pair = 32'h07c907c9;
              4'h4: delta_pair = 32'h07cb07cb;
              4'h5: delta_pair = 32'h07cd07cd;
              4'h6: delta_pair = 32'h07cf07cf;
              4'h7: delta_pair = 32'h07d007d0;
              4'h8: delta_pair = 32'h07d207d2;
              4'h9: delta_pair = 32'h07d407d4;
              4'ha: delta_pair = 32'h07d607d6;
              4'hb: delta_pair = 32'h07d807d8;
              4'hc: delta_pair = 32'h07da07da;
              4'hd: delta_pair = 32'h07db07db;
              4'he: delta_pair = 32'h07dd07dd;
              4'hf: delta_pair = 32'h07df07df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h07e107e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07e307e3;
              4'h2: delta_pair = 32'h07e507e5;
              4'h3: delta_pair = 32'h07e707e7;
              4'h4: delta_pair = 32'h07e907e9;
              4'h5: delta_pair = 32'h07ea07ea;
              4'h6: delta_pair = 32'h07ec07ec;
              4'h7: delta_pair = 32'h07ee07ee;
              4'h8: delta_pair = 32'h07f007f0;
              4'h9: delta_pair = 32'h07f207f2;
              4'ha: delta_pair = 32'h07f407f4;
              4'hb: delta_pair = 32'h07f607f6;
              4'hc: delta_pair = 32'h07f807f8;
              4'hd: delta_pair = 32'h07fa07fa;
              4'he: delta_pair = 32'h07fc07fc;
              4'hf: delta_pair = 32'h07fe07fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h94: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h95: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h96: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h97: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h0f800f80;
              4'h6: delta_pair = 32'h0f810f81;
              4'h7: delta_pair = 32'h0f830f83;
              4'h8: delta_pair = 32'h0f840f84;
              4'h9: delta_pair = 32'h0f860f86;
              4'ha: delta_pair = 32'h0f870f87;
              4'hb: delta_pair = 32'h0f890f89;
              4'hc: delta_pair = 32'h0f8a0f8a;
              4'hd: delta_pair = 32'h0f8c0f8c;
              4'he: delta_pair = 32'h0f8d0f8d;
              4'hf: delta_pair = 32'h0f8f0f8f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0f900f90;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0f920f92;
              4'h2: delta_pair = 32'h0f930f93;
              4'h3: delta_pair = 32'h0f950f95;
              4'h4: delta_pair = 32'h0f960f96;
              4'h5: delta_pair = 32'h0f980f98;
              4'h6: delta_pair = 32'h0f990f99;
              4'h7: delta_pair = 32'h0f9b0f9b;
              4'h8: delta_pair = 32'h0f9c0f9c;
              4'h9: delta_pair = 32'h0f9e0f9e;
              4'ha: delta_pair = 32'h0f9f0f9f;
              4'hb: delta_pair = 32'h0fa10fa1;
              4'hc: delta_pair = 32'h0fa30fa3;
              4'hd: delta_pair = 32'h0fa40fa4;
              4'he: delta_pair = 32'h0fa60fa6;
              4'hf: delta_pair = 32'h0fa70fa7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0fa90fa9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fab0fab;
              4'h2: delta_pair = 32'h0fac0fac;
              4'h3: delta_pair = 32'h0fae0fae;
              4'h4: delta_pair = 32'h0fb00fb0;
              4'h5: delta_pair = 32'h0fb10fb1;
              4'h6: delta_pair = 32'h0fb30fb3;
              4'h7: delta_pair = 32'h0fb50fb5;
              4'h8: delta_pair = 32'h0fb60fb6;
              4'h9: delta_pair = 32'h0fb80fb8;
              4'ha: delta_pair = 32'h0fba0fba;
              4'hb: delta_pair = 32'h0fbb0fbb;
              4'hc: delta_pair = 32'h0fbd0fbd;
              4'hd: delta_pair = 32'h0fbf0fbf;
              4'he: delta_pair = 32'h0fc10fc1;
              4'hf: delta_pair = 32'h0fc20fc2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0fc40fc4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fc60fc6;
              4'h2: delta_pair = 32'h0fc80fc8;
              4'h3: delta_pair = 32'h0fc90fc9;
              4'h4: delta_pair = 32'h0fcb0fcb;
              4'h5: delta_pair = 32'h0fcd0fcd;
              4'h6: delta_pair = 32'h0fcf0fcf;
              4'h7: delta_pair = 32'h0fd00fd0;
              4'h8: delta_pair = 32'h0fd20fd2;
              4'h9: delta_pair = 32'h0fd40fd4;
              4'ha: delta_pair = 32'h0fd60fd6;
              4'hb: delta_pair = 32'h0fd80fd8;
              4'hc: delta_pair = 32'h0fda0fda;
              4'hd: delta_pair = 32'h0fdb0fdb;
              4'he: delta_pair = 32'h0fdd0fdd;
              4'hf: delta_pair = 32'h0fdf0fdf;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0fe10fe1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fe30fe3;
              4'h2: delta_pair = 32'h0fe50fe5;
              4'h3: delta_pair = 32'h0fe70fe7;
              4'h4: delta_pair = 32'h0fe90fe9;
              4'h5: delta_pair = 32'h0fea0fea;
              4'h6: delta_pair = 32'h0fec0fec;
              4'h7: delta_pair = 32'h0fee0fee;
              4'h8: delta_pair = 32'h0ff00ff0;
              4'h9: delta_pair = 32'h0ff20ff2;
              4'ha: delta_pair = 32'h0ff40ff4;
              4'hb: delta_pair = 32'h0ff60ff6;
              4'hc: delta_pair = 32'h0ff80ff8;
              4'hd: delta_pair = 32'h0ffa0ffa;
              4'he: delta_pair = 32'h0ffc0ffc;
              4'hf: delta_pair = 32'h0ffe0ffe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h98: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h99: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h07800780;
              4'h6: delta_pair = 32'h07810781;
              4'h7: delta_pair = 32'h07830783;
              4'h8: delta_pair = 32'h07840784;
              4'h9: delta_pair = 32'h07860786;
              4'ha: delta_pair = 32'h07870787;
              4'hb: delta_pair = 32'h07890789;
              4'hc: delta_pair = 32'h078a078a;
              4'hd: delta_pair = 32'h078c078c;
              4'he: delta_pair = 32'h078d078d;
              4'hf: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h07900790;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07920792;
              4'h2: delta_pair = 32'h07930793;
              4'h3: delta_pair = 32'h07950795;
              4'h4: delta_pair = 32'h07960796;
              4'h5: delta_pair = 32'h07980798;
              4'h6: delta_pair = 32'h07990799;
              4'h7: delta_pair = 32'h079b079b;
              4'h8: delta_pair = 32'h079c079c;
              4'h9: delta_pair = 32'h079e079e;
              4'ha: delta_pair = 32'h079f079f;
              4'hb: delta_pair = 32'h07a107a1;
              4'hc: delta_pair = 32'h07a307a3;
              4'hd: delta_pair = 32'h07a407a4;
              4'he: delta_pair = 32'h07a607a6;
              4'hf: delta_pair = 32'h07a707a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h07a907a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07ab07ab;
              4'h2: delta_pair = 32'h07ac07ac;
              4'h3: delta_pair = 32'h07ae07ae;
              4'h4: delta_pair = 32'h07b007b0;
              4'h5: delta_pair = 32'h07b107b1;
              4'h6: delta_pair = 32'h07b307b3;
              4'h7: delta_pair = 32'h07b507b5;
              4'h8: delta_pair = 32'h07b607b6;
              4'h9: delta_pair = 32'h07b807b8;
              4'ha: delta_pair = 32'h07ba07ba;
              4'hb: delta_pair = 32'h07bb07bb;
              4'hc: delta_pair = 32'h07bd07bd;
              4'hd: delta_pair = 32'h07bf07bf;
              4'he: delta_pair = 32'h07c107c1;
              4'hf: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h07c407c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07c607c6;
              4'h2: delta_pair = 32'h07c807c8;
              4'h3: delta_pair = 32'h07c907c9;
              4'h4: delta_pair = 32'h07cb07cb;
              4'h5: delta_pair = 32'h07cd07cd;
              4'h6: delta_pair = 32'h07cf07cf;
              4'h7: delta_pair = 32'h07d007d0;
              4'h8: delta_pair = 32'h07d207d2;
              4'h9: delta_pair = 32'h07d407d4;
              4'ha: delta_pair = 32'h07d607d6;
              4'hb: delta_pair = 32'h07d807d8;
              4'hc: delta_pair = 32'h07da07da;
              4'hd: delta_pair = 32'h07db07db;
              4'he: delta_pair = 32'h07dd07dd;
              4'hf: delta_pair = 32'h07df07df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h07e107e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07e307e3;
              4'h2: delta_pair = 32'h07e507e5;
              4'h3: delta_pair = 32'h07e707e7;
              4'h4: delta_pair = 32'h07e907e9;
              4'h5: delta_pair = 32'h07ea07ea;
              4'h6: delta_pair = 32'h07ec07ec;
              4'h7: delta_pair = 32'h07ee07ee;
              4'h8: delta_pair = 32'h07f007f0;
              4'h9: delta_pair = 32'h07f207f2;
              4'ha: delta_pair = 32'h07f407f4;
              4'hb: delta_pair = 32'h07f607f6;
              4'hc: delta_pair = 32'h07f807f8;
              4'hd: delta_pair = 32'h07fa07fa;
              4'he: delta_pair = 32'h07fc07fc;
              4'hf: delta_pair = 32'h07fe07fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h9f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h3f803f80;
              4'h6: delta_pair = 32'h3f813f81;
              4'h7: delta_pair = 32'h3f833f83;
              4'h8: delta_pair = 32'h3f843f84;
              4'h9: delta_pair = 32'h3f863f86;
              4'ha: delta_pair = 32'h3f873f87;
              4'hb: delta_pair = 32'h3f893f89;
              4'hc: delta_pair = 32'h3f8a3f8a;
              4'hd: delta_pair = 32'h3f8c3f8c;
              4'he: delta_pair = 32'h3f8d3f8d;
              4'hf: delta_pair = 32'h3f8f3f8f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h3f903f90;
            case (mant_lo4)
              4'h1: delta_pair = 32'h3f923f92;
              4'h2: delta_pair = 32'h3f933f93;
              4'h3: delta_pair = 32'h3f953f95;
              4'h4: delta_pair = 32'h3f963f96;
              4'h5: delta_pair = 32'h3f983f98;
              4'h6: delta_pair = 32'h3f993f99;
              4'h7: delta_pair = 32'h3f9b3f9b;
              4'h8: delta_pair = 32'h3f9c3f9c;
              4'h9: delta_pair = 32'h3f9e3f9e;
              4'ha: delta_pair = 32'h3f9f3f9f;
              4'hb: delta_pair = 32'h3fa13fa1;
              4'hc: delta_pair = 32'h3fa33fa3;
              4'hd: delta_pair = 32'h3fa43fa4;
              4'he: delta_pair = 32'h3fa63fa6;
              4'hf: delta_pair = 32'h3fa73fa7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h3fa93fa9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h3fab3fab;
              4'h2: delta_pair = 32'h3fac3fac;
              4'h3: delta_pair = 32'h3fae3fae;
              4'h4: delta_pair = 32'h3fb03fb0;
              4'h5: delta_pair = 32'h3fb13fb1;
              4'h6: delta_pair = 32'h3fb33fb3;
              4'h7: delta_pair = 32'h3fb53fb5;
              4'h8: delta_pair = 32'h3fb63fb6;
              4'h9: delta_pair = 32'h3fb83fb8;
              4'ha: delta_pair = 32'h3fba3fba;
              4'hb: delta_pair = 32'h3fbb3fbb;
              4'hc: delta_pair = 32'h3fbd3fbd;
              4'hd: delta_pair = 32'h3fbf3fbf;
              4'he: delta_pair = 32'h3fc13fc1;
              4'hf: delta_pair = 32'h3fc23fc2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h3fc43fc4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h3fc63fc6;
              4'h2: delta_pair = 32'h3fc83fc8;
              4'h3: delta_pair = 32'h3fc93fc9;
              4'h4: delta_pair = 32'h3fcb3fcb;
              4'h5: delta_pair = 32'h3fcd3fcd;
              4'h6: delta_pair = 32'h3fcf3fcf;
              4'h7: delta_pair = 32'h3fd03fd0;
              4'h8: delta_pair = 32'h3fd23fd2;
              4'h9: delta_pair = 32'h3fd43fd4;
              4'ha: delta_pair = 32'h3fd63fd6;
              4'hb: delta_pair = 32'h3fd83fd8;
              4'hc: delta_pair = 32'h3fda3fda;
              4'hd: delta_pair = 32'h3fdb3fdb;
              4'he: delta_pair = 32'h3fdd3fdd;
              4'hf: delta_pair = 32'h3fdf3fdf;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h3fe13fe1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h3fe33fe3;
              4'h2: delta_pair = 32'h3fe53fe5;
              4'h3: delta_pair = 32'h3fe73fe7;
              4'h4: delta_pair = 32'h3fe93fe9;
              4'h5: delta_pair = 32'h3fea3fea;
              4'h6: delta_pair = 32'h3fec3fec;
              4'h7: delta_pair = 32'h3fee3fee;
              4'h8: delta_pair = 32'h3ff03ff0;
              4'h9: delta_pair = 32'h3ff23ff2;
              4'ha: delta_pair = 32'h3ff43ff4;
              4'hb: delta_pair = 32'h3ff63ff6;
              4'hc: delta_pair = 32'h3ff83ff8;
              4'hd: delta_pair = 32'h3ffa3ffa;
              4'he: delta_pair = 32'h3ffc3ffc;
              4'hf: delta_pair = 32'h3ffe3ffe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha0: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha1: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha2: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha3: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h07800780;
              4'h6: delta_pair = 32'h07810781;
              4'h7: delta_pair = 32'h07830783;
              4'h8: delta_pair = 32'h07840784;
              4'h9: delta_pair = 32'h07860786;
              4'ha: delta_pair = 32'h07870787;
              4'hb: delta_pair = 32'h07890789;
              4'hc: delta_pair = 32'h078a078a;
              4'hd: delta_pair = 32'h078c078c;
              4'he: delta_pair = 32'h078d078d;
              4'hf: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h07900790;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07920792;
              4'h2: delta_pair = 32'h07930793;
              4'h3: delta_pair = 32'h07950795;
              4'h4: delta_pair = 32'h07960796;
              4'h5: delta_pair = 32'h07980798;
              4'h6: delta_pair = 32'h07990799;
              4'h7: delta_pair = 32'h079b079b;
              4'h8: delta_pair = 32'h079c079c;
              4'h9: delta_pair = 32'h079e079e;
              4'ha: delta_pair = 32'h079f079f;
              4'hb: delta_pair = 32'h07a107a1;
              4'hc: delta_pair = 32'h07a307a3;
              4'hd: delta_pair = 32'h07a407a4;
              4'he: delta_pair = 32'h07a607a6;
              4'hf: delta_pair = 32'h07a707a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h07a907a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07ab07ab;
              4'h2: delta_pair = 32'h07ac07ac;
              4'h3: delta_pair = 32'h07ae07ae;
              4'h4: delta_pair = 32'h07b007b0;
              4'h5: delta_pair = 32'h07b107b1;
              4'h6: delta_pair = 32'h07b307b3;
              4'h7: delta_pair = 32'h07b507b5;
              4'h8: delta_pair = 32'h07b607b6;
              4'h9: delta_pair = 32'h07b807b8;
              4'ha: delta_pair = 32'h07ba07ba;
              4'hb: delta_pair = 32'h07bb07bb;
              4'hc: delta_pair = 32'h07bd07bd;
              4'hd: delta_pair = 32'h07bf07bf;
              4'he: delta_pair = 32'h07c107c1;
              4'hf: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h07c407c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07c607c6;
              4'h2: delta_pair = 32'h07c807c8;
              4'h3: delta_pair = 32'h07c907c9;
              4'h4: delta_pair = 32'h07cb07cb;
              4'h5: delta_pair = 32'h07cd07cd;
              4'h6: delta_pair = 32'h07cf07cf;
              4'h7: delta_pair = 32'h07d007d0;
              4'h8: delta_pair = 32'h07d207d2;
              4'h9: delta_pair = 32'h07d407d4;
              4'ha: delta_pair = 32'h07d607d6;
              4'hb: delta_pair = 32'h07d807d8;
              4'hc: delta_pair = 32'h07da07da;
              4'hd: delta_pair = 32'h07db07db;
              4'he: delta_pair = 32'h07dd07dd;
              4'hf: delta_pair = 32'h07df07df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h07e107e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07e307e3;
              4'h2: delta_pair = 32'h07e507e5;
              4'h3: delta_pair = 32'h07e707e7;
              4'h4: delta_pair = 32'h07e907e9;
              4'h5: delta_pair = 32'h07ea07ea;
              4'h6: delta_pair = 32'h07ec07ec;
              4'h7: delta_pair = 32'h07ee07ee;
              4'h8: delta_pair = 32'h07f007f0;
              4'h9: delta_pair = 32'h07f207f2;
              4'ha: delta_pair = 32'h07f407f4;
              4'hb: delta_pair = 32'h07f607f6;
              4'hc: delta_pair = 32'h07f807f8;
              4'hd: delta_pair = 32'h07fa07fa;
              4'he: delta_pair = 32'h07fc07fc;
              4'hf: delta_pair = 32'h07fe07fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha4: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha5: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha6: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha7: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h0f800f80;
              4'h6: delta_pair = 32'h0f810f81;
              4'h7: delta_pair = 32'h0f830f83;
              4'h8: delta_pair = 32'h0f840f84;
              4'h9: delta_pair = 32'h0f860f86;
              4'ha: delta_pair = 32'h0f870f87;
              4'hb: delta_pair = 32'h0f890f89;
              4'hc: delta_pair = 32'h0f8a0f8a;
              4'hd: delta_pair = 32'h0f8c0f8c;
              4'he: delta_pair = 32'h0f8d0f8d;
              4'hf: delta_pair = 32'h0f8f0f8f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0f900f90;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0f920f92;
              4'h2: delta_pair = 32'h0f930f93;
              4'h3: delta_pair = 32'h0f950f95;
              4'h4: delta_pair = 32'h0f960f96;
              4'h5: delta_pair = 32'h0f980f98;
              4'h6: delta_pair = 32'h0f990f99;
              4'h7: delta_pair = 32'h0f9b0f9b;
              4'h8: delta_pair = 32'h0f9c0f9c;
              4'h9: delta_pair = 32'h0f9e0f9e;
              4'ha: delta_pair = 32'h0f9f0f9f;
              4'hb: delta_pair = 32'h0fa10fa1;
              4'hc: delta_pair = 32'h0fa30fa3;
              4'hd: delta_pair = 32'h0fa40fa4;
              4'he: delta_pair = 32'h0fa60fa6;
              4'hf: delta_pair = 32'h0fa70fa7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0fa90fa9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fab0fab;
              4'h2: delta_pair = 32'h0fac0fac;
              4'h3: delta_pair = 32'h0fae0fae;
              4'h4: delta_pair = 32'h0fb00fb0;
              4'h5: delta_pair = 32'h0fb10fb1;
              4'h6: delta_pair = 32'h0fb30fb3;
              4'h7: delta_pair = 32'h0fb50fb5;
              4'h8: delta_pair = 32'h0fb60fb6;
              4'h9: delta_pair = 32'h0fb80fb8;
              4'ha: delta_pair = 32'h0fba0fba;
              4'hb: delta_pair = 32'h0fbb0fbb;
              4'hc: delta_pair = 32'h0fbd0fbd;
              4'hd: delta_pair = 32'h0fbf0fbf;
              4'he: delta_pair = 32'h0fc10fc1;
              4'hf: delta_pair = 32'h0fc20fc2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0fc40fc4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fc60fc6;
              4'h2: delta_pair = 32'h0fc80fc8;
              4'h3: delta_pair = 32'h0fc90fc9;
              4'h4: delta_pair = 32'h0fcb0fcb;
              4'h5: delta_pair = 32'h0fcd0fcd;
              4'h6: delta_pair = 32'h0fcf0fcf;
              4'h7: delta_pair = 32'h0fd00fd0;
              4'h8: delta_pair = 32'h0fd20fd2;
              4'h9: delta_pair = 32'h0fd40fd4;
              4'ha: delta_pair = 32'h0fd60fd6;
              4'hb: delta_pair = 32'h0fd80fd8;
              4'hc: delta_pair = 32'h0fda0fda;
              4'hd: delta_pair = 32'h0fdb0fdb;
              4'he: delta_pair = 32'h0fdd0fdd;
              4'hf: delta_pair = 32'h0fdf0fdf;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0fe10fe1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fe30fe3;
              4'h2: delta_pair = 32'h0fe50fe5;
              4'h3: delta_pair = 32'h0fe70fe7;
              4'h4: delta_pair = 32'h0fe90fe9;
              4'h5: delta_pair = 32'h0fea0fea;
              4'h6: delta_pair = 32'h0fec0fec;
              4'h7: delta_pair = 32'h0fee0fee;
              4'h8: delta_pair = 32'h0ff00ff0;
              4'h9: delta_pair = 32'h0ff20ff2;
              4'ha: delta_pair = 32'h0ff40ff4;
              4'hb: delta_pair = 32'h0ff60ff6;
              4'hc: delta_pair = 32'h0ff80ff8;
              4'hd: delta_pair = 32'h0ffa0ffa;
              4'he: delta_pair = 32'h0ffc0ffc;
              4'hf: delta_pair = 32'h0ffe0ffe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha8: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'ha9: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'haa: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hab: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h07800780;
              4'h6: delta_pair = 32'h07810781;
              4'h7: delta_pair = 32'h07830783;
              4'h8: delta_pair = 32'h07840784;
              4'h9: delta_pair = 32'h07860786;
              4'ha: delta_pair = 32'h07870787;
              4'hb: delta_pair = 32'h07890789;
              4'hc: delta_pair = 32'h078a078a;
              4'hd: delta_pair = 32'h078c078c;
              4'he: delta_pair = 32'h078d078d;
              4'hf: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h07900790;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07920792;
              4'h2: delta_pair = 32'h07930793;
              4'h3: delta_pair = 32'h07950795;
              4'h4: delta_pair = 32'h07960796;
              4'h5: delta_pair = 32'h07980798;
              4'h6: delta_pair = 32'h07990799;
              4'h7: delta_pair = 32'h079b079b;
              4'h8: delta_pair = 32'h079c079c;
              4'h9: delta_pair = 32'h079e079e;
              4'ha: delta_pair = 32'h079f079f;
              4'hb: delta_pair = 32'h07a107a1;
              4'hc: delta_pair = 32'h07a307a3;
              4'hd: delta_pair = 32'h07a407a4;
              4'he: delta_pair = 32'h07a607a6;
              4'hf: delta_pair = 32'h07a707a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h07a907a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07ab07ab;
              4'h2: delta_pair = 32'h07ac07ac;
              4'h3: delta_pair = 32'h07ae07ae;
              4'h4: delta_pair = 32'h07b007b0;
              4'h5: delta_pair = 32'h07b107b1;
              4'h6: delta_pair = 32'h07b307b3;
              4'h7: delta_pair = 32'h07b507b5;
              4'h8: delta_pair = 32'h07b607b6;
              4'h9: delta_pair = 32'h07b807b8;
              4'ha: delta_pair = 32'h07ba07ba;
              4'hb: delta_pair = 32'h07bb07bb;
              4'hc: delta_pair = 32'h07bd07bd;
              4'hd: delta_pair = 32'h07bf07bf;
              4'he: delta_pair = 32'h07c107c1;
              4'hf: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h07c407c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07c607c6;
              4'h2: delta_pair = 32'h07c807c8;
              4'h3: delta_pair = 32'h07c907c9;
              4'h4: delta_pair = 32'h07cb07cb;
              4'h5: delta_pair = 32'h07cd07cd;
              4'h6: delta_pair = 32'h07cf07cf;
              4'h7: delta_pair = 32'h07d007d0;
              4'h8: delta_pair = 32'h07d207d2;
              4'h9: delta_pair = 32'h07d407d4;
              4'ha: delta_pair = 32'h07d607d6;
              4'hb: delta_pair = 32'h07d807d8;
              4'hc: delta_pair = 32'h07da07da;
              4'hd: delta_pair = 32'h07db07db;
              4'he: delta_pair = 32'h07dd07dd;
              4'hf: delta_pair = 32'h07df07df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h07e107e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07e307e3;
              4'h2: delta_pair = 32'h07e507e5;
              4'h3: delta_pair = 32'h07e707e7;
              4'h4: delta_pair = 32'h07e907e9;
              4'h5: delta_pair = 32'h07ea07ea;
              4'h6: delta_pair = 32'h07ec07ec;
              4'h7: delta_pair = 32'h07ee07ee;
              4'h8: delta_pair = 32'h07f007f0;
              4'h9: delta_pair = 32'h07f207f2;
              4'ha: delta_pair = 32'h07f407f4;
              4'hb: delta_pair = 32'h07f607f6;
              4'hc: delta_pair = 32'h07f807f8;
              4'hd: delta_pair = 32'h07fa07fa;
              4'he: delta_pair = 32'h07fc07fc;
              4'hf: delta_pair = 32'h07fe07fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hac: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'had: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hae: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'haf: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h1f801f80;
              4'h6: delta_pair = 32'h1f811f81;
              4'h7: delta_pair = 32'h1f831f83;
              4'h8: delta_pair = 32'h1f841f84;
              4'h9: delta_pair = 32'h1f861f86;
              4'ha: delta_pair = 32'h1f871f87;
              4'hb: delta_pair = 32'h1f891f89;
              4'hc: delta_pair = 32'h1f8a1f8a;
              4'hd: delta_pair = 32'h1f8c1f8c;
              4'he: delta_pair = 32'h1f8d1f8d;
              4'hf: delta_pair = 32'h1f8f1f8f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h1f901f90;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1f921f92;
              4'h2: delta_pair = 32'h1f931f93;
              4'h3: delta_pair = 32'h1f951f95;
              4'h4: delta_pair = 32'h1f961f96;
              4'h5: delta_pair = 32'h1f981f98;
              4'h6: delta_pair = 32'h1f991f99;
              4'h7: delta_pair = 32'h1f9b1f9b;
              4'h8: delta_pair = 32'h1f9c1f9c;
              4'h9: delta_pair = 32'h1f9e1f9e;
              4'ha: delta_pair = 32'h1f9f1f9f;
              4'hb: delta_pair = 32'h1fa11fa1;
              4'hc: delta_pair = 32'h1fa31fa3;
              4'hd: delta_pair = 32'h1fa41fa4;
              4'he: delta_pair = 32'h1fa61fa6;
              4'hf: delta_pair = 32'h1fa71fa7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h1fa91fa9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1fab1fab;
              4'h2: delta_pair = 32'h1fac1fac;
              4'h3: delta_pair = 32'h1fae1fae;
              4'h4: delta_pair = 32'h1fb01fb0;
              4'h5: delta_pair = 32'h1fb11fb1;
              4'h6: delta_pair = 32'h1fb31fb3;
              4'h7: delta_pair = 32'h1fb51fb5;
              4'h8: delta_pair = 32'h1fb61fb6;
              4'h9: delta_pair = 32'h1fb81fb8;
              4'ha: delta_pair = 32'h1fba1fba;
              4'hb: delta_pair = 32'h1fbb1fbb;
              4'hc: delta_pair = 32'h1fbd1fbd;
              4'hd: delta_pair = 32'h1fbf1fbf;
              4'he: delta_pair = 32'h1fc11fc1;
              4'hf: delta_pair = 32'h1fc21fc2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h1fc41fc4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1fc61fc6;
              4'h2: delta_pair = 32'h1fc81fc8;
              4'h3: delta_pair = 32'h1fc91fc9;
              4'h4: delta_pair = 32'h1fcb1fcb;
              4'h5: delta_pair = 32'h1fcd1fcd;
              4'h6: delta_pair = 32'h1fcf1fcf;
              4'h7: delta_pair = 32'h1fd01fd0;
              4'h8: delta_pair = 32'h1fd21fd2;
              4'h9: delta_pair = 32'h1fd41fd4;
              4'ha: delta_pair = 32'h1fd61fd6;
              4'hb: delta_pair = 32'h1fd81fd8;
              4'hc: delta_pair = 32'h1fda1fda;
              4'hd: delta_pair = 32'h1fdb1fdb;
              4'he: delta_pair = 32'h1fdd1fdd;
              4'hf: delta_pair = 32'h1fdf1fdf;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h1fe11fe1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1fe31fe3;
              4'h2: delta_pair = 32'h1fe51fe5;
              4'h3: delta_pair = 32'h1fe71fe7;
              4'h4: delta_pair = 32'h1fe91fe9;
              4'h5: delta_pair = 32'h1fea1fea;
              4'h6: delta_pair = 32'h1fec1fec;
              4'h7: delta_pair = 32'h1fee1fee;
              4'h8: delta_pair = 32'h1ff01ff0;
              4'h9: delta_pair = 32'h1ff21ff2;
              4'ha: delta_pair = 32'h1ff41ff4;
              4'hb: delta_pair = 32'h1ff61ff6;
              4'hc: delta_pair = 32'h1ff81ff8;
              4'hd: delta_pair = 32'h1ffa1ffa;
              4'he: delta_pair = 32'h1ffc1ffc;
              4'hf: delta_pair = 32'h1ffe1ffe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb0: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb1: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb2: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb3: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h07800780;
              4'h6: delta_pair = 32'h07810781;
              4'h7: delta_pair = 32'h07830783;
              4'h8: delta_pair = 32'h07840784;
              4'h9: delta_pair = 32'h07860786;
              4'ha: delta_pair = 32'h07870787;
              4'hb: delta_pair = 32'h07890789;
              4'hc: delta_pair = 32'h078a078a;
              4'hd: delta_pair = 32'h078c078c;
              4'he: delta_pair = 32'h078d078d;
              4'hf: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h07900790;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07920792;
              4'h2: delta_pair = 32'h07930793;
              4'h3: delta_pair = 32'h07950795;
              4'h4: delta_pair = 32'h07960796;
              4'h5: delta_pair = 32'h07980798;
              4'h6: delta_pair = 32'h07990799;
              4'h7: delta_pair = 32'h079b079b;
              4'h8: delta_pair = 32'h079c079c;
              4'h9: delta_pair = 32'h079e079e;
              4'ha: delta_pair = 32'h079f079f;
              4'hb: delta_pair = 32'h07a107a1;
              4'hc: delta_pair = 32'h07a307a3;
              4'hd: delta_pair = 32'h07a407a4;
              4'he: delta_pair = 32'h07a607a6;
              4'hf: delta_pair = 32'h07a707a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h07a907a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07ab07ab;
              4'h2: delta_pair = 32'h07ac07ac;
              4'h3: delta_pair = 32'h07ae07ae;
              4'h4: delta_pair = 32'h07b007b0;
              4'h5: delta_pair = 32'h07b107b1;
              4'h6: delta_pair = 32'h07b307b3;
              4'h7: delta_pair = 32'h07b507b5;
              4'h8: delta_pair = 32'h07b607b6;
              4'h9: delta_pair = 32'h07b807b8;
              4'ha: delta_pair = 32'h07ba07ba;
              4'hb: delta_pair = 32'h07bb07bb;
              4'hc: delta_pair = 32'h07bd07bd;
              4'hd: delta_pair = 32'h07bf07bf;
              4'he: delta_pair = 32'h07c107c1;
              4'hf: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h07c407c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07c607c6;
              4'h2: delta_pair = 32'h07c807c8;
              4'h3: delta_pair = 32'h07c907c9;
              4'h4: delta_pair = 32'h07cb07cb;
              4'h5: delta_pair = 32'h07cd07cd;
              4'h6: delta_pair = 32'h07cf07cf;
              4'h7: delta_pair = 32'h07d007d0;
              4'h8: delta_pair = 32'h07d207d2;
              4'h9: delta_pair = 32'h07d407d4;
              4'ha: delta_pair = 32'h07d607d6;
              4'hb: delta_pair = 32'h07d807d8;
              4'hc: delta_pair = 32'h07da07da;
              4'hd: delta_pair = 32'h07db07db;
              4'he: delta_pair = 32'h07dd07dd;
              4'hf: delta_pair = 32'h07df07df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h07e107e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07e307e3;
              4'h2: delta_pair = 32'h07e507e5;
              4'h3: delta_pair = 32'h07e707e7;
              4'h4: delta_pair = 32'h07e907e9;
              4'h5: delta_pair = 32'h07ea07ea;
              4'h6: delta_pair = 32'h07ec07ec;
              4'h7: delta_pair = 32'h07ee07ee;
              4'h8: delta_pair = 32'h07f007f0;
              4'h9: delta_pair = 32'h07f207f2;
              4'ha: delta_pair = 32'h07f407f4;
              4'hb: delta_pair = 32'h07f607f6;
              4'hc: delta_pair = 32'h07f807f8;
              4'hd: delta_pair = 32'h07fa07fa;
              4'he: delta_pair = 32'h07fc07fc;
              4'hf: delta_pair = 32'h07fe07fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb4: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb5: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb6: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb7: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h0f800f80;
              4'h6: delta_pair = 32'h0f810f81;
              4'h7: delta_pair = 32'h0f830f83;
              4'h8: delta_pair = 32'h0f840f84;
              4'h9: delta_pair = 32'h0f860f86;
              4'ha: delta_pair = 32'h0f870f87;
              4'hb: delta_pair = 32'h0f890f89;
              4'hc: delta_pair = 32'h0f8a0f8a;
              4'hd: delta_pair = 32'h0f8c0f8c;
              4'he: delta_pair = 32'h0f8d0f8d;
              4'hf: delta_pair = 32'h0f8f0f8f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h0f900f90;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0f920f92;
              4'h2: delta_pair = 32'h0f930f93;
              4'h3: delta_pair = 32'h0f950f95;
              4'h4: delta_pair = 32'h0f960f96;
              4'h5: delta_pair = 32'h0f980f98;
              4'h6: delta_pair = 32'h0f990f99;
              4'h7: delta_pair = 32'h0f9b0f9b;
              4'h8: delta_pair = 32'h0f9c0f9c;
              4'h9: delta_pair = 32'h0f9e0f9e;
              4'ha: delta_pair = 32'h0f9f0f9f;
              4'hb: delta_pair = 32'h0fa10fa1;
              4'hc: delta_pair = 32'h0fa30fa3;
              4'hd: delta_pair = 32'h0fa40fa4;
              4'he: delta_pair = 32'h0fa60fa6;
              4'hf: delta_pair = 32'h0fa70fa7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0fa90fa9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fab0fab;
              4'h2: delta_pair = 32'h0fac0fac;
              4'h3: delta_pair = 32'h0fae0fae;
              4'h4: delta_pair = 32'h0fb00fb0;
              4'h5: delta_pair = 32'h0fb10fb1;
              4'h6: delta_pair = 32'h0fb30fb3;
              4'h7: delta_pair = 32'h0fb50fb5;
              4'h8: delta_pair = 32'h0fb60fb6;
              4'h9: delta_pair = 32'h0fb80fb8;
              4'ha: delta_pair = 32'h0fba0fba;
              4'hb: delta_pair = 32'h0fbb0fbb;
              4'hc: delta_pair = 32'h0fbd0fbd;
              4'hd: delta_pair = 32'h0fbf0fbf;
              4'he: delta_pair = 32'h0fc10fc1;
              4'hf: delta_pair = 32'h0fc20fc2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0fc40fc4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fc60fc6;
              4'h2: delta_pair = 32'h0fc80fc8;
              4'h3: delta_pair = 32'h0fc90fc9;
              4'h4: delta_pair = 32'h0fcb0fcb;
              4'h5: delta_pair = 32'h0fcd0fcd;
              4'h6: delta_pair = 32'h0fcf0fcf;
              4'h7: delta_pair = 32'h0fd00fd0;
              4'h8: delta_pair = 32'h0fd20fd2;
              4'h9: delta_pair = 32'h0fd40fd4;
              4'ha: delta_pair = 32'h0fd60fd6;
              4'hb: delta_pair = 32'h0fd80fd8;
              4'hc: delta_pair = 32'h0fda0fda;
              4'hd: delta_pair = 32'h0fdb0fdb;
              4'he: delta_pair = 32'h0fdd0fdd;
              4'hf: delta_pair = 32'h0fdf0fdf;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0fe10fe1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0fe30fe3;
              4'h2: delta_pair = 32'h0fe50fe5;
              4'h3: delta_pair = 32'h0fe70fe7;
              4'h4: delta_pair = 32'h0fe90fe9;
              4'h5: delta_pair = 32'h0fea0fea;
              4'h6: delta_pair = 32'h0fec0fec;
              4'h7: delta_pair = 32'h0fee0fee;
              4'h8: delta_pair = 32'h0ff00ff0;
              4'h9: delta_pair = 32'h0ff20ff2;
              4'ha: delta_pair = 32'h0ff40ff4;
              4'hb: delta_pair = 32'h0ff60ff6;
              4'hc: delta_pair = 32'h0ff80ff8;
              4'hd: delta_pair = 32'h0ffa0ffa;
              4'he: delta_pair = 32'h0ffc0ffc;
              4'hf: delta_pair = 32'h0ffe0ffe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb8: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hb9: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hba: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hbb: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h07800780;
              4'h6: delta_pair = 32'h07810781;
              4'h7: delta_pair = 32'h07830783;
              4'h8: delta_pair = 32'h07840784;
              4'h9: delta_pair = 32'h07860786;
              4'ha: delta_pair = 32'h07870787;
              4'hb: delta_pair = 32'h07890789;
              4'hc: delta_pair = 32'h078a078a;
              4'hd: delta_pair = 32'h078c078c;
              4'he: delta_pair = 32'h078d078d;
              4'hf: delta_pair = 32'h078f078f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h07900790;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07920792;
              4'h2: delta_pair = 32'h07930793;
              4'h3: delta_pair = 32'h07950795;
              4'h4: delta_pair = 32'h07960796;
              4'h5: delta_pair = 32'h07980798;
              4'h6: delta_pair = 32'h07990799;
              4'h7: delta_pair = 32'h079b079b;
              4'h8: delta_pair = 32'h079c079c;
              4'h9: delta_pair = 32'h079e079e;
              4'ha: delta_pair = 32'h079f079f;
              4'hb: delta_pair = 32'h07a107a1;
              4'hc: delta_pair = 32'h07a307a3;
              4'hd: delta_pair = 32'h07a407a4;
              4'he: delta_pair = 32'h07a607a6;
              4'hf: delta_pair = 32'h07a707a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h07a907a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07ab07ab;
              4'h2: delta_pair = 32'h07ac07ac;
              4'h3: delta_pair = 32'h07ae07ae;
              4'h4: delta_pair = 32'h07b007b0;
              4'h5: delta_pair = 32'h07b107b1;
              4'h6: delta_pair = 32'h07b307b3;
              4'h7: delta_pair = 32'h07b507b5;
              4'h8: delta_pair = 32'h07b607b6;
              4'h9: delta_pair = 32'h07b807b8;
              4'ha: delta_pair = 32'h07ba07ba;
              4'hb: delta_pair = 32'h07bb07bb;
              4'hc: delta_pair = 32'h07bd07bd;
              4'hd: delta_pair = 32'h07bf07bf;
              4'he: delta_pair = 32'h07c107c1;
              4'hf: delta_pair = 32'h07c207c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h07c407c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07c607c6;
              4'h2: delta_pair = 32'h07c807c8;
              4'h3: delta_pair = 32'h07c907c9;
              4'h4: delta_pair = 32'h07cb07cb;
              4'h5: delta_pair = 32'h07cd07cd;
              4'h6: delta_pair = 32'h07cf07cf;
              4'h7: delta_pair = 32'h07d007d0;
              4'h8: delta_pair = 32'h07d207d2;
              4'h9: delta_pair = 32'h07d407d4;
              4'ha: delta_pair = 32'h07d607d6;
              4'hb: delta_pair = 32'h07d807d8;
              4'hc: delta_pair = 32'h07da07da;
              4'hd: delta_pair = 32'h07db07db;
              4'he: delta_pair = 32'h07dd07dd;
              4'hf: delta_pair = 32'h07df07df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h07e107e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h07e307e3;
              4'h2: delta_pair = 32'h07e507e5;
              4'h3: delta_pair = 32'h07e707e7;
              4'h4: delta_pair = 32'h07e907e9;
              4'h5: delta_pair = 32'h07ea07ea;
              4'h6: delta_pair = 32'h07ec07ec;
              4'h7: delta_pair = 32'h07ee07ee;
              4'h8: delta_pair = 32'h07f007f0;
              4'h9: delta_pair = 32'h07f207f2;
              4'ha: delta_pair = 32'h07f407f4;
              4'hb: delta_pair = 32'h07f607f6;
              4'hc: delta_pair = 32'h07f807f8;
              4'hd: delta_pair = 32'h07fa07fa;
              4'he: delta_pair = 32'h07fc07fc;
              4'hf: delta_pair = 32'h07fe07fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hbc: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hbd: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h03800380;
              4'h6: delta_pair = 32'h03810381;
              4'h7: delta_pair = 32'h03830383;
              4'h8: delta_pair = 32'h03840384;
              4'h9: delta_pair = 32'h03860386;
              4'ha: delta_pair = 32'h03870387;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h038a038a;
              4'hd: delta_pair = 32'h038c038c;
              4'he: delta_pair = 32'h038d038d;
              4'hf: delta_pair = 32'h038f038f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03930393;
              4'h3: delta_pair = 32'h03950395;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03980398;
              4'h6: delta_pair = 32'h03990399;
              4'h7: delta_pair = 32'h039b039b;
              4'h8: delta_pair = 32'h039c039c;
              4'h9: delta_pair = 32'h039e039e;
              4'ha: delta_pair = 32'h039f039f;
              4'hb: delta_pair = 32'h03a103a1;
              4'hc: delta_pair = 32'h03a303a3;
              4'hd: delta_pair = 32'h03a403a4;
              4'he: delta_pair = 32'h03a603a6;
              4'hf: delta_pair = 32'h03a703a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03a903a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ab03ab;
              4'h2: delta_pair = 32'h03ac03ac;
              4'h3: delta_pair = 32'h03ae03ae;
              4'h4: delta_pair = 32'h03b003b0;
              4'h5: delta_pair = 32'h03b103b1;
              4'h6: delta_pair = 32'h03b303b3;
              4'h7: delta_pair = 32'h03b503b5;
              4'h8: delta_pair = 32'h03b603b6;
              4'h9: delta_pair = 32'h03b803b8;
              4'ha: delta_pair = 32'h03ba03ba;
              4'hb: delta_pair = 32'h03bb03bb;
              4'hc: delta_pair = 32'h03bd03bd;
              4'hd: delta_pair = 32'h03bf03bf;
              4'he: delta_pair = 32'h03c103c1;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03c403c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03c603c6;
              4'h2: delta_pair = 32'h03c803c8;
              4'h3: delta_pair = 32'h03c903c9;
              4'h4: delta_pair = 32'h03cb03cb;
              4'h5: delta_pair = 32'h03cd03cd;
              4'h6: delta_pair = 32'h03cf03cf;
              4'h7: delta_pair = 32'h03d003d0;
              4'h8: delta_pair = 32'h03d203d2;
              4'h9: delta_pair = 32'h03d403d4;
              4'ha: delta_pair = 32'h03d603d6;
              4'hb: delta_pair = 32'h03d803d8;
              4'hc: delta_pair = 32'h03da03da;
              4'hd: delta_pair = 32'h03db03db;
              4'he: delta_pair = 32'h03dd03dd;
              4'hf: delta_pair = 32'h03df03df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03e103e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e303e3;
              4'h2: delta_pair = 32'h03e503e5;
              4'h3: delta_pair = 32'h03e703e7;
              4'h4: delta_pair = 32'h03e903e9;
              4'h5: delta_pair = 32'h03ea03ea;
              4'h6: delta_pair = 32'h03ec03ec;
              4'h7: delta_pair = 32'h03ee03ee;
              4'h8: delta_pair = 32'h03f003f0;
              4'h9: delta_pair = 32'h03f203f2;
              4'ha: delta_pair = 32'h03f403f4;
              4'hb: delta_pair = 32'h03f603f6;
              4'hc: delta_pair = 32'h03f803f8;
              4'hd: delta_pair = 32'h03fa03fa;
              4'he: delta_pair = 32'h03fc03fc;
              4'hf: delta_pair = 32'h03fe03fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hbe: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00020002;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00060006;
              4'h4: delta_pair = 32'h00080008;
              4'h5: delta_pair = 32'h000a000a;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000e000e;
              4'h8: delta_pair = 32'h00100010;
              4'h9: delta_pair = 32'h00130013;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00190019;
              4'hd: delta_pair = 32'h001b001b;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00270027;
              4'h3: delta_pair = 32'h00290029;
              4'h4: delta_pair = 32'h002b002b;
              4'h5: delta_pair = 32'h002d002d;
              4'h6: delta_pair = 32'h00300030;
              4'h7: delta_pair = 32'h00320032;
              4'h8: delta_pair = 32'h00340034;
              4'h9: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003e003e;
              4'hd: delta_pair = 32'h00410041;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00460046;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00480048;
            case (mant_lo4)
              4'h1: delta_pair = 32'h004b004b;
              4'h2: delta_pair = 32'h004d004d;
              4'h3: delta_pair = 32'h00500050;
              4'h4: delta_pair = 32'h00520052;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00570057;
              4'h7: delta_pair = 32'h005a005a;
              4'h8: delta_pair = 32'h005c005c;
              4'h9: delta_pair = 32'h005f005f;
              4'ha: delta_pair = 32'h00620062;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h006a006a;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00720072;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00750075;
              4'h2: delta_pair = 32'h00780078;
              4'h3: delta_pair = 32'h007a007a;
              4'h4: delta_pair = 32'h007d007d;
              4'h5: delta_pair = 32'h01800180;
              4'h6: delta_pair = 32'h01810181;
              4'h7: delta_pair = 32'h01830183;
              4'h8: delta_pair = 32'h01840184;
              4'h9: delta_pair = 32'h01860186;
              4'ha: delta_pair = 32'h01870187;
              4'hb: delta_pair = 32'h01890189;
              4'hc: delta_pair = 32'h018a018a;
              4'hd: delta_pair = 32'h018c018c;
              4'he: delta_pair = 32'h018d018d;
              4'hf: delta_pair = 32'h018f018f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01900190;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01920192;
              4'h2: delta_pair = 32'h01930193;
              4'h3: delta_pair = 32'h01950195;
              4'h4: delta_pair = 32'h01960196;
              4'h5: delta_pair = 32'h01980198;
              4'h6: delta_pair = 32'h01990199;
              4'h7: delta_pair = 32'h019b019b;
              4'h8: delta_pair = 32'h019c019c;
              4'h9: delta_pair = 32'h019e019e;
              4'ha: delta_pair = 32'h019f019f;
              4'hb: delta_pair = 32'h01a101a1;
              4'hc: delta_pair = 32'h01a301a3;
              4'hd: delta_pair = 32'h01a401a4;
              4'he: delta_pair = 32'h01a601a6;
              4'hf: delta_pair = 32'h01a701a7;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01a901a9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ab01ab;
              4'h2: delta_pair = 32'h01ac01ac;
              4'h3: delta_pair = 32'h01ae01ae;
              4'h4: delta_pair = 32'h01b001b0;
              4'h5: delta_pair = 32'h01b101b1;
              4'h6: delta_pair = 32'h01b301b3;
              4'h7: delta_pair = 32'h01b501b5;
              4'h8: delta_pair = 32'h01b601b6;
              4'h9: delta_pair = 32'h01b801b8;
              4'ha: delta_pair = 32'h01ba01ba;
              4'hb: delta_pair = 32'h01bb01bb;
              4'hc: delta_pair = 32'h01bd01bd;
              4'hd: delta_pair = 32'h01bf01bf;
              4'he: delta_pair = 32'h01c101c1;
              4'hf: delta_pair = 32'h01c201c2;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01c401c4;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c601c6;
              4'h2: delta_pair = 32'h01c801c8;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01cb01cb;
              4'h5: delta_pair = 32'h01cd01cd;
              4'h6: delta_pair = 32'h01cf01cf;
              4'h7: delta_pair = 32'h01d001d0;
              4'h8: delta_pair = 32'h01d201d2;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d601d6;
              4'hb: delta_pair = 32'h01d801d8;
              4'hc: delta_pair = 32'h01da01da;
              4'hd: delta_pair = 32'h01db01db;
              4'he: delta_pair = 32'h01dd01dd;
              4'hf: delta_pair = 32'h01df01df;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01e101e1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01e301e3;
              4'h2: delta_pair = 32'h01e501e5;
              4'h3: delta_pair = 32'h01e701e7;
              4'h4: delta_pair = 32'h01e901e9;
              4'h5: delta_pair = 32'h01ea01ea;
              4'h6: delta_pair = 32'h01ec01ec;
              4'h7: delta_pair = 32'h01ee01ee;
              4'h8: delta_pair = 32'h01f001f0;
              4'h9: delta_pair = 32'h01f201f2;
              4'ha: delta_pair = 32'h01f401f4;
              4'hb: delta_pair = 32'h01f601f6;
              4'hc: delta_pair = 32'h01f801f8;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fc01fc;
              4'hf: delta_pair = 32'h01fe01fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'hff: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00400040;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00000000;
          end
          3'h2: begin
            delta_pair = 32'h00000000;
          end
          3'h3: begin
            delta_pair = 32'h00000000;
          end
          3'h4: begin
            delta_pair = 32'h00000000;
          end
          3'h5: begin
            delta_pair = 32'h00000000;
          end
          3'h6: begin
            delta_pair = 32'h00000000;
          end
          3'h7: begin
            delta_pair = 32'h00000000;
          end
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  wire [31:0] pair = base_pair ^ delta_pair;
  reg bit_15;
  always @* begin
    bit_15 = 1'b0;
    casez (sign_exp)
      default: begin end
    endcase
  end
  assign out = {bit_15, (sign ? pair[30] : pair[14]), (sign ? pair[29] : pair[13]), (sign ? pair[28] : pair[12]), (sign ? pair[27] : pair[11]), (sign ? pair[26] : pair[10]), (sign ? pair[25] : pair[9]), (sign ? pair[24] : pair[8]), (sign ? pair[23] : pair[7]), (sign ? pair[22] : pair[6]), (sign ? pair[21] : pair[5]), (sign ? pair[20] : pair[4]), (sign ? pair[19] : pair[3]), (sign ? pair[18] : pair[2]), (sign ? pair[17] : pair[1]), (sign ? pair[16] : pair[0])};
endmodule
