module ex244_r60_gapcofactor_satsplit_field(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] ah = in[14:8];
  wire [6:0] bl = in[6:0];
  wire nan = (ah == 7'h7f) || (bl == 7'h7f);

  wire [3:0] ae = ah[6:3];
  wire [3:0] be = bl[6:3];
  wire exp_gt = (ae > be);
  wire exp_eq = (ae == be);
  wire sig_ge = (ah[2:0] >= bl[2:0]);
  wire a_ge_b = exp_gt || (exp_eq && sig_ge);
  wire [6:0] maxc = a_ge_b ? ah : bl;
  wire [6:0] minc = a_ge_b ? bl : ah;

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [3:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 4'd1 : v[6:3];
    end
  endfunction

  function [2:0] delta_gap0;
    input [3:0] max_sig;
    input [3:0] min_sig;
    reg [7:0] key;
    reg [2:0] delta;
    begin
      key = {max_sig, min_sig};
      delta = 3'd0;
      case (key)
        8'd34: delta = 3'd1;
        8'd50: delta = 3'd1;
        8'd51: delta = 3'd1;
        8'd67: delta = 3'd1;
        8'd68: delta = 3'd2;
        8'd83: delta = 3'd1;
        8'd84: delta = 3'd1;
        8'd85: delta = 3'd2;
        8'd99: delta = 3'd1;
        8'd100: delta = 3'd1;
        8'd101: delta = 3'd2;
        8'd102: delta = 3'd2;
        8'd115: delta = 3'd1;
        8'd116: delta = 3'd1;
        8'd117: delta = 3'd2;
        8'd118: delta = 3'd2;
        8'd119: delta = 3'd3;
        8'd131: delta = 3'd1;
        8'd132: delta = 3'd1;
        8'd133: delta = 3'd1;
        8'd134: delta = 3'd2;
        8'd135: delta = 3'd3;
        8'd136: delta = 3'd3;
        8'd148: delta = 3'd1;
        8'd149: delta = 3'd1;
        8'd150: delta = 3'd2;
        8'd151: delta = 3'd2;
        8'd152: delta = 3'd3;
        8'd153: delta = 3'd4;
        8'd164: delta = 3'd1;
        8'd165: delta = 3'd1;
        8'd166: delta = 3'd2;
        8'd167: delta = 3'd2;
        8'd168: delta = 3'd3;
        8'd169: delta = 3'd3;
        8'd170: delta = 3'd4;
        8'd180: delta = 3'd1;
        8'd181: delta = 3'd1;
        8'd182: delta = 3'd2;
        8'd183: delta = 3'd2;
        8'd184: delta = 3'd3;
        8'd185: delta = 3'd3;
        8'd186: delta = 3'd4;
        8'd187: delta = 3'd5;
        8'd196: delta = 3'd1;
        8'd197: delta = 3'd1;
        8'd198: delta = 3'd1;
        8'd199: delta = 3'd2;
        8'd200: delta = 3'd2;
        8'd201: delta = 3'd3;
        8'd202: delta = 3'd4;
        8'd203: delta = 3'd4;
        8'd204: delta = 3'd4;
        8'd212: delta = 3'd1;
        8'd213: delta = 3'd1;
        8'd214: delta = 3'd1;
        8'd215: delta = 3'd2;
        8'd216: delta = 3'd2;
        8'd217: delta = 3'd3;
        8'd218: delta = 3'd3;
        8'd219: delta = 3'd4;
        8'd220: delta = 3'd4;
        8'd221: delta = 3'd4;
        8'd228: delta = 3'd1;
        8'd229: delta = 3'd1;
        8'd230: delta = 3'd1;
        8'd231: delta = 3'd2;
        8'd232: delta = 3'd2;
        8'd233: delta = 3'd2;
        8'd234: delta = 3'd3;
        8'd235: delta = 3'd3;
        8'd236: delta = 3'd3;
        8'd237: delta = 3'd4;
        8'd238: delta = 3'd4;
        8'd244: delta = 3'd1;
        8'd245: delta = 3'd1;
        8'd246: delta = 3'd1;
        8'd247: delta = 3'd1;
        8'd248: delta = 3'd1;
        8'd249: delta = 3'd2;
        8'd250: delta = 3'd2;
        8'd251: delta = 3'd2;
        8'd252: delta = 3'd3;
        8'd253: delta = 3'd3;
        8'd254: delta = 3'd3;
        8'd255: delta = 3'd4;
        default: delta = 3'd0;
      endcase
      delta_gap0 = delta;
    end
  endfunction

  function [2:0] delta_gap1;
    input [3:0] max_sig;
    input [3:0] min_sig;
    reg [7:0] key;
    reg [2:0] delta;
    begin
      key = {max_sig, min_sig};
      delta = 3'd0;
      case (key)
        8'd134: delta = 3'd1;
        8'd135: delta = 3'd1;
        8'd136: delta = 3'd1;
        8'd137: delta = 3'd1;
        8'd138: delta = 3'd1;
        8'd139: delta = 3'd2;
        8'd140: delta = 3'd2;
        8'd141: delta = 3'd2;
        8'd142: delta = 3'd3;
        8'd143: delta = 3'd3;
        8'd151: delta = 3'd1;
        8'd152: delta = 3'd1;
        8'd153: delta = 3'd1;
        8'd154: delta = 3'd1;
        8'd155: delta = 3'd2;
        8'd156: delta = 3'd2;
        8'd157: delta = 3'd2;
        8'd158: delta = 3'd2;
        8'd159: delta = 3'd3;
        8'd167: delta = 3'd1;
        8'd168: delta = 3'd1;
        8'd169: delta = 3'd1;
        8'd170: delta = 3'd1;
        8'd171: delta = 3'd1;
        8'd172: delta = 3'd2;
        8'd173: delta = 3'd2;
        8'd174: delta = 3'd2;
        8'd175: delta = 3'd2;
        8'd183: delta = 3'd1;
        8'd184: delta = 3'd1;
        8'd185: delta = 3'd1;
        8'd186: delta = 3'd1;
        8'd187: delta = 3'd1;
        8'd188: delta = 3'd2;
        8'd189: delta = 3'd2;
        8'd190: delta = 3'd2;
        8'd191: delta = 3'd2;
        8'd200: delta = 3'd1;
        8'd201: delta = 3'd1;
        8'd202: delta = 3'd1;
        8'd203: delta = 3'd1;
        8'd204: delta = 3'd1;
        8'd205: delta = 3'd2;
        8'd206: delta = 3'd2;
        8'd207: delta = 3'd2;
        8'd216: delta = 3'd1;
        8'd217: delta = 3'd1;
        8'd218: delta = 3'd1;
        8'd219: delta = 3'd1;
        8'd220: delta = 3'd1;
        8'd221: delta = 3'd2;
        8'd222: delta = 3'd2;
        8'd223: delta = 3'd2;
        8'd232: delta = 3'd1;
        8'd233: delta = 3'd1;
        8'd234: delta = 3'd1;
        8'd235: delta = 3'd1;
        8'd236: delta = 3'd1;
        8'd237: delta = 3'd1;
        8'd238: delta = 3'd2;
        8'd239: delta = 3'd2;
        8'd248: delta = 3'd1;
        8'd249: delta = 3'd1;
        8'd250: delta = 3'd1;
        8'd251: delta = 3'd1;
        8'd252: delta = 3'd1;
        8'd253: delta = 3'd1;
        8'd254: delta = 3'd1;
        8'd255: delta = 3'd1;
        default: delta = 3'd0;
      endcase
      delta_gap1 = delta;
    end
  endfunction

  function [2:0] delta_gap2;
    input [3:0] max_sig;
    input [3:0] min_sig;
    reg [7:0] key;
    reg [2:0] delta;
    begin
      key = {max_sig, min_sig};
      delta = 3'd0;
      case (key)
        8'd140: delta = 3'd1;
        8'd141: delta = 3'd1;
        8'd142: delta = 3'd1;
        8'd143: delta = 3'd1;
        8'd157: delta = 3'd1;
        8'd158: delta = 3'd1;
        8'd159: delta = 3'd1;
        8'd173: delta = 3'd1;
        8'd174: delta = 3'd1;
        8'd175: delta = 3'd1;
        8'd190: delta = 3'd1;
        8'd191: delta = 3'd1;
        8'd207: delta = 3'd1;
        8'd223: delta = 3'd1;
        default: delta = 3'd0;
      endcase
      delta_gap2 = delta;
    end
  endfunction


  wire [3:0] max_eff = eff_exp(maxc);
  wire [3:0] min_eff = eff_exp(minc);
  wire [3:0] gap_full = max_eff - min_eff;
  wire [3:0] max_sig = sig4(maxc);
  wire [3:0] min_sig = sig4(minc);
  wire [2:0] delta0 = delta_gap0(max_sig, min_sig);
  wire [2:0] delta1 = delta_gap1(max_sig, min_sig);
  wire [2:0] delta2 = delta_gap2(max_sig, min_sig);
  wire [2:0] delta = (gap_full == 4'd0) ? delta0 :
                     (gap_full == 4'd1) ? delta1 :
                     (gap_full == 4'd2) ? delta2 : 3'd0;

  wire [7:0] raw = {1'b0, maxc} + {5'd0, delta};
  wire sat0 = (maxc == 7'h7e);
  wire sat1 = (delta >= 3'd1) && (maxc >= 7'h7d);
  wire sat2 = (delta >= 3'd2) && (maxc >= 7'h7c);
  wire sat3 = (delta >= 3'd3) && (maxc >= 7'h7b);
  wire sat4 = (delta >= 3'd4) && (maxc >= 7'h7a);
  wire sat5 = (delta >= 3'd5) && (maxc >= 7'h79);
  wire sat = sat0 || sat1 || sat2 || sat3 || sat4 || sat5;
  wire [6:0] out_mag = sat ? 7'h7e : raw[6:0];
  assign out = nan ? 8'h7f : {1'b0, out_mag};
endmodule
