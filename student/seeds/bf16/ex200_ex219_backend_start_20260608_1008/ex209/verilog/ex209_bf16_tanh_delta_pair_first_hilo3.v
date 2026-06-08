module ex209_bf16_tanh_delta_pair_first_hilo3(in, out);
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
      8'h01: base_pair = 32'h80800080;
      8'h02: base_pair = 32'h81000100;
      8'h03: base_pair = 32'h81800180;
      8'h04: base_pair = 32'h82000200;
      8'h05: base_pair = 32'h82800280;
      8'h06: base_pair = 32'h83000300;
      8'h07: base_pair = 32'h83800380;
      8'h08: base_pair = 32'h84000400;
      8'h09: base_pair = 32'h84800480;
      8'h0a: base_pair = 32'h85000500;
      8'h0b: base_pair = 32'h85800580;
      8'h0c: base_pair = 32'h86000600;
      8'h0d: base_pair = 32'h86800680;
      8'h0e: base_pair = 32'h87000700;
      8'h0f: base_pair = 32'h87800780;
      8'h10: base_pair = 32'h88000800;
      8'h11: base_pair = 32'h88800880;
      8'h12: base_pair = 32'h89000900;
      8'h13: base_pair = 32'h89800980;
      8'h14: base_pair = 32'h8a000a00;
      8'h15: base_pair = 32'h8a800a80;
      8'h16: base_pair = 32'h8b000b00;
      8'h17: base_pair = 32'h8b800b80;
      8'h18: base_pair = 32'h8c000c00;
      8'h19: base_pair = 32'h8c800c80;
      8'h1a: base_pair = 32'h8d000d00;
      8'h1b: base_pair = 32'h8d800d80;
      8'h1c: base_pair = 32'h8e000e00;
      8'h1d: base_pair = 32'h8e800e80;
      8'h1e: base_pair = 32'h8f000f00;
      8'h1f: base_pair = 32'h8f800f80;
      8'h20: base_pair = 32'h90001000;
      8'h21: base_pair = 32'h90801080;
      8'h22: base_pair = 32'h91001100;
      8'h23: base_pair = 32'h91801180;
      8'h24: base_pair = 32'h92001200;
      8'h25: base_pair = 32'h92801280;
      8'h26: base_pair = 32'h93001300;
      8'h27: base_pair = 32'h93801380;
      8'h28: base_pair = 32'h94001400;
      8'h29: base_pair = 32'h94801480;
      8'h2a: base_pair = 32'h95001500;
      8'h2b: base_pair = 32'h95801580;
      8'h2c: base_pair = 32'h96001600;
      8'h2d: base_pair = 32'h96801680;
      8'h2e: base_pair = 32'h97001700;
      8'h2f: base_pair = 32'h97801780;
      8'h30: base_pair = 32'h98001800;
      8'h31: base_pair = 32'h98801880;
      8'h32: base_pair = 32'h99001900;
      8'h33: base_pair = 32'h99801980;
      8'h34: base_pair = 32'h9a001a00;
      8'h35: base_pair = 32'h9a801a80;
      8'h36: base_pair = 32'h9b001b00;
      8'h37: base_pair = 32'h9b801b80;
      8'h38: base_pair = 32'h9c001c00;
      8'h39: base_pair = 32'h9c801c80;
      8'h3a: base_pair = 32'h9d001d00;
      8'h3b: base_pair = 32'h9d801d80;
      8'h3c: base_pair = 32'h9e001e00;
      8'h3d: base_pair = 32'h9e801e80;
      8'h3e: base_pair = 32'h9f001f00;
      8'h3f: base_pair = 32'h9f801f80;
      8'h40: base_pair = 32'ha0002000;
      8'h41: base_pair = 32'ha0802080;
      8'h42: base_pair = 32'ha1002100;
      8'h43: base_pair = 32'ha1802180;
      8'h44: base_pair = 32'ha2002200;
      8'h45: base_pair = 32'ha2802280;
      8'h46: base_pair = 32'ha3002300;
      8'h47: base_pair = 32'ha3802380;
      8'h48: base_pair = 32'ha4002400;
      8'h49: base_pair = 32'ha4802480;
      8'h4a: base_pair = 32'ha5002500;
      8'h4b: base_pair = 32'ha5802580;
      8'h4c: base_pair = 32'ha6002600;
      8'h4d: base_pair = 32'ha6802680;
      8'h4e: base_pair = 32'ha7002700;
      8'h4f: base_pair = 32'ha7802780;
      8'h50: base_pair = 32'ha8002800;
      8'h51: base_pair = 32'ha8802880;
      8'h52: base_pair = 32'ha9002900;
      8'h53: base_pair = 32'ha9802980;
      8'h54: base_pair = 32'haa002a00;
      8'h55: base_pair = 32'haa802a80;
      8'h56: base_pair = 32'hab002b00;
      8'h57: base_pair = 32'hab802b80;
      8'h58: base_pair = 32'hac002c00;
      8'h59: base_pair = 32'hac802c80;
      8'h5a: base_pair = 32'had002d00;
      8'h5b: base_pair = 32'had802d80;
      8'h5c: base_pair = 32'hae002e00;
      8'h5d: base_pair = 32'hae802e80;
      8'h5e: base_pair = 32'haf002f00;
      8'h5f: base_pair = 32'haf802f80;
      8'h60: base_pair = 32'hb0003000;
      8'h61: base_pair = 32'hb0803080;
      8'h62: base_pair = 32'hb1003100;
      8'h63: base_pair = 32'hb1803180;
      8'h64: base_pair = 32'hb2003200;
      8'h65: base_pair = 32'hb2803280;
      8'h66: base_pair = 32'hb3003300;
      8'h67: base_pair = 32'hb3803380;
      8'h68: base_pair = 32'hb4003400;
      8'h69: base_pair = 32'hb4803480;
      8'h6a: base_pair = 32'hb5003500;
      8'h6b: base_pair = 32'hb5803580;
      8'h6c: base_pair = 32'hb6003600;
      8'h6d: base_pair = 32'hb6803680;
      8'h6e: base_pair = 32'hb7003700;
      8'h6f: base_pair = 32'hb7803780;
      8'h70: base_pair = 32'hb8003800;
      8'h71: base_pair = 32'hb8803880;
      8'h72: base_pair = 32'hb9003900;
      8'h73: base_pair = 32'hb9803980;
      8'h74: base_pair = 32'hba003a00;
      8'h75: base_pair = 32'hba803a80;
      8'h76: base_pair = 32'hbb003b00;
      8'h77: base_pair = 32'hbb803b80;
      8'h78: base_pair = 32'hbc003c00;
      8'h79: base_pair = 32'hbc803c80;
      8'h7a: base_pair = 32'hbd003d00;
      8'h7b: base_pair = 32'hbd803d80;
      8'h7c: base_pair = 32'hbdff3dff;
      8'h7d: base_pair = 32'hbe7b3e7b;
      8'h7e: base_pair = 32'hbeed3eed;
      8'h7f: base_pair = 32'hbf433f43;
      8'h80: base_pair = 32'hbf773f77;
      8'h81: base_pair = 32'hbf803f80;
      8'h82: base_pair = 32'hbf803f80;
      8'h83: base_pair = 32'hbf803f80;
      8'h84: base_pair = 32'hbf803f80;
      8'h85: base_pair = 32'hbf803f80;
      8'h86: base_pair = 32'hbf803f80;
      8'h87: base_pair = 32'hbf803f80;
      8'h88: base_pair = 32'hbf803f80;
      8'h89: base_pair = 32'hbf803f80;
      8'h8a: base_pair = 32'hbf803f80;
      8'h8b: base_pair = 32'hbf803f80;
      8'h8c: base_pair = 32'hbf803f80;
      8'h8d: base_pair = 32'hbf803f80;
      8'h8e: base_pair = 32'hbf803f80;
      8'h8f: base_pair = 32'hbf803f80;
      8'h90: base_pair = 32'hbf803f80;
      8'h91: base_pair = 32'hbf803f80;
      8'h92: base_pair = 32'hbf803f80;
      8'h93: base_pair = 32'hbf803f80;
      8'h94: base_pair = 32'hbf803f80;
      8'h95: base_pair = 32'hbf803f80;
      8'h96: base_pair = 32'hbf803f80;
      8'h97: base_pair = 32'hbf803f80;
      8'h98: base_pair = 32'hbf803f80;
      8'h99: base_pair = 32'hbf803f80;
      8'h9a: base_pair = 32'hbf803f80;
      8'h9b: base_pair = 32'hbf803f80;
      8'h9c: base_pair = 32'hbf803f80;
      8'h9d: base_pair = 32'hbf803f80;
      8'h9e: base_pair = 32'hbf803f80;
      8'h9f: base_pair = 32'hbf803f80;
      8'ha0: base_pair = 32'hbf803f80;
      8'ha1: base_pair = 32'hbf803f80;
      8'ha2: base_pair = 32'hbf803f80;
      8'ha3: base_pair = 32'hbf803f80;
      8'ha4: base_pair = 32'hbf803f80;
      8'ha5: base_pair = 32'hbf803f80;
      8'ha6: base_pair = 32'hbf803f80;
      8'ha7: base_pair = 32'hbf803f80;
      8'ha8: base_pair = 32'hbf803f80;
      8'ha9: base_pair = 32'hbf803f80;
      8'haa: base_pair = 32'hbf803f80;
      8'hab: base_pair = 32'hbf803f80;
      8'hac: base_pair = 32'hbf803f80;
      8'had: base_pair = 32'hbf803f80;
      8'hae: base_pair = 32'hbf803f80;
      8'haf: base_pair = 32'hbf803f80;
      8'hb0: base_pair = 32'hbf803f80;
      8'hb1: base_pair = 32'hbf803f80;
      8'hb2: base_pair = 32'hbf803f80;
      8'hb3: base_pair = 32'hbf803f80;
      8'hb4: base_pair = 32'hbf803f80;
      8'hb5: base_pair = 32'hbf803f80;
      8'hb6: base_pair = 32'hbf803f80;
      8'hb7: base_pair = 32'hbf803f80;
      8'hb8: base_pair = 32'hbf803f80;
      8'hb9: base_pair = 32'hbf803f80;
      8'hba: base_pair = 32'hbf803f80;
      8'hbb: base_pair = 32'hbf803f80;
      8'hbc: base_pair = 32'hbf803f80;
      8'hbd: base_pair = 32'hbf803f80;
      8'hbe: base_pair = 32'hbf803f80;
      8'hbf: base_pair = 32'hbf803f80;
      8'hc0: base_pair = 32'hbf803f80;
      8'hc1: base_pair = 32'hbf803f80;
      8'hc2: base_pair = 32'hbf803f80;
      8'hc3: base_pair = 32'hbf803f80;
      8'hc4: base_pair = 32'hbf803f80;
      8'hc5: base_pair = 32'hbf803f80;
      8'hc6: base_pair = 32'hbf803f80;
      8'hc7: base_pair = 32'hbf803f80;
      8'hc8: base_pair = 32'hbf803f80;
      8'hc9: base_pair = 32'hbf803f80;
      8'hca: base_pair = 32'hbf803f80;
      8'hcb: base_pair = 32'hbf803f80;
      8'hcc: base_pair = 32'hbf803f80;
      8'hcd: base_pair = 32'hbf803f80;
      8'hce: base_pair = 32'hbf803f80;
      8'hcf: base_pair = 32'hbf803f80;
      8'hd0: base_pair = 32'hbf803f80;
      8'hd1: base_pair = 32'hbf803f80;
      8'hd2: base_pair = 32'hbf803f80;
      8'hd3: base_pair = 32'hbf803f80;
      8'hd4: base_pair = 32'hbf803f80;
      8'hd5: base_pair = 32'hbf803f80;
      8'hd6: base_pair = 32'hbf803f80;
      8'hd7: base_pair = 32'hbf803f80;
      8'hd8: base_pair = 32'hbf803f80;
      8'hd9: base_pair = 32'hbf803f80;
      8'hda: base_pair = 32'hbf803f80;
      8'hdb: base_pair = 32'hbf803f80;
      8'hdc: base_pair = 32'hbf803f80;
      8'hdd: base_pair = 32'hbf803f80;
      8'hde: base_pair = 32'hbf803f80;
      8'hdf: base_pair = 32'hbf803f80;
      8'he0: base_pair = 32'hbf803f80;
      8'he1: base_pair = 32'hbf803f80;
      8'he2: base_pair = 32'hbf803f80;
      8'he3: base_pair = 32'hbf803f80;
      8'he4: base_pair = 32'hbf803f80;
      8'he5: base_pair = 32'hbf803f80;
      8'he6: base_pair = 32'hbf803f80;
      8'he7: base_pair = 32'hbf803f80;
      8'he8: base_pair = 32'hbf803f80;
      8'he9: base_pair = 32'hbf803f80;
      8'hea: base_pair = 32'hbf803f80;
      8'heb: base_pair = 32'hbf803f80;
      8'hec: base_pair = 32'hbf803f80;
      8'hed: base_pair = 32'hbf803f80;
      8'hee: base_pair = 32'hbf803f80;
      8'hef: base_pair = 32'hbf803f80;
      8'hf0: base_pair = 32'hbf803f80;
      8'hf1: base_pair = 32'hbf803f80;
      8'hf2: base_pair = 32'hbf803f80;
      8'hf3: base_pair = 32'hbf803f80;
      8'hf4: base_pair = 32'hbf803f80;
      8'hf5: base_pair = 32'hbf803f80;
      8'hf6: base_pair = 32'hbf803f80;
      8'hf7: base_pair = 32'hbf803f80;
      8'hf8: base_pair = 32'hbf803f80;
      8'hf9: base_pair = 32'hbf803f80;
      8'hfa: base_pair = 32'hbf803f80;
      8'hfb: base_pair = 32'hbf803f80;
      8'hfc: base_pair = 32'hbf803f80;
      8'hfd: base_pair = 32'hbf803f80;
      8'hfe: base_pair = 32'hbf803f80;
      8'hff: base_pair = 32'hbf803f80;
      default: base_pair = 32'h00000000;
    endcase
  end
  always @* begin
    delta_pair = 32'h00000000;
    case (exp)
      8'h01: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h02: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h03: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h04: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h05: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h06: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h07: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h08: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h09: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h0a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h0b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h0c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h0d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h0e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h0f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h10: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h11: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h12: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h13: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h14: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h15: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h16: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h17: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h18: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h19: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h1a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h1b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h1c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h1d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h1e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h1f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h20: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h21: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h22: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h23: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h24: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h25: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h26: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h27: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h28: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h29: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h2a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h2b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h2c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h2d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h2e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h2f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h30: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h31: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h32: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h33: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h34: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h35: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h36: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h37: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h38: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h39: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h3a: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h3b: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h3c: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h3d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h3e: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h3f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h40: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00000000;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00380038;
              4'h9: delta_pair = 32'h00390039;
              4'ha: delta_pair = 32'h003a003a;
              4'hb: delta_pair = 32'h003b003b;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003e003e;
              4'hf: delta_pair = 32'h003f003f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00400040;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00410041;
              4'h2: delta_pair = 32'h00420042;
              4'h3: delta_pair = 32'h00430043;
              4'h4: delta_pair = 32'h00440044;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h00460046;
              4'h7: delta_pair = 32'h00470047;
              4'h8: delta_pair = 32'h00480048;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h004a004a;
              4'hb: delta_pair = 32'h004b004b;
              4'hc: delta_pair = 32'h004c004c;
              4'hd: delta_pair = 32'h004d004d;
              4'he: delta_pair = 32'h004e004e;
              4'hf: delta_pair = 32'h004f004f;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00500050;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00520052;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h00540054;
              4'h5: delta_pair = 32'h00550055;
              4'h6: delta_pair = 32'h00560056;
              4'h7: delta_pair = 32'h00570057;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h00590059;
              4'ha: delta_pair = 32'h005a005a;
              4'hb: delta_pair = 32'h005b005b;
              4'hc: delta_pair = 32'h005c005c;
              4'hd: delta_pair = 32'h005d005d;
              4'he: delta_pair = 32'h005e005e;
              4'hf: delta_pair = 32'h005f005f;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00600060;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00610061;
              4'h2: delta_pair = 32'h00620062;
              4'h3: delta_pair = 32'h00630063;
              4'h4: delta_pair = 32'h00640064;
              4'h5: delta_pair = 32'h00650065;
              4'h6: delta_pair = 32'h00660066;
              4'h7: delta_pair = 32'h00670067;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h00690069;
              4'ha: delta_pair = 32'h006a006a;
              4'hb: delta_pair = 32'h006b006b;
              4'hc: delta_pair = 32'h006c006c;
              4'hd: delta_pair = 32'h006d006d;
              4'he: delta_pair = 32'h006e006e;
              4'hf: delta_pair = 32'h006f006f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00700070;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00710071;
              4'h2: delta_pair = 32'h00720072;
              4'h3: delta_pair = 32'h00730073;
              4'h4: delta_pair = 32'h00740074;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h00760076;
              4'h7: delta_pair = 32'h00770077;
              4'h8: delta_pair = 32'h00780078;
              4'h9: delta_pair = 32'h00790079;
              4'ha: delta_pair = 32'h007a007a;
              4'hb: delta_pair = 32'h007b007b;
              4'hc: delta_pair = 32'h007c007c;
              4'hd: delta_pair = 32'h007d007d;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h007f007f;
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
              4'h1: delta_pair = 32'h00010001;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00030003;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00050005;
              4'h6: delta_pair = 32'h00060006;
              4'h7: delta_pair = 32'h00070007;
              4'h8: delta_pair = 32'h00080008;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h000a000a;
              4'hb: delta_pair = 32'h000b000b;
              4'hc: delta_pair = 32'h000c000c;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000e000e;
              4'hf: delta_pair = 32'h000f000f;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00100010;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00110011;
              4'h2: delta_pair = 32'h00120012;
              4'h3: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00140014;
              4'h5: delta_pair = 32'h00150015;
              4'h6: delta_pair = 32'h00160016;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00180018;
              4'h9: delta_pair = 32'h00190019;
              4'ha: delta_pair = 32'h001a001a;
              4'hb: delta_pair = 32'h001b001b;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h001d001d;
              4'he: delta_pair = 32'h001e001e;
              4'hf: delta_pair = 32'h001f001f;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00230023;
              4'h4: delta_pair = 32'h00240024;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h00260026;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00290029;
              4'ha: delta_pair = 32'h002a002a;
              4'hb: delta_pair = 32'h002b002b;
              4'hc: delta_pair = 32'h002c002c;
              4'hd: delta_pair = 32'h002d002d;
              4'he: delta_pair = 32'h002e002e;
              4'hf: delta_pair = 32'h002f002f;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00380038;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00300030;
              4'h1: delta_pair = 32'h00310031;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00330033;
              4'h4: delta_pair = 32'h00340034;
              4'h5: delta_pair = 32'h00350035;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'ha: delta_pair = 32'h00390039;
              4'hb: delta_pair = 32'h003a003a;
              4'hc: delta_pair = 32'h003b003b;
              4'hd: delta_pair = 32'h003c003c;
              4'he: delta_pair = 32'h003d003d;
              4'hf: delta_pair = 32'h003e003e;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h003f003f;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00400040;
              4'h2: delta_pair = 32'h00410041;
              4'h3: delta_pair = 32'h00420042;
              4'h4: delta_pair = 32'h00430043;
              4'h5: delta_pair = 32'h00440044;
              4'h6: delta_pair = 32'h00450045;
              4'h7: delta_pair = 32'h00460046;
              4'h8: delta_pair = 32'h00470047;
              4'h9: delta_pair = 32'h00480048;
              4'ha: delta_pair = 32'h00490049;
              4'hb: delta_pair = 32'h004a004a;
              4'hc: delta_pair = 32'h004b004b;
              4'hd: delta_pair = 32'h004c004c;
              4'he: delta_pair = 32'h004d004d;
              4'hf: delta_pair = 32'h004e004e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h004f004f;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00500050;
              4'h2: delta_pair = 32'h00510051;
              4'h3: delta_pair = 32'h00520052;
              4'h4: delta_pair = 32'h00530053;
              4'h5: delta_pair = 32'h00540054;
              4'h6: delta_pair = 32'h00550055;
              4'h7: delta_pair = 32'h00560056;
              4'h8: delta_pair = 32'h00570057;
              4'h9: delta_pair = 32'h00580058;
              4'ha: delta_pair = 32'h00590059;
              4'hb: delta_pair = 32'h005a005a;
              4'hc: delta_pair = 32'h005b005b;
              4'hd: delta_pair = 32'h005c005c;
              4'he: delta_pair = 32'h005d005d;
              4'hf: delta_pair = 32'h005e005e;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h005f005f;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00600060;
              4'h2: delta_pair = 32'h00610061;
              4'h3: delta_pair = 32'h00620062;
              4'h4: delta_pair = 32'h00630063;
              4'h5: delta_pair = 32'h00640064;
              4'h6: delta_pair = 32'h00650065;
              4'h7: delta_pair = 32'h00660066;
              4'h8: delta_pair = 32'h00670067;
              4'h9: delta_pair = 32'h00680068;
              4'ha: delta_pair = 32'h00690069;
              4'hb: delta_pair = 32'h006a006a;
              4'hc: delta_pair = 32'h006b006b;
              4'hd: delta_pair = 32'h006c006c;
              4'he: delta_pair = 32'h006d006d;
              4'hf: delta_pair = 32'h006e006e;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h006f006f;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00700070;
              4'h2: delta_pair = 32'h00710071;
              4'h3: delta_pair = 32'h00720072;
              4'h4: delta_pair = 32'h00730073;
              4'h5: delta_pair = 32'h00740074;
              4'h6: delta_pair = 32'h00750075;
              4'h7: delta_pair = 32'h00760076;
              4'h8: delta_pair = 32'h00770077;
              4'h9: delta_pair = 32'h00780078;
              4'ha: delta_pair = 32'h00790079;
              4'hb: delta_pair = 32'h007a007a;
              4'hc: delta_pair = 32'h007b007b;
              4'hd: delta_pair = 32'h007c007c;
              4'he: delta_pair = 32'h007d007d;
              4'hf: delta_pair = 32'h007e007e;
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
              4'h1: delta_pair = 32'h03ff03ff;
              4'h2: delta_pair = 32'h03fe03fe;
              4'h3: delta_pair = 32'h03fd03fd;
              4'h4: delta_pair = 32'h03fc03fc;
              4'h5: delta_pair = 32'h03fb03fb;
              4'h6: delta_pair = 32'h03fa03fa;
              4'h7: delta_pair = 32'h03f903f9;
              4'h8: delta_pair = 32'h03f803f8;
              4'h9: delta_pair = 32'h03f703f7;
              4'ha: delta_pair = 32'h03f603f6;
              4'hb: delta_pair = 32'h03f503f5;
              4'hc: delta_pair = 32'h03f403f4;
              4'hd: delta_pair = 32'h03f303f3;
              4'he: delta_pair = 32'h03f203f2;
              4'hf: delta_pair = 32'h03f103f1;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h03f003f0;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03ef03ef;
              4'h2: delta_pair = 32'h03ee03ee;
              4'h3: delta_pair = 32'h03ed03ed;
              4'h4: delta_pair = 32'h03ec03ec;
              4'h5: delta_pair = 32'h03eb03eb;
              4'h6: delta_pair = 32'h03ea03ea;
              4'h7: delta_pair = 32'h03e903e9;
              4'h8: delta_pair = 32'h03e803e8;
              4'h9: delta_pair = 32'h03e703e7;
              4'ha: delta_pair = 32'h03e603e6;
              4'hb: delta_pair = 32'h03e503e5;
              4'hc: delta_pair = 32'h03e403e4;
              4'hd: delta_pair = 32'h03e303e3;
              4'he: delta_pair = 32'h03e203e2;
              4'hf: delta_pair = 32'h03e103e1;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h03d803d8;
            case (mant_lo4)
              4'h0: delta_pair = 32'h03e003e0;
              4'h1: delta_pair = 32'h03df03df;
              4'h2: delta_pair = 32'h03de03de;
              4'h3: delta_pair = 32'h03dd03dd;
              4'h4: delta_pair = 32'h03dc03dc;
              4'h5: delta_pair = 32'h03db03db;
              4'h6: delta_pair = 32'h03da03da;
              4'h7: delta_pair = 32'h03d903d9;
              4'ha: delta_pair = 32'h03d703d7;
              4'hb: delta_pair = 32'h03d603d6;
              4'hc: delta_pair = 32'h03d503d5;
              4'hd: delta_pair = 32'h03d403d4;
              4'he: delta_pair = 32'h03d303d3;
              4'hf: delta_pair = 32'h03d203d2;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h03d103d1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03d003d0;
              4'h2: delta_pair = 32'h03cf03cf;
              4'h3: delta_pair = 32'h03ce03ce;
              4'h4: delta_pair = 32'h03cd03cd;
              4'h5: delta_pair = 32'h03cc03cc;
              4'h6: delta_pair = 32'h03cb03cb;
              4'h7: delta_pair = 32'h03ca03ca;
              4'h8: delta_pair = 32'h03c903c9;
              4'h9: delta_pair = 32'h03c803c8;
              4'ha: delta_pair = 32'h03c703c7;
              4'hb: delta_pair = 32'h03c603c6;
              4'hc: delta_pair = 32'h03c503c5;
              4'hd: delta_pair = 32'h03c403c4;
              4'he: delta_pair = 32'h03c303c3;
              4'hf: delta_pair = 32'h03c203c2;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03ba03ba;
            case (mant_lo4)
              4'h0: delta_pair = 32'h03c103c1;
              4'h1: delta_pair = 32'h03c003c0;
              4'h2: delta_pair = 32'h03bf03bf;
              4'h3: delta_pair = 32'h03be03be;
              4'h4: delta_pair = 32'h03bd03bd;
              4'h5: delta_pair = 32'h03bc03bc;
              4'h6: delta_pair = 32'h03bb03bb;
              4'h9: delta_pair = 32'h03b903b9;
              4'ha: delta_pair = 32'h03b803b8;
              4'hb: delta_pair = 32'h03b703b7;
              4'hc: delta_pair = 32'h03b603b6;
              4'hd: delta_pair = 32'h03b503b5;
              4'he: delta_pair = 32'h03b403b4;
              4'hf: delta_pair = 32'h03b303b3;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h03b203b2;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03b103b1;
              4'h2: delta_pair = 32'h03b003b0;
              4'h3: delta_pair = 32'h03af03af;
              4'h4: delta_pair = 32'h03ae03ae;
              4'h5: delta_pair = 32'h03ad03ad;
              4'h6: delta_pair = 32'h03ac03ac;
              4'h7: delta_pair = 32'h03ab03ab;
              4'h8: delta_pair = 32'h03aa03aa;
              4'h9: delta_pair = 32'h03a903a9;
              4'ha: delta_pair = 32'h03a803a8;
              4'hb: delta_pair = 32'h03a703a7;
              4'hc: delta_pair = 32'h03a603a6;
              4'hd: delta_pair = 32'h03a503a5;
              4'he: delta_pair = 32'h03a403a4;
              4'hf: delta_pair = 32'h03a303a3;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h03a303a3;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03a203a2;
              4'h2: delta_pair = 32'h03a103a1;
              4'h3: delta_pair = 32'h03a003a0;
              4'h4: delta_pair = 32'h039f039f;
              4'h5: delta_pair = 32'h039e039e;
              4'h6: delta_pair = 32'h039d039d;
              4'h7: delta_pair = 32'h039c039c;
              4'h8: delta_pair = 32'h039b039b;
              4'h9: delta_pair = 32'h039a039a;
              4'ha: delta_pair = 32'h03990399;
              4'hb: delta_pair = 32'h03980398;
              4'hc: delta_pair = 32'h03970397;
              4'hd: delta_pair = 32'h03960396;
              4'he: delta_pair = 32'h03950395;
              4'hf: delta_pair = 32'h03940394;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h03900390;
            case (mant_lo4)
              4'h0: delta_pair = 32'h03930393;
              4'h1: delta_pair = 32'h03920392;
              4'h2: delta_pair = 32'h03910391;
              4'h5: delta_pair = 32'h038f038f;
              4'h6: delta_pair = 32'h038e038e;
              4'h7: delta_pair = 32'h038d038d;
              4'h8: delta_pair = 32'h038c038c;
              4'h9: delta_pair = 32'h038b038b;
              4'ha: delta_pair = 32'h038a038a;
              4'hb: delta_pair = 32'h03890389;
              4'hc: delta_pair = 32'h03880388;
              4'hd: delta_pair = 32'h03870387;
              4'he: delta_pair = 32'h03860386;
              4'hf: delta_pair = 32'h03850385;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7d: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00f100f1;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00060006;
              4'h2: delta_pair = 32'h00040004;
              4'h3: delta_pair = 32'h00fb00fb;
              4'h4: delta_pair = 32'h00fa00fa;
              4'h5: delta_pair = 32'h00f900f9;
              4'h6: delta_pair = 32'h00f800f8;
              4'h7: delta_pair = 32'h00ff00ff;
              4'h8: delta_pair = 32'h00fe00fe;
              4'h9: delta_pair = 32'h00fd00fd;
              4'ha: delta_pair = 32'h00fc00fc;
              4'hb: delta_pair = 32'h00f300f3;
              4'hc: delta_pair = 32'h00f200f2;
              4'hf: delta_pair = 32'h00f000f0;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00ed00ed;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00f700f7;
              4'h1: delta_pair = 32'h00f600f6;
              4'h2: delta_pair = 32'h00f500f5;
              4'h3: delta_pair = 32'h00f400f4;
              4'h4: delta_pair = 32'h00eb00eb;
              4'h5: delta_pair = 32'h00ea00ea;
              4'h6: delta_pair = 32'h00e900e9;
              4'h7: delta_pair = 32'h00e800e8;
              4'h8: delta_pair = 32'h00ef00ef;
              4'h9: delta_pair = 32'h00ee00ee;
              4'hc: delta_pair = 32'h00ec00ec;
              4'hd: delta_pair = 32'h00e300e3;
              4'he: delta_pair = 32'h00e200e2;
              4'hf: delta_pair = 32'h00e100e1;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00db00db;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00e000e0;
              4'h1: delta_pair = 32'h00e700e7;
              4'h2: delta_pair = 32'h00e600e6;
              4'h3: delta_pair = 32'h00e500e5;
              4'h4: delta_pair = 32'h00e400e4;
              4'h7: delta_pair = 32'h00da00da;
              4'h8: delta_pair = 32'h00d900d9;
              4'h9: delta_pair = 32'h00d800d8;
              4'ha: delta_pair = 32'h00df00df;
              4'hb: delta_pair = 32'h00de00de;
              4'hc: delta_pair = 32'h00dd00dd;
              4'hd: delta_pair = 32'h00dc00dc;
              4'he: delta_pair = 32'h00d300d3;
              4'hf: delta_pair = 32'h00d300d3;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00cb00cb;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00d200d2;
              4'h1: delta_pair = 32'h00d100d1;
              4'h2: delta_pair = 32'h00d000d0;
              4'h3: delta_pair = 32'h00d700d7;
              4'h4: delta_pair = 32'h00d600d6;
              4'h5: delta_pair = 32'h00d500d5;
              4'h6: delta_pair = 32'h00d400d4;
              4'h9: delta_pair = 32'h00ca00ca;
              4'ha: delta_pair = 32'h00c900c9;
              4'hb: delta_pair = 32'h00c800c8;
              4'hc: delta_pair = 32'h00cf00cf;
              4'hd: delta_pair = 32'h00ce00ce;
              4'he: delta_pair = 32'h00cd00cd;
              4'hf: delta_pair = 32'h00cc00cc;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00c500c5;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00cc00cc;
              4'h1: delta_pair = 32'h00c300c3;
              4'h2: delta_pair = 32'h00c200c2;
              4'h3: delta_pair = 32'h00c100c1;
              4'h4: delta_pair = 32'h00c000c0;
              4'h5: delta_pair = 32'h00c700c7;
              4'h6: delta_pair = 32'h00c600c6;
              4'h9: delta_pair = 32'h00c400c4;
              4'ha: delta_pair = 32'h00bb00bb;
              4'hb: delta_pair = 32'h00ba00ba;
              4'hc: delta_pair = 32'h00b900b9;
              4'hd: delta_pair = 32'h00b800b8;
              4'he: delta_pair = 32'h00bf00bf;
              4'hf: delta_pair = 32'h00bf00bf;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00b100b1;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00be00be;
              4'h1: delta_pair = 32'h00bd00bd;
              4'h2: delta_pair = 32'h00bc00bc;
              4'h3: delta_pair = 32'h00b300b3;
              4'h4: delta_pair = 32'h00b200b2;
              4'h7: delta_pair = 32'h00b000b0;
              4'h8: delta_pair = 32'h00b700b7;
              4'h9: delta_pair = 32'h00b600b6;
              4'ha: delta_pair = 32'h00b500b5;
              4'hb: delta_pair = 32'h00b400b4;
              4'hc: delta_pair = 32'h00b400b4;
              4'hd: delta_pair = 32'h00ab00ab;
              4'he: delta_pair = 32'h00aa00aa;
              4'hf: delta_pair = 32'h00a900a9;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00af00af;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00a800a8;
              4'h3: delta_pair = 32'h00ae00ae;
              4'h4: delta_pair = 32'h00ad00ad;
              4'h5: delta_pair = 32'h00ac00ac;
              4'h6: delta_pair = 32'h00a300a3;
              4'h7: delta_pair = 32'h00a200a2;
              4'h8: delta_pair = 32'h00a200a2;
              4'h9: delta_pair = 32'h00a100a1;
              4'ha: delta_pair = 32'h00a000a0;
              4'hb: delta_pair = 32'h00a700a7;
              4'hc: delta_pair = 32'h00a600a6;
              4'hd: delta_pair = 32'h00a600a6;
              4'he: delta_pair = 32'h00a500a5;
              4'hf: delta_pair = 32'h00a400a4;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h009a009a;
            case (mant_lo4)
              4'h0: delta_pair = 32'h009b009b;
              4'h3: delta_pair = 32'h00990099;
              4'h4: delta_pair = 32'h00980098;
              4'h5: delta_pair = 32'h009f009f;
              4'h6: delta_pair = 32'h009e009e;
              4'h7: delta_pair = 32'h009e009e;
              4'h8: delta_pair = 32'h009d009d;
              4'h9: delta_pair = 32'h009c009c;
              4'ha: delta_pair = 32'h00930093;
              4'hb: delta_pair = 32'h00920092;
              4'hc: delta_pair = 32'h00920092;
              4'hd: delta_pair = 32'h00910091;
              4'he: delta_pair = 32'h00900090;
              4'hf: delta_pair = 32'h00970097;
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
              4'h1: delta_pair = 32'h00030003;
              4'h2: delta_pair = 32'h001d001d;
              4'h3: delta_pair = 32'h001c001c;
              4'h4: delta_pair = 32'h001e001e;
              4'h5: delta_pair = 32'h00190019;
              4'h6: delta_pair = 32'h001b001b;
              4'h7: delta_pair = 32'h001a001a;
              4'h8: delta_pair = 32'h00140014;
              4'h9: delta_pair = 32'h00160016;
              4'ha: delta_pair = 32'h00110011;
              4'hb: delta_pair = 32'h00130013;
              4'hc: delta_pair = 32'h00120012;
              4'hd: delta_pair = 32'h01ed01ed;
              4'he: delta_pair = 32'h01ec01ec;
              4'hf: delta_pair = 32'h01ef01ef;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h01ee01ee;
            case (mant_lo4)
              4'h2: delta_pair = 32'h01e901e9;
              4'h3: delta_pair = 32'h01e801e8;
              4'h4: delta_pair = 32'h01e801e8;
              4'h5: delta_pair = 32'h01eb01eb;
              4'h6: delta_pair = 32'h01ea01ea;
              4'h7: delta_pair = 32'h01e501e5;
              4'h8: delta_pair = 32'h01e501e5;
              4'h9: delta_pair = 32'h01e401e4;
              4'ha: delta_pair = 32'h01e701e7;
              4'hb: delta_pair = 32'h01e701e7;
              4'hc: delta_pair = 32'h01e601e6;
              4'hd: delta_pair = 32'h01e101e1;
              4'he: delta_pair = 32'h01e001e0;
              4'hf: delta_pair = 32'h01e001e0;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h01e201e2;
            case (mant_lo4)
              4'h0: delta_pair = 32'h01e301e3;
              4'h3: delta_pair = 32'h01fd01fd;
              4'h4: delta_pair = 32'h01fc01fc;
              4'h5: delta_pair = 32'h01fc01fc;
              4'h6: delta_pair = 32'h01ff01ff;
              4'h7: delta_pair = 32'h01fe01fe;
              4'h8: delta_pair = 32'h01fe01fe;
              4'h9: delta_pair = 32'h01f901f9;
              4'ha: delta_pair = 32'h01f801f8;
              4'hb: delta_pair = 32'h01f801f8;
              4'hc: delta_pair = 32'h01fb01fb;
              4'hd: delta_pair = 32'h01fa01fa;
              4'he: delta_pair = 32'h01fa01fa;
              4'hf: delta_pair = 32'h01f501f5;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h01f401f4;
            case (mant_lo4)
              4'h2: delta_pair = 32'h01f701f7;
              4'h3: delta_pair = 32'h01f601f6;
              4'h4: delta_pair = 32'h01f601f6;
              4'h5: delta_pair = 32'h01f101f1;
              4'h6: delta_pair = 32'h01f101f1;
              4'h7: delta_pair = 32'h01f001f0;
              4'h8: delta_pair = 32'h01f301f3;
              4'h9: delta_pair = 32'h01f301f3;
              4'ha: delta_pair = 32'h01f201f2;
              4'hb: delta_pair = 32'h01cd01cd;
              4'hc: delta_pair = 32'h01cd01cd;
              4'hd: delta_pair = 32'h01cc01cc;
              4'he: delta_pair = 32'h01cc01cc;
              4'hf: delta_pair = 32'h01cf01cf;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01ce01ce;
            case (mant_lo4)
              4'h2: delta_pair = 32'h01c901c9;
              4'h3: delta_pair = 32'h01c901c9;
              4'h4: delta_pair = 32'h01c801c8;
              4'h5: delta_pair = 32'h01cb01cb;
              4'h6: delta_pair = 32'h01cb01cb;
              4'h7: delta_pair = 32'h01ca01ca;
              4'h8: delta_pair = 32'h01ca01ca;
              4'h9: delta_pair = 32'h01c501c5;
              4'ha: delta_pair = 32'h01c501c5;
              4'hb: delta_pair = 32'h01c401c4;
              4'hc: delta_pair = 32'h01c701c7;
              4'hd: delta_pair = 32'h01c701c7;
              4'he: delta_pair = 32'h01c601c6;
              4'hf: delta_pair = 32'h01c601c6;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01c101c1;
            case (mant_lo4)
              4'h2: delta_pair = 32'h01c001c0;
              4'h3: delta_pair = 32'h01c001c0;
              4'h4: delta_pair = 32'h01c301c3;
              4'h5: delta_pair = 32'h01c301c3;
              4'h6: delta_pair = 32'h01c201c2;
              4'h7: delta_pair = 32'h01dd01dd;
              4'h8: delta_pair = 32'h01dd01dd;
              4'h9: delta_pair = 32'h01dc01dc;
              4'ha: delta_pair = 32'h01dc01dc;
              4'hb: delta_pair = 32'h01df01df;
              4'hc: delta_pair = 32'h01df01df;
              4'hd: delta_pair = 32'h01de01de;
              4'he: delta_pair = 32'h01de01de;
              4'hf: delta_pair = 32'h01d901d9;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01d601d6;
            case (mant_lo4)
              4'h0: delta_pair = 32'h01d901d9;
              4'h1: delta_pair = 32'h01d801d8;
              4'h2: delta_pair = 32'h01d801d8;
              4'h3: delta_pair = 32'h01db01db;
              4'h4: delta_pair = 32'h01db01db;
              4'h5: delta_pair = 32'h01da01da;
              4'h6: delta_pair = 32'h01da01da;
              4'h7: delta_pair = 32'h01d501d5;
              4'h8: delta_pair = 32'h01d501d5;
              4'h9: delta_pair = 32'h01d401d4;
              4'ha: delta_pair = 32'h01d401d4;
              4'hb: delta_pair = 32'h01d701d7;
              4'hc: delta_pair = 32'h01d701d7;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01ad01ad;
            case (mant_lo4)
              4'h0: delta_pair = 32'h01d101d1;
              4'h1: delta_pair = 32'h01d101d1;
              4'h2: delta_pair = 32'h01d001d0;
              4'h3: delta_pair = 32'h01d001d0;
              4'h4: delta_pair = 32'h01d301d3;
              4'h5: delta_pair = 32'h01d301d3;
              4'h6: delta_pair = 32'h01d201d2;
              4'h7: delta_pair = 32'h01d201d2;
              4'hb: delta_pair = 32'h01ac01ac;
              4'hc: delta_pair = 32'h01ac01ac;
              4'hd: delta_pair = 32'h01af01af;
              4'he: delta_pair = 32'h01af01af;
              4'hf: delta_pair = 32'h01ae01ae;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h7f: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h00060006;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00070007;
              4'h4: delta_pair = 32'h00050005;
              4'h5: delta_pair = 32'h00040004;
              4'h6: delta_pair = 32'h000b000b;
              4'h7: delta_pair = 32'h000a000a;
              4'h8: delta_pair = 32'h000a000a;
              4'h9: delta_pair = 32'h00090009;
              4'ha: delta_pair = 32'h00080008;
              4'hb: delta_pair = 32'h000f000f;
              4'hc: delta_pair = 32'h000f000f;
              4'hd: delta_pair = 32'h000e000e;
              4'he: delta_pair = 32'h000d000d;
              4'hf: delta_pair = 32'h000d000d;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00120012;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000c000c;
              4'h1: delta_pair = 32'h00130013;
              4'h4: delta_pair = 32'h00110011;
              4'h5: delta_pair = 32'h00100010;
              4'h6: delta_pair = 32'h00100010;
              4'h7: delta_pair = 32'h00170017;
              4'h8: delta_pair = 32'h00170017;
              4'h9: delta_pair = 32'h00160016;
              4'ha: delta_pair = 32'h00150015;
              4'hb: delta_pair = 32'h00150015;
              4'hc: delta_pair = 32'h00140014;
              4'hd: delta_pair = 32'h00140014;
              4'he: delta_pair = 32'h001b001b;
              4'hf: delta_pair = 32'h001a001a;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00190019;
            case (mant_lo4)
              4'h0: delta_pair = 32'h001a001a;
              4'h3: delta_pair = 32'h00180018;
              4'h4: delta_pair = 32'h00180018;
              4'h5: delta_pair = 32'h001f001f;
              4'h6: delta_pair = 32'h001f001f;
              4'h7: delta_pair = 32'h001e001e;
              4'h8: delta_pair = 32'h001e001e;
              4'h9: delta_pair = 32'h001d001d;
              4'ha: delta_pair = 32'h001d001d;
              4'hb: delta_pair = 32'h001c001c;
              4'hc: delta_pair = 32'h001c001c;
              4'hd: delta_pair = 32'h00230023;
              4'he: delta_pair = 32'h00230023;
              4'hf: delta_pair = 32'h00220022;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00200020;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00220022;
              4'h1: delta_pair = 32'h00210021;
              4'h2: delta_pair = 32'h00210021;
              4'h6: delta_pair = 32'h00270027;
              4'h7: delta_pair = 32'h00270027;
              4'h8: delta_pair = 32'h00260026;
              4'h9: delta_pair = 32'h00260026;
              4'ha: delta_pair = 32'h00260026;
              4'hb: delta_pair = 32'h00250025;
              4'hc: delta_pair = 32'h00250025;
              4'hd: delta_pair = 32'h00240024;
              4'he: delta_pair = 32'h00240024;
              4'hf: delta_pair = 32'h00240024;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h002b002b;
            case (mant_lo4)
              4'h3: delta_pair = 32'h002a002a;
              4'h4: delta_pair = 32'h002a002a;
              4'h5: delta_pair = 32'h002a002a;
              4'h6: delta_pair = 32'h00290029;
              4'h7: delta_pair = 32'h00290029;
              4'h8: delta_pair = 32'h00290029;
              4'h9: delta_pair = 32'h00280028;
              4'ha: delta_pair = 32'h00280028;
              4'hb: delta_pair = 32'h00280028;
              4'hc: delta_pair = 32'h002f002f;
              4'hd: delta_pair = 32'h002f002f;
              4'he: delta_pair = 32'h002f002f;
              4'hf: delta_pair = 32'h002e002e;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h002c002c;
            case (mant_lo4)
              4'h0: delta_pair = 32'h002e002e;
              4'h1: delta_pair = 32'h002e002e;
              4'h2: delta_pair = 32'h002e002e;
              4'h3: delta_pair = 32'h002d002d;
              4'h4: delta_pair = 32'h002d002d;
              4'h5: delta_pair = 32'h002d002d;
              4'ha: delta_pair = 32'h00330033;
              4'hb: delta_pair = 32'h00330033;
              4'hc: delta_pair = 32'h00330033;
              4'hd: delta_pair = 32'h00330033;
              4'he: delta_pair = 32'h00320032;
              4'hf: delta_pair = 32'h00320032;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00300030;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00320032;
              4'h1: delta_pair = 32'h00320032;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h00310031;
              4'h4: delta_pair = 32'h00310031;
              4'h5: delta_pair = 32'h00310031;
              4'h6: delta_pair = 32'h00310031;
              4'hd: delta_pair = 32'h00370037;
              4'he: delta_pair = 32'h00370037;
              4'hf: delta_pair = 32'h00370037;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00360036;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00370037;
              4'h1: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00350035;
              4'h9: delta_pair = 32'h00350035;
              4'ha: delta_pair = 32'h00350035;
              4'hb: delta_pair = 32'h00350035;
              4'hc: delta_pair = 32'h00350035;
              4'hd: delta_pair = 32'h00350035;
              4'he: delta_pair = 32'h00340034;
              4'hf: delta_pair = 32'h00340034;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      8'h80: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h000e000e;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              4'h1: delta_pair = 32'h00000000;
              4'h2: delta_pair = 32'h00000000;
              4'h3: delta_pair = 32'h000f000f;
              4'h4: delta_pair = 32'h000f000f;
              4'h5: delta_pair = 32'h000f000f;
              4'h6: delta_pair = 32'h000f000f;
              4'hc: delta_pair = 32'h000d000d;
              4'hd: delta_pair = 32'h000d000d;
              4'he: delta_pair = 32'h000d000d;
              4'hf: delta_pair = 32'h000d000d;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h000b000b;
            case (mant_lo4)
              4'h0: delta_pair = 32'h000d000d;
              4'h1: delta_pair = 32'h000c000c;
              4'h2: delta_pair = 32'h000c000c;
              4'h3: delta_pair = 32'h000c000c;
              4'h4: delta_pair = 32'h000c000c;
              4'h5: delta_pair = 32'h000c000c;
              4'h6: delta_pair = 32'h000c000c;
              4'h7: delta_pair = 32'h000c000c;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h000a000a;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00090009;
              4'hc: delta_pair = 32'h00090009;
              4'hd: delta_pair = 32'h00090009;
              4'he: delta_pair = 32'h00090009;
              4'hf: delta_pair = 32'h00090009;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00090009;
            case (mant_lo4)
              4'hb: delta_pair = 32'h00080008;
              4'hc: delta_pair = 32'h00080008;
              4'hd: delta_pair = 32'h00080008;
              4'he: delta_pair = 32'h00080008;
              4'hf: delta_pair = 32'h00080008;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00080008;
          end
          3'h5: begin
            delta_pair = 32'h00080008;
            case (mant_lo4)
              4'he: delta_pair = 32'h00f700f7;
              4'hf: delta_pair = 32'h00f700f7;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00f700f7;
          end
          3'h7: begin
            delta_pair = 32'h00f700f7;
          end
          default: begin end
        endcase
      end
      8'hff: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'hc0404040;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'hc0404040;
          end
          3'h2: begin
            delta_pair = 32'hc0404040;
          end
          3'h3: begin
            delta_pair = 32'hc0404040;
          end
          3'h4: begin
            delta_pair = 32'hc0404040;
          end
          3'h5: begin
            delta_pair = 32'hc0404040;
          end
          3'h6: begin
            delta_pair = 32'hc0404040;
          end
          3'h7: begin
            delta_pair = 32'hc0404040;
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
