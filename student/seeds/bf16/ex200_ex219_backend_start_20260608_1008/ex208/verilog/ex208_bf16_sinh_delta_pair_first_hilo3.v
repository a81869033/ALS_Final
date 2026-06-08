module ex208_bf16_sinh_delta_pair_first_hilo3(in, out);
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
      8'h7c: base_pair = 32'hbe003e00;
      8'h7d: base_pair = 32'hbe813e81;
      8'h7e: base_pair = 32'hbf053f05;
      8'h7f: base_pair = 32'hbf963f96;
      8'h80: base_pair = 32'hc0684068;
      8'h81: base_pair = 32'hc1da41da;
      8'h82: base_pair = 32'hc4ba44ba;
      8'h83: base_pair = 32'hca884a88;
      8'h84: base_pair = 32'hd6105610;
      8'h85: base_pair = 32'hed216d21;
      8'h86: base_pair = 32'hff807f80;
      8'h87: base_pair = 32'hff807f80;
      8'h88: base_pair = 32'hff807f80;
      8'h89: base_pair = 32'hff807f80;
      8'h8a: base_pair = 32'hff807f80;
      8'h8b: base_pair = 32'hff807f80;
      8'h8c: base_pair = 32'hff807f80;
      8'h8d: base_pair = 32'hff807f80;
      8'h8e: base_pair = 32'hff807f80;
      8'h8f: base_pair = 32'hff807f80;
      8'h90: base_pair = 32'hff807f80;
      8'h91: base_pair = 32'hff807f80;
      8'h92: base_pair = 32'hff807f80;
      8'h93: base_pair = 32'hff807f80;
      8'h94: base_pair = 32'hff807f80;
      8'h95: base_pair = 32'hff807f80;
      8'h96: base_pair = 32'hff807f80;
      8'h97: base_pair = 32'hff807f80;
      8'h98: base_pair = 32'hff807f80;
      8'h99: base_pair = 32'hff807f80;
      8'h9a: base_pair = 32'hff807f80;
      8'h9b: base_pair = 32'hff807f80;
      8'h9c: base_pair = 32'hff807f80;
      8'h9d: base_pair = 32'hff807f80;
      8'h9e: base_pair = 32'hff807f80;
      8'h9f: base_pair = 32'hff807f80;
      8'ha0: base_pair = 32'hff807f80;
      8'ha1: base_pair = 32'hff807f80;
      8'ha2: base_pair = 32'hff807f80;
      8'ha3: base_pair = 32'hff807f80;
      8'ha4: base_pair = 32'hff807f80;
      8'ha5: base_pair = 32'hff807f80;
      8'ha6: base_pair = 32'hff807f80;
      8'ha7: base_pair = 32'hff807f80;
      8'ha8: base_pair = 32'hff807f80;
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
      8'hff: base_pair = 32'hff807f80;
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
              4'h9: delta_pair = 32'h006a006a;
              4'ha: delta_pair = 32'h006b006b;
              4'hb: delta_pair = 32'h006c006c;
              4'hc: delta_pair = 32'h006d006d;
              4'hd: delta_pair = 32'h006e006e;
              4'he: delta_pair = 32'h006f006f;
              4'hf: delta_pair = 32'h00700070;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00710071;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00720072;
              4'h2: delta_pair = 32'h00730073;
              4'h3: delta_pair = 32'h00740074;
              4'h4: delta_pair = 32'h00750075;
              4'h5: delta_pair = 32'h00760076;
              4'h6: delta_pair = 32'h00770077;
              4'h7: delta_pair = 32'h00780078;
              4'h8: delta_pair = 32'h00790079;
              4'h9: delta_pair = 32'h007a007a;
              4'ha: delta_pair = 32'h007b007b;
              4'hb: delta_pair = 32'h007c007c;
              4'hc: delta_pair = 32'h007d007d;
              4'hd: delta_pair = 32'h007e007e;
              4'he: delta_pair = 32'h007f007f;
              4'hf: delta_pair = 32'h03800380;
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
              4'h3: delta_pair = 32'h00140014;
              4'h4: delta_pair = 32'h00150015;
              4'h5: delta_pair = 32'h00160016;
              4'h6: delta_pair = 32'h00170017;
              4'h7: delta_pair = 32'h00180018;
              4'h8: delta_pair = 32'h00190019;
              4'h9: delta_pair = 32'h001a001a;
              4'ha: delta_pair = 32'h001b001b;
              4'hb: delta_pair = 32'h001c001c;
              4'hc: delta_pair = 32'h001d001d;
              4'hd: delta_pair = 32'h001e001e;
              4'he: delta_pair = 32'h001f001f;
              4'hf: delta_pair = 32'h00200020;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00210021;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00220022;
              4'h2: delta_pair = 32'h00230023;
              4'h3: delta_pair = 32'h00240024;
              4'h4: delta_pair = 32'h00250025;
              4'h5: delta_pair = 32'h00260026;
              4'h6: delta_pair = 32'h00270027;
              4'h7: delta_pair = 32'h00280028;
              4'h8: delta_pair = 32'h00290029;
              4'h9: delta_pair = 32'h002a002a;
              4'ha: delta_pair = 32'h002b002b;
              4'hb: delta_pair = 32'h002c002c;
              4'hc: delta_pair = 32'h002d002d;
              4'hd: delta_pair = 32'h002e002e;
              4'he: delta_pair = 32'h002f002f;
              4'hf: delta_pair = 32'h00300030;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00310031;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00320032;
              4'h2: delta_pair = 32'h00330033;
              4'h3: delta_pair = 32'h00340034;
              4'h4: delta_pair = 32'h00350035;
              4'h5: delta_pair = 32'h00360036;
              4'h6: delta_pair = 32'h00370037;
              4'h7: delta_pair = 32'h00380038;
              4'h8: delta_pair = 32'h00390039;
              4'h9: delta_pair = 32'h003a003a;
              4'ha: delta_pair = 32'h003b003b;
              4'hb: delta_pair = 32'h003c003c;
              4'hc: delta_pair = 32'h003d003d;
              4'hd: delta_pair = 32'h003e003e;
              4'he: delta_pair = 32'h003f003f;
              4'hf: delta_pair = 32'h00400040;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00410041;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00420042;
              4'h2: delta_pair = 32'h00430043;
              4'h3: delta_pair = 32'h00440044;
              4'h4: delta_pair = 32'h00450045;
              4'h5: delta_pair = 32'h00460046;
              4'h6: delta_pair = 32'h00470047;
              4'h7: delta_pair = 32'h00480048;
              4'h8: delta_pair = 32'h00490049;
              4'h9: delta_pair = 32'h004a004a;
              4'ha: delta_pair = 32'h004b004b;
              4'hb: delta_pair = 32'h004c004c;
              4'hc: delta_pair = 32'h004d004d;
              4'hd: delta_pair = 32'h004e004e;
              4'he: delta_pair = 32'h004f004f;
              4'hf: delta_pair = 32'h00500050;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00510051;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00520052;
              4'h2: delta_pair = 32'h00530053;
              4'h3: delta_pair = 32'h00540054;
              4'h4: delta_pair = 32'h00560056;
              4'h5: delta_pair = 32'h00570057;
              4'h6: delta_pair = 32'h00580058;
              4'h7: delta_pair = 32'h00590059;
              4'h8: delta_pair = 32'h005a005a;
              4'h9: delta_pair = 32'h005b005b;
              4'ha: delta_pair = 32'h005c005c;
              4'hb: delta_pair = 32'h005d005d;
              4'hc: delta_pair = 32'h005e005e;
              4'hd: delta_pair = 32'h005f005f;
              4'he: delta_pair = 32'h00600060;
              4'hf: delta_pair = 32'h00610061;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00620062;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00630063;
              4'h2: delta_pair = 32'h00640064;
              4'h3: delta_pair = 32'h00650065;
              4'h4: delta_pair = 32'h00660066;
              4'h5: delta_pair = 32'h00670067;
              4'h6: delta_pair = 32'h00680068;
              4'h7: delta_pair = 32'h00690069;
              4'h8: delta_pair = 32'h006a006a;
              4'h9: delta_pair = 32'h006b006b;
              4'ha: delta_pair = 32'h006c006c;
              4'hb: delta_pair = 32'h006d006d;
              4'hc: delta_pair = 32'h006e006e;
              4'hd: delta_pair = 32'h006f006f;
              4'he: delta_pair = 32'h00700070;
              4'hf: delta_pair = 32'h00710071;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00800080;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00720072;
              4'h1: delta_pair = 32'h00730073;
              4'h2: delta_pair = 32'h00740074;
              4'h3: delta_pair = 32'h00750075;
              4'h4: delta_pair = 32'h00760076;
              4'h5: delta_pair = 32'h00770077;
              4'h6: delta_pair = 32'h00780078;
              4'h7: delta_pair = 32'h00790079;
              4'h8: delta_pair = 32'h007a007a;
              4'h9: delta_pair = 32'h007b007b;
              4'ha: delta_pair = 32'h007c007c;
              4'hb: delta_pair = 32'h007e007e;
              4'hc: delta_pair = 32'h007f007f;
              4'hf: delta_pair = 32'h00810081;
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
              4'h1: delta_pair = 32'h00030003;
              4'h2: delta_pair = 32'h00020002;
              4'h3: delta_pair = 32'h00050005;
              4'h4: delta_pair = 32'h00040004;
              4'h5: delta_pair = 32'h00060006;
              4'h6: delta_pair = 32'h00090009;
              4'h7: delta_pair = 32'h00080008;
              4'h8: delta_pair = 32'h000b000b;
              4'h9: delta_pair = 32'h000a000a;
              4'ha: delta_pair = 32'h000d000d;
              4'hb: delta_pair = 32'h000c000c;
              4'hc: delta_pair = 32'h000f000f;
              4'hd: delta_pair = 32'h000e000e;
              4'he: delta_pair = 32'h00110011;
              4'hf: delta_pair = 32'h00100010;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00130013;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00120012;
              4'h2: delta_pair = 32'h00150015;
              4'h3: delta_pair = 32'h00140014;
              4'h4: delta_pair = 32'h00170017;
              4'h5: delta_pair = 32'h00160016;
              4'h6: delta_pair = 32'h00190019;
              4'h7: delta_pair = 32'h00180018;
              4'h8: delta_pair = 32'h001b001b;
              4'h9: delta_pair = 32'h001a001a;
              4'ha: delta_pair = 32'h001d001d;
              4'hb: delta_pair = 32'h001c001c;
              4'hc: delta_pair = 32'h001f001f;
              4'hd: delta_pair = 32'h001e001e;
              4'he: delta_pair = 32'h00200020;
              4'hf: delta_pair = 32'h00230023;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00220022;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00250025;
              4'h2: delta_pair = 32'h00240024;
              4'h3: delta_pair = 32'h00270027;
              4'h4: delta_pair = 32'h00260026;
              4'h5: delta_pair = 32'h00290029;
              4'h6: delta_pair = 32'h00280028;
              4'h7: delta_pair = 32'h002b002b;
              4'h8: delta_pair = 32'h002a002a;
              4'h9: delta_pair = 32'h002d002d;
              4'ha: delta_pair = 32'h002c002c;
              4'hb: delta_pair = 32'h002f002f;
              4'hc: delta_pair = 32'h002e002e;
              4'hd: delta_pair = 32'h00310031;
              4'he: delta_pair = 32'h00300030;
              4'hf: delta_pair = 32'h00330033;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00320032;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00340034;
              4'h2: delta_pair = 32'h00370037;
              4'h3: delta_pair = 32'h00360036;
              4'h4: delta_pair = 32'h00390039;
              4'h5: delta_pair = 32'h00380038;
              4'h6: delta_pair = 32'h003b003b;
              4'h7: delta_pair = 32'h003a003a;
              4'h8: delta_pair = 32'h003d003d;
              4'h9: delta_pair = 32'h003c003c;
              4'ha: delta_pair = 32'h003f003f;
              4'hb: delta_pair = 32'h003e003e;
              4'hc: delta_pair = 32'h00410041;
              4'hd: delta_pair = 32'h00400040;
              4'he: delta_pair = 32'h00430043;
              4'hf: delta_pair = 32'h00420042;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00440044;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00470047;
              4'h2: delta_pair = 32'h00460046;
              4'h3: delta_pair = 32'h00490049;
              4'h4: delta_pair = 32'h00480048;
              4'h5: delta_pair = 32'h004b004b;
              4'h6: delta_pair = 32'h004a004a;
              4'h7: delta_pair = 32'h004d004d;
              4'h8: delta_pair = 32'h004c004c;
              4'h9: delta_pair = 32'h004f004f;
              4'ha: delta_pair = 32'h004e004e;
              4'hb: delta_pair = 32'h00510051;
              4'hc: delta_pair = 32'h00500050;
              4'hd: delta_pair = 32'h00520052;
              4'he: delta_pair = 32'h00550055;
              4'hf: delta_pair = 32'h00540054;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h00570057;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00560056;
              4'h2: delta_pair = 32'h00590059;
              4'h3: delta_pair = 32'h00580058;
              4'h4: delta_pair = 32'h005b005b;
              4'h5: delta_pair = 32'h005a005a;
              4'h6: delta_pair = 32'h005d005d;
              4'h7: delta_pair = 32'h005c005c;
              4'h8: delta_pair = 32'h005f005f;
              4'h9: delta_pair = 32'h00610061;
              4'ha: delta_pair = 32'h00600060;
              4'hb: delta_pair = 32'h00630063;
              4'hc: delta_pair = 32'h00620062;
              4'hd: delta_pair = 32'h00650065;
              4'he: delta_pair = 32'h00640064;
              4'hf: delta_pair = 32'h00670067;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00660066;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00690069;
              4'h2: delta_pair = 32'h00680068;
              4'h3: delta_pair = 32'h006a006a;
              4'h4: delta_pair = 32'h006d006d;
              4'h5: delta_pair = 32'h006c006c;
              4'h6: delta_pair = 32'h006f006f;
              4'h7: delta_pair = 32'h006e006e;
              4'h8: delta_pair = 32'h00710071;
              4'h9: delta_pair = 32'h00700070;
              4'ha: delta_pair = 32'h00730073;
              4'hb: delta_pair = 32'h00720072;
              4'hc: delta_pair = 32'h00750075;
              4'hd: delta_pair = 32'h00770077;
              4'he: delta_pair = 32'h00760076;
              4'hf: delta_pair = 32'h00790079;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01810181;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00780078;
              4'h1: delta_pair = 32'h007b007b;
              4'h2: delta_pair = 32'h007a007a;
              4'h3: delta_pair = 32'h007d007d;
              4'h4: delta_pair = 32'h007c007c;
              4'h5: delta_pair = 32'h007f007f;
              4'h8: delta_pair = 32'h01800180;
              4'h9: delta_pair = 32'h01800180;
              4'ha: delta_pair = 32'h01830183;
              4'hb: delta_pair = 32'h01820182;
              4'hc: delta_pair = 32'h01820182;
              4'hd: delta_pair = 32'h01850185;
              4'he: delta_pair = 32'h01850185;
              4'hf: delta_pair = 32'h01840184;
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
              4'h2: delta_pair = 32'h000d000d;
              4'h3: delta_pair = 32'h000c000c;
              4'h4: delta_pair = 32'h000f000f;
              4'h5: delta_pair = 32'h000e000e;
              4'h6: delta_pair = 32'h00090009;
              4'h7: delta_pair = 32'h00080008;
              4'h8: delta_pair = 32'h000b000b;
              4'h9: delta_pair = 32'h00150015;
              4'ha: delta_pair = 32'h00140014;
              4'hb: delta_pair = 32'h00170017;
              4'hc: delta_pair = 32'h00160016;
              4'hd: delta_pair = 32'h00110011;
              4'he: delta_pair = 32'h00100010;
              4'hf: delta_pair = 32'h00120012;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h001d001d;
            case (mant_lo4)
              4'h1: delta_pair = 32'h001c001c;
              4'h2: delta_pair = 32'h001f001f;
              4'h3: delta_pair = 32'h001e001e;
              4'h4: delta_pair = 32'h00190019;
              4'h5: delta_pair = 32'h001b001b;
              4'h6: delta_pair = 32'h001a001a;
              4'h7: delta_pair = 32'h00250025;
              4'h8: delta_pair = 32'h00240024;
              4'h9: delta_pair = 32'h00270027;
              4'ha: delta_pair = 32'h00260026;
              4'hb: delta_pair = 32'h00200020;
              4'hc: delta_pair = 32'h00230023;
              4'hd: delta_pair = 32'h00220022;
              4'he: delta_pair = 32'h002d002d;
              4'hf: delta_pair = 32'h002c002c;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h002e002e;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00290029;
              4'h2: delta_pair = 32'h00280028;
              4'h3: delta_pair = 32'h002b002b;
              4'h4: delta_pair = 32'h002a002a;
              4'h5: delta_pair = 32'h00340034;
              4'h6: delta_pair = 32'h00370037;
              4'h7: delta_pair = 32'h00360036;
              4'h8: delta_pair = 32'h00310031;
              4'h9: delta_pair = 32'h00330033;
              4'ha: delta_pair = 32'h00320032;
              4'hb: delta_pair = 32'h003d003d;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003f003f;
              4'he: delta_pair = 32'h00390039;
              4'hf: delta_pair = 32'h00380038;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h003b003b;
            case (mant_lo4)
              4'h1: delta_pair = 32'h003a003a;
              4'h2: delta_pair = 32'h00440044;
              4'h3: delta_pair = 32'h00470047;
              4'h4: delta_pair = 32'h00460046;
              4'h5: delta_pair = 32'h00410041;
              4'h6: delta_pair = 32'h00430043;
              4'h7: delta_pair = 32'h00420042;
              4'h8: delta_pair = 32'h004d004d;
              4'h9: delta_pair = 32'h004f004f;
              4'ha: delta_pair = 32'h004e004e;
              4'hb: delta_pair = 32'h00490049;
              4'hc: delta_pair = 32'h00480048;
              4'hd: delta_pair = 32'h004a004a;
              4'he: delta_pair = 32'h00550055;
              4'hf: delta_pair = 32'h00540054;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h00560056;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00510051;
              4'h2: delta_pair = 32'h00500050;
              4'h3: delta_pair = 32'h00530053;
              4'h4: delta_pair = 32'h005d005d;
              4'h5: delta_pair = 32'h005c005c;
              4'h6: delta_pair = 32'h005f005f;
              4'h7: delta_pair = 32'h00590059;
              4'h8: delta_pair = 32'h00580058;
              4'h9: delta_pair = 32'h005b005b;
              4'ha: delta_pair = 32'h00650065;
              4'hb: delta_pair = 32'h00640064;
              4'hc: delta_pair = 32'h00670067;
              4'hd: delta_pair = 32'h00610061;
              4'he: delta_pair = 32'h00600060;
              4'hf: delta_pair = 32'h00630063;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h006d006d;
            case (mant_lo4)
              4'h1: delta_pair = 32'h006c006c;
              4'h2: delta_pair = 32'h006f006f;
              4'h3: delta_pair = 32'h00690069;
              4'h4: delta_pair = 32'h00680068;
              4'h5: delta_pair = 32'h006b006b;
              4'h6: delta_pair = 32'h00750075;
              4'h7: delta_pair = 32'h00740074;
              4'h8: delta_pair = 32'h00760076;
              4'h9: delta_pair = 32'h00710071;
              4'ha: delta_pair = 32'h00700070;
              4'hb: delta_pair = 32'h00720072;
              4'hc: delta_pair = 32'h007d007d;
              4'hd: delta_pair = 32'h007c007c;
              4'he: delta_pair = 32'h007e007e;
              4'hf: delta_pair = 32'h00790079;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h00870087;
            case (mant_lo4)
              4'h0: delta_pair = 32'h007b007b;
              4'h1: delta_pair = 32'h007a007a;
              4'h2: delta_pair = 32'h00850085;
              4'h3: delta_pair = 32'h00840084;
              4'h6: delta_pair = 32'h00860086;
              4'h7: delta_pair = 32'h00810081;
              4'h8: delta_pair = 32'h00800080;
              4'h9: delta_pair = 32'h00800080;
              4'ha: delta_pair = 32'h00830083;
              4'hb: delta_pair = 32'h00820082;
              4'hc: delta_pair = 32'h00820082;
              4'hd: delta_pair = 32'h008d008d;
              4'he: delta_pair = 32'h008c008c;
              4'hf: delta_pair = 32'h008f008f;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h00880088;
            case (mant_lo4)
              4'h0: delta_pair = 32'h008f008f;
              4'h1: delta_pair = 32'h008e008e;
              4'h2: delta_pair = 32'h00890089;
              4'h5: delta_pair = 32'h008b008b;
              4'h6: delta_pair = 32'h008a008a;
              4'h7: delta_pair = 32'h00950095;
              4'h8: delta_pair = 32'h00950095;
              4'h9: delta_pair = 32'h00940094;
              4'ha: delta_pair = 32'h00970097;
              4'hb: delta_pair = 32'h00960096;
              4'hc: delta_pair = 32'h00960096;
              4'hd: delta_pair = 32'h00910091;
              4'he: delta_pair = 32'h00900090;
              4'hf: delta_pair = 32'h00930093;
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
              4'h1: delta_pair = 32'h000e000e;
              4'h2: delta_pair = 32'h000c000c;
              4'h3: delta_pair = 32'h000d000d;
              4'h4: delta_pair = 32'h000b000b;
              4'h5: delta_pair = 32'h00080008;
              4'h6: delta_pair = 32'h00360036;
              4'h7: delta_pair = 32'h00370037;
              4'h8: delta_pair = 32'h00350035;
              4'h9: delta_pair = 32'h00330033;
              4'ha: delta_pair = 32'h00300030;
              4'hb: delta_pair = 32'h003e003e;
              4'hc: delta_pair = 32'h003c003c;
              4'hd: delta_pair = 32'h003d003d;
              4'he: delta_pair = 32'h003b003b;
              4'hf: delta_pair = 32'h00390039;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00260026;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00240024;
              4'h2: delta_pair = 32'h00220022;
              4'h3: delta_pair = 32'h00200020;
              4'h4: delta_pair = 32'h00210021;
              4'h5: delta_pair = 32'h002f002f;
              4'h6: delta_pair = 32'h002d002d;
              4'h7: delta_pair = 32'h002b002b;
              4'h8: delta_pair = 32'h00280028;
              4'h9: delta_pair = 32'h00560056;
              4'ha: delta_pair = 32'h00540054;
              4'hb: delta_pair = 32'h00520052;
              4'hc: delta_pair = 32'h00500050;
              4'hd: delta_pair = 32'h00510051;
              4'he: delta_pair = 32'h005f005f;
              4'hf: delta_pair = 32'h005d005d;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h005b005b;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00590059;
              4'h2: delta_pair = 32'h00470047;
              4'h3: delta_pair = 32'h00450045;
              4'h4: delta_pair = 32'h00430043;
              4'h5: delta_pair = 32'h00410041;
              4'h6: delta_pair = 32'h004f004f;
              4'h7: delta_pair = 32'h004d004d;
              4'h8: delta_pair = 32'h004b004b;
              4'h9: delta_pair = 32'h00490049;
              4'ha: delta_pair = 32'h00770077;
              4'hb: delta_pair = 32'h00750075;
              4'hc: delta_pair = 32'h00730073;
              4'hd: delta_pair = 32'h00710071;
              4'he: delta_pair = 32'h007f007f;
              4'hf: delta_pair = 32'h007d007d;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h007b007b;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00790079;
              4'h2: delta_pair = 32'h00670067;
              4'h3: delta_pair = 32'h00650065;
              4'h4: delta_pair = 32'h00630063;
              4'h5: delta_pair = 32'h006e006e;
              4'h6: delta_pair = 32'h006c006c;
              4'h7: delta_pair = 32'h006a006a;
              4'h8: delta_pair = 32'h00680068;
              4'h9: delta_pair = 32'h7f967f96;
              4'ha: delta_pair = 32'h7f977f97;
              4'hb: delta_pair = 32'h7f947f94;
              4'hc: delta_pair = 32'h7f927f92;
              4'hd: delta_pair = 32'h7f937f93;
              4'he: delta_pair = 32'h7f907f90;
              4'hf: delta_pair = 32'h7f917f91;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h7f9e7f9e;
            case (mant_lo4)
              4'h1: delta_pair = 32'h7f9f7f9f;
              4'h2: delta_pair = 32'h7f9d7f9d;
              4'h3: delta_pair = 32'h7f9a7f9a;
              4'h4: delta_pair = 32'h7f9b7f9b;
              4'h5: delta_pair = 32'h7f987f98;
              4'h6: delta_pair = 32'h7f997f99;
              4'h7: delta_pair = 32'h7f877f87;
              4'h8: delta_pair = 32'h7f847f84;
              4'h9: delta_pair = 32'h7f857f85;
              4'ha: delta_pair = 32'h7f827f82;
              4'hb: delta_pair = 32'h7f807f80;
              4'hc: delta_pair = 32'h7f817f81;
              4'hd: delta_pair = 32'h7f8e7f8e;
              4'he: delta_pair = 32'h7f8c7f8c;
              4'hf: delta_pair = 32'h7f8d7f8d;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h7f8a7f8a;
            case (mant_lo4)
              4'h1: delta_pair = 32'h7f887f88;
              4'h2: delta_pair = 32'h7f897f89;
              4'h3: delta_pair = 32'h7fb67fb6;
              4'h4: delta_pair = 32'h7fb47fb4;
              4'h5: delta_pair = 32'h7fb57fb5;
              4'h6: delta_pair = 32'h7fb27fb2;
              4'h7: delta_pair = 32'h7fb07fb0;
              4'h8: delta_pair = 32'h7fb17fb1;
              4'h9: delta_pair = 32'h7fbe7fbe;
              4'ha: delta_pair = 32'h7fbc7fbc;
              4'hb: delta_pair = 32'h7fbd7fbd;
              4'hc: delta_pair = 32'h7fbb7fbb;
              4'hd: delta_pair = 32'h7fb87fb8;
              4'he: delta_pair = 32'h7fa67fa6;
              4'hf: delta_pair = 32'h7fa77fa7;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h7fa57fa5;
            case (mant_lo4)
              4'h1: delta_pair = 32'h7fa27fa2;
              4'h2: delta_pair = 32'h7fa07fa0;
              4'h3: delta_pair = 32'h7fa17fa1;
              4'h4: delta_pair = 32'h7faf7faf;
              4'h5: delta_pair = 32'h7fac7fac;
              4'h6: delta_pair = 32'h7faa7faa;
              4'h7: delta_pair = 32'h7fab7fab;
              4'h8: delta_pair = 32'h7fa97fa9;
              4'h9: delta_pair = 32'h7fd67fd6;
              4'ha: delta_pair = 32'h7fd47fd4;
              4'hb: delta_pair = 32'h7fd27fd2;
              4'hc: delta_pair = 32'h7fd37fd3;
              4'hd: delta_pair = 32'h7fd17fd1;
              4'he: delta_pair = 32'h7fde7fde;
              4'hf: delta_pair = 32'h7fdc7fdc;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h7fda7fda;
            case (mant_lo4)
              4'h1: delta_pair = 32'h7fdb7fdb;
              4'h2: delta_pair = 32'h7fd97fd9;
              4'h3: delta_pair = 32'h7fc77fc7;
              4'h4: delta_pair = 32'h7fc57fc5;
              4'h5: delta_pair = 32'h7fc27fc2;
              4'h6: delta_pair = 32'h7fc07fc0;
              4'h7: delta_pair = 32'h7fce7fce;
              4'h8: delta_pair = 32'h7fcc7fcc;
              4'h9: delta_pair = 32'h7fcd7fcd;
              4'ha: delta_pair = 32'h7fcb7fcb;
              4'hb: delta_pair = 32'h7fc97fc9;
              4'hc: delta_pair = 32'h7ff77ff7;
              4'hd: delta_pair = 32'h7ff57ff5;
              4'he: delta_pair = 32'h7ff27ff2;
              4'hf: delta_pair = 32'h7ff07ff0;
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
              4'h1: delta_pair = 32'h00040004;
              4'h2: delta_pair = 32'h00180018;
              4'h3: delta_pair = 32'h001c001c;
              4'h4: delta_pair = 32'h00100010;
              4'h5: delta_pair = 32'h00140014;
              4'h6: delta_pair = 32'h00e800e8;
              4'h7: delta_pair = 32'h00ea00ea;
              4'h8: delta_pair = 32'h00ec00ec;
              4'h9: delta_pair = 32'h00ee00ee;
              4'ha: delta_pair = 32'h00e000e0;
              4'hb: delta_pair = 32'h00e300e3;
              4'hc: delta_pair = 32'h00e500e5;
              4'hd: delta_pair = 32'h00e700e7;
              4'he: delta_pair = 32'h00f900f9;
              4'hf: delta_pair = 32'h00fc00fc;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h00fe00fe;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00f100f1;
              4'h2: delta_pair = 32'h00f300f3;
              4'h3: delta_pair = 32'h00f500f5;
              4'h4: delta_pair = 32'h00c800c8;
              4'h5: delta_pair = 32'h00cb00cb;
              4'h6: delta_pair = 32'h00cd00cd;
              4'h7: delta_pair = 32'h00c000c0;
              4'h8: delta_pair = 32'h00c300c3;
              4'h9: delta_pair = 32'h00c500c5;
              4'ha: delta_pair = 32'h00d800d8;
              4'hb: delta_pair = 32'h00db00db;
              4'hc: delta_pair = 32'h00de00de;
              4'hd: delta_pair = 32'h00d100d1;
              4'he: delta_pair = 32'h00d400d4;
              4'hf: delta_pair = 32'h00d700d7;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h00aa00aa;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00ad00ad;
              4'h2: delta_pair = 32'h00a000a0;
              4'h3: delta_pair = 32'h00a300a3;
              4'h4: delta_pair = 32'h00a600a6;
              4'h5: delta_pair = 32'h00ba00ba;
              4'h6: delta_pair = 32'h00bd00bd;
              4'h7: delta_pair = 32'h00b000b0;
              4'h8: delta_pair = 32'h00b400b4;
              4'h9: delta_pair = 32'h00b700b7;
              4'ha: delta_pair = 32'h008b008b;
              4'hb: delta_pair = 32'h008e008e;
              4'hc: delta_pair = 32'h00820082;
              4'hd: delta_pair = 32'h00860086;
              4'he: delta_pair = 32'h009a009a;
              4'hf: delta_pair = 32'h009d009d;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h00910091;
            case (mant_lo4)
              4'h1: delta_pair = 32'h00950095;
              4'h2: delta_pair = 32'h01690169;
              4'h3: delta_pair = 32'h016b016b;
              4'h4: delta_pair = 32'h016d016d;
              4'h5: delta_pair = 32'h016f016f;
              4'h6: delta_pair = 32'h01610161;
              4'h7: delta_pair = 32'h01630163;
              4'h8: delta_pair = 32'h01650165;
              4'h9: delta_pair = 32'h01780178;
              4'ha: delta_pair = 32'h017a017a;
              4'hb: delta_pair = 32'h017c017c;
              4'hc: delta_pair = 32'h017f017f;
              4'hd: delta_pair = 32'h01710171;
              4'he: delta_pair = 32'h01730173;
              4'hf: delta_pair = 32'h01760176;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h01480148;
            case (mant_lo4)
              4'h1: delta_pair = 32'h014b014b;
              4'h2: delta_pair = 32'h014d014d;
              4'h3: delta_pair = 32'h01400140;
              4'h4: delta_pair = 32'h01430143;
              4'h5: delta_pair = 32'h01450145;
              4'h6: delta_pair = 32'h01580158;
              4'h7: delta_pair = 32'h015b015b;
              4'h8: delta_pair = 32'h015e015e;
              4'h9: delta_pair = 32'h01510151;
              4'ha: delta_pair = 32'h01540154;
              4'hb: delta_pair = 32'h01560156;
              4'hc: delta_pair = 32'h01290129;
              4'hd: delta_pair = 32'h012d012d;
              4'he: delta_pair = 32'h01200120;
              4'hf: delta_pair = 32'h01230123;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h01260126;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01390139;
              4'h2: delta_pair = 32'h013d013d;
              4'h3: delta_pair = 32'h01300130;
              4'h4: delta_pair = 32'h01330133;
              4'h5: delta_pair = 32'h01370137;
              4'h6: delta_pair = 32'h010a010a;
              4'h7: delta_pair = 32'h010e010e;
              4'h8: delta_pair = 32'h01020102;
              4'h9: delta_pair = 32'h01050105;
              4'ha: delta_pair = 32'h01190119;
              4'hb: delta_pair = 32'h011d011d;
              4'hc: delta_pair = 32'h01110111;
              4'hd: delta_pair = 32'h01150115;
              4'he: delta_pair = 32'h01e801e8;
              4'hf: delta_pair = 32'h01ea01ea;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h01ec01ec;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01ee01ee;
              4'h2: delta_pair = 32'h01e101e1;
              4'h3: delta_pair = 32'h01e301e3;
              4'h4: delta_pair = 32'h01e501e5;
              4'h5: delta_pair = 32'h01e701e7;
              4'h6: delta_pair = 32'h01f901f9;
              4'h7: delta_pair = 32'h01fc01fc;
              4'h8: delta_pair = 32'h01fe01fe;
              4'h9: delta_pair = 32'h01f001f0;
              4'ha: delta_pair = 32'h01f301f3;
              4'hb: delta_pair = 32'h01f501f5;
              4'hc: delta_pair = 32'h01c801c8;
              4'hd: delta_pair = 32'h01ca01ca;
              4'he: delta_pair = 32'h01cd01cd;
              4'hf: delta_pair = 32'h01cf01cf;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h01c201c2;
            case (mant_lo4)
              4'h1: delta_pair = 32'h01c501c5;
              4'h2: delta_pair = 32'h01c701c7;
              4'h3: delta_pair = 32'h01da01da;
              4'h4: delta_pair = 32'h01dd01dd;
              4'h5: delta_pair = 32'h01d001d0;
              4'h6: delta_pair = 32'h01d301d3;
              4'h7: delta_pair = 32'h01d601d6;
              4'h8: delta_pair = 32'h01a901a9;
              4'h9: delta_pair = 32'h01ac01ac;
              4'ha: delta_pair = 32'h01af01af;
              4'hb: delta_pair = 32'h01a201a2;
              4'hc: delta_pair = 32'h01a501a5;
              4'hd: delta_pair = 32'h01b801b8;
              4'he: delta_pair = 32'h01bc01bc;
              4'hf: delta_pair = 32'h01bf01bf;
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
              4'h1: delta_pair = 32'h003b003b;
              4'h2: delta_pair = 32'h00320032;
              4'h3: delta_pair = 32'h002a002a;
              4'h4: delta_pair = 32'h002d002d;
              4'h5: delta_pair = 32'h00250025;
              4'h6: delta_pair = 32'h03de03de;
              4'h7: delta_pair = 32'h03d203d2;
              4'h8: delta_pair = 32'h03d603d6;
              4'h9: delta_pair = 32'h03cb03cb;
              4'ha: delta_pair = 32'h03cf03cf;
              4'hb: delta_pair = 32'h03c003c0;
              4'hc: delta_pair = 32'h03c503c5;
              4'hd: delta_pair = 32'h03fe03fe;
              4'he: delta_pair = 32'h03f303f3;
              4'hf: delta_pair = 32'h03f403f4;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h03ee03ee;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03e003e0;
              4'h2: delta_pair = 32'h039a039a;
              4'h3: delta_pair = 32'h039c039c;
              4'h4: delta_pair = 32'h03960396;
              4'h5: delta_pair = 32'h03880388;
              4'h6: delta_pair = 32'h03830383;
              4'h7: delta_pair = 32'h03ba03ba;
              4'h8: delta_pair = 32'h03bd03bd;
              4'h9: delta_pair = 32'h03b403b4;
              4'ha: delta_pair = 32'h03ac03ac;
              4'hb: delta_pair = 32'h03a403a4;
              4'hc: delta_pair = 32'h03590359;
              4'hd: delta_pair = 32'h035d035d;
              4'he: delta_pair = 32'h03510351;
              4'hf: delta_pair = 32'h034a034a;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h034e034e;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03430343;
              4'h2: delta_pair = 32'h03440344;
              4'h3: delta_pair = 32'h03790379;
              4'h4: delta_pair = 32'h03720372;
              4'h5: delta_pair = 32'h03740374;
              4'h6: delta_pair = 32'h03690369;
              4'h7: delta_pair = 32'h03630363;
              4'h8: delta_pair = 32'h03650365;
              4'h9: delta_pair = 32'h031f031f;
              4'ha: delta_pair = 32'h03110311;
              4'hb: delta_pair = 32'h030b030b;
              4'hc: delta_pair = 32'h03020302;
              4'hd: delta_pair = 32'h03050305;
              4'he: delta_pair = 32'h033c033c;
              4'hf: delta_pair = 32'h03370337;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h032f032f;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03260326;
              4'h2: delta_pair = 32'h02d802d8;
              4'h3: delta_pair = 32'h02dc02dc;
              4'h4: delta_pair = 32'h02d102d1;
              4'h5: delta_pair = 32'h02d502d5;
              4'h6: delta_pair = 32'h02ce02ce;
              4'h7: delta_pair = 32'h02c202c2;
              4'h8: delta_pair = 32'h02c702c7;
              4'h9: delta_pair = 32'h02f802f8;
              4'ha: delta_pair = 32'h02fd02fd;
              4'hb: delta_pair = 32'h02f702f7;
              4'hc: delta_pair = 32'h02e802e8;
              4'hd: delta_pair = 32'h02e202e2;
              4'he: delta_pair = 32'h02e702e7;
              4'hf: delta_pair = 32'h029e029e;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h02900290;
            case (mant_lo4)
              4'h1: delta_pair = 32'h028a028a;
              4'h2: delta_pair = 32'h028d028d;
              4'h3: delta_pair = 32'h02840284;
              4'h4: delta_pair = 32'h02bf02bf;
              4'h5: delta_pair = 32'h02b602b6;
              4'h6: delta_pair = 32'h02a902a9;
              4'h7: delta_pair = 32'h02a102a1;
              4'h8: delta_pair = 32'h02580258;
              4'h9: delta_pair = 32'h025c025c;
              4'ha: delta_pair = 32'h02500250;
              4'hb: delta_pair = 32'h02540254;
              4'hc: delta_pair = 32'h02490249;
              4'hd: delta_pair = 32'h024d024d;
              4'he: delta_pair = 32'h02460246;
              4'hf: delta_pair = 32'h027b027b;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h027c027c;
            case (mant_lo4)
              4'h1: delta_pair = 32'h02760276;
              4'h2: delta_pair = 32'h026b026b;
              4'h3: delta_pair = 32'h026d026d;
              4'h4: delta_pair = 32'h02660266;
              4'h5: delta_pair = 32'h02180218;
              4'h6: delta_pair = 32'h02130213;
              4'h7: delta_pair = 32'h02150215;
              4'h8: delta_pair = 32'h020c020c;
              4'h9: delta_pair = 32'h02060206;
              4'ha: delta_pair = 32'h02390239;
              4'hb: delta_pair = 32'h02300230;
              4'hc: delta_pair = 32'h02280228;
              4'hd: delta_pair = 32'h02200220;
              4'he: delta_pair = 32'h05db05db;
              4'hf: delta_pair = 32'h05df05df;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h05d305d3;
            case (mant_lo4)
              4'h1: delta_pair = 32'h05d705d7;
              4'h2: delta_pair = 32'h05c805c8;
              4'h3: delta_pair = 32'h05cd05cd;
              4'h4: delta_pair = 32'h05c105c1;
              4'h5: delta_pair = 32'h05fa05fa;
              4'h6: delta_pair = 32'h05ff05ff;
              4'h7: delta_pair = 32'h05f105f1;
              4'h8: delta_pair = 32'h05ea05ea;
              4'h9: delta_pair = 32'h05ec05ec;
              4'ha: delta_pair = 32'h05e105e1;
              4'hb: delta_pair = 32'h059b059b;
              4'hc: delta_pair = 32'h059d059d;
              4'hd: delta_pair = 32'h05940594;
              4'he: delta_pair = 32'h058e058e;
              4'hf: delta_pair = 32'h05810581;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h05b805b8;
            case (mant_lo4)
              4'h1: delta_pair = 32'h05b305b3;
              4'h2: delta_pair = 32'h05ab05ab;
              4'h3: delta_pair = 32'h05a205a2;
              4'h4: delta_pair = 32'h055a055a;
              4'h5: delta_pair = 32'h055e055e;
              4'h6: delta_pair = 32'h05520552;
              4'h7: delta_pair = 32'h05570557;
              4'h8: delta_pair = 32'h054b054b;
              4'h9: delta_pair = 32'h054c054c;
              4'ha: delta_pair = 32'h05400540;
              4'hb: delta_pair = 32'h05450545;
              4'hc: delta_pair = 32'h057e057e;
              4'hd: delta_pair = 32'h05700570;
              4'he: delta_pair = 32'h05750575;
              4'hf: delta_pair = 32'h056f056f;
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
              4'h1: delta_pair = 32'h007c007c;
              4'h2: delta_pair = 32'h00690069;
              4'h3: delta_pair = 32'h005b005b;
              4'h4: delta_pair = 32'h00550055;
              4'h5: delta_pair = 32'h00450045;
              4'h6: delta_pair = 32'h01b201b2;
              4'h7: delta_pair = 32'h01aa01aa;
              4'h8: delta_pair = 32'h01a001a0;
              4'h9: delta_pair = 32'h01990199;
              4'ha: delta_pair = 32'h01940194;
              4'hb: delta_pair = 32'h01830183;
              4'hc: delta_pair = 32'h01ff01ff;
              4'hd: delta_pair = 32'h01e801e8;
              4'he: delta_pair = 32'h01e501e5;
              4'hf: delta_pair = 32'h01d401d4;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h01c701c7;
            case (mant_lo4)
              4'h1: delta_pair = 32'h013d013d;
              4'h2: delta_pair = 32'h01350135;
              4'h3: delta_pair = 32'h01230123;
              4'h4: delta_pair = 32'h01190119;
              4'h5: delta_pair = 32'h01170117;
              4'h6: delta_pair = 32'h01020102;
              4'h7: delta_pair = 32'h017e017e;
              4'h8: delta_pair = 32'h016b016b;
              4'h9: delta_pair = 32'h01640164;
              4'ha: delta_pair = 32'h01570157;
              4'hb: delta_pair = 32'h01460146;
              4'hc: delta_pair = 32'h02bc02bc;
              4'hd: delta_pair = 32'h02b502b5;
              4'he: delta_pair = 32'h02a202a2;
              4'hf: delta_pair = 32'h02980298;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h02960296;
            case (mant_lo4)
              4'h1: delta_pair = 32'h028d028d;
              4'h2: delta_pair = 32'h02f902f9;
              4'h3: delta_pair = 32'h02ea02ea;
              4'h4: delta_pair = 32'h02e702e7;
              4'h5: delta_pair = 32'h02d102d1;
              4'h6: delta_pair = 32'h02c002c0;
              4'h7: delta_pair = 32'h023f023f;
              4'h8: delta_pair = 32'h02340234;
              4'h9: delta_pair = 32'h022d022d;
              4'ha: delta_pair = 32'h021b021b;
              4'hb: delta_pair = 32'h02110211;
              4'hc: delta_pair = 32'h020c020c;
              4'hd: delta_pair = 32'h02780278;
              4'he: delta_pair = 32'h02740274;
              4'hf: delta_pair = 32'h02660266;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h02500250;
            case (mant_lo4)
              4'h1: delta_pair = 32'h02430243;
              4'h2: delta_pair = 32'h03bf03bf;
              4'h3: delta_pair = 32'h03b703b7;
              4'h4: delta_pair = 32'h03ac03ac;
              4'h5: delta_pair = 32'h039a039a;
              4'h6: delta_pair = 32'h03900390;
              4'h7: delta_pair = 32'h038f038f;
              4'h8: delta_pair = 32'h03fb03fb;
              4'h9: delta_pair = 32'h03f703f7;
              4'ha: delta_pair = 32'h03e003e0;
              4'hb: delta_pair = 32'h03d303d3;
              4'hc: delta_pair = 32'h03c203c2;
              4'hd: delta_pair = 32'h033e033e;
              4'he: delta_pair = 32'h03360336;
              4'hf: delta_pair = 32'h032f032f;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h03250325;
            case (mant_lo4)
              4'h1: delta_pair = 32'h03130313;
              4'h2: delta_pair = 32'h030e030e;
              4'h3: delta_pair = 32'h037a037a;
              4'h4: delta_pair = 32'h03760376;
              4'h5: delta_pair = 32'h03630363;
              4'h6: delta_pair = 32'h035d035d;
              4'h7: delta_pair = 32'h034c034c;
              4'h8: delta_pair = 32'h0cb90cb9;
              4'h9: delta_pair = 32'h0cb10cb1;
              4'ha: delta_pair = 32'h0cae0cae;
              4'hb: delta_pair = 32'h0ca40ca4;
              4'hc: delta_pair = 32'h0c920c92;
              4'hd: delta_pair = 32'h0c890c89;
              4'he: delta_pair = 32'h0c850c85;
              4'hf: delta_pair = 32'h0cf10cf1;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h0ce20ce2;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0cdc0cdc;
              4'h2: delta_pair = 32'h0ccf0ccf;
              4'h3: delta_pair = 32'h0c380c38;
              4'h4: delta_pair = 32'h0c310c31;
              4'h5: delta_pair = 32'h0c2e0c2e;
              4'h6: delta_pair = 32'h0c270c27;
              4'h7: delta_pair = 32'h0c1d0c1d;
              4'h8: delta_pair = 32'h0c080c08;
              4'h9: delta_pair = 32'h0c040c04;
              4'ha: delta_pair = 32'h0c700c70;
              4'hb: delta_pair = 32'h0c6d0c6d;
              4'hc: delta_pair = 32'h0c5f0c5f;
              4'hd: delta_pair = 32'h0c490c49;
              4'he: delta_pair = 32'h0db80db8;
              4'hf: delta_pair = 32'h0db00db0;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h0da90da9;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0da60da6;
              4'h2: delta_pair = 32'h0d9c0d9c;
              4'h3: delta_pair = 32'h0d8b0d8b;
              4'h4: delta_pair = 32'h0d860d86;
              4'h5: delta_pair = 32'h0df30df3;
              4'h6: delta_pair = 32'h0dec0dec;
              4'h7: delta_pair = 32'h0dd90dd9;
              4'h8: delta_pair = 32'h0dc80dc8;
              4'h9: delta_pair = 32'h0d3b0d3b;
              4'ha: delta_pair = 32'h0d330d33;
              4'hb: delta_pair = 32'h0d280d28;
              4'hc: delta_pair = 32'h0d210d21;
              4'hd: delta_pair = 32'h0d1f0d1f;
              4'he: delta_pair = 32'h0d0a0d0a;
              4'hf: delta_pair = 32'h0d010d01;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h0d720d72;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0d6e0d6e;
              4'h2: delta_pair = 32'h0d580d58;
              4'h3: delta_pair = 32'h0d4b0d4b;
              4'h4: delta_pair = 32'h0eba0eba;
              4'h5: delta_pair = 32'h0eb20eb2;
              4'h6: delta_pair = 32'h0eab0eab;
              4'h7: delta_pair = 32'h0ea10ea1;
              4'h8: delta_pair = 32'h0e9e0e9e;
              4'h9: delta_pair = 32'h0e950e95;
              4'ha: delta_pair = 32'h0e800e80;
              4'hb: delta_pair = 32'h0efc0efc;
              4'hc: delta_pair = 32'h0ee90ee9;
              4'hd: delta_pair = 32'h0edb0edb;
              4'he: delta_pair = 32'h0ed50ed5;
              4'hf: delta_pair = 32'h0ec50ec5;
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
              4'h1: delta_pair = 32'h00120012;
              4'h2: delta_pair = 32'h00260026;
              4'h3: delta_pair = 32'h004d004d;
              4'h4: delta_pair = 32'h00680068;
              4'h5: delta_pair = 32'h00750075;
              4'h6: delta_pair = 32'h01980198;
              4'h7: delta_pair = 32'h01ab01ab;
              4'h8: delta_pair = 32'h01b001b0;
              4'h9: delta_pair = 32'h01d901d9;
              4'ha: delta_pair = 32'h01e501e5;
              4'hb: delta_pair = 32'h010e010e;
              4'hc: delta_pair = 32'h01100110;
              4'hd: delta_pair = 32'h01240124;
              4'he: delta_pair = 32'h014b014b;
              4'hf: delta_pair = 32'h01550155;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h01720172;
            case (mant_lo4)
              4'h1: delta_pair = 32'h06860686;
              4'h2: delta_pair = 32'h06a906a9;
              4'h3: delta_pair = 32'h06be06be;
              4'h4: delta_pair = 32'h06c606c6;
              4'h5: delta_pair = 32'h06e206e2;
              4'h6: delta_pair = 32'h060d060d;
              4'h7: delta_pair = 32'h061e061e;
              4'h8: delta_pair = 32'h06220622;
              4'h9: delta_pair = 32'h06490649;
              4'ha: delta_pair = 32'h06530653;
              4'hb: delta_pair = 32'h06700670;
              4'hc: delta_pair = 32'h07840784;
              4'hd: delta_pair = 32'h07970797;
              4'he: delta_pair = 32'h07bc07bc;
              4'hf: delta_pair = 32'h07c407c4;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h07ef07ef;
            case (mant_lo4)
              4'h1: delta_pair = 32'h070b070b;
              4'h2: delta_pair = 32'h071d071d;
              4'h3: delta_pair = 32'h07200720;
              4'h4: delta_pair = 32'h07370737;
              4'h5: delta_pair = 32'h07500750;
              4'h6: delta_pair = 32'h077d077d;
              4'h7: delta_pair = 32'h04830483;
              4'h8: delta_pair = 32'h04950495;
              4'h9: delta_pair = 32'h04ba04ba;
              4'ha: delta_pair = 32'h04c204c2;
              4'hb: delta_pair = 32'h04ed04ed;
              4'hc: delta_pair = 32'h040a040a;
              4'hd: delta_pair = 32'h041b041b;
              4'he: delta_pair = 32'h042e042e;
              4'hf: delta_pair = 32'h04350435;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h045e045e;
            case (mant_lo4)
              4'h1: delta_pair = 32'h047a047a;
              4'h2: delta_pair = 32'h05810581;
              4'h3: delta_pair = 32'h05930593;
              4'h4: delta_pair = 32'h05b805b8;
              4'h5: delta_pair = 32'h05c005c0;
              4'h6: delta_pair = 32'h05ea05ea;
              4'h7: delta_pair = 32'h05080508;
              4'h8: delta_pair = 32'h05190519;
              4'h9: delta_pair = 32'h052d052d;
              4'ha: delta_pair = 32'h05320532;
              4'hb: delta_pair = 32'h055b055b;
              4'hc: delta_pair = 32'h05670567;
              4'hd: delta_pair = 32'h1a801a80;
              4'he: delta_pair = 32'h1a921a92;
              4'hf: delta_pair = 32'h1aa61aa6;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h1acd1acd;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1ae81ae8;
              4'h2: delta_pair = 32'h1af51af5;
              4'h3: delta_pair = 32'h1a181a18;
              4'h4: delta_pair = 32'h1a2b1a2b;
              4'h5: delta_pair = 32'h1a301a30;
              4'h6: delta_pair = 32'h1a591a59;
              4'h7: delta_pair = 32'h1a651a65;
              4'h8: delta_pair = 32'h1b8e1b8e;
              4'h9: delta_pair = 32'h1b901b90;
              4'ha: delta_pair = 32'h1ba41ba4;
              4'hb: delta_pair = 32'h1bcb1bcb;
              4'hc: delta_pair = 32'h1bd51bd5;
              4'hd: delta_pair = 32'h1bf31bf3;
              4'he: delta_pair = 32'h1b061b06;
              4'hf: delta_pair = 32'h1b291b29;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h1b3e1b3e;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1b471b47;
              4'h2: delta_pair = 32'h1b621b62;
              4'h3: delta_pair = 32'h188d188d;
              4'h4: delta_pair = 32'h189e189e;
              4'h5: delta_pair = 32'h18a218a2;
              4'h6: delta_pair = 32'h18c918c9;
              4'h7: delta_pair = 32'h18d318d3;
              4'h8: delta_pair = 32'h18f018f0;
              4'h9: delta_pair = 32'h18041804;
              4'ha: delta_pair = 32'h18171817;
              4'hb: delta_pair = 32'h183c183c;
              4'hc: delta_pair = 32'h18441844;
              4'hd: delta_pair = 32'h186f186f;
              4'he: delta_pair = 32'h198b198b;
              4'hf: delta_pair = 32'h199d199d;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h19a019a0;
            case (mant_lo4)
              4'h1: delta_pair = 32'h19b719b7;
              4'h2: delta_pair = 32'h19d019d0;
              4'h3: delta_pair = 32'h19fd19fd;
              4'h4: delta_pair = 32'h19031903;
              4'h5: delta_pair = 32'h19151915;
              4'h6: delta_pair = 32'h193a193a;
              4'h7: delta_pair = 32'h19421942;
              4'h8: delta_pair = 32'h196d196d;
              4'h9: delta_pair = 32'h1e8a1e8a;
              4'ha: delta_pair = 32'h1e9b1e9b;
              4'hb: delta_pair = 32'h1eae1eae;
              4'hc: delta_pair = 32'h1eb51eb5;
              4'hd: delta_pair = 32'h1ede1ede;
              4'he: delta_pair = 32'h1efa1efa;
              4'hf: delta_pair = 32'h1e011e01;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h1e141e14;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1e381e38;
              4'h2: delta_pair = 32'h1e401e40;
              4'h3: delta_pair = 32'h1e6a1e6a;
              4'h4: delta_pair = 32'h1f881f88;
              4'h5: delta_pair = 32'h1f991f99;
              4'h6: delta_pair = 32'h1fad1fad;
              4'h7: delta_pair = 32'h1fb31fb3;
              4'h8: delta_pair = 32'h1fdb1fdb;
              4'h9: delta_pair = 32'h1ff81ff8;
              4'ha: delta_pair = 32'h1f001f00;
              4'hb: delta_pair = 32'h1f121f12;
              4'hc: delta_pair = 32'h1f261f26;
              4'hd: delta_pair = 32'h1f4d1f4d;
              4'he: delta_pair = 32'h1f681f68;
              4'hf: delta_pair = 32'h1f761f76;
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
              4'h1: delta_pair = 32'h00280028;
              4'h2: delta_pair = 32'h007d007d;
              4'h3: delta_pair = 32'h00880088;
              4'h4: delta_pair = 32'h00d300d3;
              4'h5: delta_pair = 32'h00eb00eb;
              4'h6: delta_pair = 32'h01310131;
              4'h7: delta_pair = 32'h015f015f;
              4'h8: delta_pair = 32'h01950195;
              4'h9: delta_pair = 32'h01ba01ba;
              4'ha: delta_pair = 32'h01cb01cb;
              4'hb: delta_pair = 32'h0e1c0e1c;
              4'hc: delta_pair = 32'h0e240e24;
              4'hd: delta_pair = 32'h0e780e78;
              4'he: delta_pair = 32'h0e850e85;
              4'hf: delta_pair = 32'h0eaf0eaf;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h0ee50ee5;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0f0d0f0d;
              4'h2: delta_pair = 32'h0f5a0f5a;
              4'h3: delta_pair = 32'h0f920f92;
              4'h4: delta_pair = 32'h0fb70fb7;
              4'h5: delta_pair = 32'h0fc60fc6;
              4'h6: delta_pair = 32'h0c190c19;
              4'h7: delta_pair = 32'h0c200c20;
              4'h8: delta_pair = 32'h0c720c72;
              4'h9: delta_pair = 32'h0c810c81;
              4'ha: delta_pair = 32'h0cab0cab;
              4'hb: delta_pair = 32'h0ce00ce0;
              4'hc: delta_pair = 32'h0d0a0d0a;
              4'hd: delta_pair = 32'h0d560d56;
              4'he: delta_pair = 32'h0d6e0d6e;
              4'hf: delta_pair = 32'h0db30db3;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h0dc10dc1;
            case (mant_lo4)
              4'h1: delta_pair = 32'h0a160a16;
              4'h2: delta_pair = 32'h0a3c0a3c;
              4'h3: delta_pair = 32'h0a4d0a4d;
              4'h4: delta_pair = 32'h0a9e0a9e;
              4'h5: delta_pair = 32'h0aa60aa6;
              4'h6: delta_pair = 32'h0afa0afa;
              4'h7: delta_pair = 32'h0b060b06;
              4'h8: delta_pair = 32'h0b510b51;
              4'h9: delta_pair = 32'h0b680b68;
              4'ha: delta_pair = 32'h0b8f0b8f;
              4'hb: delta_pair = 32'h0bdc0bdc;
              4'hc: delta_pair = 32'h08130813;
              4'hd: delta_pair = 32'h08380838;
              4'he: delta_pair = 32'h08480848;
              4'hf: delta_pair = 32'h089b089b;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h08a208a2;
            case (mant_lo4)
              4'h1: delta_pair = 32'h08f508f5;
              4'h2: delta_pair = 32'h09030903;
              4'h3: delta_pair = 32'h092d092d;
              4'h4: delta_pair = 32'h09620962;
              4'h5: delta_pair = 32'h098c098c;
              4'h6: delta_pair = 32'h09d809d8;
              4'h7: delta_pair = 32'h36103610;
              4'h8: delta_pair = 32'h36353635;
              4'h9: delta_pair = 32'h36443644;
              4'ha: delta_pair = 32'h36983698;
              4'hb: delta_pair = 32'h36be36be;
              4'hc: delta_pair = 32'h36f036f0;
              4'hd: delta_pair = 32'h37003700;
              4'he: delta_pair = 32'h37293729;
              4'hf: delta_pair = 32'h377d377d;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h37883788;
            case (mant_lo4)
              4'h1: delta_pair = 32'h37d337d3;
              4'h2: delta_pair = 32'h37eb37eb;
              4'h3: delta_pair = 32'h34313431;
              4'h4: delta_pair = 32'h345f345f;
              4'h5: delta_pair = 32'h34953495;
              4'h6: delta_pair = 32'h34ba34ba;
              4'h7: delta_pair = 32'h34cb34cb;
              4'h8: delta_pair = 32'h351d351d;
              4'h9: delta_pair = 32'h35243524;
              4'ha: delta_pair = 32'h35783578;
              4'hb: delta_pair = 32'h35853585;
              4'hc: delta_pair = 32'h35af35af;
              4'hd: delta_pair = 32'h35e535e5;
              4'he: delta_pair = 32'h320d320d;
              4'hf: delta_pair = 32'h325a325a;
              default: begin end
            endcase
          end
          3'h5: begin
            delta_pair = 32'h32923292;
            case (mant_lo4)
              4'h1: delta_pair = 32'h32b732b7;
              4'h2: delta_pair = 32'h32c632c6;
              4'h3: delta_pair = 32'h33193319;
              4'h4: delta_pair = 32'h33203320;
              4'h5: delta_pair = 32'h33733373;
              4'h6: delta_pair = 32'h33813381;
              4'h7: delta_pair = 32'h33ab33ab;
              4'h8: delta_pair = 32'h33e033e0;
              4'h9: delta_pair = 32'h300a300a;
              4'ha: delta_pair = 32'h30563056;
              4'hb: delta_pair = 32'h306e306e;
              4'hc: delta_pair = 32'h30b330b3;
              4'hd: delta_pair = 32'h30c130c1;
              4'he: delta_pair = 32'h31163116;
              4'hf: delta_pair = 32'h313c313c;
              default: begin end
            endcase
          end
          3'h6: begin
            delta_pair = 32'h314d314d;
            case (mant_lo4)
              4'h1: delta_pair = 32'h319e319e;
              4'h2: delta_pair = 32'h31a731a7;
              4'h3: delta_pair = 32'h31fa31fa;
              4'h4: delta_pair = 32'h3e063e06;
              4'h5: delta_pair = 32'h3e513e51;
              4'h6: delta_pair = 32'h3e683e68;
              4'h7: delta_pair = 32'h3e8f3e8f;
              4'h8: delta_pair = 32'h3edd3edd;
              4'h9: delta_pair = 32'h3f133f13;
              4'ha: delta_pair = 32'h3f393f39;
              4'hb: delta_pair = 32'h3f493f49;
              4'hc: delta_pair = 32'h3f9b3f9b;
              4'hd: delta_pair = 32'h3fa23fa2;
              4'he: delta_pair = 32'h3ff53ff5;
              4'hf: delta_pair = 32'h3c033c03;
              default: begin end
            endcase
          end
          3'h7: begin
            delta_pair = 32'h3c2d3c2d;
            case (mant_lo4)
              4'h1: delta_pair = 32'h3c633c63;
              4'h2: delta_pair = 32'h3c8c3c8c;
              4'h3: delta_pair = 32'h3cd83cd8;
              4'h4: delta_pair = 32'h3d103d10;
              4'h5: delta_pair = 32'h3d353d35;
              4'h6: delta_pair = 32'h3d443d44;
              4'h7: delta_pair = 32'h3d983d98;
              4'h8: delta_pair = 32'h3dbf3dbf;
              4'h9: delta_pair = 32'h3df03df0;
              4'ha: delta_pair = 32'h3a003a00;
              4'hb: delta_pair = 32'h3a293a29;
              4'hc: delta_pair = 32'h3a7d3a7d;
              4'hd: delta_pair = 32'h3a883a88;
              4'he: delta_pair = 32'h3ad43ad4;
              4'hf: delta_pair = 32'h3aeb3aeb;
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
              4'h1: delta_pair = 32'h00a400a4;
              4'h2: delta_pair = 32'h00fa00fa;
              4'h3: delta_pair = 32'h03140314;
              4'h4: delta_pair = 32'h03b403b4;
              4'h5: delta_pair = 32'h03d403d4;
              4'h6: delta_pair = 32'h026b026b;
              4'h7: delta_pair = 32'h02860286;
              4'h8: delta_pair = 32'h1d281d28;
              4'h9: delta_pair = 32'h1d421d42;
              4'ha: delta_pair = 32'h1d9a1d9a;
              4'hb: delta_pair = 32'h1c3b1c3b;
              4'hc: delta_pair = 32'h1c5f1c5f;
              4'hd: delta_pair = 32'h1cf01cf0;
              4'he: delta_pair = 32'h1f0c1f0c;
              4'hf: delta_pair = 32'h1faf1faf;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h1fca1fca;
            case (mant_lo4)
              4'h1: delta_pair = 32'h1e601e60;
              4'h2: delta_pair = 32'h1ebe1ebe;
              4'h3: delta_pair = 32'h19221922;
              4'h4: delta_pair = 32'h19781978;
              4'h5: delta_pair = 32'h19921992;
              4'h6: delta_pair = 32'h18321832;
              4'h7: delta_pair = 32'h18521852;
              4'h8: delta_pair = 32'h18e918e9;
              4'h9: delta_pair = 32'h1b041b04;
              4'ha: delta_pair = 32'h1ba91ba9;
              4'hb: delta_pair = 32'h1bc11bc1;
              4'hc: delta_pair = 32'h1a181a18;
              4'hd: delta_pair = 32'h1ab91ab9;
              4'he: delta_pair = 32'h1ada1ada;
              4'hf: delta_pair = 32'h156e156e;
              default: begin end
            endcase
          end
          3'h2: begin
            delta_pair = 32'h158a158a;
            case (mant_lo4)
              4'h1: delta_pair = 32'h142c142c;
              4'h2: delta_pair = 32'h14491449;
              4'h3: delta_pair = 32'h149e149e;
              4'h4: delta_pair = 32'h173f173f;
              4'h5: delta_pair = 32'h17a317a3;
              4'h6: delta_pair = 32'h17f717f7;
              4'h7: delta_pair = 32'h16101610;
              4'h8: delta_pair = 32'h16b316b3;
              4'h9: delta_pair = 32'h16d116d1;
              4'ha: delta_pair = 32'h11671167;
              4'hb: delta_pair = 32'h11821182;
              4'hc: delta_pair = 32'h10261026;
              4'hd: delta_pair = 32'h107f107f;
              4'he: delta_pair = 32'h10961096;
              4'hf: delta_pair = 32'h13361336;
              default: begin end
            endcase
          end
          3'h3: begin
            delta_pair = 32'h12a112a1;
            case (mant_lo4)
              4'h0: delta_pair = 32'h13581358;
              4'h1: delta_pair = 32'h13ec13ec;
              4'h2: delta_pair = 32'h12081208;
              default: begin end
            endcase
          end
          3'h4: begin
            delta_pair = 32'h12a112a1;
          end
          3'h5: begin
            delta_pair = 32'h12a112a1;
          end
          3'h6: begin
            delta_pair = 32'h12a112a1;
          end
          3'h7: begin
            delta_pair = 32'h12a112a1;
          end
          default: begin end
        endcase
      end
      8'hff: begin
        case (mant_hi3)
          3'h0: begin
            delta_pair = 32'h80400040;
            case (mant_lo4)
              4'h0: delta_pair = 32'h00000000;
              default: begin end
            endcase
          end
          3'h1: begin
            delta_pair = 32'h80400040;
          end
          3'h2: begin
            delta_pair = 32'h80400040;
          end
          3'h3: begin
            delta_pair = 32'h80400040;
          end
          3'h4: begin
            delta_pair = 32'h80400040;
          end
          3'h5: begin
            delta_pair = 32'h80400040;
          end
          3'h6: begin
            delta_pair = 32'h80400040;
          end
          3'h7: begin
            delta_pair = 32'h80400040;
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
