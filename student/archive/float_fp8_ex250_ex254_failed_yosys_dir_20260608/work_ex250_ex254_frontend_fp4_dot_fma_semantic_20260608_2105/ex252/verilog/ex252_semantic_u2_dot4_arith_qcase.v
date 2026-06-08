module ex252_semantic_u2_dot4_arith_qcase(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [5:0] dot_sum = ({4'd0, in[9:8]} * {4'd0, in[1:0]}) + ({4'd0, in[11:10]} * {4'd0, in[3:2]}) + ({4'd0, in[13:12]} * {4'd0, in[5:4]}) + ({4'd0, in[15:14]} * {4'd0, in[7:6]});

  function [6:0] quant_scaled;
    input [9:0] value;
    begin
      case (value)
        10'd0: quant_scaled = 7'h00;
        10'd1: quant_scaled = 7'h28;
        10'd2: quant_scaled = 7'h30;
        10'd3: quant_scaled = 7'h34;
        10'd4: quant_scaled = 7'h38;
        10'd5: quant_scaled = 7'h3a;
        10'd6: quant_scaled = 7'h3c;
        10'd7: quant_scaled = 7'h3e;
        10'd8: quant_scaled = 7'h40;
        10'd9: quant_scaled = 7'h41;
        10'd10: quant_scaled = 7'h42;
        10'd11: quant_scaled = 7'h43;
        10'd12: quant_scaled = 7'h44;
        10'd13: quant_scaled = 7'h45;
        10'd14: quant_scaled = 7'h46;
        10'd15: quant_scaled = 7'h47;
        10'd16: quant_scaled = 7'h48;
        10'd17: quant_scaled = 7'h48;
        10'd18: quant_scaled = 7'h49;
        10'd19: quant_scaled = 7'h4a;
        10'd20: quant_scaled = 7'h4a;
        10'd21: quant_scaled = 7'h4a;
        10'd22: quant_scaled = 7'h4b;
        10'd23: quant_scaled = 7'h4c;
        10'd24: quant_scaled = 7'h4c;
        10'd25: quant_scaled = 7'h4c;
        10'd26: quant_scaled = 7'h4d;
        10'd27: quant_scaled = 7'h4e;
        10'd28: quant_scaled = 7'h4e;
        10'd29: quant_scaled = 7'h4e;
        10'd30: quant_scaled = 7'h4f;
        10'd31: quant_scaled = 7'h50;
        10'd32: quant_scaled = 7'h50;
        10'd33: quant_scaled = 7'h50;
        10'd34: quant_scaled = 7'h50;
        10'd35: quant_scaled = 7'h51;
        10'd36: quant_scaled = 7'h51;
        default: quant_scaled = 7'h7e;
      endcase
    end
  endfunction

  assign out = {1'b0, quant_scaled({4'd0, dot_sum})};
endmodule
