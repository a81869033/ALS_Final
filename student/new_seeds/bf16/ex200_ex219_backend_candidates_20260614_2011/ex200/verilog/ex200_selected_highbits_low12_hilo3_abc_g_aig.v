module ex200_selected_highbits_low12_hilo3(in, out);
  input [15:0] in;
  output [15:0] out;
  wire [8:0] sign_exp = in[15:7];
  wire [6:0] mant = in[6:0];
  reg [11:0] out_low;
  always @* begin
    case (sign_exp)
      9'd0: out_low = 12'd3968;
      9'd1: out_low = 12'd3968;
      9'd2: out_low = 12'd3968;
      9'd3: out_low = 12'd3968;
      9'd4: out_low = 12'd3968;
      9'd5: out_low = 12'd3968;
      9'd6: out_low = 12'd3968;
      9'd7: out_low = 12'd3968;
      9'd8: out_low = 12'd3968;
      9'd9: out_low = 12'd3968;
      9'd10: out_low = 12'd3968;
      9'd11: out_low = 12'd3968;
      9'd12: out_low = 12'd3968;
      9'd13: out_low = 12'd3968;
      9'd14: out_low = 12'd3968;
      9'd15: out_low = 12'd3968;
      9'd16: out_low = 12'd3968;
      9'd17: out_low = 12'd3968;
      9'd18: out_low = 12'd3968;
      9'd19: out_low = 12'd3968;
      9'd20: out_low = 12'd3968;
      9'd21: out_low = 12'd3968;
      9'd22: out_low = 12'd3968;
      9'd23: out_low = 12'd3968;
      9'd24: out_low = 12'd3968;
      9'd25: out_low = 12'd3968;
      9'd26: out_low = 12'd3968;
      9'd27: out_low = 12'd3968;
      9'd28: out_low = 12'd3968;
      9'd29: out_low = 12'd3968;
      9'd30: out_low = 12'd3968;
      9'd31: out_low = 12'd3968;
      9'd32: out_low = 12'd3968;
      9'd33: out_low = 12'd3968;
      9'd34: out_low = 12'd3968;
      9'd35: out_low = 12'd3968;
      9'd36: out_low = 12'd3968;
      9'd37: out_low = 12'd3968;
      9'd38: out_low = 12'd3968;
      9'd39: out_low = 12'd3968;
      9'd40: out_low = 12'd3968;
      9'd41: out_low = 12'd3968;
      9'd42: out_low = 12'd3968;
      9'd43: out_low = 12'd3968;
      9'd44: out_low = 12'd3968;
      9'd45: out_low = 12'd3968;
      9'd46: out_low = 12'd3968;
      9'd47: out_low = 12'd3968;
      9'd48: out_low = 12'd3968;
      9'd49: out_low = 12'd3968;
      9'd50: out_low = 12'd3968;
      9'd51: out_low = 12'd3968;
      9'd52: out_low = 12'd3968;
      9'd53: out_low = 12'd3968;
      9'd54: out_low = 12'd3968;
      9'd55: out_low = 12'd3968;
      9'd56: out_low = 12'd3968;
      9'd57: out_low = 12'd3968;
      9'd58: out_low = 12'd3968;
      9'd59: out_low = 12'd3968;
      9'd60: out_low = 12'd3968;
      9'd61: out_low = 12'd3968;
      9'd62: out_low = 12'd3968;
      9'd63: out_low = 12'd3968;
      9'd64: out_low = 12'd3968;
      9'd65: out_low = 12'd3968;
      9'd66: out_low = 12'd3968;
      9'd67: out_low = 12'd3968;
      9'd68: out_low = 12'd3968;
      9'd69: out_low = 12'd3968;
      9'd70: out_low = 12'd3968;
      9'd71: out_low = 12'd3968;
      9'd72: out_low = 12'd3968;
      9'd73: out_low = 12'd3968;
      9'd74: out_low = 12'd3968;
      9'd75: out_low = 12'd3968;
      9'd76: out_low = 12'd3968;
      9'd77: out_low = 12'd3968;
      9'd78: out_low = 12'd3968;
      9'd79: out_low = 12'd3968;
      9'd80: out_low = 12'd3968;
      9'd81: out_low = 12'd3968;
      9'd82: out_low = 12'd3968;
      9'd83: out_low = 12'd3968;
      9'd84: out_low = 12'd3968;
      9'd85: out_low = 12'd3968;
      9'd86: out_low = 12'd3968;
      9'd87: out_low = 12'd3968;
      9'd88: out_low = 12'd3968;
      9'd89: out_low = 12'd3968;
      9'd90: out_low = 12'd3968;
      9'd91: out_low = 12'd3968;
      9'd92: out_low = 12'd3968;
      9'd93: out_low = 12'd3968;
      9'd94: out_low = 12'd3968;
      9'd95: out_low = 12'd3968;
      9'd96: out_low = 12'd3968;
      9'd97: out_low = 12'd3968;
      9'd98: out_low = 12'd3968;
      9'd99: out_low = 12'd3968;
      9'd100: out_low = 12'd3968;
      9'd101: out_low = 12'd3968;
      9'd102: out_low = 12'd3968;
      9'd103: out_low = 12'd3968;
      9'd104: out_low = 12'd3968;
      9'd105: out_low = 12'd3968;
      9'd106: out_low = 12'd3968;
      9'd107: out_low = 12'd3968;
      9'd108: out_low = 12'd3968;
      9'd109: out_low = 12'd3968;
      9'd110: out_low = 12'd3968;
      9'd111: out_low = 12'd3968;
      9'd112: out_low = 12'd3968;
      9'd113: out_low = 12'd3968;
      9'd114: out_low = 12'd3968;
      9'd115: out_low = 12'd3968;
      9'd116: out_low = 12'd3968;
      9'd117: out_low = 12'd3968;
      9'd118: out_low = 12'd3968;
      9'd119: out_low = 12'd3969;
      9'd120: begin
        case (mant[6:4])
          3'd0: out_low = 12'd3969;
          3'd1: out_low = 12'd3969;
          3'd2: out_low = 12'd3969;
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3969;
              4'd1: out_low = 12'd3969;
              4'd2: out_low = 12'd3969;
              4'd3: out_low = 12'd3969;
              4'd4: out_low = 12'd3969;
              4'd5: out_low = 12'd3969;
              4'd6: out_low = 12'd3969;
              4'd7: out_low = 12'd3969;
              4'd8: out_low = 12'd3969;
              4'd9: out_low = 12'd3969;
              4'd10: out_low = 12'd3969;
              4'd11: out_low = 12'd3969;
              4'd12: out_low = 12'd3969;
              4'd13: out_low = 12'd3969;
              4'd14: out_low = 12'd3969;
              4'd15: out_low = 12'd3970;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: out_low = 12'd3970;
          3'd5: out_low = 12'd3970;
          3'd6: out_low = 12'd3970;
          3'd7: out_low = 12'd3970;
          default: out_low = 12'd0;
        endcase
      end
      9'd121: begin
        case (mant[6:4])
          3'd0: out_low = 12'd3970;
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3970;
              4'd1: out_low = 12'd3970;
              4'd2: out_low = 12'd3970;
              4'd3: out_low = 12'd3970;
              4'd4: out_low = 12'd3970;
              4'd5: out_low = 12'd3970;
              4'd6: out_low = 12'd3970;
              4'd7: out_low = 12'd3970;
              4'd8: out_low = 12'd3970;
              4'd9: out_low = 12'd3970;
              4'd10: out_low = 12'd3970;
              4'd11: out_low = 12'd3970;
              4'd12: out_low = 12'd3970;
              4'd13: out_low = 12'd3970;
              4'd14: out_low = 12'd3970;
              4'd15: out_low = 12'd3971;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: out_low = 12'd3971;
          3'd3: out_low = 12'd3971;
          3'd4: out_low = 12'd3971;
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3971;
              4'd1: out_low = 12'd3971;
              4'd2: out_low = 12'd3971;
              4'd3: out_low = 12'd3971;
              4'd4: out_low = 12'd3971;
              4'd5: out_low = 12'd3971;
              4'd6: out_low = 12'd3971;
              4'd7: out_low = 12'd3971;
              4'd8: out_low = 12'd3971;
              4'd9: out_low = 12'd3971;
              4'd10: out_low = 12'd3971;
              4'd11: out_low = 12'd3971;
              4'd12: out_low = 12'd3971;
              4'd13: out_low = 12'd3972;
              4'd14: out_low = 12'd3972;
              4'd15: out_low = 12'd3972;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: out_low = 12'd3972;
          3'd7: out_low = 12'd3972;
          default: out_low = 12'd0;
        endcase
      end
      9'd122: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3972;
              4'd1: out_low = 12'd3972;
              4'd2: out_low = 12'd3972;
              4'd3: out_low = 12'd3972;
              4'd4: out_low = 12'd3972;
              4'd5: out_low = 12'd3972;
              4'd6: out_low = 12'd3972;
              4'd7: out_low = 12'd3972;
              4'd8: out_low = 12'd3972;
              4'd9: out_low = 12'd3972;
              4'd10: out_low = 12'd3972;
              4'd11: out_low = 12'd3972;
              4'd12: out_low = 12'd3972;
              4'd13: out_low = 12'd3972;
              4'd14: out_low = 12'd3973;
              4'd15: out_low = 12'd3973;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: out_low = 12'd3973;
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3973;
              4'd1: out_low = 12'd3973;
              4'd2: out_low = 12'd3973;
              4'd3: out_low = 12'd3973;
              4'd4: out_low = 12'd3973;
              4'd5: out_low = 12'd3973;
              4'd6: out_low = 12'd3973;
              4'd7: out_low = 12'd3973;
              4'd8: out_low = 12'd3973;
              4'd9: out_low = 12'd3973;
              4'd10: out_low = 12'd3973;
              4'd11: out_low = 12'd3973;
              4'd12: out_low = 12'd3973;
              4'd13: out_low = 12'd3974;
              4'd14: out_low = 12'd3974;
              4'd15: out_low = 12'd3974;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: out_low = 12'd3974;
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3974;
              4'd1: out_low = 12'd3974;
              4'd2: out_low = 12'd3974;
              4'd3: out_low = 12'd3974;
              4'd4: out_low = 12'd3974;
              4'd5: out_low = 12'd3974;
              4'd6: out_low = 12'd3974;
              4'd7: out_low = 12'd3974;
              4'd8: out_low = 12'd3974;
              4'd9: out_low = 12'd3974;
              4'd10: out_low = 12'd3974;
              4'd11: out_low = 12'd3975;
              4'd12: out_low = 12'd3975;
              4'd13: out_low = 12'd3975;
              4'd14: out_low = 12'd3975;
              4'd15: out_low = 12'd3975;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: out_low = 12'd3975;
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3975;
              4'd1: out_low = 12'd3975;
              4'd2: out_low = 12'd3975;
              4'd3: out_low = 12'd3975;
              4'd4: out_low = 12'd3975;
              4'd5: out_low = 12'd3975;
              4'd6: out_low = 12'd3975;
              4'd7: out_low = 12'd3975;
              4'd8: out_low = 12'd3975;
              4'd9: out_low = 12'd3975;
              4'd10: out_low = 12'd3976;
              4'd11: out_low = 12'd3976;
              4'd12: out_low = 12'd3976;
              4'd13: out_low = 12'd3976;
              4'd14: out_low = 12'd3976;
              4'd15: out_low = 12'd3976;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: out_low = 12'd3976;
          default: out_low = 12'd0;
        endcase
      end
      9'd123: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3976;
              4'd1: out_low = 12'd3976;
              4'd2: out_low = 12'd3976;
              4'd3: out_low = 12'd3976;
              4'd4: out_low = 12'd3977;
              4'd5: out_low = 12'd3977;
              4'd6: out_low = 12'd3977;
              4'd7: out_low = 12'd3977;
              4'd8: out_low = 12'd3977;
              4'd9: out_low = 12'd3977;
              4'd10: out_low = 12'd3977;
              4'd11: out_low = 12'd3977;
              4'd12: out_low = 12'd3977;
              4'd13: out_low = 12'd3977;
              4'd14: out_low = 12'd3977;
              4'd15: out_low = 12'd3977;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3977;
              4'd1: out_low = 12'd3977;
              4'd2: out_low = 12'd3977;
              4'd3: out_low = 12'd3978;
              4'd4: out_low = 12'd3978;
              4'd5: out_low = 12'd3978;
              4'd6: out_low = 12'd3978;
              4'd7: out_low = 12'd3978;
              4'd8: out_low = 12'd3978;
              4'd9: out_low = 12'd3978;
              4'd10: out_low = 12'd3978;
              4'd11: out_low = 12'd3978;
              4'd12: out_low = 12'd3978;
              4'd13: out_low = 12'd3978;
              4'd14: out_low = 12'd3978;
              4'd15: out_low = 12'd3978;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3978;
              4'd1: out_low = 12'd3978;
              4'd2: out_low = 12'd3979;
              4'd3: out_low = 12'd3979;
              4'd4: out_low = 12'd3979;
              4'd5: out_low = 12'd3979;
              4'd6: out_low = 12'd3979;
              4'd7: out_low = 12'd3979;
              4'd8: out_low = 12'd3979;
              4'd9: out_low = 12'd3979;
              4'd10: out_low = 12'd3979;
              4'd11: out_low = 12'd3979;
              4'd12: out_low = 12'd3979;
              4'd13: out_low = 12'd3979;
              4'd14: out_low = 12'd3979;
              4'd15: out_low = 12'd3979;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3979;
              4'd1: out_low = 12'd3980;
              4'd2: out_low = 12'd3980;
              4'd3: out_low = 12'd3980;
              4'd4: out_low = 12'd3980;
              4'd5: out_low = 12'd3980;
              4'd6: out_low = 12'd3980;
              4'd7: out_low = 12'd3980;
              4'd8: out_low = 12'd3980;
              4'd9: out_low = 12'd3980;
              4'd10: out_low = 12'd3980;
              4'd11: out_low = 12'd3980;
              4'd12: out_low = 12'd3980;
              4'd13: out_low = 12'd3980;
              4'd14: out_low = 12'd3980;
              4'd15: out_low = 12'd3981;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3981;
              4'd1: out_low = 12'd3981;
              4'd2: out_low = 12'd3981;
              4'd3: out_low = 12'd3981;
              4'd4: out_low = 12'd3981;
              4'd5: out_low = 12'd3981;
              4'd6: out_low = 12'd3981;
              4'd7: out_low = 12'd3981;
              4'd8: out_low = 12'd3981;
              4'd9: out_low = 12'd3981;
              4'd10: out_low = 12'd3981;
              4'd11: out_low = 12'd3981;
              4'd12: out_low = 12'd3981;
              4'd13: out_low = 12'd3981;
              4'd14: out_low = 12'd3982;
              4'd15: out_low = 12'd3982;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3982;
              4'd1: out_low = 12'd3982;
              4'd2: out_low = 12'd3982;
              4'd3: out_low = 12'd3982;
              4'd4: out_low = 12'd3982;
              4'd5: out_low = 12'd3982;
              4'd6: out_low = 12'd3982;
              4'd7: out_low = 12'd3982;
              4'd8: out_low = 12'd3982;
              4'd9: out_low = 12'd3982;
              4'd10: out_low = 12'd3982;
              4'd11: out_low = 12'd3982;
              4'd12: out_low = 12'd3983;
              4'd13: out_low = 12'd3983;
              4'd14: out_low = 12'd3983;
              4'd15: out_low = 12'd3983;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3983;
              4'd1: out_low = 12'd3983;
              4'd2: out_low = 12'd3983;
              4'd3: out_low = 12'd3983;
              4'd4: out_low = 12'd3983;
              4'd5: out_low = 12'd3983;
              4'd6: out_low = 12'd3983;
              4'd7: out_low = 12'd3983;
              4'd8: out_low = 12'd3983;
              4'd9: out_low = 12'd3983;
              4'd10: out_low = 12'd3983;
              4'd11: out_low = 12'd3984;
              4'd12: out_low = 12'd3984;
              4'd13: out_low = 12'd3984;
              4'd14: out_low = 12'd3984;
              4'd15: out_low = 12'd3984;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3984;
              4'd1: out_low = 12'd3984;
              4'd2: out_low = 12'd3984;
              4'd3: out_low = 12'd3984;
              4'd4: out_low = 12'd3984;
              4'd5: out_low = 12'd3984;
              4'd6: out_low = 12'd3984;
              4'd7: out_low = 12'd3984;
              4'd8: out_low = 12'd3984;
              4'd9: out_low = 12'd3985;
              4'd10: out_low = 12'd3985;
              4'd11: out_low = 12'd3985;
              4'd12: out_low = 12'd3985;
              4'd13: out_low = 12'd3985;
              4'd14: out_low = 12'd3985;
              4'd15: out_low = 12'd3985;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd124: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3985;
              4'd1: out_low = 12'd3985;
              4'd2: out_low = 12'd3985;
              4'd3: out_low = 12'd3985;
              4'd4: out_low = 12'd3986;
              4'd5: out_low = 12'd3986;
              4'd6: out_low = 12'd3986;
              4'd7: out_low = 12'd3986;
              4'd8: out_low = 12'd3986;
              4'd9: out_low = 12'd3986;
              4'd10: out_low = 12'd3986;
              4'd11: out_low = 12'd3987;
              4'd12: out_low = 12'd3987;
              4'd13: out_low = 12'd3987;
              4'd14: out_low = 12'd3987;
              4'd15: out_low = 12'd3987;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3987;
              4'd1: out_low = 12'd3987;
              4'd2: out_low = 12'd3988;
              4'd3: out_low = 12'd3988;
              4'd4: out_low = 12'd3988;
              4'd5: out_low = 12'd3988;
              4'd6: out_low = 12'd3988;
              4'd7: out_low = 12'd3988;
              4'd8: out_low = 12'd3988;
              4'd9: out_low = 12'd3989;
              4'd10: out_low = 12'd3989;
              4'd11: out_low = 12'd3989;
              4'd12: out_low = 12'd3989;
              4'd13: out_low = 12'd3989;
              4'd14: out_low = 12'd3989;
              4'd15: out_low = 12'd3990;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3990;
              4'd1: out_low = 12'd3990;
              4'd2: out_low = 12'd3990;
              4'd3: out_low = 12'd3990;
              4'd4: out_low = 12'd3990;
              4'd5: out_low = 12'd3990;
              4'd6: out_low = 12'd3991;
              4'd7: out_low = 12'd3991;
              4'd8: out_low = 12'd3991;
              4'd9: out_low = 12'd3991;
              4'd10: out_low = 12'd3991;
              4'd11: out_low = 12'd3991;
              4'd12: out_low = 12'd3991;
              4'd13: out_low = 12'd3992;
              4'd14: out_low = 12'd3992;
              4'd15: out_low = 12'd3992;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3992;
              4'd1: out_low = 12'd3992;
              4'd2: out_low = 12'd3992;
              4'd3: out_low = 12'd3992;
              4'd4: out_low = 12'd3993;
              4'd5: out_low = 12'd3993;
              4'd6: out_low = 12'd3993;
              4'd7: out_low = 12'd3993;
              4'd8: out_low = 12'd3993;
              4'd9: out_low = 12'd3993;
              4'd10: out_low = 12'd3993;
              4'd11: out_low = 12'd3994;
              4'd12: out_low = 12'd3994;
              4'd13: out_low = 12'd3994;
              4'd14: out_low = 12'd3994;
              4'd15: out_low = 12'd3994;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3994;
              4'd1: out_low = 12'd3995;
              4'd2: out_low = 12'd3995;
              4'd3: out_low = 12'd3995;
              4'd4: out_low = 12'd3995;
              4'd5: out_low = 12'd3995;
              4'd6: out_low = 12'd3995;
              4'd7: out_low = 12'd3995;
              4'd8: out_low = 12'd3996;
              4'd9: out_low = 12'd3996;
              4'd10: out_low = 12'd3996;
              4'd11: out_low = 12'd3996;
              4'd12: out_low = 12'd3996;
              4'd13: out_low = 12'd3996;
              4'd14: out_low = 12'd3997;
              4'd15: out_low = 12'd3997;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3997;
              4'd1: out_low = 12'd3997;
              4'd2: out_low = 12'd3997;
              4'd3: out_low = 12'd3997;
              4'd4: out_low = 12'd3997;
              4'd5: out_low = 12'd3998;
              4'd6: out_low = 12'd3998;
              4'd7: out_low = 12'd3998;
              4'd8: out_low = 12'd3998;
              4'd9: out_low = 12'd3998;
              4'd10: out_low = 12'd3998;
              4'd11: out_low = 12'd3999;
              4'd12: out_low = 12'd3999;
              4'd13: out_low = 12'd3999;
              4'd14: out_low = 12'd3999;
              4'd15: out_low = 12'd3999;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3999;
              4'd1: out_low = 12'd3999;
              4'd2: out_low = 12'd4000;
              4'd3: out_low = 12'd4000;
              4'd4: out_low = 12'd4000;
              4'd5: out_low = 12'd4000;
              4'd6: out_low = 12'd4000;
              4'd7: out_low = 12'd4000;
              4'd8: out_low = 12'd4001;
              4'd9: out_low = 12'd4001;
              4'd10: out_low = 12'd4001;
              4'd11: out_low = 12'd4001;
              4'd12: out_low = 12'd4001;
              4'd13: out_low = 12'd4001;
              4'd14: out_low = 12'd4001;
              4'd15: out_low = 12'd4002;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd4002;
              4'd1: out_low = 12'd4002;
              4'd2: out_low = 12'd4002;
              4'd3: out_low = 12'd4002;
              4'd4: out_low = 12'd4002;
              4'd5: out_low = 12'd4003;
              4'd6: out_low = 12'd4003;
              4'd7: out_low = 12'd4003;
              4'd8: out_low = 12'd4003;
              4'd9: out_low = 12'd4003;
              4'd10: out_low = 12'd4003;
              4'd11: out_low = 12'd4004;
              4'd12: out_low = 12'd4004;
              4'd13: out_low = 12'd4004;
              4'd14: out_low = 12'd4004;
              4'd15: out_low = 12'd4004;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd125: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd4004;
              4'd1: out_low = 12'd4005;
              4'd2: out_low = 12'd4005;
              4'd3: out_low = 12'd4005;
              4'd4: out_low = 12'd4006;
              4'd5: out_low = 12'd4006;
              4'd6: out_low = 12'd4006;
              4'd7: out_low = 12'd4007;
              4'd8: out_low = 12'd4007;
              4'd9: out_low = 12'd4007;
              4'd10: out_low = 12'd4008;
              4'd11: out_low = 12'd4008;
              4'd12: out_low = 12'd4008;
              4'd13: out_low = 12'd4009;
              4'd14: out_low = 12'd4009;
              4'd15: out_low = 12'd4009;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd4010;
              4'd1: out_low = 12'd4010;
              4'd2: out_low = 12'd4010;
              4'd3: out_low = 12'd4011;
              4'd4: out_low = 12'd4011;
              4'd5: out_low = 12'd4011;
              4'd6: out_low = 12'd4012;
              4'd7: out_low = 12'd4012;
              4'd8: out_low = 12'd4012;
              4'd9: out_low = 12'd4013;
              4'd10: out_low = 12'd4013;
              4'd11: out_low = 12'd4013;
              4'd12: out_low = 12'd4014;
              4'd13: out_low = 12'd4014;
              4'd14: out_low = 12'd4014;
              4'd15: out_low = 12'd4015;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd4015;
              4'd1: out_low = 12'd4015;
              4'd2: out_low = 12'd4016;
              4'd3: out_low = 12'd4016;
              4'd4: out_low = 12'd4016;
              4'd5: out_low = 12'd4017;
              4'd6: out_low = 12'd4017;
              4'd7: out_low = 12'd4017;
              4'd8: out_low = 12'd4018;
              4'd9: out_low = 12'd4018;
              4'd10: out_low = 12'd4018;
              4'd11: out_low = 12'd4019;
              4'd12: out_low = 12'd4019;
              4'd13: out_low = 12'd4019;
              4'd14: out_low = 12'd4020;
              4'd15: out_low = 12'd4020;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd4021;
              4'd1: out_low = 12'd4021;
              4'd2: out_low = 12'd4021;
              4'd3: out_low = 12'd4022;
              4'd4: out_low = 12'd4022;
              4'd5: out_low = 12'd4022;
              4'd6: out_low = 12'd4023;
              4'd7: out_low = 12'd4023;
              4'd8: out_low = 12'd4023;
              4'd9: out_low = 12'd4024;
              4'd10: out_low = 12'd4024;
              4'd11: out_low = 12'd4024;
              4'd12: out_low = 12'd4025;
              4'd13: out_low = 12'd4025;
              4'd14: out_low = 12'd4026;
              4'd15: out_low = 12'd4026;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd4026;
              4'd1: out_low = 12'd4027;
              4'd2: out_low = 12'd4027;
              4'd3: out_low = 12'd4027;
              4'd4: out_low = 12'd4028;
              4'd5: out_low = 12'd4028;
              4'd6: out_low = 12'd4028;
              4'd7: out_low = 12'd4029;
              4'd8: out_low = 12'd4029;
              4'd9: out_low = 12'd4030;
              4'd10: out_low = 12'd4030;
              4'd11: out_low = 12'd4030;
              4'd12: out_low = 12'd4031;
              4'd13: out_low = 12'd4031;
              4'd14: out_low = 12'd4031;
              4'd15: out_low = 12'd4032;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd4032;
              4'd1: out_low = 12'd4033;
              4'd2: out_low = 12'd4033;
              4'd3: out_low = 12'd4033;
              4'd4: out_low = 12'd4034;
              4'd5: out_low = 12'd4034;
              4'd6: out_low = 12'd4034;
              4'd7: out_low = 12'd4035;
              4'd8: out_low = 12'd4035;
              4'd9: out_low = 12'd4036;
              4'd10: out_low = 12'd4036;
              4'd11: out_low = 12'd4036;
              4'd12: out_low = 12'd4037;
              4'd13: out_low = 12'd4037;
              4'd14: out_low = 12'd4037;
              4'd15: out_low = 12'd4038;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd4038;
              4'd1: out_low = 12'd4039;
              4'd2: out_low = 12'd4039;
              4'd3: out_low = 12'd4039;
              4'd4: out_low = 12'd4040;
              4'd5: out_low = 12'd4040;
              4'd6: out_low = 12'd4041;
              4'd7: out_low = 12'd4041;
              4'd8: out_low = 12'd4041;
              4'd9: out_low = 12'd4042;
              4'd10: out_low = 12'd4042;
              4'd11: out_low = 12'd4043;
              4'd12: out_low = 12'd4043;
              4'd13: out_low = 12'd4043;
              4'd14: out_low = 12'd4044;
              4'd15: out_low = 12'd4044;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd4045;
              4'd1: out_low = 12'd4045;
              4'd2: out_low = 12'd4045;
              4'd3: out_low = 12'd4046;
              4'd4: out_low = 12'd4046;
              4'd5: out_low = 12'd4047;
              4'd6: out_low = 12'd4047;
              4'd7: out_low = 12'd4047;
              4'd8: out_low = 12'd4048;
              4'd9: out_low = 12'd4048;
              4'd10: out_low = 12'd4049;
              4'd11: out_low = 12'd4049;
              4'd12: out_low = 12'd4049;
              4'd13: out_low = 12'd4050;
              4'd14: out_low = 12'd4050;
              4'd15: out_low = 12'd4051;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd126: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd4051;
              4'd1: out_low = 12'd4052;
              4'd2: out_low = 12'd4053;
              4'd3: out_low = 12'd4054;
              4'd4: out_low = 12'd4054;
              4'd5: out_low = 12'd4055;
              4'd6: out_low = 12'd4056;
              4'd7: out_low = 12'd4057;
              4'd8: out_low = 12'd4058;
              4'd9: out_low = 12'd4059;
              4'd10: out_low = 12'd4059;
              4'd11: out_low = 12'd4060;
              4'd12: out_low = 12'd4061;
              4'd13: out_low = 12'd4062;
              4'd14: out_low = 12'd4063;
              4'd15: out_low = 12'd4064;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd4065;
              4'd1: out_low = 12'd4066;
              4'd2: out_low = 12'd4066;
              4'd3: out_low = 12'd4067;
              4'd4: out_low = 12'd4068;
              4'd5: out_low = 12'd4069;
              4'd6: out_low = 12'd4070;
              4'd7: out_low = 12'd4071;
              4'd8: out_low = 12'd4072;
              4'd9: out_low = 12'd4073;
              4'd10: out_low = 12'd4074;
              4'd11: out_low = 12'd4075;
              4'd12: out_low = 12'd4075;
              4'd13: out_low = 12'd4076;
              4'd14: out_low = 12'd4077;
              4'd15: out_low = 12'd4078;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd4079;
              4'd1: out_low = 12'd4080;
              4'd2: out_low = 12'd4081;
              4'd3: out_low = 12'd4082;
              4'd4: out_low = 12'd4083;
              4'd5: out_low = 12'd4084;
              4'd6: out_low = 12'd4085;
              4'd7: out_low = 12'd4086;
              4'd8: out_low = 12'd4087;
              4'd9: out_low = 12'd4088;
              4'd10: out_low = 12'd4089;
              4'd11: out_low = 12'd4090;
              4'd12: out_low = 12'd4091;
              4'd13: out_low = 12'd4092;
              4'd14: out_low = 12'd4093;
              4'd15: out_low = 12'd4094;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd4095;
              4'd1: out_low = 12'd0;
              4'd2: out_low = 12'd0;
              4'd3: out_low = 12'd1;
              4'd4: out_low = 12'd1;
              4'd5: out_low = 12'd2;
              4'd6: out_low = 12'd2;
              4'd7: out_low = 12'd3;
              4'd8: out_low = 12'd3;
              4'd9: out_low = 12'd4;
              4'd10: out_low = 12'd4;
              4'd11: out_low = 12'd5;
              4'd12: out_low = 12'd5;
              4'd13: out_low = 12'd6;
              4'd14: out_low = 12'd6;
              4'd15: out_low = 12'd7;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd7;
              4'd1: out_low = 12'd8;
              4'd2: out_low = 12'd9;
              4'd3: out_low = 12'd9;
              4'd4: out_low = 12'd10;
              4'd5: out_low = 12'd10;
              4'd6: out_low = 12'd11;
              4'd7: out_low = 12'd11;
              4'd8: out_low = 12'd12;
              4'd9: out_low = 12'd12;
              4'd10: out_low = 12'd13;
              4'd11: out_low = 12'd13;
              4'd12: out_low = 12'd14;
              4'd13: out_low = 12'd15;
              4'd14: out_low = 12'd15;
              4'd15: out_low = 12'd16;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd16;
              4'd1: out_low = 12'd17;
              4'd2: out_low = 12'd17;
              4'd3: out_low = 12'd18;
              4'd4: out_low = 12'd18;
              4'd5: out_low = 12'd19;
              4'd6: out_low = 12'd20;
              4'd7: out_low = 12'd20;
              4'd8: out_low = 12'd21;
              4'd9: out_low = 12'd21;
              4'd10: out_low = 12'd22;
              4'd11: out_low = 12'd23;
              4'd12: out_low = 12'd23;
              4'd13: out_low = 12'd24;
              4'd14: out_low = 12'd24;
              4'd15: out_low = 12'd25;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd26;
              4'd1: out_low = 12'd26;
              4'd2: out_low = 12'd27;
              4'd3: out_low = 12'd27;
              4'd4: out_low = 12'd28;
              4'd5: out_low = 12'd29;
              4'd6: out_low = 12'd29;
              4'd7: out_low = 12'd30;
              4'd8: out_low = 12'd30;
              4'd9: out_low = 12'd31;
              4'd10: out_low = 12'd32;
              4'd11: out_low = 12'd32;
              4'd12: out_low = 12'd33;
              4'd13: out_low = 12'd34;
              4'd14: out_low = 12'd34;
              4'd15: out_low = 12'd35;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd35;
              4'd1: out_low = 12'd36;
              4'd2: out_low = 12'd37;
              4'd3: out_low = 12'd37;
              4'd4: out_low = 12'd38;
              4'd5: out_low = 12'd39;
              4'd6: out_low = 12'd39;
              4'd7: out_low = 12'd40;
              4'd8: out_low = 12'd41;
              4'd9: out_low = 12'd41;
              4'd10: out_low = 12'd42;
              4'd11: out_low = 12'd43;
              4'd12: out_low = 12'd43;
              4'd13: out_low = 12'd44;
              4'd14: out_low = 12'd45;
              4'd15: out_low = 12'd45;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd127: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd46;
              4'd1: out_low = 12'd47;
              4'd2: out_low = 12'd49;
              4'd3: out_low = 12'd50;
              4'd4: out_low = 12'd51;
              4'd5: out_low = 12'd53;
              4'd6: out_low = 12'd54;
              4'd7: out_low = 12'd56;
              4'd8: out_low = 12'd57;
              4'd9: out_low = 12'd59;
              4'd10: out_low = 12'd60;
              4'd11: out_low = 12'd62;
              4'd12: out_low = 12'd63;
              4'd13: out_low = 12'd65;
              4'd14: out_low = 12'd66;
              4'd15: out_low = 12'd68;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd69;
              4'd1: out_low = 12'd71;
              4'd2: out_low = 12'd72;
              4'd3: out_low = 12'd74;
              4'd4: out_low = 12'd75;
              4'd5: out_low = 12'd77;
              4'd6: out_low = 12'd79;
              4'd7: out_low = 12'd80;
              4'd8: out_low = 12'd82;
              4'd9: out_low = 12'd83;
              4'd10: out_low = 12'd85;
              4'd11: out_low = 12'd87;
              4'd12: out_low = 12'd89;
              4'd13: out_low = 12'd90;
              4'd14: out_low = 12'd92;
              4'd15: out_low = 12'd94;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd95;
              4'd1: out_low = 12'd97;
              4'd2: out_low = 12'd99;
              4'd3: out_low = 12'd101;
              4'd4: out_low = 12'd102;
              4'd5: out_low = 12'd104;
              4'd6: out_low = 12'd106;
              4'd7: out_low = 12'd108;
              4'd8: out_low = 12'd110;
              4'd9: out_low = 12'd112;
              4'd10: out_low = 12'd114;
              4'd11: out_low = 12'd115;
              4'd12: out_low = 12'd117;
              4'd13: out_low = 12'd119;
              4'd14: out_low = 12'd121;
              4'd15: out_low = 12'd123;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd125;
              4'd1: out_low = 12'd127;
              4'd2: out_low = 12'd129;
              4'd3: out_low = 12'd130;
              4'd4: out_low = 12'd131;
              4'd5: out_low = 12'd132;
              4'd6: out_low = 12'd133;
              4'd7: out_low = 12'd134;
              4'd8: out_low = 12'd135;
              4'd9: out_low = 12'd136;
              4'd10: out_low = 12'd137;
              4'd11: out_low = 12'd138;
              4'd12: out_low = 12'd139;
              4'd13: out_low = 12'd140;
              4'd14: out_low = 12'd141;
              4'd15: out_low = 12'd142;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd143;
              4'd1: out_low = 12'd145;
              4'd2: out_low = 12'd146;
              4'd3: out_low = 12'd147;
              4'd4: out_low = 12'd148;
              4'd5: out_low = 12'd149;
              4'd6: out_low = 12'd150;
              4'd7: out_low = 12'd151;
              4'd8: out_low = 12'd153;
              4'd9: out_low = 12'd154;
              4'd10: out_low = 12'd155;
              4'd11: out_low = 12'd156;
              4'd12: out_low = 12'd158;
              4'd13: out_low = 12'd159;
              4'd14: out_low = 12'd160;
              4'd15: out_low = 12'd161;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd163;
              4'd1: out_low = 12'd164;
              4'd2: out_low = 12'd165;
              4'd3: out_low = 12'd166;
              4'd4: out_low = 12'd168;
              4'd5: out_low = 12'd169;
              4'd6: out_low = 12'd170;
              4'd7: out_low = 12'd172;
              4'd8: out_low = 12'd173;
              4'd9: out_low = 12'd174;
              4'd10: out_low = 12'd176;
              4'd11: out_low = 12'd177;
              4'd12: out_low = 12'd178;
              4'd13: out_low = 12'd180;
              4'd14: out_low = 12'd181;
              4'd15: out_low = 12'd183;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd184;
              4'd1: out_low = 12'd186;
              4'd2: out_low = 12'd187;
              4'd3: out_low = 12'd189;
              4'd4: out_low = 12'd190;
              4'd5: out_low = 12'd191;
              4'd6: out_low = 12'd193;
              4'd7: out_low = 12'd194;
              4'd8: out_low = 12'd196;
              4'd9: out_low = 12'd198;
              4'd10: out_low = 12'd199;
              4'd11: out_low = 12'd201;
              4'd12: out_low = 12'd202;
              4'd13: out_low = 12'd204;
              4'd14: out_low = 12'd205;
              4'd15: out_low = 12'd207;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd209;
              4'd1: out_low = 12'd210;
              4'd2: out_low = 12'd212;
              4'd3: out_low = 12'd214;
              4'd4: out_low = 12'd215;
              4'd5: out_low = 12'd217;
              4'd6: out_low = 12'd219;
              4'd7: out_low = 12'd220;
              4'd8: out_low = 12'd222;
              4'd9: out_low = 12'd224;
              4'd10: out_low = 12'd226;
              4'd11: out_low = 12'd227;
              4'd12: out_low = 12'd229;
              4'd13: out_low = 12'd231;
              4'd14: out_low = 12'd233;
              4'd15: out_low = 12'd235;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd128: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd236;
              4'd1: out_low = 12'd240;
              4'd2: out_low = 12'd244;
              4'd3: out_low = 12'd248;
              4'd4: out_low = 12'd252;
              4'd5: out_low = 12'd256;
              4'd6: out_low = 12'd258;
              4'd7: out_low = 12'd260;
              4'd8: out_low = 12'd262;
              4'd9: out_low = 12'd264;
              4'd10: out_low = 12'd266;
              4'd11: out_low = 12'd268;
              4'd12: out_low = 12'd271;
              4'd13: out_low = 12'd273;
              4'd14: out_low = 12'd275;
              4'd15: out_low = 12'd277;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd280;
              4'd1: out_low = 12'd282;
              4'd2: out_low = 12'd285;
              4'd3: out_low = 12'd287;
              4'd4: out_low = 12'd290;
              4'd5: out_low = 12'd292;
              4'd6: out_low = 12'd295;
              4'd7: out_low = 12'd297;
              4'd8: out_low = 12'd300;
              4'd9: out_low = 12'd303;
              4'd10: out_low = 12'd305;
              4'd11: out_low = 12'd308;
              4'd12: out_low = 12'd311;
              4'd13: out_low = 12'd314;
              4'd14: out_low = 12'd317;
              4'd15: out_low = 12'd320;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd323;
              4'd1: out_low = 12'd326;
              4'd2: out_low = 12'd329;
              4'd3: out_low = 12'd332;
              4'd4: out_low = 12'd335;
              4'd5: out_low = 12'd339;
              4'd6: out_low = 12'd342;
              4'd7: out_low = 12'd345;
              4'd8: out_low = 12'd349;
              4'd9: out_low = 12'd352;
              4'd10: out_low = 12'd356;
              4'd11: out_low = 12'd359;
              4'd12: out_low = 12'd363;
              4'd13: out_low = 12'd367;
              4'd14: out_low = 12'd371;
              4'd15: out_low = 12'd374;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd378;
              4'd1: out_low = 12'd382;
              4'd2: out_low = 12'd385;
              4'd3: out_low = 12'd387;
              4'd4: out_low = 12'd389;
              4'd5: out_low = 12'd391;
              4'd6: out_low = 12'd393;
              4'd7: out_low = 12'd396;
              4'd8: out_low = 12'd398;
              4'd9: out_low = 12'd400;
              4'd10: out_low = 12'd402;
              4'd11: out_low = 12'd405;
              4'd12: out_low = 12'd407;
              4'd13: out_low = 12'd409;
              4'd14: out_low = 12'd412;
              4'd15: out_low = 12'd414;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd417;
              4'd1: out_low = 12'd419;
              4'd2: out_low = 12'd422;
              4'd3: out_low = 12'd424;
              4'd4: out_low = 12'd427;
              4'd5: out_low = 12'd430;
              4'd6: out_low = 12'd432;
              4'd7: out_low = 12'd435;
              4'd8: out_low = 12'd438;
              4'd9: out_low = 12'd441;
              4'd10: out_low = 12'd444;
              4'd11: out_low = 12'd447;
              4'd12: out_low = 12'd450;
              4'd13: out_low = 12'd453;
              4'd14: out_low = 12'd456;
              4'd15: out_low = 12'd459;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd462;
              4'd1: out_low = 12'd466;
              4'd2: out_low = 12'd469;
              4'd3: out_low = 12'd472;
              4'd4: out_low = 12'd476;
              4'd5: out_low = 12'd479;
              4'd6: out_low = 12'd483;
              4'd7: out_low = 12'd486;
              4'd8: out_low = 12'd490;
              4'd9: out_low = 12'd493;
              4'd10: out_low = 12'd497;
              4'd11: out_low = 12'd501;
              4'd12: out_low = 12'd505;
              4'd13: out_low = 12'd509;
              4'd14: out_low = 12'd512;
              4'd15: out_low = 12'd514;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd516;
              4'd1: out_low = 12'd519;
              4'd2: out_low = 12'd521;
              4'd3: out_low = 12'd523;
              4'd4: out_low = 12'd525;
              4'd5: out_low = 12'd527;
              4'd6: out_low = 12'd529;
              4'd7: out_low = 12'd532;
              4'd8: out_low = 12'd534;
              4'd9: out_low = 12'd536;
              4'd10: out_low = 12'd539;
              4'd11: out_low = 12'd541;
              4'd12: out_low = 12'd544;
              4'd13: out_low = 12'd546;
              4'd14: out_low = 12'd549;
              4'd15: out_low = 12'd551;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd554;
              4'd1: out_low = 12'd557;
              4'd2: out_low = 12'd559;
              4'd3: out_low = 12'd562;
              4'd4: out_low = 12'd565;
              4'd5: out_low = 12'd568;
              4'd6: out_low = 12'd571;
              4'd7: out_low = 12'd574;
              4'd8: out_low = 12'd577;
              4'd9: out_low = 12'd580;
              4'd10: out_low = 12'd583;
              4'd11: out_low = 12'd586;
              4'd12: out_low = 12'd589;
              4'd13: out_low = 12'd592;
              4'd14: out_low = 12'd596;
              4'd15: out_low = 12'd599;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd129: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd602;
              4'd1: out_low = 12'd609;
              4'd2: out_low = 12'd616;
              4'd3: out_low = 12'd624;
              4'd4: out_low = 12'd631;
              4'd5: out_low = 12'd639;
              4'd6: out_low = 12'd644;
              4'd7: out_low = 12'd648;
              4'd8: out_low = 12'd652;
              4'd9: out_low = 12'd657;
              4'd10: out_low = 12'd661;
              4'd11: out_low = 12'd666;
              4'd12: out_low = 12'd671;
              4'd13: out_low = 12'd676;
              4'd14: out_low = 12'd681;
              4'd15: out_low = 12'd686;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd692;
              4'd1: out_low = 12'd698;
              4'd2: out_low = 12'd704;
              4'd3: out_low = 12'd710;
              4'd4: out_low = 12'd716;
              4'd5: out_low = 12'd722;
              4'd6: out_low = 12'd729;
              4'd7: out_low = 12'd736;
              4'd8: out_low = 12'd743;
              4'd9: out_low = 12'd751;
              4'd10: out_low = 12'd758;
              4'd11: out_low = 12'd766;
              4'd12: out_low = 12'd771;
              4'd13: out_low = 12'd775;
              4'd14: out_low = 12'd779;
              4'd15: out_low = 12'd784;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd788;
              4'd1: out_low = 12'd793;
              4'd2: out_low = 12'd798;
              4'd3: out_low = 12'd803;
              4'd4: out_low = 12'd808;
              4'd5: out_low = 12'd814;
              4'd6: out_low = 12'd819;
              4'd7: out_low = 12'd825;
              4'd8: out_low = 12'd831;
              4'd9: out_low = 12'd837;
              4'd10: out_low = 12'd843;
              4'd11: out_low = 12'd849;
              4'd12: out_low = 12'd856;
              4'd13: out_low = 12'd863;
              4'd14: out_low = 12'd870;
              4'd15: out_low = 12'd877;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd885;
              4'd1: out_low = 12'd892;
              4'd2: out_low = 12'd898;
              4'd3: out_low = 12'd902;
              4'd4: out_low = 12'd907;
              4'd5: out_low = 12'd911;
              4'd6: out_low = 12'd916;
              4'd7: out_low = 12'd920;
              4'd8: out_low = 12'd925;
              4'd9: out_low = 12'd930;
              4'd10: out_low = 12'd935;
              4'd11: out_low = 12'd941;
              4'd12: out_low = 12'd946;
              4'd13: out_low = 12'd952;
              4'd14: out_low = 12'd957;
              4'd15: out_low = 12'd964;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd970;
              4'd1: out_low = 12'd976;
              4'd2: out_low = 12'd983;
              4'd3: out_low = 12'd990;
              4'd4: out_low = 12'd997;
              4'd5: out_low = 12'd1004;
              4'd6: out_low = 12'd1011;
              4'd7: out_low = 12'd1019;
              4'd8: out_low = 12'd1026;
              4'd9: out_low = 12'd1030;
              4'd10: out_low = 12'd1034;
              4'd11: out_low = 12'd1038;
              4'd12: out_low = 12'd1043;
              4'd13: out_low = 12'd1047;
              4'd14: out_low = 12'd1052;
              4'd15: out_low = 12'd1057;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1062;
              4'd1: out_low = 12'd1068;
              4'd2: out_low = 12'd1073;
              4'd3: out_low = 12'd1079;
              4'd4: out_low = 12'd1084;
              4'd5: out_low = 12'd1090;
              4'd6: out_low = 12'd1097;
              4'd7: out_low = 12'd1103;
              4'd8: out_low = 12'd1110;
              4'd9: out_low = 12'd1116;
              4'd10: out_low = 12'd1123;
              4'd11: out_low = 12'd1131;
              4'd12: out_low = 12'd1138;
              4'd13: out_low = 12'd1146;
              4'd14: out_low = 12'd1153;
              4'd15: out_low = 12'd1157;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1161;
              4'd1: out_low = 12'd1165;
              4'd2: out_low = 12'd1170;
              4'd3: out_low = 12'd1175;
              4'd4: out_low = 12'd1179;
              4'd5: out_low = 12'd1184;
              4'd6: out_low = 12'd1189;
              4'd7: out_low = 12'd1195;
              4'd8: out_low = 12'd1200;
              4'd9: out_low = 12'd1206;
              4'd10: out_low = 12'd1211;
              4'd11: out_low = 12'd1217;
              4'd12: out_low = 12'd1223;
              4'd13: out_low = 12'd1230;
              4'd14: out_low = 12'd1236;
              4'd15: out_low = 12'd1243;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1250;
              4'd1: out_low = 12'd1257;
              4'd2: out_low = 12'd1265;
              4'd3: out_low = 12'd1272;
              4'd4: out_low = 12'd1280;
              4'd5: out_low = 12'd1284;
              4'd6: out_low = 12'd1288;
              4'd7: out_low = 12'd1293;
              4'd8: out_low = 12'd1297;
              4'd9: out_low = 12'd1302;
              4'd10: out_low = 12'd1306;
              4'd11: out_low = 12'd1311;
              4'd12: out_low = 12'd1316;
              4'd13: out_low = 12'd1322;
              4'd14: out_low = 12'd1327;
              4'd15: out_low = 12'd1333;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd130: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1338;
              4'd1: out_low = 12'd1350;
              4'd2: out_low = 12'd1363;
              4'd3: out_low = 12'd1377;
              4'd4: out_low = 12'd1391;
              4'd5: out_low = 12'd1407;
              4'd6: out_low = 12'd1416;
              4'd7: out_low = 12'd1424;
              4'd8: out_low = 12'd1434;
              4'd9: out_low = 12'd1443;
              4'd10: out_low = 12'd1454;
              4'd11: out_low = 12'd1465;
              4'd12: out_low = 12'd1477;
              4'd13: out_low = 12'd1490;
              4'd14: out_low = 12'd1503;
              4'd15: out_low = 12'd1518;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1533;
              4'd1: out_low = 12'd1543;
              4'd2: out_low = 12'd1551;
              4'd3: out_low = 12'd1561;
              4'd4: out_low = 12'd1571;
              4'd5: out_low = 12'd1581;
              4'd6: out_low = 12'd1592;
              4'd7: out_low = 12'd1604;
              4'd8: out_low = 12'd1617;
              4'd9: out_low = 12'd1630;
              4'd10: out_low = 12'd1645;
              4'd11: out_low = 12'd1660;
              4'd12: out_low = 12'd1670;
              4'd13: out_low = 12'd1679;
              4'd14: out_low = 12'd1688;
              4'd15: out_low = 12'd1698;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1708;
              4'd1: out_low = 12'd1719;
              4'd2: out_low = 12'd1731;
              4'd3: out_low = 12'd1744;
              4'd4: out_low = 12'd1757;
              4'd5: out_low = 12'd1771;
              4'd6: out_low = 12'd1786;
              4'd7: out_low = 12'd1797;
              4'd8: out_low = 12'd1806;
              4'd9: out_low = 12'd1815;
              4'd10: out_low = 12'd1825;
              4'd11: out_low = 12'd1835;
              4'd12: out_low = 12'd1846;
              4'd13: out_low = 12'd1858;
              4'd14: out_low = 12'd1870;
              4'd15: out_low = 12'd1884;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1898;
              4'd1: out_low = 12'd1913;
              4'd2: out_low = 12'd1925;
              4'd3: out_low = 12'd1933;
              4'd4: out_low = 12'd1942;
              4'd5: out_low = 12'd1952;
              4'd6: out_low = 12'd1962;
              4'd7: out_low = 12'd1973;
              4'd8: out_low = 12'd1985;
              4'd9: out_low = 12'd1997;
              4'd10: out_low = 12'd2010;
              4'd11: out_low = 12'd2025;
              4'd12: out_low = 12'd2040;
              4'd13: out_low = 12'd2052;
              4'd14: out_low = 12'd2060;
              4'd15: out_low = 12'd2069;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2079;
              4'd1: out_low = 12'd2089;
              4'd2: out_low = 12'd2100;
              4'd3: out_low = 12'd2112;
              4'd4: out_low = 12'd2124;
              4'd5: out_low = 12'd2137;
              4'd6: out_low = 12'd2151;
              4'd7: out_low = 12'd2166;
              4'd8: out_low = 12'd2179;
              4'd9: out_low = 12'd2187;
              4'd10: out_low = 12'd2196;
              4'd11: out_low = 12'd2206;
              4'd12: out_low = 12'd2216;
              4'd13: out_low = 12'd2227;
              4'd14: out_low = 12'd2239;
              4'd15: out_low = 12'd2251;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2264;
              4'd1: out_low = 12'd2278;
              4'd2: out_low = 12'd2293;
              4'd3: out_low = 12'd2306;
              4'd4: out_low = 12'd2315;
              4'd5: out_low = 12'd2324;
              4'd6: out_low = 12'd2333;
              4'd7: out_low = 12'd2343;
              4'd8: out_low = 12'd2354;
              4'd9: out_low = 12'd2366;
              4'd10: out_low = 12'd2378;
              4'd11: out_low = 12'd2391;
              4'd12: out_low = 12'd2405;
              4'd13: out_low = 12'd2419;
              4'd14: out_low = 12'd2434;
              4'd15: out_low = 12'd2442;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2451;
              4'd1: out_low = 12'd2460;
              4'd2: out_low = 12'd2470;
              4'd3: out_low = 12'd2481;
              4'd4: out_low = 12'd2492;
              4'd5: out_low = 12'd2505;
              4'd6: out_low = 12'd2518;
              4'd7: out_low = 12'd2531;
              4'd8: out_low = 12'd2546;
              4'd9: out_low = 12'd2561;
              4'd10: out_low = 12'd2569;
              4'd11: out_low = 12'd2578;
              4'd12: out_low = 12'd2587;
              4'd13: out_low = 12'd2597;
              4'd14: out_low = 12'd2608;
              4'd15: out_low = 12'd2619;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2632;
              4'd1: out_low = 12'd2644;
              4'd2: out_low = 12'd2658;
              4'd3: out_low = 12'd2673;
              4'd4: out_low = 12'd2688;
              4'd5: out_low = 12'd2696;
              4'd6: out_low = 12'd2705;
              4'd7: out_low = 12'd2715;
              4'd8: out_low = 12'd2724;
              4'd9: out_low = 12'd2735;
              4'd10: out_low = 12'd2746;
              4'd11: out_low = 12'd2758;
              4'd12: out_low = 12'd2771;
              4'd13: out_low = 12'd2785;
              4'd14: out_low = 12'd2799;
              4'd15: out_low = 12'd2815;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd131: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2824;
              4'd1: out_low = 12'd2842;
              4'd2: out_low = 12'd2862;
              4'd3: out_low = 12'd2885;
              4'd4: out_low = 12'd2912;
              4'd5: out_low = 12'd2941;
              4'd6: out_low = 12'd2960;
              4'd7: out_low = 12'd2979;
              4'd8: out_low = 12'd3000;
              4'd9: out_low = 12'd3025;
              4'd10: out_low = 12'd3053;
              4'd11: out_low = 12'd3078;
              4'd12: out_low = 12'd3096;
              4'd13: out_low = 12'd3116;
              4'd14: out_low = 12'd3139;
              4'd15: out_low = 12'd3165;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3194;
              4'd1: out_low = 12'd3214;
              4'd2: out_low = 12'd3233;
              4'd3: out_low = 12'd3254;
              4'd4: out_low = 12'd3278;
              4'd5: out_low = 12'd3306;
              4'd6: out_low = 12'd3333;
              4'd7: out_low = 12'd3350;
              4'd8: out_low = 12'd3370;
              4'd9: out_low = 12'd3393;
              4'd10: out_low = 12'd3419;
              4'd11: out_low = 12'd3448;
              4'd12: out_low = 12'd3468;
              4'd13: out_low = 12'd3487;
              4'd14: out_low = 12'd3508;
              4'd15: out_low = 12'd3532;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3559;
              4'd1: out_low = 12'd3587;
              4'd2: out_low = 12'd3605;
              4'd3: out_low = 12'd3624;
              4'd4: out_low = 12'd3647;
              4'd5: out_low = 12'd3672;
              4'd6: out_low = 12'd3701;
              4'd7: out_low = 12'd3723;
              4'd8: out_low = 12'd3741;
              4'd9: out_low = 12'd3762;
              4'd10: out_low = 12'd3786;
              4'd11: out_low = 12'd3813;
              4'd12: out_low = 12'd3842;
              4'd13: out_low = 12'd3859;
              4'd14: out_low = 12'd3878;
              4'd15: out_low = 12'd3901;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3926;
              4'd1: out_low = 12'd3954;
              4'd2: out_low = 12'd3977;
              4'd3: out_low = 12'd3995;
              4'd4: out_low = 12'd4016;
              4'd5: out_low = 12'd4040;
              4'd6: out_low = 12'd4066;
              4'd7: out_low = 12'd0;
              4'd8: out_low = 12'd17;
              4'd9: out_low = 12'd37;
              4'd10: out_low = 12'd58;
              4'd11: out_low = 12'd83;
              4'd12: out_low = 12'd111;
              4'd13: out_low = 12'd136;
              4'd14: out_low = 12'd154;
              4'd15: out_low = 12'd174;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd197;
              4'd1: out_low = 12'd224;
              4'd2: out_low = 12'd253;
              4'd3: out_low = 12'd272;
              4'd4: out_low = 12'd291;
              4'd5: out_low = 12'd312;
              4'd6: out_low = 12'd337;
              4'd7: out_low = 12'd365;
              4'd8: out_low = 12'd390;
              4'd9: out_low = 12'd408;
              4'd10: out_low = 12'd428;
              4'd11: out_low = 12'd451;
              4'd12: out_low = 12'd477;
              4'd13: out_low = 12'd507;
              4'd14: out_low = 12'd526;
              4'd15: out_low = 12'd545;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd566;
              4'd1: out_low = 12'd591;
              4'd2: out_low = 12'd618;
              4'd3: out_low = 12'd645;
              4'd4: out_low = 12'd662;
              4'd5: out_low = 12'd682;
              4'd6: out_low = 12'd705;
              4'd7: out_low = 12'd731;
              4'd8: out_low = 12'd760;
              4'd9: out_low = 12'd780;
              4'd10: out_low = 12'd799;
              4'd11: out_low = 12'd820;
              4'd12: out_low = 12'd844;
              4'd13: out_low = 12'd871;
              4'd14: out_low = 12'd899;
              4'd15: out_low = 12'd917;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd936;
              4'd1: out_low = 12'd959;
              4'd2: out_low = 12'd984;
              4'd3: out_low = 12'd1013;
              4'd4: out_low = 12'd1035;
              4'd5: out_low = 12'd1053;
              4'd6: out_low = 12'd1074;
              4'd7: out_low = 12'd1098;
              4'd8: out_low = 12'd1125;
              4'd9: out_low = 12'd1154;
              4'd10: out_low = 12'd1171;
              4'd11: out_low = 12'd1190;
              4'd12: out_low = 12'd1213;
              4'd13: out_low = 12'd1238;
              4'd14: out_low = 12'd1266;
              4'd15: out_low = 12'd1289;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1308;
              4'd1: out_low = 12'd1328;
              4'd2: out_low = 12'd1352;
              4'd3: out_low = 12'd1378;
              4'd4: out_low = 12'd1408;
              4'd5: out_low = 12'd1425;
              4'd6: out_low = 12'd1445;
              4'd7: out_low = 12'd1467;
              4'd8: out_low = 12'd1491;
              4'd9: out_low = 12'd1520;
              4'd10: out_low = 12'd1544;
              4'd11: out_low = 12'd1562;
              4'd12: out_low = 12'd1582;
              4'd13: out_low = 12'd1605;
              4'd14: out_low = 12'd1632;
              4'd15: out_low = 12'd1662;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd132: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1680;
              4'd1: out_low = 12'd1720;
              4'd2: out_low = 12'd1773;
              4'd3: out_low = 12'd1816;
              4'd4: out_low = 12'd1859;
              4'd5: out_low = 12'd1915;
              4'd6: out_low = 12'd1953;
              4'd7: out_low = 12'd1999;
              4'd8: out_low = 12'd2053;
              4'd9: out_low = 12'd2090;
              4'd10: out_low = 12'd2139;
              4'd11: out_low = 12'd2188;
              4'd12: out_low = 12'd2228;
              4'd13: out_low = 12'd2280;
              4'd14: out_low = 12'd2325;
              4'd15: out_low = 12'd2367;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2421;
              4'd1: out_low = 12'd2461;
              4'd2: out_low = 12'd2506;
              4'd3: out_low = 12'd2562;
              4'd4: out_low = 12'd2599;
              4'd5: out_low = 12'd2646;
              4'd6: out_low = 12'd2697;
              4'd7: out_low = 12'd2736;
              4'd8: out_low = 12'd2786;
              4'd9: out_low = 12'd2833;
              4'd10: out_low = 12'd2875;
              4'd11: out_low = 12'd2928;
              4'd12: out_low = 12'd2970;
              4'd13: out_low = 12'd3014;
              4'd14: out_low = 12'd3070;
              4'd15: out_low = 12'd3107;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3153;
              4'd1: out_low = 12'd3206;
              4'd2: out_low = 12'd3244;
              4'd3: out_low = 12'd3293;
              4'd4: out_low = 12'd3342;
              4'd5: out_low = 12'd3382;
              4'd6: out_low = 12'd3434;
              4'd7: out_low = 12'd3478;
              4'd8: out_low = 12'd3521;
              4'd9: out_low = 12'd3576;
              4'd10: out_low = 12'd3615;
              4'd11: out_low = 12'd3660;
              4'd12: out_low = 12'd3715;
              4'd13: out_low = 12'd3752;
              4'd14: out_low = 12'd3800;
              4'd15: out_low = 12'd3851;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3890;
              4'd1: out_low = 12'd3941;
              4'd2: out_low = 12'd3987;
              4'd3: out_low = 12'd4029;
              4'd4: out_low = 12'd4082;
              4'd5: out_low = 12'd28;
              4'd6: out_low = 12'd72;
              4'd7: out_low = 12'd128;
              4'd8: out_low = 12'd165;
              4'd9: out_low = 12'd212;
              4'd10: out_low = 12'd264;
              4'd11: out_low = 12'd302;
              4'd12: out_low = 12'd352;
              4'd13: out_low = 12'd400;
              4'd14: out_low = 12'd441;
              4'd15: out_low = 12'd493;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd536;
              4'd1: out_low = 12'd579;
              4'd2: out_low = 12'd635;
              4'd3: out_low = 12'd673;
              4'd4: out_low = 12'd719;
              4'd5: out_low = 12'd773;
              4'd6: out_low = 12'd810;
              4'd7: out_low = 12'd859;
              4'd8: out_low = 12'd909;
              4'd9: out_low = 12'd948;
              4'd10: out_low = 12'd1000;
              4'd11: out_low = 12'd1045;
              4'd12: out_low = 12'd1087;
              4'd13: out_low = 12'd1141;
              4'd14: out_low = 12'd1181;
              4'd15: out_low = 12'd1226;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1282;
              4'd1: out_low = 12'd1319;
              4'd2: out_low = 12'd1366;
              4'd3: out_low = 12'd1417;
              4'd4: out_low = 12'd1456;
              4'd5: out_low = 12'd1507;
              4'd6: out_low = 12'd1553;
              4'd7: out_low = 12'd1595;
              4'd8: out_low = 12'd1648;
              4'd9: out_low = 12'd1690;
              4'd10: out_low = 12'd1734;
              4'd11: out_low = 12'd1790;
              4'd12: out_low = 12'd1827;
              4'd13: out_low = 12'd1873;
              4'd14: out_low = 12'd1926;
              4'd15: out_low = 12'd1964;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2013;
              4'd1: out_low = 12'd2062;
              4'd2: out_low = 12'd2103;
              4'd3: out_low = 12'd2154;
              4'd4: out_low = 12'd2198;
              4'd5: out_low = 12'd2241;
              4'd6: out_low = 12'd2296;
              4'd7: out_low = 12'd2335;
              4'd8: out_low = 12'd2381;
              4'd9: out_low = 12'd2435;
              4'd10: out_low = 12'd2473;
              4'd11: out_low = 12'd2521;
              4'd12: out_low = 12'd2571;
              4'd13: out_low = 12'd2610;
              4'd14: out_low = 12'd2661;
              4'd15: out_low = 12'd2707;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2749;
              4'd1: out_low = 12'd2803;
              4'd2: out_low = 12'd2844;
              4'd3: out_low = 12'd2888;
              4'd4: out_low = 12'd2944;
              4'd5: out_low = 12'd2981;
              4'd6: out_low = 12'd3028;
              4'd7: out_low = 12'd3080;
              4'd8: out_low = 12'd3119;
              4'd9: out_low = 12'd3168;
              4'd10: out_low = 12'd3216;
              4'd11: out_low = 12'd3257;
              4'd12: out_low = 12'd3309;
              4'd13: out_low = 12'd3352;
              4'd14: out_low = 12'd3396;
              4'd15: out_low = 12'd3451;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd133: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3489;
              4'd1: out_low = 12'd3589;
              4'd2: out_low = 12'd3675;
              4'd3: out_low = 12'd3765;
              4'd4: out_low = 12'd3861;
              4'd5: out_low = 12'd3957;
              4'd6: out_low = 12'd4042;
              4'd7: out_low = 12'd39;
              4'd8: out_low = 12'd137;
              4'd9: out_low = 12'd227;
              4'd10: out_low = 12'd315;
              4'd11: out_low = 12'd410;
              4'd12: out_low = 12'd510;
              4'd13: out_low = 12'd593;
              4'd14: out_low = 12'd685;
              4'd15: out_low = 12'd782;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd875;
              4'd1: out_low = 12'd961;
              4'd2: out_low = 12'd1055;
              4'd3: out_low = 12'd1155;
              4'd4: out_low = 12'd1241;
              4'd5: out_low = 12'd1331;
              4'd6: out_low = 12'd1427;
              4'd7: out_low = 12'd1523;
              4'd8: out_low = 12'd1608;
              4'd9: out_low = 12'd1701;
              4'd10: out_low = 12'd1800;
              4'd11: out_low = 12'd1888;
              4'd12: out_low = 12'd1977;
              4'd13: out_low = 12'd2072;
              4'd14: out_low = 12'd2171;
              4'd15: out_low = 12'd2255;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2347;
              4'd1: out_low = 12'd2445;
              4'd2: out_low = 12'd2536;
              4'd3: out_low = 12'd2623;
              4'd4: out_low = 12'd2718;
              4'd5: out_low = 12'd2818;
              4'd6: out_low = 12'd2902;
              4'd7: out_low = 12'd2993;
              4'd8: out_low = 12'd3090;
              4'd9: out_low = 12'd3184;
              4'd10: out_low = 12'd3270;
              4'd11: out_low = 12'd3363;
              4'd12: out_low = 12'd3463;
              4'd13: out_low = 12'd3550;
              4'd14: out_low = 12'd3639;
              4'd15: out_low = 12'd3735;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3833;
              4'd1: out_low = 12'd3917;
              4'd2: out_low = 12'd3968;
              4'd3: out_low = 12'd3968;
              4'd4: out_low = 12'd3968;
              4'd5: out_low = 12'd3968;
              4'd6: out_low = 12'd3968;
              4'd7: out_low = 12'd3968;
              4'd8: out_low = 12'd3968;
              4'd9: out_low = 12'd3968;
              4'd10: out_low = 12'd3968;
              4'd11: out_low = 12'd3968;
              4'd12: out_low = 12'd3968;
              4'd13: out_low = 12'd3968;
              4'd14: out_low = 12'd3968;
              4'd15: out_low = 12'd3968;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: out_low = 12'd3968;
          3'd5: out_low = 12'd3968;
          3'd6: out_low = 12'd3968;
          3'd7: out_low = 12'd3968;
          default: out_low = 12'd0;
        endcase
      end
      9'd134: out_low = 12'd3968;
      9'd135: out_low = 12'd3968;
      9'd136: out_low = 12'd3968;
      9'd137: out_low = 12'd3968;
      9'd138: out_low = 12'd3968;
      9'd139: out_low = 12'd3968;
      9'd140: out_low = 12'd3968;
      9'd141: out_low = 12'd3968;
      9'd142: out_low = 12'd3968;
      9'd143: out_low = 12'd3968;
      9'd144: out_low = 12'd3968;
      9'd145: out_low = 12'd3968;
      9'd146: out_low = 12'd3968;
      9'd147: out_low = 12'd3968;
      9'd148: out_low = 12'd3968;
      9'd149: out_low = 12'd3968;
      9'd150: out_low = 12'd3968;
      9'd151: out_low = 12'd3968;
      9'd152: out_low = 12'd3968;
      9'd153: out_low = 12'd3968;
      9'd154: out_low = 12'd3968;
      9'd155: out_low = 12'd3968;
      9'd156: out_low = 12'd3968;
      9'd157: out_low = 12'd3968;
      9'd158: out_low = 12'd3968;
      9'd159: out_low = 12'd3968;
      9'd160: out_low = 12'd3968;
      9'd161: out_low = 12'd3968;
      9'd162: out_low = 12'd3968;
      9'd163: out_low = 12'd3968;
      9'd164: out_low = 12'd3968;
      9'd165: out_low = 12'd3968;
      9'd166: out_low = 12'd3968;
      9'd167: out_low = 12'd3968;
      9'd168: out_low = 12'd3968;
      9'd169: out_low = 12'd3968;
      9'd170: out_low = 12'd3968;
      9'd171: out_low = 12'd3968;
      9'd172: out_low = 12'd3968;
      9'd173: out_low = 12'd3968;
      9'd174: out_low = 12'd3968;
      9'd175: out_low = 12'd3968;
      9'd176: out_low = 12'd3968;
      9'd177: out_low = 12'd3968;
      9'd178: out_low = 12'd3968;
      9'd179: out_low = 12'd3968;
      9'd180: out_low = 12'd3968;
      9'd181: out_low = 12'd3968;
      9'd182: out_low = 12'd3968;
      9'd183: out_low = 12'd3968;
      9'd184: out_low = 12'd3968;
      9'd185: out_low = 12'd3968;
      9'd186: out_low = 12'd3968;
      9'd187: out_low = 12'd3968;
      9'd188: out_low = 12'd3968;
      9'd189: out_low = 12'd3968;
      9'd190: out_low = 12'd3968;
      9'd191: out_low = 12'd3968;
      9'd192: out_low = 12'd3968;
      9'd193: out_low = 12'd3968;
      9'd194: out_low = 12'd3968;
      9'd195: out_low = 12'd3968;
      9'd196: out_low = 12'd3968;
      9'd197: out_low = 12'd3968;
      9'd198: out_low = 12'd3968;
      9'd199: out_low = 12'd3968;
      9'd200: out_low = 12'd3968;
      9'd201: out_low = 12'd3968;
      9'd202: out_low = 12'd3968;
      9'd203: out_low = 12'd3968;
      9'd204: out_low = 12'd3968;
      9'd205: out_low = 12'd3968;
      9'd206: out_low = 12'd3968;
      9'd207: out_low = 12'd3968;
      9'd208: out_low = 12'd3968;
      9'd209: out_low = 12'd3968;
      9'd210: out_low = 12'd3968;
      9'd211: out_low = 12'd3968;
      9'd212: out_low = 12'd3968;
      9'd213: out_low = 12'd3968;
      9'd214: out_low = 12'd3968;
      9'd215: out_low = 12'd3968;
      9'd216: out_low = 12'd3968;
      9'd217: out_low = 12'd3968;
      9'd218: out_low = 12'd3968;
      9'd219: out_low = 12'd3968;
      9'd220: out_low = 12'd3968;
      9'd221: out_low = 12'd3968;
      9'd222: out_low = 12'd3968;
      9'd223: out_low = 12'd3968;
      9'd224: out_low = 12'd3968;
      9'd225: out_low = 12'd3968;
      9'd226: out_low = 12'd3968;
      9'd227: out_low = 12'd3968;
      9'd228: out_low = 12'd3968;
      9'd229: out_low = 12'd3968;
      9'd230: out_low = 12'd3968;
      9'd231: out_low = 12'd3968;
      9'd232: out_low = 12'd3968;
      9'd233: out_low = 12'd3968;
      9'd234: out_low = 12'd3968;
      9'd235: out_low = 12'd3968;
      9'd236: out_low = 12'd3968;
      9'd237: out_low = 12'd3968;
      9'd238: out_low = 12'd3968;
      9'd239: out_low = 12'd3968;
      9'd240: out_low = 12'd3968;
      9'd241: out_low = 12'd3968;
      9'd242: out_low = 12'd3968;
      9'd243: out_low = 12'd3968;
      9'd244: out_low = 12'd3968;
      9'd245: out_low = 12'd3968;
      9'd246: out_low = 12'd3968;
      9'd247: out_low = 12'd3968;
      9'd248: out_low = 12'd3968;
      9'd249: out_low = 12'd3968;
      9'd250: out_low = 12'd3968;
      9'd251: out_low = 12'd3968;
      9'd252: out_low = 12'd3968;
      9'd253: out_low = 12'd3968;
      9'd254: out_low = 12'd3968;
      9'd255: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3968;
              4'd1: out_low = 12'd4032;
              4'd2: out_low = 12'd4032;
              4'd3: out_low = 12'd4032;
              4'd4: out_low = 12'd4032;
              4'd5: out_low = 12'd4032;
              4'd6: out_low = 12'd4032;
              4'd7: out_low = 12'd4032;
              4'd8: out_low = 12'd4032;
              4'd9: out_low = 12'd4032;
              4'd10: out_low = 12'd4032;
              4'd11: out_low = 12'd4032;
              4'd12: out_low = 12'd4032;
              4'd13: out_low = 12'd4032;
              4'd14: out_low = 12'd4032;
              4'd15: out_low = 12'd4032;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: out_low = 12'd4032;
          3'd2: out_low = 12'd4032;
          3'd3: out_low = 12'd4032;
          3'd4: out_low = 12'd4032;
          3'd5: out_low = 12'd4032;
          3'd6: out_low = 12'd4032;
          3'd7: out_low = 12'd4032;
          default: out_low = 12'd0;
        endcase
      end
      9'd256: out_low = 12'd3968;
      9'd257: out_low = 12'd3968;
      9'd258: out_low = 12'd3968;
      9'd259: out_low = 12'd3968;
      9'd260: out_low = 12'd3968;
      9'd261: out_low = 12'd3968;
      9'd262: out_low = 12'd3968;
      9'd263: out_low = 12'd3968;
      9'd264: out_low = 12'd3968;
      9'd265: out_low = 12'd3968;
      9'd266: out_low = 12'd3968;
      9'd267: out_low = 12'd3968;
      9'd268: out_low = 12'd3968;
      9'd269: out_low = 12'd3968;
      9'd270: out_low = 12'd3968;
      9'd271: out_low = 12'd3968;
      9'd272: out_low = 12'd3968;
      9'd273: out_low = 12'd3968;
      9'd274: out_low = 12'd3968;
      9'd275: out_low = 12'd3968;
      9'd276: out_low = 12'd3968;
      9'd277: out_low = 12'd3968;
      9'd278: out_low = 12'd3968;
      9'd279: out_low = 12'd3968;
      9'd280: out_low = 12'd3968;
      9'd281: out_low = 12'd3968;
      9'd282: out_low = 12'd3968;
      9'd283: out_low = 12'd3968;
      9'd284: out_low = 12'd3968;
      9'd285: out_low = 12'd3968;
      9'd286: out_low = 12'd3968;
      9'd287: out_low = 12'd3968;
      9'd288: out_low = 12'd3968;
      9'd289: out_low = 12'd3968;
      9'd290: out_low = 12'd3968;
      9'd291: out_low = 12'd3968;
      9'd292: out_low = 12'd3968;
      9'd293: out_low = 12'd3968;
      9'd294: out_low = 12'd3968;
      9'd295: out_low = 12'd3968;
      9'd296: out_low = 12'd3968;
      9'd297: out_low = 12'd3968;
      9'd298: out_low = 12'd3968;
      9'd299: out_low = 12'd3968;
      9'd300: out_low = 12'd3968;
      9'd301: out_low = 12'd3968;
      9'd302: out_low = 12'd3968;
      9'd303: out_low = 12'd3968;
      9'd304: out_low = 12'd3968;
      9'd305: out_low = 12'd3968;
      9'd306: out_low = 12'd3968;
      9'd307: out_low = 12'd3968;
      9'd308: out_low = 12'd3968;
      9'd309: out_low = 12'd3968;
      9'd310: out_low = 12'd3968;
      9'd311: out_low = 12'd3968;
      9'd312: out_low = 12'd3968;
      9'd313: out_low = 12'd3968;
      9'd314: out_low = 12'd3968;
      9'd315: out_low = 12'd3968;
      9'd316: out_low = 12'd3968;
      9'd317: out_low = 12'd3968;
      9'd318: out_low = 12'd3968;
      9'd319: out_low = 12'd3968;
      9'd320: out_low = 12'd3968;
      9'd321: out_low = 12'd3968;
      9'd322: out_low = 12'd3968;
      9'd323: out_low = 12'd3968;
      9'd324: out_low = 12'd3968;
      9'd325: out_low = 12'd3968;
      9'd326: out_low = 12'd3968;
      9'd327: out_low = 12'd3968;
      9'd328: out_low = 12'd3968;
      9'd329: out_low = 12'd3968;
      9'd330: out_low = 12'd3968;
      9'd331: out_low = 12'd3968;
      9'd332: out_low = 12'd3968;
      9'd333: out_low = 12'd3968;
      9'd334: out_low = 12'd3968;
      9'd335: out_low = 12'd3968;
      9'd336: out_low = 12'd3968;
      9'd337: out_low = 12'd3968;
      9'd338: out_low = 12'd3968;
      9'd339: out_low = 12'd3968;
      9'd340: out_low = 12'd3968;
      9'd341: out_low = 12'd3968;
      9'd342: out_low = 12'd3968;
      9'd343: out_low = 12'd3968;
      9'd344: out_low = 12'd3968;
      9'd345: out_low = 12'd3968;
      9'd346: out_low = 12'd3968;
      9'd347: out_low = 12'd3968;
      9'd348: out_low = 12'd3968;
      9'd349: out_low = 12'd3968;
      9'd350: out_low = 12'd3968;
      9'd351: out_low = 12'd3968;
      9'd352: out_low = 12'd3968;
      9'd353: out_low = 12'd3968;
      9'd354: out_low = 12'd3968;
      9'd355: out_low = 12'd3968;
      9'd356: out_low = 12'd3968;
      9'd357: out_low = 12'd3968;
      9'd358: out_low = 12'd3968;
      9'd359: out_low = 12'd3968;
      9'd360: out_low = 12'd3968;
      9'd361: out_low = 12'd3968;
      9'd362: out_low = 12'd3968;
      9'd363: out_low = 12'd3968;
      9'd364: out_low = 12'd3968;
      9'd365: out_low = 12'd3968;
      9'd366: out_low = 12'd3968;
      9'd367: out_low = 12'd3968;
      9'd368: out_low = 12'd3968;
      9'd369: out_low = 12'd3968;
      9'd370: out_low = 12'd3968;
      9'd371: out_low = 12'd3968;
      9'd372: out_low = 12'd3968;
      9'd373: out_low = 12'd3968;
      9'd374: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3968;
              4'd1: out_low = 12'd3967;
              4'd2: out_low = 12'd3967;
              4'd3: out_low = 12'd3967;
              4'd4: out_low = 12'd3967;
              4'd5: out_low = 12'd3967;
              4'd6: out_low = 12'd3967;
              4'd7: out_low = 12'd3967;
              4'd8: out_low = 12'd3967;
              4'd9: out_low = 12'd3967;
              4'd10: out_low = 12'd3967;
              4'd11: out_low = 12'd3967;
              4'd12: out_low = 12'd3967;
              4'd13: out_low = 12'd3967;
              4'd14: out_low = 12'd3967;
              4'd15: out_low = 12'd3967;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: out_low = 12'd3967;
          3'd2: out_low = 12'd3967;
          3'd3: out_low = 12'd3967;
          3'd4: out_low = 12'd3967;
          3'd5: out_low = 12'd3967;
          3'd6: out_low = 12'd3967;
          3'd7: out_low = 12'd3967;
          default: out_low = 12'd0;
        endcase
      end
      9'd375: begin
        case (mant[6:4])
          3'd0: out_low = 12'd3967;
          3'd1: out_low = 12'd3967;
          3'd2: out_low = 12'd3967;
          3'd3: out_low = 12'd3967;
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3967;
              4'd1: out_low = 12'd3966;
              4'd2: out_low = 12'd3966;
              4'd3: out_low = 12'd3966;
              4'd4: out_low = 12'd3966;
              4'd5: out_low = 12'd3966;
              4'd6: out_low = 12'd3966;
              4'd7: out_low = 12'd3966;
              4'd8: out_low = 12'd3966;
              4'd9: out_low = 12'd3966;
              4'd10: out_low = 12'd3966;
              4'd11: out_low = 12'd3966;
              4'd12: out_low = 12'd3966;
              4'd13: out_low = 12'd3966;
              4'd14: out_low = 12'd3966;
              4'd15: out_low = 12'd3966;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: out_low = 12'd3966;
          3'd6: out_low = 12'd3966;
          3'd7: out_low = 12'd3966;
          default: out_low = 12'd0;
        endcase
      end
      9'd376: begin
        case (mant[6:4])
          3'd0: out_low = 12'd3966;
          3'd1: out_low = 12'd3966;
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3966;
              4'd1: out_low = 12'd3965;
              4'd2: out_low = 12'd3965;
              4'd3: out_low = 12'd3965;
              4'd4: out_low = 12'd3965;
              4'd5: out_low = 12'd3965;
              4'd6: out_low = 12'd3965;
              4'd7: out_low = 12'd3965;
              4'd8: out_low = 12'd3965;
              4'd9: out_low = 12'd3965;
              4'd10: out_low = 12'd3965;
              4'd11: out_low = 12'd3965;
              4'd12: out_low = 12'd3965;
              4'd13: out_low = 12'd3965;
              4'd14: out_low = 12'd3965;
              4'd15: out_low = 12'd3965;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: out_low = 12'd3965;
          3'd4: out_low = 12'd3965;
          3'd5: out_low = 12'd3965;
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3965;
              4'd1: out_low = 12'd3965;
              4'd2: out_low = 12'd3964;
              4'd3: out_low = 12'd3964;
              4'd4: out_low = 12'd3964;
              4'd5: out_low = 12'd3964;
              4'd6: out_low = 12'd3964;
              4'd7: out_low = 12'd3964;
              4'd8: out_low = 12'd3964;
              4'd9: out_low = 12'd3964;
              4'd10: out_low = 12'd3964;
              4'd11: out_low = 12'd3964;
              4'd12: out_low = 12'd3964;
              4'd13: out_low = 12'd3964;
              4'd14: out_low = 12'd3964;
              4'd15: out_low = 12'd3964;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: out_low = 12'd3964;
          default: out_low = 12'd0;
        endcase
      end
      9'd377: begin
        case (mant[6:4])
          3'd0: out_low = 12'd3964;
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3964;
              4'd1: out_low = 12'd3964;
              4'd2: out_low = 12'd3963;
              4'd3: out_low = 12'd3963;
              4'd4: out_low = 12'd3963;
              4'd5: out_low = 12'd3963;
              4'd6: out_low = 12'd3963;
              4'd7: out_low = 12'd3963;
              4'd8: out_low = 12'd3963;
              4'd9: out_low = 12'd3963;
              4'd10: out_low = 12'd3963;
              4'd11: out_low = 12'd3963;
              4'd12: out_low = 12'd3963;
              4'd13: out_low = 12'd3963;
              4'd14: out_low = 12'd3963;
              4'd15: out_low = 12'd3963;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: out_low = 12'd3963;
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3963;
              4'd1: out_low = 12'd3963;
              4'd2: out_low = 12'd3962;
              4'd3: out_low = 12'd3962;
              4'd4: out_low = 12'd3962;
              4'd5: out_low = 12'd3962;
              4'd6: out_low = 12'd3962;
              4'd7: out_low = 12'd3962;
              4'd8: out_low = 12'd3962;
              4'd9: out_low = 12'd3962;
              4'd10: out_low = 12'd3962;
              4'd11: out_low = 12'd3962;
              4'd12: out_low = 12'd3962;
              4'd13: out_low = 12'd3962;
              4'd14: out_low = 12'd3962;
              4'd15: out_low = 12'd3962;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: out_low = 12'd3962;
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3962;
              4'd1: out_low = 12'd3962;
              4'd2: out_low = 12'd3962;
              4'd3: out_low = 12'd3961;
              4'd4: out_low = 12'd3961;
              4'd5: out_low = 12'd3961;
              4'd6: out_low = 12'd3961;
              4'd7: out_low = 12'd3961;
              4'd8: out_low = 12'd3961;
              4'd9: out_low = 12'd3961;
              4'd10: out_low = 12'd3961;
              4'd11: out_low = 12'd3961;
              4'd12: out_low = 12'd3961;
              4'd13: out_low = 12'd3961;
              4'd14: out_low = 12'd3961;
              4'd15: out_low = 12'd3961;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: out_low = 12'd3961;
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3961;
              4'd1: out_low = 12'd3961;
              4'd2: out_low = 12'd3961;
              4'd3: out_low = 12'd3961;
              4'd4: out_low = 12'd3960;
              4'd5: out_low = 12'd3960;
              4'd6: out_low = 12'd3960;
              4'd7: out_low = 12'd3960;
              4'd8: out_low = 12'd3960;
              4'd9: out_low = 12'd3960;
              4'd10: out_low = 12'd3960;
              4'd11: out_low = 12'd3960;
              4'd12: out_low = 12'd3960;
              4'd13: out_low = 12'd3960;
              4'd14: out_low = 12'd3960;
              4'd15: out_low = 12'd3960;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd378: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3960;
              4'd1: out_low = 12'd3960;
              4'd2: out_low = 12'd3960;
              4'd3: out_low = 12'd3960;
              4'd4: out_low = 12'd3960;
              4'd5: out_low = 12'd3960;
              4'd6: out_low = 12'd3960;
              4'd7: out_low = 12'd3960;
              4'd8: out_low = 12'd3960;
              4'd9: out_low = 12'd3960;
              4'd10: out_low = 12'd3960;
              4'd11: out_low = 12'd3959;
              4'd12: out_low = 12'd3959;
              4'd13: out_low = 12'd3959;
              4'd14: out_low = 12'd3959;
              4'd15: out_low = 12'd3959;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3959;
              4'd1: out_low = 12'd3959;
              4'd2: out_low = 12'd3959;
              4'd3: out_low = 12'd3959;
              4'd4: out_low = 12'd3959;
              4'd5: out_low = 12'd3959;
              4'd6: out_low = 12'd3959;
              4'd7: out_low = 12'd3959;
              4'd8: out_low = 12'd3959;
              4'd9: out_low = 12'd3959;
              4'd10: out_low = 12'd3959;
              4'd11: out_low = 12'd3958;
              4'd12: out_low = 12'd3958;
              4'd13: out_low = 12'd3958;
              4'd14: out_low = 12'd3958;
              4'd15: out_low = 12'd3958;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3958;
              4'd1: out_low = 12'd3958;
              4'd2: out_low = 12'd3958;
              4'd3: out_low = 12'd3958;
              4'd4: out_low = 12'd3958;
              4'd5: out_low = 12'd3958;
              4'd6: out_low = 12'd3958;
              4'd7: out_low = 12'd3958;
              4'd8: out_low = 12'd3958;
              4'd9: out_low = 12'd3958;
              4'd10: out_low = 12'd3958;
              4'd11: out_low = 12'd3958;
              4'd12: out_low = 12'd3957;
              4'd13: out_low = 12'd3957;
              4'd14: out_low = 12'd3957;
              4'd15: out_low = 12'd3957;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3957;
              4'd1: out_low = 12'd3957;
              4'd2: out_low = 12'd3957;
              4'd3: out_low = 12'd3957;
              4'd4: out_low = 12'd3957;
              4'd5: out_low = 12'd3957;
              4'd6: out_low = 12'd3957;
              4'd7: out_low = 12'd3957;
              4'd8: out_low = 12'd3957;
              4'd9: out_low = 12'd3957;
              4'd10: out_low = 12'd3957;
              4'd11: out_low = 12'd3957;
              4'd12: out_low = 12'd3957;
              4'd13: out_low = 12'd3956;
              4'd14: out_low = 12'd3956;
              4'd15: out_low = 12'd3956;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3956;
              4'd1: out_low = 12'd3956;
              4'd2: out_low = 12'd3956;
              4'd3: out_low = 12'd3956;
              4'd4: out_low = 12'd3956;
              4'd5: out_low = 12'd3956;
              4'd6: out_low = 12'd3956;
              4'd7: out_low = 12'd3956;
              4'd8: out_low = 12'd3956;
              4'd9: out_low = 12'd3956;
              4'd10: out_low = 12'd3956;
              4'd11: out_low = 12'd3956;
              4'd12: out_low = 12'd3956;
              4'd13: out_low = 12'd3956;
              4'd14: out_low = 12'd3955;
              4'd15: out_low = 12'd3955;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3955;
              4'd1: out_low = 12'd3955;
              4'd2: out_low = 12'd3955;
              4'd3: out_low = 12'd3955;
              4'd4: out_low = 12'd3955;
              4'd5: out_low = 12'd3955;
              4'd6: out_low = 12'd3955;
              4'd7: out_low = 12'd3955;
              4'd8: out_low = 12'd3955;
              4'd9: out_low = 12'd3955;
              4'd10: out_low = 12'd3955;
              4'd11: out_low = 12'd3955;
              4'd12: out_low = 12'd3955;
              4'd13: out_low = 12'd3955;
              4'd14: out_low = 12'd3954;
              4'd15: out_low = 12'd3954;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3954;
              4'd1: out_low = 12'd3954;
              4'd2: out_low = 12'd3954;
              4'd3: out_low = 12'd3954;
              4'd4: out_low = 12'd3954;
              4'd5: out_low = 12'd3954;
              4'd6: out_low = 12'd3954;
              4'd7: out_low = 12'd3954;
              4'd8: out_low = 12'd3954;
              4'd9: out_low = 12'd3954;
              4'd10: out_low = 12'd3954;
              4'd11: out_low = 12'd3954;
              4'd12: out_low = 12'd3954;
              4'd13: out_low = 12'd3954;
              4'd14: out_low = 12'd3954;
              4'd15: out_low = 12'd3953;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: out_low = 12'd3953;
          default: out_low = 12'd0;
        endcase
      end
      9'd379: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3952;
              4'd1: out_low = 12'd3952;
              4'd2: out_low = 12'd3952;
              4'd3: out_low = 12'd3952;
              4'd4: out_low = 12'd3952;
              4'd5: out_low = 12'd3952;
              4'd6: out_low = 12'd3952;
              4'd7: out_low = 12'd3952;
              4'd8: out_low = 12'd3952;
              4'd9: out_low = 12'd3951;
              4'd10: out_low = 12'd3951;
              4'd11: out_low = 12'd3951;
              4'd12: out_low = 12'd3951;
              4'd13: out_low = 12'd3951;
              4'd14: out_low = 12'd3951;
              4'd15: out_low = 12'd3951;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3951;
              4'd1: out_low = 12'd3951;
              4'd2: out_low = 12'd3950;
              4'd3: out_low = 12'd3950;
              4'd4: out_low = 12'd3950;
              4'd5: out_low = 12'd3950;
              4'd6: out_low = 12'd3950;
              4'd7: out_low = 12'd3950;
              4'd8: out_low = 12'd3950;
              4'd9: out_low = 12'd3950;
              4'd10: out_low = 12'd3949;
              4'd11: out_low = 12'd3949;
              4'd12: out_low = 12'd3949;
              4'd13: out_low = 12'd3949;
              4'd14: out_low = 12'd3949;
              4'd15: out_low = 12'd3949;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3949;
              4'd1: out_low = 12'd3949;
              4'd2: out_low = 12'd3949;
              4'd3: out_low = 12'd3948;
              4'd4: out_low = 12'd3948;
              4'd5: out_low = 12'd3948;
              4'd6: out_low = 12'd3948;
              4'd7: out_low = 12'd3948;
              4'd8: out_low = 12'd3948;
              4'd9: out_low = 12'd3948;
              4'd10: out_low = 12'd3948;
              4'd11: out_low = 12'd3947;
              4'd12: out_low = 12'd3947;
              4'd13: out_low = 12'd3947;
              4'd14: out_low = 12'd3947;
              4'd15: out_low = 12'd3947;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3947;
              4'd1: out_low = 12'd3947;
              4'd2: out_low = 12'd3947;
              4'd3: out_low = 12'd3947;
              4'd4: out_low = 12'd3946;
              4'd5: out_low = 12'd3946;
              4'd6: out_low = 12'd3946;
              4'd7: out_low = 12'd3946;
              4'd8: out_low = 12'd3946;
              4'd9: out_low = 12'd3946;
              4'd10: out_low = 12'd3946;
              4'd11: out_low = 12'd3946;
              4'd12: out_low = 12'd3946;
              4'd13: out_low = 12'd3945;
              4'd14: out_low = 12'd3945;
              4'd15: out_low = 12'd3945;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3945;
              4'd1: out_low = 12'd3945;
              4'd2: out_low = 12'd3945;
              4'd3: out_low = 12'd3945;
              4'd4: out_low = 12'd3945;
              4'd5: out_low = 12'd3945;
              4'd6: out_low = 12'd3944;
              4'd7: out_low = 12'd3944;
              4'd8: out_low = 12'd3944;
              4'd9: out_low = 12'd3944;
              4'd10: out_low = 12'd3944;
              4'd11: out_low = 12'd3944;
              4'd12: out_low = 12'd3944;
              4'd13: out_low = 12'd3944;
              4'd14: out_low = 12'd3944;
              4'd15: out_low = 12'd3943;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3943;
              4'd1: out_low = 12'd3943;
              4'd2: out_low = 12'd3943;
              4'd3: out_low = 12'd3943;
              4'd4: out_low = 12'd3943;
              4'd5: out_low = 12'd3943;
              4'd6: out_low = 12'd3943;
              4'd7: out_low = 12'd3942;
              4'd8: out_low = 12'd3942;
              4'd9: out_low = 12'd3942;
              4'd10: out_low = 12'd3942;
              4'd11: out_low = 12'd3942;
              4'd12: out_low = 12'd3942;
              4'd13: out_low = 12'd3942;
              4'd14: out_low = 12'd3942;
              4'd15: out_low = 12'd3942;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3941;
              4'd1: out_low = 12'd3941;
              4'd2: out_low = 12'd3941;
              4'd3: out_low = 12'd3941;
              4'd4: out_low = 12'd3941;
              4'd5: out_low = 12'd3941;
              4'd6: out_low = 12'd3941;
              4'd7: out_low = 12'd3941;
              4'd8: out_low = 12'd3941;
              4'd9: out_low = 12'd3940;
              4'd10: out_low = 12'd3940;
              4'd11: out_low = 12'd3940;
              4'd12: out_low = 12'd3940;
              4'd13: out_low = 12'd3940;
              4'd14: out_low = 12'd3940;
              4'd15: out_low = 12'd3940;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3940;
              4'd1: out_low = 12'd3940;
              4'd2: out_low = 12'd3939;
              4'd3: out_low = 12'd3939;
              4'd4: out_low = 12'd3939;
              4'd5: out_low = 12'd3939;
              4'd6: out_low = 12'd3939;
              4'd7: out_low = 12'd3939;
              4'd8: out_low = 12'd3939;
              4'd9: out_low = 12'd3939;
              4'd10: out_low = 12'd3939;
              4'd11: out_low = 12'd3938;
              4'd12: out_low = 12'd3938;
              4'd13: out_low = 12'd3938;
              4'd14: out_low = 12'd3938;
              4'd15: out_low = 12'd3938;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd380: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3938;
              4'd1: out_low = 12'd3938;
              4'd2: out_low = 12'd3937;
              4'd3: out_low = 12'd3937;
              4'd4: out_low = 12'd3937;
              4'd5: out_low = 12'd3937;
              4'd6: out_low = 12'd3937;
              4'd7: out_low = 12'd3936;
              4'd8: out_low = 12'd3936;
              4'd9: out_low = 12'd3936;
              4'd10: out_low = 12'd3936;
              4'd11: out_low = 12'd3936;
              4'd12: out_low = 12'd3935;
              4'd13: out_low = 12'd3935;
              4'd14: out_low = 12'd3935;
              4'd15: out_low = 12'd3935;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3934;
              4'd1: out_low = 12'd3934;
              4'd2: out_low = 12'd3934;
              4'd3: out_low = 12'd3934;
              4'd4: out_low = 12'd3934;
              4'd5: out_low = 12'd3933;
              4'd6: out_low = 12'd3933;
              4'd7: out_low = 12'd3933;
              4'd8: out_low = 12'd3933;
              4'd9: out_low = 12'd3932;
              4'd10: out_low = 12'd3932;
              4'd11: out_low = 12'd3932;
              4'd12: out_low = 12'd3932;
              4'd13: out_low = 12'd3932;
              4'd14: out_low = 12'd3931;
              4'd15: out_low = 12'd3931;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3931;
              4'd1: out_low = 12'd3931;
              4'd2: out_low = 12'd3931;
              4'd3: out_low = 12'd3930;
              4'd4: out_low = 12'd3930;
              4'd5: out_low = 12'd3930;
              4'd6: out_low = 12'd3930;
              4'd7: out_low = 12'd3929;
              4'd8: out_low = 12'd3929;
              4'd9: out_low = 12'd3929;
              4'd10: out_low = 12'd3929;
              4'd11: out_low = 12'd3929;
              4'd12: out_low = 12'd3928;
              4'd13: out_low = 12'd3928;
              4'd14: out_low = 12'd3928;
              4'd15: out_low = 12'd3928;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3928;
              4'd1: out_low = 12'd3927;
              4'd2: out_low = 12'd3927;
              4'd3: out_low = 12'd3927;
              4'd4: out_low = 12'd3927;
              4'd5: out_low = 12'd3927;
              4'd6: out_low = 12'd3926;
              4'd7: out_low = 12'd3926;
              4'd8: out_low = 12'd3926;
              4'd9: out_low = 12'd3926;
              4'd10: out_low = 12'd3925;
              4'd11: out_low = 12'd3925;
              4'd12: out_low = 12'd3925;
              4'd13: out_low = 12'd3925;
              4'd14: out_low = 12'd3925;
              4'd15: out_low = 12'd3924;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3924;
              4'd1: out_low = 12'd3924;
              4'd2: out_low = 12'd3924;
              4'd3: out_low = 12'd3924;
              4'd4: out_low = 12'd3923;
              4'd5: out_low = 12'd3923;
              4'd6: out_low = 12'd3923;
              4'd7: out_low = 12'd3923;
              4'd8: out_low = 12'd3923;
              4'd9: out_low = 12'd3922;
              4'd10: out_low = 12'd3922;
              4'd11: out_low = 12'd3922;
              4'd12: out_low = 12'd3922;
              4'd13: out_low = 12'd3922;
              4'd14: out_low = 12'd3921;
              4'd15: out_low = 12'd3921;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3921;
              4'd1: out_low = 12'd3921;
              4'd2: out_low = 12'd3921;
              4'd3: out_low = 12'd3920;
              4'd4: out_low = 12'd3920;
              4'd5: out_low = 12'd3920;
              4'd6: out_low = 12'd3920;
              4'd7: out_low = 12'd3920;
              4'd8: out_low = 12'd3919;
              4'd9: out_low = 12'd3919;
              4'd10: out_low = 12'd3919;
              4'd11: out_low = 12'd3919;
              4'd12: out_low = 12'd3919;
              4'd13: out_low = 12'd3918;
              4'd14: out_low = 12'd3918;
              4'd15: out_low = 12'd3918;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3918;
              4'd1: out_low = 12'd3918;
              4'd2: out_low = 12'd3917;
              4'd3: out_low = 12'd3917;
              4'd4: out_low = 12'd3917;
              4'd5: out_low = 12'd3917;
              4'd6: out_low = 12'd3917;
              4'd7: out_low = 12'd3916;
              4'd8: out_low = 12'd3916;
              4'd9: out_low = 12'd3916;
              4'd10: out_low = 12'd3916;
              4'd11: out_low = 12'd3916;
              4'd12: out_low = 12'd3915;
              4'd13: out_low = 12'd3915;
              4'd14: out_low = 12'd3915;
              4'd15: out_low = 12'd3915;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3915;
              4'd1: out_low = 12'd3914;
              4'd2: out_low = 12'd3914;
              4'd3: out_low = 12'd3914;
              4'd4: out_low = 12'd3914;
              4'd5: out_low = 12'd3914;
              4'd6: out_low = 12'd3913;
              4'd7: out_low = 12'd3913;
              4'd8: out_low = 12'd3913;
              4'd9: out_low = 12'd3913;
              4'd10: out_low = 12'd3913;
              4'd11: out_low = 12'd3912;
              4'd12: out_low = 12'd3912;
              4'd13: out_low = 12'd3912;
              4'd14: out_low = 12'd3912;
              4'd15: out_low = 12'd3912;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd381: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3911;
              4'd1: out_low = 12'd3911;
              4'd2: out_low = 12'd3911;
              4'd3: out_low = 12'd3910;
              4'd4: out_low = 12'd3910;
              4'd5: out_low = 12'd3909;
              4'd6: out_low = 12'd3909;
              4'd7: out_low = 12'd3909;
              4'd8: out_low = 12'd3908;
              4'd9: out_low = 12'd3908;
              4'd10: out_low = 12'd3908;
              4'd11: out_low = 12'd3907;
              4'd12: out_low = 12'd3907;
              4'd13: out_low = 12'd3906;
              4'd14: out_low = 12'd3906;
              4'd15: out_low = 12'd3906;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3905;
              4'd1: out_low = 12'd3905;
              4'd2: out_low = 12'd3904;
              4'd3: out_low = 12'd3904;
              4'd4: out_low = 12'd3904;
              4'd5: out_low = 12'd3903;
              4'd6: out_low = 12'd3903;
              4'd7: out_low = 12'd3903;
              4'd8: out_low = 12'd3902;
              4'd9: out_low = 12'd3902;
              4'd10: out_low = 12'd3902;
              4'd11: out_low = 12'd3901;
              4'd12: out_low = 12'd3901;
              4'd13: out_low = 12'd3900;
              4'd14: out_low = 12'd3900;
              4'd15: out_low = 12'd3900;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3899;
              4'd1: out_low = 12'd3899;
              4'd2: out_low = 12'd3899;
              4'd3: out_low = 12'd3898;
              4'd4: out_low = 12'd3898;
              4'd5: out_low = 12'd3897;
              4'd6: out_low = 12'd3897;
              4'd7: out_low = 12'd3897;
              4'd8: out_low = 12'd3896;
              4'd9: out_low = 12'd3896;
              4'd10: out_low = 12'd3896;
              4'd11: out_low = 12'd3895;
              4'd12: out_low = 12'd3895;
              4'd13: out_low = 12'd3895;
              4'd14: out_low = 12'd3894;
              4'd15: out_low = 12'd3894;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3894;
              4'd1: out_low = 12'd3893;
              4'd2: out_low = 12'd3893;
              4'd3: out_low = 12'd3892;
              4'd4: out_low = 12'd3892;
              4'd5: out_low = 12'd3892;
              4'd6: out_low = 12'd3891;
              4'd7: out_low = 12'd3891;
              4'd8: out_low = 12'd3891;
              4'd9: out_low = 12'd3890;
              4'd10: out_low = 12'd3890;
              4'd11: out_low = 12'd3890;
              4'd12: out_low = 12'd3889;
              4'd13: out_low = 12'd3889;
              4'd14: out_low = 12'd3889;
              4'd15: out_low = 12'd3888;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3888;
              4'd1: out_low = 12'd3888;
              4'd2: out_low = 12'd3887;
              4'd3: out_low = 12'd3887;
              4'd4: out_low = 12'd3887;
              4'd5: out_low = 12'd3886;
              4'd6: out_low = 12'd3886;
              4'd7: out_low = 12'd3886;
              4'd8: out_low = 12'd3885;
              4'd9: out_low = 12'd3885;
              4'd10: out_low = 12'd3885;
              4'd11: out_low = 12'd3884;
              4'd12: out_low = 12'd3884;
              4'd13: out_low = 12'd3884;
              4'd14: out_low = 12'd3883;
              4'd15: out_low = 12'd3883;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3883;
              4'd1: out_low = 12'd3882;
              4'd2: out_low = 12'd3882;
              4'd3: out_low = 12'd3882;
              4'd4: out_low = 12'd3881;
              4'd5: out_low = 12'd3881;
              4'd6: out_low = 12'd3881;
              4'd7: out_low = 12'd3880;
              4'd8: out_low = 12'd3880;
              4'd9: out_low = 12'd3880;
              4'd10: out_low = 12'd3879;
              4'd11: out_low = 12'd3879;
              4'd12: out_low = 12'd3879;
              4'd13: out_low = 12'd3878;
              4'd14: out_low = 12'd3878;
              4'd15: out_low = 12'd3878;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3877;
              4'd1: out_low = 12'd3877;
              4'd2: out_low = 12'd3877;
              4'd3: out_low = 12'd3876;
              4'd4: out_low = 12'd3876;
              4'd5: out_low = 12'd3876;
              4'd6: out_low = 12'd3875;
              4'd7: out_low = 12'd3875;
              4'd8: out_low = 12'd3875;
              4'd9: out_low = 12'd3874;
              4'd10: out_low = 12'd3874;
              4'd11: out_low = 12'd3874;
              4'd12: out_low = 12'd3873;
              4'd13: out_low = 12'd3873;
              4'd14: out_low = 12'd3873;
              4'd15: out_low = 12'd3873;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3872;
              4'd1: out_low = 12'd3872;
              4'd2: out_low = 12'd3872;
              4'd3: out_low = 12'd3871;
              4'd4: out_low = 12'd3871;
              4'd5: out_low = 12'd3871;
              4'd6: out_low = 12'd3870;
              4'd7: out_low = 12'd3870;
              4'd8: out_low = 12'd3870;
              4'd9: out_low = 12'd3869;
              4'd10: out_low = 12'd3869;
              4'd11: out_low = 12'd3869;
              4'd12: out_low = 12'd3868;
              4'd13: out_low = 12'd3868;
              4'd14: out_low = 12'd3868;
              4'd15: out_low = 12'd3868;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd382: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3867;
              4'd1: out_low = 12'd3867;
              4'd2: out_low = 12'd3866;
              4'd3: out_low = 12'd3865;
              4'd4: out_low = 12'd3865;
              4'd5: out_low = 12'd3864;
              4'd6: out_low = 12'd3864;
              4'd7: out_low = 12'd3863;
              4'd8: out_low = 12'd3862;
              4'd9: out_low = 12'd3862;
              4'd10: out_low = 12'd3861;
              4'd11: out_low = 12'd3861;
              4'd12: out_low = 12'd3860;
              4'd13: out_low = 12'd3860;
              4'd14: out_low = 12'd3859;
              4'd15: out_low = 12'd3858;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3858;
              4'd1: out_low = 12'd3857;
              4'd2: out_low = 12'd3857;
              4'd3: out_low = 12'd3856;
              4'd4: out_low = 12'd3856;
              4'd5: out_low = 12'd3855;
              4'd6: out_low = 12'd3854;
              4'd7: out_low = 12'd3854;
              4'd8: out_low = 12'd3853;
              4'd9: out_low = 12'd3853;
              4'd10: out_low = 12'd3852;
              4'd11: out_low = 12'd3852;
              4'd12: out_low = 12'd3851;
              4'd13: out_low = 12'd3851;
              4'd14: out_low = 12'd3850;
              4'd15: out_low = 12'd3850;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3849;
              4'd1: out_low = 12'd3848;
              4'd2: out_low = 12'd3848;
              4'd3: out_low = 12'd3847;
              4'd4: out_low = 12'd3847;
              4'd5: out_low = 12'd3846;
              4'd6: out_low = 12'd3846;
              4'd7: out_low = 12'd3845;
              4'd8: out_low = 12'd3845;
              4'd9: out_low = 12'd3844;
              4'd10: out_low = 12'd3844;
              4'd11: out_low = 12'd3843;
              4'd12: out_low = 12'd3843;
              4'd13: out_low = 12'd3842;
              4'd14: out_low = 12'd3842;
              4'd15: out_low = 12'd3841;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3841;
              4'd1: out_low = 12'd3840;
              4'd2: out_low = 12'd3839;
              4'd3: out_low = 12'd3838;
              4'd4: out_low = 12'd3837;
              4'd5: out_low = 12'd3836;
              4'd6: out_low = 12'd3835;
              4'd7: out_low = 12'd3835;
              4'd8: out_low = 12'd3834;
              4'd9: out_low = 12'd3833;
              4'd10: out_low = 12'd3832;
              4'd11: out_low = 12'd3831;
              4'd12: out_low = 12'd3830;
              4'd13: out_low = 12'd3829;
              4'd14: out_low = 12'd3828;
              4'd15: out_low = 12'd3827;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3826;
              4'd1: out_low = 12'd3825;
              4'd2: out_low = 12'd3824;
              4'd3: out_low = 12'd3823;
              4'd4: out_low = 12'd3822;
              4'd5: out_low = 12'd3821;
              4'd6: out_low = 12'd3820;
              4'd7: out_low = 12'd3819;
              4'd8: out_low = 12'd3818;
              4'd9: out_low = 12'd3817;
              4'd10: out_low = 12'd3817;
              4'd11: out_low = 12'd3816;
              4'd12: out_low = 12'd3815;
              4'd13: out_low = 12'd3814;
              4'd14: out_low = 12'd3813;
              4'd15: out_low = 12'd3812;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3811;
              4'd1: out_low = 12'd3810;
              4'd2: out_low = 12'd3809;
              4'd3: out_low = 12'd3809;
              4'd4: out_low = 12'd3808;
              4'd5: out_low = 12'd3807;
              4'd6: out_low = 12'd3806;
              4'd7: out_low = 12'd3805;
              4'd8: out_low = 12'd3804;
              4'd9: out_low = 12'd3803;
              4'd10: out_low = 12'd3802;
              4'd11: out_low = 12'd3802;
              4'd12: out_low = 12'd3801;
              4'd13: out_low = 12'd3800;
              4'd14: out_low = 12'd3799;
              4'd15: out_low = 12'd3798;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3797;
              4'd1: out_low = 12'd3797;
              4'd2: out_low = 12'd3796;
              4'd3: out_low = 12'd3795;
              4'd4: out_low = 12'd3794;
              4'd5: out_low = 12'd3793;
              4'd6: out_low = 12'd3792;
              4'd7: out_low = 12'd3792;
              4'd8: out_low = 12'd3791;
              4'd9: out_low = 12'd3790;
              4'd10: out_low = 12'd3789;
              4'd11: out_low = 12'd3788;
              4'd12: out_low = 12'd3788;
              4'd13: out_low = 12'd3787;
              4'd14: out_low = 12'd3786;
              4'd15: out_low = 12'd3785;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3785;
              4'd1: out_low = 12'd3784;
              4'd2: out_low = 12'd3783;
              4'd3: out_low = 12'd3782;
              4'd4: out_low = 12'd3781;
              4'd5: out_low = 12'd3781;
              4'd6: out_low = 12'd3780;
              4'd7: out_low = 12'd3779;
              4'd8: out_low = 12'd3778;
              4'd9: out_low = 12'd3778;
              4'd10: out_low = 12'd3777;
              4'd11: out_low = 12'd3776;
              4'd12: out_low = 12'd3775;
              4'd13: out_low = 12'd3775;
              4'd14: out_low = 12'd3774;
              4'd15: out_low = 12'd3773;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd383: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3772;
              4'd1: out_low = 12'd3771;
              4'd2: out_low = 12'd3769;
              4'd3: out_low = 12'd3768;
              4'd4: out_low = 12'd3767;
              4'd5: out_low = 12'd3765;
              4'd6: out_low = 12'd3764;
              4'd7: out_low = 12'd3762;
              4'd8: out_low = 12'd3761;
              4'd9: out_low = 12'd3760;
              4'd10: out_low = 12'd3758;
              4'd11: out_low = 12'd3757;
              4'd12: out_low = 12'd3755;
              4'd13: out_low = 12'd3754;
              4'd14: out_low = 12'd3753;
              4'd15: out_low = 12'd3752;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3750;
              4'd1: out_low = 12'd3749;
              4'd2: out_low = 12'd3748;
              4'd3: out_low = 12'd3746;
              4'd4: out_low = 12'd3745;
              4'd5: out_low = 12'd3744;
              4'd6: out_low = 12'd3743;
              4'd7: out_low = 12'd3741;
              4'd8: out_low = 12'd3740;
              4'd9: out_low = 12'd3739;
              4'd10: out_low = 12'd3738;
              4'd11: out_low = 12'd3737;
              4'd12: out_low = 12'd3735;
              4'd13: out_low = 12'd3734;
              4'd14: out_low = 12'd3733;
              4'd15: out_low = 12'd3732;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3731;
              4'd1: out_low = 12'd3730;
              4'd2: out_low = 12'd3728;
              4'd3: out_low = 12'd3727;
              4'd4: out_low = 12'd3726;
              4'd5: out_low = 12'd3725;
              4'd6: out_low = 12'd3724;
              4'd7: out_low = 12'd3723;
              4'd8: out_low = 12'd3722;
              4'd9: out_low = 12'd3721;
              4'd10: out_low = 12'd3720;
              4'd11: out_low = 12'd3719;
              4'd12: out_low = 12'd3718;
              4'd13: out_low = 12'd3717;
              4'd14: out_low = 12'd3715;
              4'd15: out_low = 12'd3714;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3713;
              4'd1: out_low = 12'd3712;
              4'd2: out_low = 12'd3711;
              4'd3: out_low = 12'd3709;
              4'd4: out_low = 12'd3707;
              4'd5: out_low = 12'd3705;
              4'd6: out_low = 12'd3703;
              4'd7: out_low = 12'd3701;
              4'd8: out_low = 12'd3699;
              4'd9: out_low = 12'd3697;
              4'd10: out_low = 12'd3695;
              4'd11: out_low = 12'd3694;
              4'd12: out_low = 12'd3692;
              4'd13: out_low = 12'd3690;
              4'd14: out_low = 12'd3688;
              4'd15: out_low = 12'd3686;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3684;
              4'd1: out_low = 12'd3683;
              4'd2: out_low = 12'd3681;
              4'd3: out_low = 12'd3679;
              4'd4: out_low = 12'd3677;
              4'd5: out_low = 12'd3676;
              4'd6: out_low = 12'd3674;
              4'd7: out_low = 12'd3672;
              4'd8: out_low = 12'd3671;
              4'd9: out_low = 12'd3669;
              4'd10: out_low = 12'd3667;
              4'd11: out_low = 12'd3666;
              4'd12: out_low = 12'd3664;
              4'd13: out_low = 12'd3662;
              4'd14: out_low = 12'd3661;
              4'd15: out_low = 12'd3659;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3658;
              4'd1: out_low = 12'd3656;
              4'd2: out_low = 12'd3655;
              4'd3: out_low = 12'd3653;
              4'd4: out_low = 12'd3651;
              4'd5: out_low = 12'd3650;
              4'd6: out_low = 12'd3648;
              4'd7: out_low = 12'd3647;
              4'd8: out_low = 12'd3645;
              4'd9: out_low = 12'd3644;
              4'd10: out_low = 12'd3642;
              4'd11: out_low = 12'd3641;
              4'd12: out_low = 12'd3640;
              4'd13: out_low = 12'd3638;
              4'd14: out_low = 12'd3637;
              4'd15: out_low = 12'd3635;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3634;
              4'd1: out_low = 12'd3633;
              4'd2: out_low = 12'd3631;
              4'd3: out_low = 12'd3630;
              4'd4: out_low = 12'd3628;
              4'd5: out_low = 12'd3627;
              4'd6: out_low = 12'd3626;
              4'd7: out_low = 12'd3624;
              4'd8: out_low = 12'd3623;
              4'd9: out_low = 12'd3622;
              4'd10: out_low = 12'd3621;
              4'd11: out_low = 12'd3619;
              4'd12: out_low = 12'd3618;
              4'd13: out_low = 12'd3617;
              4'd14: out_low = 12'd3616;
              4'd15: out_low = 12'd3614;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3613;
              4'd1: out_low = 12'd3612;
              4'd2: out_low = 12'd3611;
              4'd3: out_low = 12'd3609;
              4'd4: out_low = 12'd3608;
              4'd5: out_low = 12'd3607;
              4'd6: out_low = 12'd3606;
              4'd7: out_low = 12'd3605;
              4'd8: out_low = 12'd3604;
              4'd9: out_low = 12'd3602;
              4'd10: out_low = 12'd3601;
              4'd11: out_low = 12'd3600;
              4'd12: out_low = 12'd3599;
              4'd13: out_low = 12'd3598;
              4'd14: out_low = 12'd3597;
              4'd15: out_low = 12'd3596;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd384: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3595;
              4'd1: out_low = 12'd3592;
              4'd2: out_low = 12'd3590;
              4'd3: out_low = 12'd3588;
              4'd4: out_low = 12'd3586;
              4'd5: out_low = 12'd3584;
              4'd6: out_low = 12'd3580;
              4'd7: out_low = 12'd3576;
              4'd8: out_low = 12'd3573;
              4'd9: out_low = 12'd3569;
              4'd10: out_low = 12'd3565;
              4'd11: out_low = 12'd3561;
              4'd12: out_low = 12'd3558;
              4'd13: out_low = 12'd3554;
              4'd14: out_low = 12'd3551;
              4'd15: out_low = 12'd3547;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3544;
              4'd1: out_low = 12'd3541;
              4'd2: out_low = 12'd3537;
              4'd3: out_low = 12'd3534;
              4'd4: out_low = 12'd3531;
              4'd5: out_low = 12'd3528;
              4'd6: out_low = 12'd3525;
              4'd7: out_low = 12'd3521;
              4'd8: out_low = 12'd3518;
              4'd9: out_low = 12'd3516;
              4'd10: out_low = 12'd3513;
              4'd11: out_low = 12'd3510;
              4'd12: out_low = 12'd3507;
              4'd13: out_low = 12'd3504;
              4'd14: out_low = 12'd3501;
              4'd15: out_low = 12'd3499;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3496;
              4'd1: out_low = 12'd3494;
              4'd2: out_low = 12'd3491;
              4'd3: out_low = 12'd3488;
              4'd4: out_low = 12'd3486;
              4'd5: out_low = 12'd3483;
              4'd6: out_low = 12'd3481;
              4'd7: out_low = 12'd3479;
              4'd8: out_low = 12'd3476;
              4'd9: out_low = 12'd3474;
              4'd10: out_low = 12'd3472;
              4'd11: out_low = 12'd3470;
              4'd12: out_low = 12'd3467;
              4'd13: out_low = 12'd3465;
              4'd14: out_low = 12'd3463;
              4'd15: out_low = 12'd3461;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3459;
              4'd1: out_low = 12'd3457;
              4'd2: out_low = 12'd3454;
              4'd3: out_low = 12'd3450;
              4'd4: out_low = 12'd3446;
              4'd5: out_low = 12'd3442;
              4'd6: out_low = 12'd3438;
              4'd7: out_low = 12'd3435;
              4'd8: out_low = 12'd3431;
              4'd9: out_low = 12'd3427;
              4'd10: out_low = 12'd3424;
              4'd11: out_low = 12'd3420;
              4'd12: out_low = 12'd3417;
              4'd13: out_low = 12'd3414;
              4'd14: out_low = 12'd3410;
              4'd15: out_low = 12'd3407;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3404;
              4'd1: out_low = 12'd3401;
              4'd2: out_low = 12'd3398;
              4'd3: out_low = 12'd3395;
              4'd4: out_low = 12'd3392;
              4'd5: out_low = 12'd3389;
              4'd6: out_low = 12'd3386;
              4'd7: out_low = 12'd3383;
              4'd8: out_low = 12'd3380;
              4'd9: out_low = 12'd3377;
              4'd10: out_low = 12'd3374;
              4'd11: out_low = 12'd3372;
              4'd12: out_low = 12'd3369;
              4'd13: out_low = 12'd3366;
              4'd14: out_low = 12'd3364;
              4'd15: out_low = 12'd3361;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3359;
              4'd1: out_low = 12'd3356;
              4'd2: out_low = 12'd3354;
              4'd3: out_low = 12'd3352;
              4'd4: out_low = 12'd3349;
              4'd5: out_low = 12'd3347;
              4'd6: out_low = 12'd3345;
              4'd7: out_low = 12'd3342;
              4'd8: out_low = 12'd3340;
              4'd9: out_low = 12'd3338;
              4'd10: out_low = 12'd3336;
              4'd11: out_low = 12'd3334;
              4'd12: out_low = 12'd3332;
              4'd13: out_low = 12'd3330;
              4'd14: out_low = 12'd3327;
              4'd15: out_low = 12'd3323;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3319;
              4'd1: out_low = 12'd3316;
              4'd2: out_low = 12'd3312;
              4'd3: out_low = 12'd3308;
              4'd4: out_low = 12'd3304;
              4'd5: out_low = 12'd3301;
              4'd6: out_low = 12'd3297;
              4'd7: out_low = 12'd3294;
              4'd8: out_low = 12'd3290;
              4'd9: out_low = 12'd3287;
              4'd10: out_low = 12'd3284;
              4'd11: out_low = 12'd3280;
              4'd12: out_low = 12'd3277;
              4'd13: out_low = 12'd3274;
              4'd14: out_low = 12'd3271;
              4'd15: out_low = 12'd3268;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3265;
              4'd1: out_low = 12'd3262;
              4'd2: out_low = 12'd3259;
              4'd3: out_low = 12'd3256;
              4'd4: out_low = 12'd3253;
              4'd5: out_low = 12'd3250;
              4'd6: out_low = 12'd3247;
              4'd7: out_low = 12'd3245;
              4'd8: out_low = 12'd3242;
              4'd9: out_low = 12'd3239;
              4'd10: out_low = 12'd3237;
              4'd11: out_low = 12'd3234;
              4'd12: out_low = 12'd3232;
              4'd13: out_low = 12'd3229;
              4'd14: out_low = 12'd3227;
              4'd15: out_low = 12'd3224;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd385: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3222;
              4'd1: out_low = 12'd3217;
              4'd2: out_low = 12'd3213;
              4'd3: out_low = 12'd3209;
              4'd4: out_low = 12'd3204;
              4'd5: out_low = 12'd3200;
              4'd6: out_low = 12'd3193;
              4'd7: out_low = 12'd3185;
              4'd8: out_low = 12'd3178;
              4'd9: out_low = 12'd3171;
              4'd10: out_low = 12'd3164;
              4'd11: out_low = 12'd3157;
              4'd12: out_low = 12'd3150;
              4'd13: out_low = 12'd3144;
              4'd14: out_low = 12'd3138;
              4'd15: out_low = 12'd3132;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3126;
              4'd1: out_low = 12'd3120;
              4'd2: out_low = 12'd3115;
              4'd3: out_low = 12'd3110;
              4'd4: out_low = 12'd3105;
              4'd5: out_low = 12'd3100;
              4'd6: out_low = 12'd3095;
              4'd7: out_low = 12'd3090;
              4'd8: out_low = 12'd3086;
              4'd9: out_low = 12'd3081;
              4'd10: out_low = 12'd3077;
              4'd11: out_low = 12'd3073;
              4'd12: out_low = 12'd3066;
              4'd13: out_low = 12'd3058;
              4'd14: out_low = 12'd3051;
              4'd15: out_low = 12'd3044;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3037;
              4'd1: out_low = 12'd3030;
              4'd2: out_low = 12'd3023;
              4'd3: out_low = 12'd3017;
              4'd4: out_low = 12'd3011;
              4'd5: out_low = 12'd3005;
              4'd6: out_low = 12'd2999;
              4'd7: out_low = 12'd2993;
              4'd8: out_low = 12'd2988;
              4'd9: out_low = 12'd2983;
              4'd10: out_low = 12'd2978;
              4'd11: out_low = 12'd2973;
              4'd12: out_low = 12'd2968;
              4'd13: out_low = 12'd2963;
              4'd14: out_low = 12'd2959;
              4'd15: out_low = 12'd2954;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2950;
              4'd1: out_low = 12'd2946;
              4'd2: out_low = 12'd2940;
              4'd3: out_low = 12'd2932;
              4'd4: out_low = 12'd2924;
              4'd5: out_low = 12'd2917;
              4'd6: out_low = 12'd2910;
              4'd7: out_low = 12'd2903;
              4'd8: out_low = 12'd2897;
              4'd9: out_low = 12'd2890;
              4'd10: out_low = 12'd2884;
              4'd11: out_low = 12'd2878;
              4'd12: out_low = 12'd2872;
              4'd13: out_low = 12'd2866;
              4'd14: out_low = 12'd2861;
              4'd15: out_low = 12'd2856;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2850;
              4'd1: out_low = 12'd2845;
              4'd2: out_low = 12'd2841;
              4'd3: out_low = 12'd2836;
              4'd4: out_low = 12'd2831;
              4'd5: out_low = 12'd2827;
              4'd6: out_low = 12'd2823;
              4'd7: out_low = 12'd2819;
              4'd8: out_low = 12'd2813;
              4'd9: out_low = 12'd2805;
              4'd10: out_low = 12'd2798;
              4'd11: out_low = 12'd2790;
              4'd12: out_low = 12'd2783;
              4'd13: out_low = 12'd2776;
              4'd14: out_low = 12'd2770;
              4'd15: out_low = 12'd2763;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2757;
              4'd1: out_low = 12'd2751;
              4'd2: out_low = 12'd2745;
              4'd3: out_low = 12'd2739;
              4'd4: out_low = 12'd2734;
              4'd5: out_low = 12'd2729;
              4'd6: out_low = 12'd2723;
              4'd7: out_low = 12'd2718;
              4'd8: out_low = 12'd2713;
              4'd9: out_low = 12'd2709;
              4'd10: out_low = 12'd2704;
              4'd11: out_low = 12'd2700;
              4'd12: out_low = 12'd2695;
              4'd13: out_low = 12'd2691;
              4'd14: out_low = 12'd2686;
              4'd15: out_low = 12'd2679;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2671;
              4'd1: out_low = 12'd2664;
              4'd2: out_low = 12'd2657;
              4'd3: out_low = 12'd2650;
              4'd4: out_low = 12'd2643;
              4'd5: out_low = 12'd2636;
              4'd6: out_low = 12'd2630;
              4'd7: out_low = 12'd2624;
              4'd8: out_low = 12'd2618;
              4'd9: out_low = 12'd2612;
              4'd10: out_low = 12'd2607;
              4'd11: out_low = 12'd2602;
              4'd12: out_low = 12'd2596;
              4'd13: out_low = 12'd2591;
              4'd14: out_low = 12'd2586;
              4'd15: out_low = 12'd2582;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2577;
              4'd1: out_low = 12'd2573;
              4'd2: out_low = 12'd2568;
              4'd3: out_low = 12'd2564;
              4'd4: out_low = 12'd2560;
              4'd5: out_low = 12'd2552;
              4'd6: out_low = 12'd2544;
              4'd7: out_low = 12'd2537;
              4'd8: out_low = 12'd2530;
              4'd9: out_low = 12'd2523;
              4'd10: out_low = 12'd2516;
              4'd11: out_low = 12'd2510;
              4'd12: out_low = 12'd2503;
              4'd13: out_low = 12'd2497;
              4'd14: out_low = 12'd2491;
              4'd15: out_low = 12'd2485;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd386: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2480;
              4'd1: out_low = 12'd2469;
              4'd2: out_low = 12'd2459;
              4'd3: out_low = 12'd2450;
              4'd4: out_low = 12'd2441;
              4'd5: out_low = 12'd2433;
              4'd6: out_low = 12'd2418;
              4'd7: out_low = 12'd2403;
              4'd8: out_low = 12'd2389;
              4'd9: out_low = 12'd2376;
              4'd10: out_low = 12'd2364;
              4'd11: out_low = 12'd2353;
              4'd12: out_low = 12'd2342;
              4'd13: out_low = 12'd2332;
              4'd14: out_low = 12'd2323;
              4'd15: out_low = 12'd2314;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2305;
              4'd1: out_low = 12'd2291;
              4'd2: out_low = 12'd2276;
              4'd3: out_low = 12'd2263;
              4'd4: out_low = 12'd2250;
              4'd5: out_low = 12'd2237;
              4'd6: out_low = 12'd2226;
              4'd7: out_low = 12'd2215;
              4'd8: out_low = 12'd2205;
              4'd9: out_low = 12'd2195;
              4'd10: out_low = 12'd2187;
              4'd11: out_low = 12'd2178;
              4'd12: out_low = 12'd2165;
              4'd13: out_low = 12'd2150;
              4'd14: out_low = 12'd2136;
              4'd15: out_low = 12'd2123;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2110;
              4'd1: out_low = 12'd2099;
              4'd2: out_low = 12'd2088;
              4'd3: out_low = 12'd2078;
              4'd4: out_low = 12'd2068;
              4'd5: out_low = 12'd2059;
              4'd6: out_low = 12'd2051;
              4'd7: out_low = 12'd2038;
              4'd8: out_low = 12'd2023;
              4'd9: out_low = 12'd2009;
              4'd10: out_low = 12'd1996;
              4'd11: out_low = 12'd1983;
              4'd12: out_low = 12'd1972;
              4'd13: out_low = 12'd1961;
              4'd14: out_low = 12'd1951;
              4'd15: out_low = 12'd1941;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1932;
              4'd1: out_low = 12'd1924;
              4'd2: out_low = 12'd1911;
              4'd3: out_low = 12'd1896;
              4'd4: out_low = 12'd1882;
              4'd5: out_low = 12'd1869;
              4'd6: out_low = 12'd1857;
              4'd7: out_low = 12'd1845;
              4'd8: out_low = 12'd1834;
              4'd9: out_low = 12'd1824;
              4'd10: out_low = 12'd1814;
              4'd11: out_low = 12'd1805;
              4'd12: out_low = 12'd1796;
              4'd13: out_low = 12'd1785;
              4'd14: out_low = 12'd1770;
              4'd15: out_low = 12'd1755;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1742;
              4'd1: out_low = 12'd1730;
              4'd2: out_low = 12'd1718;
              4'd3: out_low = 12'd1707;
              4'd4: out_low = 12'd1697;
              4'd5: out_low = 12'd1687;
              4'd6: out_low = 12'd1678;
              4'd7: out_low = 12'd1669;
              4'd8: out_low = 12'd1658;
              4'd9: out_low = 12'd1643;
              4'd10: out_low = 12'd1629;
              4'd11: out_low = 12'd1615;
              4'd12: out_low = 12'd1603;
              4'd13: out_low = 12'd1591;
              4'd14: out_low = 12'd1580;
              4'd15: out_low = 12'd1569;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1560;
              4'd1: out_low = 12'd1550;
              4'd2: out_low = 12'd1542;
              4'd3: out_low = 12'd1532;
              4'd4: out_low = 12'd1516;
              4'd5: out_low = 12'd1502;
              4'd6: out_low = 12'd1489;
              4'd7: out_low = 12'd1476;
              4'd8: out_low = 12'd1464;
              4'd9: out_low = 12'd1453;
              4'd10: out_low = 12'd1442;
              4'd11: out_low = 12'd1433;
              4'd12: out_low = 12'd1423;
              4'd13: out_low = 12'd1415;
              4'd14: out_low = 12'd1405;
              4'd15: out_low = 12'd1390;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1375;
              4'd1: out_low = 12'd1362;
              4'd2: out_low = 12'd1349;
              4'd3: out_low = 12'd1337;
              4'd4: out_low = 12'd1326;
              4'd5: out_low = 12'd1315;
              4'd6: out_low = 12'd1305;
              4'd7: out_low = 12'd1296;
              4'd8: out_low = 12'd1287;
              4'd9: out_low = 12'd1278;
              4'd10: out_low = 12'd1263;
              4'd11: out_low = 12'd1248;
              4'd12: out_low = 12'd1235;
              4'd13: out_low = 12'd1222;
              4'd14: out_low = 12'd1210;
              4'd15: out_low = 12'd1199;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1188;
              4'd1: out_low = 12'd1178;
              4'd2: out_low = 12'd1169;
              4'd3: out_low = 12'd1160;
              4'd4: out_low = 12'd1152;
              4'd5: out_low = 12'd1136;
              4'd6: out_low = 12'd1122;
              4'd7: out_low = 12'd1108;
              4'd8: out_low = 12'd1095;
              4'd9: out_low = 12'd1083;
              4'd10: out_low = 12'd1072;
              4'd11: out_low = 12'd1061;
              4'd12: out_low = 12'd1051;
              4'd13: out_low = 12'd1042;
              4'd14: out_low = 12'd1033;
              4'd15: out_low = 12'd1025;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd387: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1010;
              4'd1: out_low = 12'd981;
              4'd2: out_low = 12'd956;
              4'd3: out_low = 12'd934;
              4'd4: out_low = 12'd915;
              4'd5: out_low = 12'd897;
              4'd6: out_low = 12'd868;
              4'd7: out_low = 12'd841;
              4'd8: out_low = 12'd818;
              4'd9: out_low = 12'd797;
              4'd10: out_low = 12'd778;
              4'd11: out_low = 12'd756;
              4'd12: out_low = 12'd728;
              4'd13: out_low = 12'd702;
              4'd14: out_low = 12'd680;
              4'd15: out_low = 12'd660;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd643;
              4'd1: out_low = 12'd615;
              4'd2: out_low = 12'd588;
              4'd3: out_low = 12'd564;
              4'd4: out_low = 12'd543;
              4'd5: out_low = 12'd524;
              4'd6: out_low = 12'd503;
              4'd7: out_low = 12'd474;
              4'd8: out_low = 12'd449;
              4'd9: out_low = 12'd426;
              4'd10: out_low = 12'd406;
              4'd11: out_low = 12'd388;
              4'd12: out_low = 12'd362;
              4'd13: out_low = 12'd334;
              4'd14: out_low = 12'd310;
              4'd15: out_low = 12'd289;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd270;
              4'd1: out_low = 12'd250;
              4'd2: out_low = 12'd221;
              4'd3: out_low = 12'd195;
              4'd4: out_low = 12'd172;
              4'd5: out_low = 12'd152;
              4'd6: out_low = 12'd134;
              4'd7: out_low = 12'd108;
              4'd8: out_low = 12'd80;
              4'd9: out_low = 12'd56;
              4'd10: out_low = 12'd34;
              4'd11: out_low = 12'd15;
              4'd12: out_low = 12'd4093;
              4'd13: out_low = 12'd4063;
              4'd14: out_low = 12'd4037;
              4'd15: out_low = 12'd4014;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3993;
              4'd1: out_low = 12'd3975;
              4'd2: out_low = 12'd3951;
              4'd3: out_low = 12'd3923;
              4'd4: out_low = 12'd3898;
              4'd5: out_low = 12'd3876;
              4'd6: out_low = 12'd3857;
              4'd7: out_low = 12'd3840;
              4'd8: out_low = 12'd3810;
              4'd9: out_low = 12'd3783;
              4'd10: out_low = 12'd3760;
              4'd11: out_low = 12'd3739;
              4'd12: out_low = 12'd3721;
              4'd13: out_low = 12'd3698;
              4'd14: out_low = 12'd3669;
              4'd15: out_low = 12'd3644;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3622;
              4'd1: out_low = 12'd3603;
              4'd2: out_low = 12'd3585;
              4'd3: out_low = 12'd3556;
              4'd4: out_low = 12'd3529;
              4'd5: out_low = 12'd3506;
              4'd6: out_low = 12'd3485;
              4'd7: out_low = 12'd3466;
              4'd8: out_low = 12'd3444;
              4'd9: out_low = 12'd3416;
              4'd10: out_low = 12'd3390;
              4'd11: out_low = 12'd3368;
              4'd12: out_low = 12'd3348;
              4'd13: out_low = 12'd3331;
              4'd14: out_low = 12'd3303;
              4'd15: out_low = 12'd3276;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3252;
              4'd1: out_low = 12'd3231;
              4'd2: out_low = 12'd3212;
              4'd3: out_low = 12'd3191;
              4'd4: out_low = 12'd3162;
              4'd5: out_low = 12'd3136;
              4'd6: out_low = 12'd3114;
              4'd7: out_low = 12'd3094;
              4'd8: out_low = 12'd3076;
              4'd9: out_low = 12'd3049;
              4'd10: out_low = 12'd3022;
              4'd11: out_low = 12'd2998;
              4'd12: out_low = 12'd2976;
              4'd13: out_low = 12'd2958;
              4'd14: out_low = 12'd2938;
              4'd15: out_low = 12'd2909;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2883;
              4'd1: out_low = 12'd2860;
              4'd2: out_low = 12'd2840;
              4'd3: out_low = 12'd2822;
              4'd4: out_low = 12'd2796;
              4'd5: out_low = 12'd2768;
              4'd6: out_low = 12'd2744;
              4'd7: out_low = 12'd2722;
              4'd8: out_low = 12'd2703;
              4'd9: out_low = 12'd2685;
              4'd10: out_low = 12'd2655;
              4'd11: out_low = 12'd2629;
              4'd12: out_low = 12'd2606;
              4'd13: out_low = 12'd2585;
              4'd14: out_low = 12'd2567;
              4'd15: out_low = 12'd2543;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2515;
              4'd1: out_low = 12'd2490;
              4'd2: out_low = 12'd2468;
              4'd3: out_low = 12'd2449;
              4'd4: out_low = 12'd2432;
              4'd5: out_low = 12'd2402;
              4'd6: out_low = 12'd2375;
              4'd7: out_low = 12'd2352;
              4'd8: out_low = 12'd2331;
              4'd9: out_low = 12'd2313;
              4'd10: out_low = 12'd2289;
              4'd11: out_low = 12'd2261;
              4'd12: out_low = 12'd2236;
              4'd13: out_low = 12'd2214;
              4'd14: out_low = 12'd2194;
              4'd15: out_low = 12'd2177;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd388: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2148;
              4'd1: out_low = 12'd2098;
              4'd2: out_low = 12'd2058;
              4'd3: out_low = 12'd2008;
              4'd4: out_low = 12'd1960;
              4'd5: out_low = 12'd1923;
              4'd6: out_low = 12'd1868;
              4'd7: out_low = 12'd1823;
              4'd8: out_low = 12'd1783;
              4'd9: out_low = 12'd1728;
              4'd10: out_low = 12'd1686;
              4'd11: out_low = 12'd1641;
              4'd12: out_low = 12'd1590;
              4'd13: out_low = 12'd1550;
              4'd14: out_low = 12'd1500;
              4'd15: out_low = 12'd1452;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1414;
              4'd1: out_low = 12'd1360;
              4'd2: out_low = 12'd1314;
              4'd3: out_low = 12'd1277;
              4'd4: out_low = 12'd1221;
              4'd5: out_low = 12'd1177;
              4'd6: out_low = 12'd1135;
              4'd7: out_low = 12'd1082;
              4'd8: out_low = 12'd1041;
              4'd9: out_low = 12'd993;
              4'd10: out_low = 12'd944;
              4'd11: out_low = 12'd905;
              4'd12: out_low = 12'd853;
              4'd13: out_low = 12'd806;
              4'd14: out_low = 12'd769;
              4'd15: out_low = 12'd713;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd669;
              4'd1: out_low = 12'd628;
              4'd2: out_low = 12'd574;
              4'd3: out_low = 12'd532;
              4'd4: out_low = 12'd487;
              4'd5: out_low = 12'd436;
              4'd6: out_low = 12'd396;
              4'd7: out_low = 12'd346;
              4'd8: out_low = 12'd298;
              4'd9: out_low = 12'd260;
              4'd10: out_low = 12'd206;
              4'd11: out_low = 12'd160;
              4'd12: out_low = 12'd122;
              4'd13: out_low = 12'd66;
              4'd14: out_low = 12'd23;
              4'd15: out_low = 12'd4076;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: begin
            case (mant[3:0])
              4'd0: out_low = 12'd4024;
              4'd1: out_low = 12'd3983;
              4'd2: out_low = 12'd3935;
              4'd3: out_low = 12'd3886;
              4'd4: out_low = 12'd3847;
              4'd5: out_low = 12'd3795;
              4'd6: out_low = 12'd3748;
              4'd7: out_low = 12'd3711;
              4'd8: out_low = 12'd3655;
              4'd9: out_low = 12'd3611;
              4'd10: out_low = 12'd3569;
              4'd11: out_low = 12'd3516;
              4'd12: out_low = 12'd3474;
              4'd13: out_low = 12'd3428;
              4'd14: out_low = 12'd3378;
              4'd15: out_low = 12'd3338;
              default: out_low = 12'd0;
            endcase
          end
          3'd4: begin
            case (mant[3:0])
              4'd0: out_low = 12'd3287;
              4'd1: out_low = 12'd3240;
              4'd2: out_low = 12'd3203;
              4'd3: out_low = 12'd3147;
              4'd4: out_low = 12'd3102;
              4'd5: out_low = 12'd3063;
              4'd6: out_low = 12'd3008;
              4'd7: out_low = 12'd2966;
              4'd8: out_low = 12'd2921;
              4'd9: out_low = 12'd2870;
              4'd10: out_low = 12'd2829;
              4'd11: out_low = 12'd2780;
              4'd12: out_low = 12'd2732;
              4'd13: out_low = 12'd2694;
              4'd14: out_low = 12'd2640;
              4'd15: out_low = 12'd2594;
              default: out_low = 12'd0;
            endcase
          end
          3'd5: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2556;
              4'd1: out_low = 12'd2501;
              4'd2: out_low = 12'd2457;
              4'd3: out_low = 12'd2414;
              4'd4: out_low = 12'd2362;
              4'd5: out_low = 12'd2321;
              4'd6: out_low = 12'd2273;
              4'd7: out_low = 12'd2223;
              4'd8: out_low = 12'd2185;
              4'd9: out_low = 12'd2133;
              4'd10: out_low = 12'd2086;
              4'd11: out_low = 12'd2049;
              4'd12: out_low = 12'd1993;
              4'd13: out_low = 12'd1949;
              4'd14: out_low = 12'd1908;
              4'd15: out_low = 12'd1854;
              default: out_low = 12'd0;
            endcase
          end
          3'd6: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1812;
              4'd1: out_low = 12'd1766;
              4'd2: out_low = 12'd1715;
              4'd3: out_low = 12'd1676;
              4'd4: out_low = 12'd1626;
              4'd5: out_low = 12'd1578;
              4'd6: out_low = 12'd1540;
              4'd7: out_low = 12'd1486;
              4'd8: out_low = 12'd1440;
              4'd9: out_low = 12'd1402;
              4'd10: out_low = 12'd1346;
              4'd11: out_low = 12'd1303;
              4'd12: out_low = 12'd1260;
              4'd13: out_low = 12'd1208;
              4'd14: out_low = 12'd1167;
              4'd15: out_low = 12'd1119;
              default: out_low = 12'd0;
            endcase
          end
          3'd7: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1069;
              4'd1: out_low = 12'd1031;
              4'd2: out_low = 12'd978;
              4'd3: out_low = 12'd932;
              4'd4: out_low = 12'd895;
              4'd5: out_low = 12'd839;
              4'd6: out_low = 12'd795;
              4'd7: out_low = 12'd753;
              4'd8: out_low = 12'd700;
              4'd9: out_low = 12'd658;
              4'd10: out_low = 12'd612;
              4'd11: out_low = 12'd561;
              4'd12: out_low = 12'd522;
              4'd13: out_low = 12'd471;
              4'd14: out_low = 12'd424;
              4'd15: out_low = 12'd387;
              default: out_low = 12'd0;
            endcase
          end
          default: out_low = 12'd0;
        endcase
      end
      9'd389: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd331;
              4'd1: out_low = 12'd247;
              4'd2: out_low = 12'd150;
              4'd3: out_low = 12'd53;
              4'd4: out_low = 12'd4060;
              4'd5: out_low = 12'd3974;
              4'd6: out_low = 12'd3874;
              4'd7: out_low = 12'd3780;
              4'd8: out_low = 12'd3694;
              4'd9: out_low = 12'd3601;
              4'd10: out_low = 12'd3503;
              4'd11: out_low = 12'd3413;
              4'd12: out_low = 12'd3329;
              4'd13: out_low = 12'd3228;
              4'd14: out_low = 12'd3134;
              4'd15: out_low = 12'd3046;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: begin
            case (mant[3:0])
              4'd0: out_low = 12'd2956;
              4'd1: out_low = 12'd2857;
              4'd2: out_low = 12'd2766;
              4'd3: out_low = 12'd2681;
              4'd4: out_low = 12'd2583;
              4'd5: out_low = 12'd2487;
              4'd6: out_low = 12'd2399;
              4'd7: out_low = 12'd2311;
              4'd8: out_low = 12'd2212;
              4'd9: out_low = 12'd2119;
              4'd10: out_low = 12'd2033;
              4'd11: out_low = 12'd1938;
              4'd12: out_low = 12'd1841;
              4'd13: out_low = 12'd1751;
              4'd14: out_low = 12'd1666;
              4'd15: out_low = 12'd1566;
              default: out_low = 12'd0;
            endcase
          end
          3'd2: begin
            case (mant[3:0])
              4'd0: out_low = 12'd1472;
              4'd1: out_low = 12'd1385;
              4'd2: out_low = 12'd1293;
              4'd3: out_low = 12'd1195;
              4'd4: out_low = 12'd1104;
              4'd5: out_low = 12'd1020;
              4'd6: out_low = 12'd921;
              4'd7: out_low = 12'd825;
              4'd8: out_low = 12'd737;
              4'd9: out_low = 12'd648;
              4'd10: out_low = 12'd550;
              4'd11: out_low = 12'd457;
              4'd12: out_low = 12'd372;
              4'd13: out_low = 12'd276;
              4'd14: out_low = 12'd179;
              4'd15: out_low = 12'd0;
              default: out_low = 12'd0;
            endcase
          end
          3'd3: out_low = 12'd0;
          3'd4: out_low = 12'd0;
          3'd5: out_low = 12'd0;
          3'd6: out_low = 12'd0;
          3'd7: out_low = 12'd0;
          default: out_low = 12'd0;
        endcase
      end
      9'd390: out_low = 12'd0;
      9'd391: out_low = 12'd0;
      9'd392: out_low = 12'd0;
      9'd393: out_low = 12'd0;
      9'd394: out_low = 12'd0;
      9'd395: out_low = 12'd0;
      9'd396: out_low = 12'd0;
      9'd397: out_low = 12'd0;
      9'd398: out_low = 12'd0;
      9'd399: out_low = 12'd0;
      9'd400: out_low = 12'd0;
      9'd401: out_low = 12'd0;
      9'd402: out_low = 12'd0;
      9'd403: out_low = 12'd0;
      9'd404: out_low = 12'd0;
      9'd405: out_low = 12'd0;
      9'd406: out_low = 12'd0;
      9'd407: out_low = 12'd0;
      9'd408: out_low = 12'd0;
      9'd409: out_low = 12'd0;
      9'd410: out_low = 12'd0;
      9'd411: out_low = 12'd0;
      9'd412: out_low = 12'd0;
      9'd413: out_low = 12'd0;
      9'd414: out_low = 12'd0;
      9'd415: out_low = 12'd0;
      9'd416: out_low = 12'd0;
      9'd417: out_low = 12'd0;
      9'd418: out_low = 12'd0;
      9'd419: out_low = 12'd0;
      9'd420: out_low = 12'd0;
      9'd421: out_low = 12'd0;
      9'd422: out_low = 12'd0;
      9'd423: out_low = 12'd0;
      9'd424: out_low = 12'd0;
      9'd425: out_low = 12'd0;
      9'd426: out_low = 12'd0;
      9'd427: out_low = 12'd0;
      9'd428: out_low = 12'd0;
      9'd429: out_low = 12'd0;
      9'd430: out_low = 12'd0;
      9'd431: out_low = 12'd0;
      9'd432: out_low = 12'd0;
      9'd433: out_low = 12'd0;
      9'd434: out_low = 12'd0;
      9'd435: out_low = 12'd0;
      9'd436: out_low = 12'd0;
      9'd437: out_low = 12'd0;
      9'd438: out_low = 12'd0;
      9'd439: out_low = 12'd0;
      9'd440: out_low = 12'd0;
      9'd441: out_low = 12'd0;
      9'd442: out_low = 12'd0;
      9'd443: out_low = 12'd0;
      9'd444: out_low = 12'd0;
      9'd445: out_low = 12'd0;
      9'd446: out_low = 12'd0;
      9'd447: out_low = 12'd0;
      9'd448: out_low = 12'd0;
      9'd449: out_low = 12'd0;
      9'd450: out_low = 12'd0;
      9'd451: out_low = 12'd0;
      9'd452: out_low = 12'd0;
      9'd453: out_low = 12'd0;
      9'd454: out_low = 12'd0;
      9'd455: out_low = 12'd0;
      9'd456: out_low = 12'd0;
      9'd457: out_low = 12'd0;
      9'd458: out_low = 12'd0;
      9'd459: out_low = 12'd0;
      9'd460: out_low = 12'd0;
      9'd461: out_low = 12'd0;
      9'd462: out_low = 12'd0;
      9'd463: out_low = 12'd0;
      9'd464: out_low = 12'd0;
      9'd465: out_low = 12'd0;
      9'd466: out_low = 12'd0;
      9'd467: out_low = 12'd0;
      9'd468: out_low = 12'd0;
      9'd469: out_low = 12'd0;
      9'd470: out_low = 12'd0;
      9'd471: out_low = 12'd0;
      9'd472: out_low = 12'd0;
      9'd473: out_low = 12'd0;
      9'd474: out_low = 12'd0;
      9'd475: out_low = 12'd0;
      9'd476: out_low = 12'd0;
      9'd477: out_low = 12'd0;
      9'd478: out_low = 12'd0;
      9'd479: out_low = 12'd0;
      9'd480: out_low = 12'd0;
      9'd481: out_low = 12'd0;
      9'd482: out_low = 12'd0;
      9'd483: out_low = 12'd0;
      9'd484: out_low = 12'd0;
      9'd485: out_low = 12'd0;
      9'd486: out_low = 12'd0;
      9'd487: out_low = 12'd0;
      9'd488: out_low = 12'd0;
      9'd489: out_low = 12'd0;
      9'd490: out_low = 12'd0;
      9'd491: out_low = 12'd0;
      9'd492: out_low = 12'd0;
      9'd493: out_low = 12'd0;
      9'd494: out_low = 12'd0;
      9'd495: out_low = 12'd0;
      9'd496: out_low = 12'd0;
      9'd497: out_low = 12'd0;
      9'd498: out_low = 12'd0;
      9'd499: out_low = 12'd0;
      9'd500: out_low = 12'd0;
      9'd501: out_low = 12'd0;
      9'd502: out_low = 12'd0;
      9'd503: out_low = 12'd0;
      9'd504: out_low = 12'd0;
      9'd505: out_low = 12'd0;
      9'd506: out_low = 12'd0;
      9'd507: out_low = 12'd0;
      9'd508: out_low = 12'd0;
      9'd509: out_low = 12'd0;
      9'd510: out_low = 12'd0;
      9'd511: begin
        case (mant[6:4])
          3'd0: begin
            case (mant[3:0])
              4'd0: out_low = 12'd0;
              4'd1: out_low = 12'd4032;
              4'd2: out_low = 12'd4032;
              4'd3: out_low = 12'd4032;
              4'd4: out_low = 12'd4032;
              4'd5: out_low = 12'd4032;
              4'd6: out_low = 12'd4032;
              4'd7: out_low = 12'd4032;
              4'd8: out_low = 12'd4032;
              4'd9: out_low = 12'd4032;
              4'd10: out_low = 12'd4032;
              4'd11: out_low = 12'd4032;
              4'd12: out_low = 12'd4032;
              4'd13: out_low = 12'd4032;
              4'd14: out_low = 12'd4032;
              4'd15: out_low = 12'd4032;
              default: out_low = 12'd0;
            endcase
          end
          3'd1: out_low = 12'd4032;
          3'd2: out_low = 12'd4032;
          3'd3: out_low = 12'd4032;
          3'd4: out_low = 12'd4032;
          3'd5: out_low = 12'd4032;
          3'd6: out_low = 12'd4032;
          3'd7: out_low = 12'd4032;
          default: out_low = 12'd0;
        endcase
      end
      default: out_low = 12'd0;
    endcase
  end
  reg out_b15;
  always @* begin
    case (sign_exp)
      9'd0: begin
        out_b15 = 1'b0;
      end
      9'd1: begin
        out_b15 = 1'b0;
      end
      9'd2: begin
        out_b15 = 1'b0;
      end
      9'd3: begin
        out_b15 = 1'b0;
      end
      9'd4: begin
        out_b15 = 1'b0;
      end
      9'd5: begin
        out_b15 = 1'b0;
      end
      9'd6: begin
        out_b15 = 1'b0;
      end
      9'd7: begin
        out_b15 = 1'b0;
      end
      9'd8: begin
        out_b15 = 1'b0;
      end
      9'd9: begin
        out_b15 = 1'b0;
      end
      9'd10: begin
        out_b15 = 1'b0;
      end
      9'd11: begin
        out_b15 = 1'b0;
      end
      9'd12: begin
        out_b15 = 1'b0;
      end
      9'd13: begin
        out_b15 = 1'b0;
      end
      9'd14: begin
        out_b15 = 1'b0;
      end
      9'd15: begin
        out_b15 = 1'b0;
      end
      9'd16: begin
        out_b15 = 1'b0;
      end
      9'd17: begin
        out_b15 = 1'b0;
      end
      9'd18: begin
        out_b15 = 1'b0;
      end
      9'd19: begin
        out_b15 = 1'b0;
      end
      9'd20: begin
        out_b15 = 1'b0;
      end
      9'd21: begin
        out_b15 = 1'b0;
      end
      9'd22: begin
        out_b15 = 1'b0;
      end
      9'd23: begin
        out_b15 = 1'b0;
      end
      9'd24: begin
        out_b15 = 1'b0;
      end
      9'd25: begin
        out_b15 = 1'b0;
      end
      9'd26: begin
        out_b15 = 1'b0;
      end
      9'd27: begin
        out_b15 = 1'b0;
      end
      9'd28: begin
        out_b15 = 1'b0;
      end
      9'd29: begin
        out_b15 = 1'b0;
      end
      9'd30: begin
        out_b15 = 1'b0;
      end
      9'd31: begin
        out_b15 = 1'b0;
      end
      9'd32: begin
        out_b15 = 1'b0;
      end
      9'd33: begin
        out_b15 = 1'b0;
      end
      9'd34: begin
        out_b15 = 1'b0;
      end
      9'd35: begin
        out_b15 = 1'b0;
      end
      9'd36: begin
        out_b15 = 1'b0;
      end
      9'd37: begin
        out_b15 = 1'b0;
      end
      9'd38: begin
        out_b15 = 1'b0;
      end
      9'd39: begin
        out_b15 = 1'b0;
      end
      9'd40: begin
        out_b15 = 1'b0;
      end
      9'd41: begin
        out_b15 = 1'b0;
      end
      9'd42: begin
        out_b15 = 1'b0;
      end
      9'd43: begin
        out_b15 = 1'b0;
      end
      9'd44: begin
        out_b15 = 1'b0;
      end
      9'd45: begin
        out_b15 = 1'b0;
      end
      9'd46: begin
        out_b15 = 1'b0;
      end
      9'd47: begin
        out_b15 = 1'b0;
      end
      9'd48: begin
        out_b15 = 1'b0;
      end
      9'd49: begin
        out_b15 = 1'b0;
      end
      9'd50: begin
        out_b15 = 1'b0;
      end
      9'd51: begin
        out_b15 = 1'b0;
      end
      9'd52: begin
        out_b15 = 1'b0;
      end
      9'd53: begin
        out_b15 = 1'b0;
      end
      9'd54: begin
        out_b15 = 1'b0;
      end
      9'd55: begin
        out_b15 = 1'b0;
      end
      9'd56: begin
        out_b15 = 1'b0;
      end
      9'd57: begin
        out_b15 = 1'b0;
      end
      9'd58: begin
        out_b15 = 1'b0;
      end
      9'd59: begin
        out_b15 = 1'b0;
      end
      9'd60: begin
        out_b15 = 1'b0;
      end
      9'd61: begin
        out_b15 = 1'b0;
      end
      9'd62: begin
        out_b15 = 1'b0;
      end
      9'd63: begin
        out_b15 = 1'b0;
      end
      9'd64: begin
        out_b15 = 1'b0;
      end
      9'd65: begin
        out_b15 = 1'b0;
      end
      9'd66: begin
        out_b15 = 1'b0;
      end
      9'd67: begin
        out_b15 = 1'b0;
      end
      9'd68: begin
        out_b15 = 1'b0;
      end
      9'd69: begin
        out_b15 = 1'b0;
      end
      9'd70: begin
        out_b15 = 1'b0;
      end
      9'd71: begin
        out_b15 = 1'b0;
      end
      9'd72: begin
        out_b15 = 1'b0;
      end
      9'd73: begin
        out_b15 = 1'b0;
      end
      9'd74: begin
        out_b15 = 1'b0;
      end
      9'd75: begin
        out_b15 = 1'b0;
      end
      9'd76: begin
        out_b15 = 1'b0;
      end
      9'd77: begin
        out_b15 = 1'b0;
      end
      9'd78: begin
        out_b15 = 1'b0;
      end
      9'd79: begin
        out_b15 = 1'b0;
      end
      9'd80: begin
        out_b15 = 1'b0;
      end
      9'd81: begin
        out_b15 = 1'b0;
      end
      9'd82: begin
        out_b15 = 1'b0;
      end
      9'd83: begin
        out_b15 = 1'b0;
      end
      9'd84: begin
        out_b15 = 1'b0;
      end
      9'd85: begin
        out_b15 = 1'b0;
      end
      9'd86: begin
        out_b15 = 1'b0;
      end
      9'd87: begin
        out_b15 = 1'b0;
      end
      9'd88: begin
        out_b15 = 1'b0;
      end
      9'd89: begin
        out_b15 = 1'b0;
      end
      9'd90: begin
        out_b15 = 1'b0;
      end
      9'd91: begin
        out_b15 = 1'b0;
      end
      9'd92: begin
        out_b15 = 1'b0;
      end
      9'd93: begin
        out_b15 = 1'b0;
      end
      9'd94: begin
        out_b15 = 1'b0;
      end
      9'd95: begin
        out_b15 = 1'b0;
      end
      9'd96: begin
        out_b15 = 1'b0;
      end
      9'd97: begin
        out_b15 = 1'b0;
      end
      9'd98: begin
        out_b15 = 1'b0;
      end
      9'd99: begin
        out_b15 = 1'b0;
      end
      9'd100: begin
        out_b15 = 1'b0;
      end
      9'd101: begin
        out_b15 = 1'b0;
      end
      9'd102: begin
        out_b15 = 1'b0;
      end
      9'd103: begin
        out_b15 = 1'b0;
      end
      9'd104: begin
        out_b15 = 1'b0;
      end
      9'd105: begin
        out_b15 = 1'b0;
      end
      9'd106: begin
        out_b15 = 1'b0;
      end
      9'd107: begin
        out_b15 = 1'b0;
      end
      9'd108: begin
        out_b15 = 1'b0;
      end
      9'd109: begin
        out_b15 = 1'b0;
      end
      9'd110: begin
        out_b15 = 1'b0;
      end
      9'd111: begin
        out_b15 = 1'b0;
      end
      9'd112: begin
        out_b15 = 1'b0;
      end
      9'd113: begin
        out_b15 = 1'b0;
      end
      9'd114: begin
        out_b15 = 1'b0;
      end
      9'd115: begin
        out_b15 = 1'b0;
      end
      9'd116: begin
        out_b15 = 1'b0;
      end
      9'd117: begin
        out_b15 = 1'b0;
      end
      9'd118: begin
        out_b15 = 1'b0;
      end
      9'd119: begin
        out_b15 = 1'b0;
      end
      9'd120: begin
        out_b15 = 1'b0;
      end
      9'd121: begin
        out_b15 = 1'b0;
      end
      9'd122: begin
        out_b15 = 1'b0;
      end
      9'd123: begin
        out_b15 = 1'b0;
      end
      9'd124: begin
        out_b15 = 1'b0;
      end
      9'd125: begin
        out_b15 = 1'b0;
      end
      9'd126: begin
        out_b15 = 1'b0;
      end
      9'd127: begin
        out_b15 = 1'b0;
      end
      9'd128: begin
        out_b15 = 1'b0;
      end
      9'd129: begin
        out_b15 = 1'b0;
      end
      9'd130: begin
        out_b15 = 1'b0;
      end
      9'd131: begin
        out_b15 = 1'b0;
      end
      9'd132: begin
        out_b15 = 1'b0;
      end
      9'd133: begin
        out_b15 = 1'b0;
      end
      9'd134: begin
        out_b15 = 1'b0;
      end
      9'd135: begin
        out_b15 = 1'b0;
      end
      9'd136: begin
        out_b15 = 1'b0;
      end
      9'd137: begin
        out_b15 = 1'b0;
      end
      9'd138: begin
        out_b15 = 1'b0;
      end
      9'd139: begin
        out_b15 = 1'b0;
      end
      9'd140: begin
        out_b15 = 1'b0;
      end
      9'd141: begin
        out_b15 = 1'b0;
      end
      9'd142: begin
        out_b15 = 1'b0;
      end
      9'd143: begin
        out_b15 = 1'b0;
      end
      9'd144: begin
        out_b15 = 1'b0;
      end
      9'd145: begin
        out_b15 = 1'b0;
      end
      9'd146: begin
        out_b15 = 1'b0;
      end
      9'd147: begin
        out_b15 = 1'b0;
      end
      9'd148: begin
        out_b15 = 1'b0;
      end
      9'd149: begin
        out_b15 = 1'b0;
      end
      9'd150: begin
        out_b15 = 1'b0;
      end
      9'd151: begin
        out_b15 = 1'b0;
      end
      9'd152: begin
        out_b15 = 1'b0;
      end
      9'd153: begin
        out_b15 = 1'b0;
      end
      9'd154: begin
        out_b15 = 1'b0;
      end
      9'd155: begin
        out_b15 = 1'b0;
      end
      9'd156: begin
        out_b15 = 1'b0;
      end
      9'd157: begin
        out_b15 = 1'b0;
      end
      9'd158: begin
        out_b15 = 1'b0;
      end
      9'd159: begin
        out_b15 = 1'b0;
      end
      9'd160: begin
        out_b15 = 1'b0;
      end
      9'd161: begin
        out_b15 = 1'b0;
      end
      9'd162: begin
        out_b15 = 1'b0;
      end
      9'd163: begin
        out_b15 = 1'b0;
      end
      9'd164: begin
        out_b15 = 1'b0;
      end
      9'd165: begin
        out_b15 = 1'b0;
      end
      9'd166: begin
        out_b15 = 1'b0;
      end
      9'd167: begin
        out_b15 = 1'b0;
      end
      9'd168: begin
        out_b15 = 1'b0;
      end
      9'd169: begin
        out_b15 = 1'b0;
      end
      9'd170: begin
        out_b15 = 1'b0;
      end
      9'd171: begin
        out_b15 = 1'b0;
      end
      9'd172: begin
        out_b15 = 1'b0;
      end
      9'd173: begin
        out_b15 = 1'b0;
      end
      9'd174: begin
        out_b15 = 1'b0;
      end
      9'd175: begin
        out_b15 = 1'b0;
      end
      9'd176: begin
        out_b15 = 1'b0;
      end
      9'd177: begin
        out_b15 = 1'b0;
      end
      9'd178: begin
        out_b15 = 1'b0;
      end
      9'd179: begin
        out_b15 = 1'b0;
      end
      9'd180: begin
        out_b15 = 1'b0;
      end
      9'd181: begin
        out_b15 = 1'b0;
      end
      9'd182: begin
        out_b15 = 1'b0;
      end
      9'd183: begin
        out_b15 = 1'b0;
      end
      9'd184: begin
        out_b15 = 1'b0;
      end
      9'd185: begin
        out_b15 = 1'b0;
      end
      9'd186: begin
        out_b15 = 1'b0;
      end
      9'd187: begin
        out_b15 = 1'b0;
      end
      9'd188: begin
        out_b15 = 1'b0;
      end
      9'd189: begin
        out_b15 = 1'b0;
      end
      9'd190: begin
        out_b15 = 1'b0;
      end
      9'd191: begin
        out_b15 = 1'b0;
      end
      9'd192: begin
        out_b15 = 1'b0;
      end
      9'd193: begin
        out_b15 = 1'b0;
      end
      9'd194: begin
        out_b15 = 1'b0;
      end
      9'd195: begin
        out_b15 = 1'b0;
      end
      9'd196: begin
        out_b15 = 1'b0;
      end
      9'd197: begin
        out_b15 = 1'b0;
      end
      9'd198: begin
        out_b15 = 1'b0;
      end
      9'd199: begin
        out_b15 = 1'b0;
      end
      9'd200: begin
        out_b15 = 1'b0;
      end
      9'd201: begin
        out_b15 = 1'b0;
      end
      9'd202: begin
        out_b15 = 1'b0;
      end
      9'd203: begin
        out_b15 = 1'b0;
      end
      9'd204: begin
        out_b15 = 1'b0;
      end
      9'd205: begin
        out_b15 = 1'b0;
      end
      9'd206: begin
        out_b15 = 1'b0;
      end
      9'd207: begin
        out_b15 = 1'b0;
      end
      9'd208: begin
        out_b15 = 1'b0;
      end
      9'd209: begin
        out_b15 = 1'b0;
      end
      9'd210: begin
        out_b15 = 1'b0;
      end
      9'd211: begin
        out_b15 = 1'b0;
      end
      9'd212: begin
        out_b15 = 1'b0;
      end
      9'd213: begin
        out_b15 = 1'b0;
      end
      9'd214: begin
        out_b15 = 1'b0;
      end
      9'd215: begin
        out_b15 = 1'b0;
      end
      9'd216: begin
        out_b15 = 1'b0;
      end
      9'd217: begin
        out_b15 = 1'b0;
      end
      9'd218: begin
        out_b15 = 1'b0;
      end
      9'd219: begin
        out_b15 = 1'b0;
      end
      9'd220: begin
        out_b15 = 1'b0;
      end
      9'd221: begin
        out_b15 = 1'b0;
      end
      9'd222: begin
        out_b15 = 1'b0;
      end
      9'd223: begin
        out_b15 = 1'b0;
      end
      9'd224: begin
        out_b15 = 1'b0;
      end
      9'd225: begin
        out_b15 = 1'b0;
      end
      9'd226: begin
        out_b15 = 1'b0;
      end
      9'd227: begin
        out_b15 = 1'b0;
      end
      9'd228: begin
        out_b15 = 1'b0;
      end
      9'd229: begin
        out_b15 = 1'b0;
      end
      9'd230: begin
        out_b15 = 1'b0;
      end
      9'd231: begin
        out_b15 = 1'b0;
      end
      9'd232: begin
        out_b15 = 1'b0;
      end
      9'd233: begin
        out_b15 = 1'b0;
      end
      9'd234: begin
        out_b15 = 1'b0;
      end
      9'd235: begin
        out_b15 = 1'b0;
      end
      9'd236: begin
        out_b15 = 1'b0;
      end
      9'd237: begin
        out_b15 = 1'b0;
      end
      9'd238: begin
        out_b15 = 1'b0;
      end
      9'd239: begin
        out_b15 = 1'b0;
      end
      9'd240: begin
        out_b15 = 1'b0;
      end
      9'd241: begin
        out_b15 = 1'b0;
      end
      9'd242: begin
        out_b15 = 1'b0;
      end
      9'd243: begin
        out_b15 = 1'b0;
      end
      9'd244: begin
        out_b15 = 1'b0;
      end
      9'd245: begin
        out_b15 = 1'b0;
      end
      9'd246: begin
        out_b15 = 1'b0;
      end
      9'd247: begin
        out_b15 = 1'b0;
      end
      9'd248: begin
        out_b15 = 1'b0;
      end
      9'd249: begin
        out_b15 = 1'b0;
      end
      9'd250: begin
        out_b15 = 1'b0;
      end
      9'd251: begin
        out_b15 = 1'b0;
      end
      9'd252: begin
        out_b15 = 1'b0;
      end
      9'd253: begin
        out_b15 = 1'b0;
      end
      9'd254: begin
        out_b15 = 1'b0;
      end
      9'd255: begin
        out_b15 = 1'b0;
      end
      9'd256: begin
        out_b15 = 1'b0;
      end
      9'd257: begin
        out_b15 = 1'b0;
      end
      9'd258: begin
        out_b15 = 1'b0;
      end
      9'd259: begin
        out_b15 = 1'b0;
      end
      9'd260: begin
        out_b15 = 1'b0;
      end
      9'd261: begin
        out_b15 = 1'b0;
      end
      9'd262: begin
        out_b15 = 1'b0;
      end
      9'd263: begin
        out_b15 = 1'b0;
      end
      9'd264: begin
        out_b15 = 1'b0;
      end
      9'd265: begin
        out_b15 = 1'b0;
      end
      9'd266: begin
        out_b15 = 1'b0;
      end
      9'd267: begin
        out_b15 = 1'b0;
      end
      9'd268: begin
        out_b15 = 1'b0;
      end
      9'd269: begin
        out_b15 = 1'b0;
      end
      9'd270: begin
        out_b15 = 1'b0;
      end
      9'd271: begin
        out_b15 = 1'b0;
      end
      9'd272: begin
        out_b15 = 1'b0;
      end
      9'd273: begin
        out_b15 = 1'b0;
      end
      9'd274: begin
        out_b15 = 1'b0;
      end
      9'd275: begin
        out_b15 = 1'b0;
      end
      9'd276: begin
        out_b15 = 1'b0;
      end
      9'd277: begin
        out_b15 = 1'b0;
      end
      9'd278: begin
        out_b15 = 1'b0;
      end
      9'd279: begin
        out_b15 = 1'b0;
      end
      9'd280: begin
        out_b15 = 1'b0;
      end
      9'd281: begin
        out_b15 = 1'b0;
      end
      9'd282: begin
        out_b15 = 1'b0;
      end
      9'd283: begin
        out_b15 = 1'b0;
      end
      9'd284: begin
        out_b15 = 1'b0;
      end
      9'd285: begin
        out_b15 = 1'b0;
      end
      9'd286: begin
        out_b15 = 1'b0;
      end
      9'd287: begin
        out_b15 = 1'b0;
      end
      9'd288: begin
        out_b15 = 1'b0;
      end
      9'd289: begin
        out_b15 = 1'b0;
      end
      9'd290: begin
        out_b15 = 1'b0;
      end
      9'd291: begin
        out_b15 = 1'b0;
      end
      9'd292: begin
        out_b15 = 1'b0;
      end
      9'd293: begin
        out_b15 = 1'b0;
      end
      9'd294: begin
        out_b15 = 1'b0;
      end
      9'd295: begin
        out_b15 = 1'b0;
      end
      9'd296: begin
        out_b15 = 1'b0;
      end
      9'd297: begin
        out_b15 = 1'b0;
      end
      9'd298: begin
        out_b15 = 1'b0;
      end
      9'd299: begin
        out_b15 = 1'b0;
      end
      9'd300: begin
        out_b15 = 1'b0;
      end
      9'd301: begin
        out_b15 = 1'b0;
      end
      9'd302: begin
        out_b15 = 1'b0;
      end
      9'd303: begin
        out_b15 = 1'b0;
      end
      9'd304: begin
        out_b15 = 1'b0;
      end
      9'd305: begin
        out_b15 = 1'b0;
      end
      9'd306: begin
        out_b15 = 1'b0;
      end
      9'd307: begin
        out_b15 = 1'b0;
      end
      9'd308: begin
        out_b15 = 1'b0;
      end
      9'd309: begin
        out_b15 = 1'b0;
      end
      9'd310: begin
        out_b15 = 1'b0;
      end
      9'd311: begin
        out_b15 = 1'b0;
      end
      9'd312: begin
        out_b15 = 1'b0;
      end
      9'd313: begin
        out_b15 = 1'b0;
      end
      9'd314: begin
        out_b15 = 1'b0;
      end
      9'd315: begin
        out_b15 = 1'b0;
      end
      9'd316: begin
        out_b15 = 1'b0;
      end
      9'd317: begin
        out_b15 = 1'b0;
      end
      9'd318: begin
        out_b15 = 1'b0;
      end
      9'd319: begin
        out_b15 = 1'b0;
      end
      9'd320: begin
        out_b15 = 1'b0;
      end
      9'd321: begin
        out_b15 = 1'b0;
      end
      9'd322: begin
        out_b15 = 1'b0;
      end
      9'd323: begin
        out_b15 = 1'b0;
      end
      9'd324: begin
        out_b15 = 1'b0;
      end
      9'd325: begin
        out_b15 = 1'b0;
      end
      9'd326: begin
        out_b15 = 1'b0;
      end
      9'd327: begin
        out_b15 = 1'b0;
      end
      9'd328: begin
        out_b15 = 1'b0;
      end
      9'd329: begin
        out_b15 = 1'b0;
      end
      9'd330: begin
        out_b15 = 1'b0;
      end
      9'd331: begin
        out_b15 = 1'b0;
      end
      9'd332: begin
        out_b15 = 1'b0;
      end
      9'd333: begin
        out_b15 = 1'b0;
      end
      9'd334: begin
        out_b15 = 1'b0;
      end
      9'd335: begin
        out_b15 = 1'b0;
      end
      9'd336: begin
        out_b15 = 1'b0;
      end
      9'd337: begin
        out_b15 = 1'b0;
      end
      9'd338: begin
        out_b15 = 1'b0;
      end
      9'd339: begin
        out_b15 = 1'b0;
      end
      9'd340: begin
        out_b15 = 1'b0;
      end
      9'd341: begin
        out_b15 = 1'b0;
      end
      9'd342: begin
        out_b15 = 1'b0;
      end
      9'd343: begin
        out_b15 = 1'b0;
      end
      9'd344: begin
        out_b15 = 1'b0;
      end
      9'd345: begin
        out_b15 = 1'b0;
      end
      9'd346: begin
        out_b15 = 1'b0;
      end
      9'd347: begin
        out_b15 = 1'b0;
      end
      9'd348: begin
        out_b15 = 1'b0;
      end
      9'd349: begin
        out_b15 = 1'b0;
      end
      9'd350: begin
        out_b15 = 1'b0;
      end
      9'd351: begin
        out_b15 = 1'b0;
      end
      9'd352: begin
        out_b15 = 1'b0;
      end
      9'd353: begin
        out_b15 = 1'b0;
      end
      9'd354: begin
        out_b15 = 1'b0;
      end
      9'd355: begin
        out_b15 = 1'b0;
      end
      9'd356: begin
        out_b15 = 1'b0;
      end
      9'd357: begin
        out_b15 = 1'b0;
      end
      9'd358: begin
        out_b15 = 1'b0;
      end
      9'd359: begin
        out_b15 = 1'b0;
      end
      9'd360: begin
        out_b15 = 1'b0;
      end
      9'd361: begin
        out_b15 = 1'b0;
      end
      9'd362: begin
        out_b15 = 1'b0;
      end
      9'd363: begin
        out_b15 = 1'b0;
      end
      9'd364: begin
        out_b15 = 1'b0;
      end
      9'd365: begin
        out_b15 = 1'b0;
      end
      9'd366: begin
        out_b15 = 1'b0;
      end
      9'd367: begin
        out_b15 = 1'b0;
      end
      9'd368: begin
        out_b15 = 1'b0;
      end
      9'd369: begin
        out_b15 = 1'b0;
      end
      9'd370: begin
        out_b15 = 1'b0;
      end
      9'd371: begin
        out_b15 = 1'b0;
      end
      9'd372: begin
        out_b15 = 1'b0;
      end
      9'd373: begin
        out_b15 = 1'b0;
      end
      9'd374: begin
        out_b15 = 1'b0;
      end
      9'd375: begin
        out_b15 = 1'b0;
      end
      9'd376: begin
        out_b15 = 1'b0;
      end
      9'd377: begin
        out_b15 = 1'b0;
      end
      9'd378: begin
        out_b15 = 1'b0;
      end
      9'd379: begin
        out_b15 = 1'b0;
      end
      9'd380: begin
        out_b15 = 1'b0;
      end
      9'd381: begin
        out_b15 = 1'b0;
      end
      9'd382: begin
        out_b15 = 1'b0;
      end
      9'd383: begin
        out_b15 = 1'b0;
      end
      9'd384: begin
        out_b15 = 1'b0;
      end
      9'd385: begin
        out_b15 = 1'b0;
      end
      9'd386: begin
        out_b15 = 1'b0;
      end
      9'd387: begin
        out_b15 = 1'b0;
      end
      9'd388: begin
        out_b15 = 1'b0;
      end
      9'd389: begin
        out_b15 = 1'b0;
      end
      9'd390: begin
        out_b15 = 1'b0;
      end
      9'd391: begin
        out_b15 = 1'b0;
      end
      9'd392: begin
        out_b15 = 1'b0;
      end
      9'd393: begin
        out_b15 = 1'b0;
      end
      9'd394: begin
        out_b15 = 1'b0;
      end
      9'd395: begin
        out_b15 = 1'b0;
      end
      9'd396: begin
        out_b15 = 1'b0;
      end
      9'd397: begin
        out_b15 = 1'b0;
      end
      9'd398: begin
        out_b15 = 1'b0;
      end
      9'd399: begin
        out_b15 = 1'b0;
      end
      9'd400: begin
        out_b15 = 1'b0;
      end
      9'd401: begin
        out_b15 = 1'b0;
      end
      9'd402: begin
        out_b15 = 1'b0;
      end
      9'd403: begin
        out_b15 = 1'b0;
      end
      9'd404: begin
        out_b15 = 1'b0;
      end
      9'd405: begin
        out_b15 = 1'b0;
      end
      9'd406: begin
        out_b15 = 1'b0;
      end
      9'd407: begin
        out_b15 = 1'b0;
      end
      9'd408: begin
        out_b15 = 1'b0;
      end
      9'd409: begin
        out_b15 = 1'b0;
      end
      9'd410: begin
        out_b15 = 1'b0;
      end
      9'd411: begin
        out_b15 = 1'b0;
      end
      9'd412: begin
        out_b15 = 1'b0;
      end
      9'd413: begin
        out_b15 = 1'b0;
      end
      9'd414: begin
        out_b15 = 1'b0;
      end
      9'd415: begin
        out_b15 = 1'b0;
      end
      9'd416: begin
        out_b15 = 1'b0;
      end
      9'd417: begin
        out_b15 = 1'b0;
      end
      9'd418: begin
        out_b15 = 1'b0;
      end
      9'd419: begin
        out_b15 = 1'b0;
      end
      9'd420: begin
        out_b15 = 1'b0;
      end
      9'd421: begin
        out_b15 = 1'b0;
      end
      9'd422: begin
        out_b15 = 1'b0;
      end
      9'd423: begin
        out_b15 = 1'b0;
      end
      9'd424: begin
        out_b15 = 1'b0;
      end
      9'd425: begin
        out_b15 = 1'b0;
      end
      9'd426: begin
        out_b15 = 1'b0;
      end
      9'd427: begin
        out_b15 = 1'b0;
      end
      9'd428: begin
        out_b15 = 1'b0;
      end
      9'd429: begin
        out_b15 = 1'b0;
      end
      9'd430: begin
        out_b15 = 1'b0;
      end
      9'd431: begin
        out_b15 = 1'b0;
      end
      9'd432: begin
        out_b15 = 1'b0;
      end
      9'd433: begin
        out_b15 = 1'b0;
      end
      9'd434: begin
        out_b15 = 1'b0;
      end
      9'd435: begin
        out_b15 = 1'b0;
      end
      9'd436: begin
        out_b15 = 1'b0;
      end
      9'd437: begin
        out_b15 = 1'b0;
      end
      9'd438: begin
        out_b15 = 1'b0;
      end
      9'd439: begin
        out_b15 = 1'b0;
      end
      9'd440: begin
        out_b15 = 1'b0;
      end
      9'd441: begin
        out_b15 = 1'b0;
      end
      9'd442: begin
        out_b15 = 1'b0;
      end
      9'd443: begin
        out_b15 = 1'b0;
      end
      9'd444: begin
        out_b15 = 1'b0;
      end
      9'd445: begin
        out_b15 = 1'b0;
      end
      9'd446: begin
        out_b15 = 1'b0;
      end
      9'd447: begin
        out_b15 = 1'b0;
      end
      9'd448: begin
        out_b15 = 1'b0;
      end
      9'd449: begin
        out_b15 = 1'b0;
      end
      9'd450: begin
        out_b15 = 1'b0;
      end
      9'd451: begin
        out_b15 = 1'b0;
      end
      9'd452: begin
        out_b15 = 1'b0;
      end
      9'd453: begin
        out_b15 = 1'b0;
      end
      9'd454: begin
        out_b15 = 1'b0;
      end
      9'd455: begin
        out_b15 = 1'b0;
      end
      9'd456: begin
        out_b15 = 1'b0;
      end
      9'd457: begin
        out_b15 = 1'b0;
      end
      9'd458: begin
        out_b15 = 1'b0;
      end
      9'd459: begin
        out_b15 = 1'b0;
      end
      9'd460: begin
        out_b15 = 1'b0;
      end
      9'd461: begin
        out_b15 = 1'b0;
      end
      9'd462: begin
        out_b15 = 1'b0;
      end
      9'd463: begin
        out_b15 = 1'b0;
      end
      9'd464: begin
        out_b15 = 1'b0;
      end
      9'd465: begin
        out_b15 = 1'b0;
      end
      9'd466: begin
        out_b15 = 1'b0;
      end
      9'd467: begin
        out_b15 = 1'b0;
      end
      9'd468: begin
        out_b15 = 1'b0;
      end
      9'd469: begin
        out_b15 = 1'b0;
      end
      9'd470: begin
        out_b15 = 1'b0;
      end
      9'd471: begin
        out_b15 = 1'b0;
      end
      9'd472: begin
        out_b15 = 1'b0;
      end
      9'd473: begin
        out_b15 = 1'b0;
      end
      9'd474: begin
        out_b15 = 1'b0;
      end
      9'd475: begin
        out_b15 = 1'b0;
      end
      9'd476: begin
        out_b15 = 1'b0;
      end
      9'd477: begin
        out_b15 = 1'b0;
      end
      9'd478: begin
        out_b15 = 1'b0;
      end
      9'd479: begin
        out_b15 = 1'b0;
      end
      9'd480: begin
        out_b15 = 1'b0;
      end
      9'd481: begin
        out_b15 = 1'b0;
      end
      9'd482: begin
        out_b15 = 1'b0;
      end
      9'd483: begin
        out_b15 = 1'b0;
      end
      9'd484: begin
        out_b15 = 1'b0;
      end
      9'd485: begin
        out_b15 = 1'b0;
      end
      9'd486: begin
        out_b15 = 1'b0;
      end
      9'd487: begin
        out_b15 = 1'b0;
      end
      9'd488: begin
        out_b15 = 1'b0;
      end
      9'd489: begin
        out_b15 = 1'b0;
      end
      9'd490: begin
        out_b15 = 1'b0;
      end
      9'd491: begin
        out_b15 = 1'b0;
      end
      9'd492: begin
        out_b15 = 1'b0;
      end
      9'd493: begin
        out_b15 = 1'b0;
      end
      9'd494: begin
        out_b15 = 1'b0;
      end
      9'd495: begin
        out_b15 = 1'b0;
      end
      9'd496: begin
        out_b15 = 1'b0;
      end
      9'd497: begin
        out_b15 = 1'b0;
      end
      9'd498: begin
        out_b15 = 1'b0;
      end
      9'd499: begin
        out_b15 = 1'b0;
      end
      9'd500: begin
        out_b15 = 1'b0;
      end
      9'd501: begin
        out_b15 = 1'b0;
      end
      9'd502: begin
        out_b15 = 1'b0;
      end
      9'd503: begin
        out_b15 = 1'b0;
      end
      9'd504: begin
        out_b15 = 1'b0;
      end
      9'd505: begin
        out_b15 = 1'b0;
      end
      9'd506: begin
        out_b15 = 1'b0;
      end
      9'd507: begin
        out_b15 = 1'b0;
      end
      9'd508: begin
        out_b15 = 1'b0;
      end
      9'd509: begin
        out_b15 = 1'b0;
      end
      9'd510: begin
        out_b15 = 1'b0;
      end
      9'd511: begin
        out_b15 = 1'b0;
      end
      default: out_b15 = 1'b0;
    endcase
  end
  reg out_b14;
  always @* begin
    case (sign_exp)
      9'd0: begin
        out_b14 = 1'b0;
      end
      9'd1: begin
        out_b14 = 1'b0;
      end
      9'd2: begin
        out_b14 = 1'b0;
      end
      9'd3: begin
        out_b14 = 1'b0;
      end
      9'd4: begin
        out_b14 = 1'b0;
      end
      9'd5: begin
        out_b14 = 1'b0;
      end
      9'd6: begin
        out_b14 = 1'b0;
      end
      9'd7: begin
        out_b14 = 1'b0;
      end
      9'd8: begin
        out_b14 = 1'b0;
      end
      9'd9: begin
        out_b14 = 1'b0;
      end
      9'd10: begin
        out_b14 = 1'b0;
      end
      9'd11: begin
        out_b14 = 1'b0;
      end
      9'd12: begin
        out_b14 = 1'b0;
      end
      9'd13: begin
        out_b14 = 1'b0;
      end
      9'd14: begin
        out_b14 = 1'b0;
      end
      9'd15: begin
        out_b14 = 1'b0;
      end
      9'd16: begin
        out_b14 = 1'b0;
      end
      9'd17: begin
        out_b14 = 1'b0;
      end
      9'd18: begin
        out_b14 = 1'b0;
      end
      9'd19: begin
        out_b14 = 1'b0;
      end
      9'd20: begin
        out_b14 = 1'b0;
      end
      9'd21: begin
        out_b14 = 1'b0;
      end
      9'd22: begin
        out_b14 = 1'b0;
      end
      9'd23: begin
        out_b14 = 1'b0;
      end
      9'd24: begin
        out_b14 = 1'b0;
      end
      9'd25: begin
        out_b14 = 1'b0;
      end
      9'd26: begin
        out_b14 = 1'b0;
      end
      9'd27: begin
        out_b14 = 1'b0;
      end
      9'd28: begin
        out_b14 = 1'b0;
      end
      9'd29: begin
        out_b14 = 1'b0;
      end
      9'd30: begin
        out_b14 = 1'b0;
      end
      9'd31: begin
        out_b14 = 1'b0;
      end
      9'd32: begin
        out_b14 = 1'b0;
      end
      9'd33: begin
        out_b14 = 1'b0;
      end
      9'd34: begin
        out_b14 = 1'b0;
      end
      9'd35: begin
        out_b14 = 1'b0;
      end
      9'd36: begin
        out_b14 = 1'b0;
      end
      9'd37: begin
        out_b14 = 1'b0;
      end
      9'd38: begin
        out_b14 = 1'b0;
      end
      9'd39: begin
        out_b14 = 1'b0;
      end
      9'd40: begin
        out_b14 = 1'b0;
      end
      9'd41: begin
        out_b14 = 1'b0;
      end
      9'd42: begin
        out_b14 = 1'b0;
      end
      9'd43: begin
        out_b14 = 1'b0;
      end
      9'd44: begin
        out_b14 = 1'b0;
      end
      9'd45: begin
        out_b14 = 1'b0;
      end
      9'd46: begin
        out_b14 = 1'b0;
      end
      9'd47: begin
        out_b14 = 1'b0;
      end
      9'd48: begin
        out_b14 = 1'b0;
      end
      9'd49: begin
        out_b14 = 1'b0;
      end
      9'd50: begin
        out_b14 = 1'b0;
      end
      9'd51: begin
        out_b14 = 1'b0;
      end
      9'd52: begin
        out_b14 = 1'b0;
      end
      9'd53: begin
        out_b14 = 1'b0;
      end
      9'd54: begin
        out_b14 = 1'b0;
      end
      9'd55: begin
        out_b14 = 1'b0;
      end
      9'd56: begin
        out_b14 = 1'b0;
      end
      9'd57: begin
        out_b14 = 1'b0;
      end
      9'd58: begin
        out_b14 = 1'b0;
      end
      9'd59: begin
        out_b14 = 1'b0;
      end
      9'd60: begin
        out_b14 = 1'b0;
      end
      9'd61: begin
        out_b14 = 1'b0;
      end
      9'd62: begin
        out_b14 = 1'b0;
      end
      9'd63: begin
        out_b14 = 1'b0;
      end
      9'd64: begin
        out_b14 = 1'b0;
      end
      9'd65: begin
        out_b14 = 1'b0;
      end
      9'd66: begin
        out_b14 = 1'b0;
      end
      9'd67: begin
        out_b14 = 1'b0;
      end
      9'd68: begin
        out_b14 = 1'b0;
      end
      9'd69: begin
        out_b14 = 1'b0;
      end
      9'd70: begin
        out_b14 = 1'b0;
      end
      9'd71: begin
        out_b14 = 1'b0;
      end
      9'd72: begin
        out_b14 = 1'b0;
      end
      9'd73: begin
        out_b14 = 1'b0;
      end
      9'd74: begin
        out_b14 = 1'b0;
      end
      9'd75: begin
        out_b14 = 1'b0;
      end
      9'd76: begin
        out_b14 = 1'b0;
      end
      9'd77: begin
        out_b14 = 1'b0;
      end
      9'd78: begin
        out_b14 = 1'b0;
      end
      9'd79: begin
        out_b14 = 1'b0;
      end
      9'd80: begin
        out_b14 = 1'b0;
      end
      9'd81: begin
        out_b14 = 1'b0;
      end
      9'd82: begin
        out_b14 = 1'b0;
      end
      9'd83: begin
        out_b14 = 1'b0;
      end
      9'd84: begin
        out_b14 = 1'b0;
      end
      9'd85: begin
        out_b14 = 1'b0;
      end
      9'd86: begin
        out_b14 = 1'b0;
      end
      9'd87: begin
        out_b14 = 1'b0;
      end
      9'd88: begin
        out_b14 = 1'b0;
      end
      9'd89: begin
        out_b14 = 1'b0;
      end
      9'd90: begin
        out_b14 = 1'b0;
      end
      9'd91: begin
        out_b14 = 1'b0;
      end
      9'd92: begin
        out_b14 = 1'b0;
      end
      9'd93: begin
        out_b14 = 1'b0;
      end
      9'd94: begin
        out_b14 = 1'b0;
      end
      9'd95: begin
        out_b14 = 1'b0;
      end
      9'd96: begin
        out_b14 = 1'b0;
      end
      9'd97: begin
        out_b14 = 1'b0;
      end
      9'd98: begin
        out_b14 = 1'b0;
      end
      9'd99: begin
        out_b14 = 1'b0;
      end
      9'd100: begin
        out_b14 = 1'b0;
      end
      9'd101: begin
        out_b14 = 1'b0;
      end
      9'd102: begin
        out_b14 = 1'b0;
      end
      9'd103: begin
        out_b14 = 1'b0;
      end
      9'd104: begin
        out_b14 = 1'b0;
      end
      9'd105: begin
        out_b14 = 1'b0;
      end
      9'd106: begin
        out_b14 = 1'b0;
      end
      9'd107: begin
        out_b14 = 1'b0;
      end
      9'd108: begin
        out_b14 = 1'b0;
      end
      9'd109: begin
        out_b14 = 1'b0;
      end
      9'd110: begin
        out_b14 = 1'b0;
      end
      9'd111: begin
        out_b14 = 1'b0;
      end
      9'd112: begin
        out_b14 = 1'b0;
      end
      9'd113: begin
        out_b14 = 1'b0;
      end
      9'd114: begin
        out_b14 = 1'b0;
      end
      9'd115: begin
        out_b14 = 1'b0;
      end
      9'd116: begin
        out_b14 = 1'b0;
      end
      9'd117: begin
        out_b14 = 1'b0;
      end
      9'd118: begin
        out_b14 = 1'b0;
      end
      9'd119: begin
        out_b14 = 1'b0;
      end
      9'd120: begin
        out_b14 = 1'b0;
      end
      9'd121: begin
        out_b14 = 1'b0;
      end
      9'd122: begin
        out_b14 = 1'b0;
      end
      9'd123: begin
        out_b14 = 1'b0;
      end
      9'd124: begin
        out_b14 = 1'b0;
      end
      9'd125: begin
        out_b14 = 1'b0;
      end
      9'd126: begin
        if (mant <= 7'd48) begin
          out_b14 = 1'b0;
        end else begin
          out_b14 = 1'b1;
        end
      end
      9'd127: begin
        out_b14 = 1'b1;
      end
      9'd128: begin
        out_b14 = 1'b1;
      end
      9'd129: begin
        out_b14 = 1'b1;
      end
      9'd130: begin
        out_b14 = 1'b1;
      end
      9'd131: begin
        out_b14 = 1'b1;
      end
      9'd132: begin
        out_b14 = 1'b1;
      end
      9'd133: begin
        out_b14 = 1'b1;
      end
      9'd134: begin
        out_b14 = 1'b1;
      end
      9'd135: begin
        out_b14 = 1'b1;
      end
      9'd136: begin
        out_b14 = 1'b1;
      end
      9'd137: begin
        out_b14 = 1'b1;
      end
      9'd138: begin
        out_b14 = 1'b1;
      end
      9'd139: begin
        out_b14 = 1'b1;
      end
      9'd140: begin
        out_b14 = 1'b1;
      end
      9'd141: begin
        out_b14 = 1'b1;
      end
      9'd142: begin
        out_b14 = 1'b1;
      end
      9'd143: begin
        out_b14 = 1'b1;
      end
      9'd144: begin
        out_b14 = 1'b1;
      end
      9'd145: begin
        out_b14 = 1'b1;
      end
      9'd146: begin
        out_b14 = 1'b1;
      end
      9'd147: begin
        out_b14 = 1'b1;
      end
      9'd148: begin
        out_b14 = 1'b1;
      end
      9'd149: begin
        out_b14 = 1'b1;
      end
      9'd150: begin
        out_b14 = 1'b1;
      end
      9'd151: begin
        out_b14 = 1'b1;
      end
      9'd152: begin
        out_b14 = 1'b1;
      end
      9'd153: begin
        out_b14 = 1'b1;
      end
      9'd154: begin
        out_b14 = 1'b1;
      end
      9'd155: begin
        out_b14 = 1'b1;
      end
      9'd156: begin
        out_b14 = 1'b1;
      end
      9'd157: begin
        out_b14 = 1'b1;
      end
      9'd158: begin
        out_b14 = 1'b1;
      end
      9'd159: begin
        out_b14 = 1'b1;
      end
      9'd160: begin
        out_b14 = 1'b1;
      end
      9'd161: begin
        out_b14 = 1'b1;
      end
      9'd162: begin
        out_b14 = 1'b1;
      end
      9'd163: begin
        out_b14 = 1'b1;
      end
      9'd164: begin
        out_b14 = 1'b1;
      end
      9'd165: begin
        out_b14 = 1'b1;
      end
      9'd166: begin
        out_b14 = 1'b1;
      end
      9'd167: begin
        out_b14 = 1'b1;
      end
      9'd168: begin
        out_b14 = 1'b1;
      end
      9'd169: begin
        out_b14 = 1'b1;
      end
      9'd170: begin
        out_b14 = 1'b1;
      end
      9'd171: begin
        out_b14 = 1'b1;
      end
      9'd172: begin
        out_b14 = 1'b1;
      end
      9'd173: begin
        out_b14 = 1'b1;
      end
      9'd174: begin
        out_b14 = 1'b1;
      end
      9'd175: begin
        out_b14 = 1'b1;
      end
      9'd176: begin
        out_b14 = 1'b1;
      end
      9'd177: begin
        out_b14 = 1'b1;
      end
      9'd178: begin
        out_b14 = 1'b1;
      end
      9'd179: begin
        out_b14 = 1'b1;
      end
      9'd180: begin
        out_b14 = 1'b1;
      end
      9'd181: begin
        out_b14 = 1'b1;
      end
      9'd182: begin
        out_b14 = 1'b1;
      end
      9'd183: begin
        out_b14 = 1'b1;
      end
      9'd184: begin
        out_b14 = 1'b1;
      end
      9'd185: begin
        out_b14 = 1'b1;
      end
      9'd186: begin
        out_b14 = 1'b1;
      end
      9'd187: begin
        out_b14 = 1'b1;
      end
      9'd188: begin
        out_b14 = 1'b1;
      end
      9'd189: begin
        out_b14 = 1'b1;
      end
      9'd190: begin
        out_b14 = 1'b1;
      end
      9'd191: begin
        out_b14 = 1'b1;
      end
      9'd192: begin
        out_b14 = 1'b1;
      end
      9'd193: begin
        out_b14 = 1'b1;
      end
      9'd194: begin
        out_b14 = 1'b1;
      end
      9'd195: begin
        out_b14 = 1'b1;
      end
      9'd196: begin
        out_b14 = 1'b1;
      end
      9'd197: begin
        out_b14 = 1'b1;
      end
      9'd198: begin
        out_b14 = 1'b1;
      end
      9'd199: begin
        out_b14 = 1'b1;
      end
      9'd200: begin
        out_b14 = 1'b1;
      end
      9'd201: begin
        out_b14 = 1'b1;
      end
      9'd202: begin
        out_b14 = 1'b1;
      end
      9'd203: begin
        out_b14 = 1'b1;
      end
      9'd204: begin
        out_b14 = 1'b1;
      end
      9'd205: begin
        out_b14 = 1'b1;
      end
      9'd206: begin
        out_b14 = 1'b1;
      end
      9'd207: begin
        out_b14 = 1'b1;
      end
      9'd208: begin
        out_b14 = 1'b1;
      end
      9'd209: begin
        out_b14 = 1'b1;
      end
      9'd210: begin
        out_b14 = 1'b1;
      end
      9'd211: begin
        out_b14 = 1'b1;
      end
      9'd212: begin
        out_b14 = 1'b1;
      end
      9'd213: begin
        out_b14 = 1'b1;
      end
      9'd214: begin
        out_b14 = 1'b1;
      end
      9'd215: begin
        out_b14 = 1'b1;
      end
      9'd216: begin
        out_b14 = 1'b1;
      end
      9'd217: begin
        out_b14 = 1'b1;
      end
      9'd218: begin
        out_b14 = 1'b1;
      end
      9'd219: begin
        out_b14 = 1'b1;
      end
      9'd220: begin
        out_b14 = 1'b1;
      end
      9'd221: begin
        out_b14 = 1'b1;
      end
      9'd222: begin
        out_b14 = 1'b1;
      end
      9'd223: begin
        out_b14 = 1'b1;
      end
      9'd224: begin
        out_b14 = 1'b1;
      end
      9'd225: begin
        out_b14 = 1'b1;
      end
      9'd226: begin
        out_b14 = 1'b1;
      end
      9'd227: begin
        out_b14 = 1'b1;
      end
      9'd228: begin
        out_b14 = 1'b1;
      end
      9'd229: begin
        out_b14 = 1'b1;
      end
      9'd230: begin
        out_b14 = 1'b1;
      end
      9'd231: begin
        out_b14 = 1'b1;
      end
      9'd232: begin
        out_b14 = 1'b1;
      end
      9'd233: begin
        out_b14 = 1'b1;
      end
      9'd234: begin
        out_b14 = 1'b1;
      end
      9'd235: begin
        out_b14 = 1'b1;
      end
      9'd236: begin
        out_b14 = 1'b1;
      end
      9'd237: begin
        out_b14 = 1'b1;
      end
      9'd238: begin
        out_b14 = 1'b1;
      end
      9'd239: begin
        out_b14 = 1'b1;
      end
      9'd240: begin
        out_b14 = 1'b1;
      end
      9'd241: begin
        out_b14 = 1'b1;
      end
      9'd242: begin
        out_b14 = 1'b1;
      end
      9'd243: begin
        out_b14 = 1'b1;
      end
      9'd244: begin
        out_b14 = 1'b1;
      end
      9'd245: begin
        out_b14 = 1'b1;
      end
      9'd246: begin
        out_b14 = 1'b1;
      end
      9'd247: begin
        out_b14 = 1'b1;
      end
      9'd248: begin
        out_b14 = 1'b1;
      end
      9'd249: begin
        out_b14 = 1'b1;
      end
      9'd250: begin
        out_b14 = 1'b1;
      end
      9'd251: begin
        out_b14 = 1'b1;
      end
      9'd252: begin
        out_b14 = 1'b1;
      end
      9'd253: begin
        out_b14 = 1'b1;
      end
      9'd254: begin
        out_b14 = 1'b1;
      end
      9'd255: begin
        out_b14 = 1'b1;
      end
      9'd256: begin
        out_b14 = 1'b0;
      end
      9'd257: begin
        out_b14 = 1'b0;
      end
      9'd258: begin
        out_b14 = 1'b0;
      end
      9'd259: begin
        out_b14 = 1'b0;
      end
      9'd260: begin
        out_b14 = 1'b0;
      end
      9'd261: begin
        out_b14 = 1'b0;
      end
      9'd262: begin
        out_b14 = 1'b0;
      end
      9'd263: begin
        out_b14 = 1'b0;
      end
      9'd264: begin
        out_b14 = 1'b0;
      end
      9'd265: begin
        out_b14 = 1'b0;
      end
      9'd266: begin
        out_b14 = 1'b0;
      end
      9'd267: begin
        out_b14 = 1'b0;
      end
      9'd268: begin
        out_b14 = 1'b0;
      end
      9'd269: begin
        out_b14 = 1'b0;
      end
      9'd270: begin
        out_b14 = 1'b0;
      end
      9'd271: begin
        out_b14 = 1'b0;
      end
      9'd272: begin
        out_b14 = 1'b0;
      end
      9'd273: begin
        out_b14 = 1'b0;
      end
      9'd274: begin
        out_b14 = 1'b0;
      end
      9'd275: begin
        out_b14 = 1'b0;
      end
      9'd276: begin
        out_b14 = 1'b0;
      end
      9'd277: begin
        out_b14 = 1'b0;
      end
      9'd278: begin
        out_b14 = 1'b0;
      end
      9'd279: begin
        out_b14 = 1'b0;
      end
      9'd280: begin
        out_b14 = 1'b0;
      end
      9'd281: begin
        out_b14 = 1'b0;
      end
      9'd282: begin
        out_b14 = 1'b0;
      end
      9'd283: begin
        out_b14 = 1'b0;
      end
      9'd284: begin
        out_b14 = 1'b0;
      end
      9'd285: begin
        out_b14 = 1'b0;
      end
      9'd286: begin
        out_b14 = 1'b0;
      end
      9'd287: begin
        out_b14 = 1'b0;
      end
      9'd288: begin
        out_b14 = 1'b0;
      end
      9'd289: begin
        out_b14 = 1'b0;
      end
      9'd290: begin
        out_b14 = 1'b0;
      end
      9'd291: begin
        out_b14 = 1'b0;
      end
      9'd292: begin
        out_b14 = 1'b0;
      end
      9'd293: begin
        out_b14 = 1'b0;
      end
      9'd294: begin
        out_b14 = 1'b0;
      end
      9'd295: begin
        out_b14 = 1'b0;
      end
      9'd296: begin
        out_b14 = 1'b0;
      end
      9'd297: begin
        out_b14 = 1'b0;
      end
      9'd298: begin
        out_b14 = 1'b0;
      end
      9'd299: begin
        out_b14 = 1'b0;
      end
      9'd300: begin
        out_b14 = 1'b0;
      end
      9'd301: begin
        out_b14 = 1'b0;
      end
      9'd302: begin
        out_b14 = 1'b0;
      end
      9'd303: begin
        out_b14 = 1'b0;
      end
      9'd304: begin
        out_b14 = 1'b0;
      end
      9'd305: begin
        out_b14 = 1'b0;
      end
      9'd306: begin
        out_b14 = 1'b0;
      end
      9'd307: begin
        out_b14 = 1'b0;
      end
      9'd308: begin
        out_b14 = 1'b0;
      end
      9'd309: begin
        out_b14 = 1'b0;
      end
      9'd310: begin
        out_b14 = 1'b0;
      end
      9'd311: begin
        out_b14 = 1'b0;
      end
      9'd312: begin
        out_b14 = 1'b0;
      end
      9'd313: begin
        out_b14 = 1'b0;
      end
      9'd314: begin
        out_b14 = 1'b0;
      end
      9'd315: begin
        out_b14 = 1'b0;
      end
      9'd316: begin
        out_b14 = 1'b0;
      end
      9'd317: begin
        out_b14 = 1'b0;
      end
      9'd318: begin
        out_b14 = 1'b0;
      end
      9'd319: begin
        out_b14 = 1'b0;
      end
      9'd320: begin
        out_b14 = 1'b0;
      end
      9'd321: begin
        out_b14 = 1'b0;
      end
      9'd322: begin
        out_b14 = 1'b0;
      end
      9'd323: begin
        out_b14 = 1'b0;
      end
      9'd324: begin
        out_b14 = 1'b0;
      end
      9'd325: begin
        out_b14 = 1'b0;
      end
      9'd326: begin
        out_b14 = 1'b0;
      end
      9'd327: begin
        out_b14 = 1'b0;
      end
      9'd328: begin
        out_b14 = 1'b0;
      end
      9'd329: begin
        out_b14 = 1'b0;
      end
      9'd330: begin
        out_b14 = 1'b0;
      end
      9'd331: begin
        out_b14 = 1'b0;
      end
      9'd332: begin
        out_b14 = 1'b0;
      end
      9'd333: begin
        out_b14 = 1'b0;
      end
      9'd334: begin
        out_b14 = 1'b0;
      end
      9'd335: begin
        out_b14 = 1'b0;
      end
      9'd336: begin
        out_b14 = 1'b0;
      end
      9'd337: begin
        out_b14 = 1'b0;
      end
      9'd338: begin
        out_b14 = 1'b0;
      end
      9'd339: begin
        out_b14 = 1'b0;
      end
      9'd340: begin
        out_b14 = 1'b0;
      end
      9'd341: begin
        out_b14 = 1'b0;
      end
      9'd342: begin
        out_b14 = 1'b0;
      end
      9'd343: begin
        out_b14 = 1'b0;
      end
      9'd344: begin
        out_b14 = 1'b0;
      end
      9'd345: begin
        out_b14 = 1'b0;
      end
      9'd346: begin
        out_b14 = 1'b0;
      end
      9'd347: begin
        out_b14 = 1'b0;
      end
      9'd348: begin
        out_b14 = 1'b0;
      end
      9'd349: begin
        out_b14 = 1'b0;
      end
      9'd350: begin
        out_b14 = 1'b0;
      end
      9'd351: begin
        out_b14 = 1'b0;
      end
      9'd352: begin
        out_b14 = 1'b0;
      end
      9'd353: begin
        out_b14 = 1'b0;
      end
      9'd354: begin
        out_b14 = 1'b0;
      end
      9'd355: begin
        out_b14 = 1'b0;
      end
      9'd356: begin
        out_b14 = 1'b0;
      end
      9'd357: begin
        out_b14 = 1'b0;
      end
      9'd358: begin
        out_b14 = 1'b0;
      end
      9'd359: begin
        out_b14 = 1'b0;
      end
      9'd360: begin
        out_b14 = 1'b0;
      end
      9'd361: begin
        out_b14 = 1'b0;
      end
      9'd362: begin
        out_b14 = 1'b0;
      end
      9'd363: begin
        out_b14 = 1'b0;
      end
      9'd364: begin
        out_b14 = 1'b0;
      end
      9'd365: begin
        out_b14 = 1'b0;
      end
      9'd366: begin
        out_b14 = 1'b0;
      end
      9'd367: begin
        out_b14 = 1'b0;
      end
      9'd368: begin
        out_b14 = 1'b0;
      end
      9'd369: begin
        out_b14 = 1'b0;
      end
      9'd370: begin
        out_b14 = 1'b0;
      end
      9'd371: begin
        out_b14 = 1'b0;
      end
      9'd372: begin
        out_b14 = 1'b0;
      end
      9'd373: begin
        out_b14 = 1'b0;
      end
      9'd374: begin
        out_b14 = 1'b0;
      end
      9'd375: begin
        out_b14 = 1'b0;
      end
      9'd376: begin
        out_b14 = 1'b0;
      end
      9'd377: begin
        out_b14 = 1'b0;
      end
      9'd378: begin
        out_b14 = 1'b0;
      end
      9'd379: begin
        out_b14 = 1'b0;
      end
      9'd380: begin
        out_b14 = 1'b0;
      end
      9'd381: begin
        out_b14 = 1'b0;
      end
      9'd382: begin
        out_b14 = 1'b0;
      end
      9'd383: begin
        out_b14 = 1'b0;
      end
      9'd384: begin
        out_b14 = 1'b0;
      end
      9'd385: begin
        out_b14 = 1'b0;
      end
      9'd386: begin
        out_b14 = 1'b0;
      end
      9'd387: begin
        out_b14 = 1'b0;
      end
      9'd388: begin
        out_b14 = 1'b0;
      end
      9'd389: begin
        out_b14 = 1'b0;
      end
      9'd390: begin
        out_b14 = 1'b0;
      end
      9'd391: begin
        out_b14 = 1'b0;
      end
      9'd392: begin
        out_b14 = 1'b0;
      end
      9'd393: begin
        out_b14 = 1'b0;
      end
      9'd394: begin
        out_b14 = 1'b0;
      end
      9'd395: begin
        out_b14 = 1'b0;
      end
      9'd396: begin
        out_b14 = 1'b0;
      end
      9'd397: begin
        out_b14 = 1'b0;
      end
      9'd398: begin
        out_b14 = 1'b0;
      end
      9'd399: begin
        out_b14 = 1'b0;
      end
      9'd400: begin
        out_b14 = 1'b0;
      end
      9'd401: begin
        out_b14 = 1'b0;
      end
      9'd402: begin
        out_b14 = 1'b0;
      end
      9'd403: begin
        out_b14 = 1'b0;
      end
      9'd404: begin
        out_b14 = 1'b0;
      end
      9'd405: begin
        out_b14 = 1'b0;
      end
      9'd406: begin
        out_b14 = 1'b0;
      end
      9'd407: begin
        out_b14 = 1'b0;
      end
      9'd408: begin
        out_b14 = 1'b0;
      end
      9'd409: begin
        out_b14 = 1'b0;
      end
      9'd410: begin
        out_b14 = 1'b0;
      end
      9'd411: begin
        out_b14 = 1'b0;
      end
      9'd412: begin
        out_b14 = 1'b0;
      end
      9'd413: begin
        out_b14 = 1'b0;
      end
      9'd414: begin
        out_b14 = 1'b0;
      end
      9'd415: begin
        out_b14 = 1'b0;
      end
      9'd416: begin
        out_b14 = 1'b0;
      end
      9'd417: begin
        out_b14 = 1'b0;
      end
      9'd418: begin
        out_b14 = 1'b0;
      end
      9'd419: begin
        out_b14 = 1'b0;
      end
      9'd420: begin
        out_b14 = 1'b0;
      end
      9'd421: begin
        out_b14 = 1'b0;
      end
      9'd422: begin
        out_b14 = 1'b0;
      end
      9'd423: begin
        out_b14 = 1'b0;
      end
      9'd424: begin
        out_b14 = 1'b0;
      end
      9'd425: begin
        out_b14 = 1'b0;
      end
      9'd426: begin
        out_b14 = 1'b0;
      end
      9'd427: begin
        out_b14 = 1'b0;
      end
      9'd428: begin
        out_b14 = 1'b0;
      end
      9'd429: begin
        out_b14 = 1'b0;
      end
      9'd430: begin
        out_b14 = 1'b0;
      end
      9'd431: begin
        out_b14 = 1'b0;
      end
      9'd432: begin
        out_b14 = 1'b0;
      end
      9'd433: begin
        out_b14 = 1'b0;
      end
      9'd434: begin
        out_b14 = 1'b0;
      end
      9'd435: begin
        out_b14 = 1'b0;
      end
      9'd436: begin
        out_b14 = 1'b0;
      end
      9'd437: begin
        out_b14 = 1'b0;
      end
      9'd438: begin
        out_b14 = 1'b0;
      end
      9'd439: begin
        out_b14 = 1'b0;
      end
      9'd440: begin
        out_b14 = 1'b0;
      end
      9'd441: begin
        out_b14 = 1'b0;
      end
      9'd442: begin
        out_b14 = 1'b0;
      end
      9'd443: begin
        out_b14 = 1'b0;
      end
      9'd444: begin
        out_b14 = 1'b0;
      end
      9'd445: begin
        out_b14 = 1'b0;
      end
      9'd446: begin
        out_b14 = 1'b0;
      end
      9'd447: begin
        out_b14 = 1'b0;
      end
      9'd448: begin
        out_b14 = 1'b0;
      end
      9'd449: begin
        out_b14 = 1'b0;
      end
      9'd450: begin
        out_b14 = 1'b0;
      end
      9'd451: begin
        out_b14 = 1'b0;
      end
      9'd452: begin
        out_b14 = 1'b0;
      end
      9'd453: begin
        out_b14 = 1'b0;
      end
      9'd454: begin
        out_b14 = 1'b0;
      end
      9'd455: begin
        out_b14 = 1'b0;
      end
      9'd456: begin
        out_b14 = 1'b0;
      end
      9'd457: begin
        out_b14 = 1'b0;
      end
      9'd458: begin
        out_b14 = 1'b0;
      end
      9'd459: begin
        out_b14 = 1'b0;
      end
      9'd460: begin
        out_b14 = 1'b0;
      end
      9'd461: begin
        out_b14 = 1'b0;
      end
      9'd462: begin
        out_b14 = 1'b0;
      end
      9'd463: begin
        out_b14 = 1'b0;
      end
      9'd464: begin
        out_b14 = 1'b0;
      end
      9'd465: begin
        out_b14 = 1'b0;
      end
      9'd466: begin
        out_b14 = 1'b0;
      end
      9'd467: begin
        out_b14 = 1'b0;
      end
      9'd468: begin
        out_b14 = 1'b0;
      end
      9'd469: begin
        out_b14 = 1'b0;
      end
      9'd470: begin
        out_b14 = 1'b0;
      end
      9'd471: begin
        out_b14 = 1'b0;
      end
      9'd472: begin
        out_b14 = 1'b0;
      end
      9'd473: begin
        out_b14 = 1'b0;
      end
      9'd474: begin
        out_b14 = 1'b0;
      end
      9'd475: begin
        out_b14 = 1'b0;
      end
      9'd476: begin
        out_b14 = 1'b0;
      end
      9'd477: begin
        out_b14 = 1'b0;
      end
      9'd478: begin
        out_b14 = 1'b0;
      end
      9'd479: begin
        out_b14 = 1'b0;
      end
      9'd480: begin
        out_b14 = 1'b0;
      end
      9'd481: begin
        out_b14 = 1'b0;
      end
      9'd482: begin
        out_b14 = 1'b0;
      end
      9'd483: begin
        out_b14 = 1'b0;
      end
      9'd484: begin
        out_b14 = 1'b0;
      end
      9'd485: begin
        out_b14 = 1'b0;
      end
      9'd486: begin
        out_b14 = 1'b0;
      end
      9'd487: begin
        out_b14 = 1'b0;
      end
      9'd488: begin
        out_b14 = 1'b0;
      end
      9'd489: begin
        out_b14 = 1'b0;
      end
      9'd490: begin
        out_b14 = 1'b0;
      end
      9'd491: begin
        out_b14 = 1'b0;
      end
      9'd492: begin
        out_b14 = 1'b0;
      end
      9'd493: begin
        out_b14 = 1'b0;
      end
      9'd494: begin
        out_b14 = 1'b0;
      end
      9'd495: begin
        out_b14 = 1'b0;
      end
      9'd496: begin
        out_b14 = 1'b0;
      end
      9'd497: begin
        out_b14 = 1'b0;
      end
      9'd498: begin
        out_b14 = 1'b0;
      end
      9'd499: begin
        out_b14 = 1'b0;
      end
      9'd500: begin
        out_b14 = 1'b0;
      end
      9'd501: begin
        out_b14 = 1'b0;
      end
      9'd502: begin
        out_b14 = 1'b0;
      end
      9'd503: begin
        out_b14 = 1'b0;
      end
      9'd504: begin
        out_b14 = 1'b0;
      end
      9'd505: begin
        out_b14 = 1'b0;
      end
      9'd506: begin
        out_b14 = 1'b0;
      end
      9'd507: begin
        out_b14 = 1'b0;
      end
      9'd508: begin
        out_b14 = 1'b0;
      end
      9'd509: begin
        out_b14 = 1'b0;
      end
      9'd510: begin
        out_b14 = 1'b0;
      end
      9'd511: begin
        if (mant <= 7'd0) begin
          out_b14 = 1'b0;
        end else begin
          out_b14 = 1'b1;
        end
      end
      default: out_b14 = 1'b0;
    endcase
  end
  reg out_b13;
  always @* begin
    case (sign_exp)
      9'd0: begin
        out_b13 = 1'b1;
      end
      9'd1: begin
        out_b13 = 1'b1;
      end
      9'd2: begin
        out_b13 = 1'b1;
      end
      9'd3: begin
        out_b13 = 1'b1;
      end
      9'd4: begin
        out_b13 = 1'b1;
      end
      9'd5: begin
        out_b13 = 1'b1;
      end
      9'd6: begin
        out_b13 = 1'b1;
      end
      9'd7: begin
        out_b13 = 1'b1;
      end
      9'd8: begin
        out_b13 = 1'b1;
      end
      9'd9: begin
        out_b13 = 1'b1;
      end
      9'd10: begin
        out_b13 = 1'b1;
      end
      9'd11: begin
        out_b13 = 1'b1;
      end
      9'd12: begin
        out_b13 = 1'b1;
      end
      9'd13: begin
        out_b13 = 1'b1;
      end
      9'd14: begin
        out_b13 = 1'b1;
      end
      9'd15: begin
        out_b13 = 1'b1;
      end
      9'd16: begin
        out_b13 = 1'b1;
      end
      9'd17: begin
        out_b13 = 1'b1;
      end
      9'd18: begin
        out_b13 = 1'b1;
      end
      9'd19: begin
        out_b13 = 1'b1;
      end
      9'd20: begin
        out_b13 = 1'b1;
      end
      9'd21: begin
        out_b13 = 1'b1;
      end
      9'd22: begin
        out_b13 = 1'b1;
      end
      9'd23: begin
        out_b13 = 1'b1;
      end
      9'd24: begin
        out_b13 = 1'b1;
      end
      9'd25: begin
        out_b13 = 1'b1;
      end
      9'd26: begin
        out_b13 = 1'b1;
      end
      9'd27: begin
        out_b13 = 1'b1;
      end
      9'd28: begin
        out_b13 = 1'b1;
      end
      9'd29: begin
        out_b13 = 1'b1;
      end
      9'd30: begin
        out_b13 = 1'b1;
      end
      9'd31: begin
        out_b13 = 1'b1;
      end
      9'd32: begin
        out_b13 = 1'b1;
      end
      9'd33: begin
        out_b13 = 1'b1;
      end
      9'd34: begin
        out_b13 = 1'b1;
      end
      9'd35: begin
        out_b13 = 1'b1;
      end
      9'd36: begin
        out_b13 = 1'b1;
      end
      9'd37: begin
        out_b13 = 1'b1;
      end
      9'd38: begin
        out_b13 = 1'b1;
      end
      9'd39: begin
        out_b13 = 1'b1;
      end
      9'd40: begin
        out_b13 = 1'b1;
      end
      9'd41: begin
        out_b13 = 1'b1;
      end
      9'd42: begin
        out_b13 = 1'b1;
      end
      9'd43: begin
        out_b13 = 1'b1;
      end
      9'd44: begin
        out_b13 = 1'b1;
      end
      9'd45: begin
        out_b13 = 1'b1;
      end
      9'd46: begin
        out_b13 = 1'b1;
      end
      9'd47: begin
        out_b13 = 1'b1;
      end
      9'd48: begin
        out_b13 = 1'b1;
      end
      9'd49: begin
        out_b13 = 1'b1;
      end
      9'd50: begin
        out_b13 = 1'b1;
      end
      9'd51: begin
        out_b13 = 1'b1;
      end
      9'd52: begin
        out_b13 = 1'b1;
      end
      9'd53: begin
        out_b13 = 1'b1;
      end
      9'd54: begin
        out_b13 = 1'b1;
      end
      9'd55: begin
        out_b13 = 1'b1;
      end
      9'd56: begin
        out_b13 = 1'b1;
      end
      9'd57: begin
        out_b13 = 1'b1;
      end
      9'd58: begin
        out_b13 = 1'b1;
      end
      9'd59: begin
        out_b13 = 1'b1;
      end
      9'd60: begin
        out_b13 = 1'b1;
      end
      9'd61: begin
        out_b13 = 1'b1;
      end
      9'd62: begin
        out_b13 = 1'b1;
      end
      9'd63: begin
        out_b13 = 1'b1;
      end
      9'd64: begin
        out_b13 = 1'b1;
      end
      9'd65: begin
        out_b13 = 1'b1;
      end
      9'd66: begin
        out_b13 = 1'b1;
      end
      9'd67: begin
        out_b13 = 1'b1;
      end
      9'd68: begin
        out_b13 = 1'b1;
      end
      9'd69: begin
        out_b13 = 1'b1;
      end
      9'd70: begin
        out_b13 = 1'b1;
      end
      9'd71: begin
        out_b13 = 1'b1;
      end
      9'd72: begin
        out_b13 = 1'b1;
      end
      9'd73: begin
        out_b13 = 1'b1;
      end
      9'd74: begin
        out_b13 = 1'b1;
      end
      9'd75: begin
        out_b13 = 1'b1;
      end
      9'd76: begin
        out_b13 = 1'b1;
      end
      9'd77: begin
        out_b13 = 1'b1;
      end
      9'd78: begin
        out_b13 = 1'b1;
      end
      9'd79: begin
        out_b13 = 1'b1;
      end
      9'd80: begin
        out_b13 = 1'b1;
      end
      9'd81: begin
        out_b13 = 1'b1;
      end
      9'd82: begin
        out_b13 = 1'b1;
      end
      9'd83: begin
        out_b13 = 1'b1;
      end
      9'd84: begin
        out_b13 = 1'b1;
      end
      9'd85: begin
        out_b13 = 1'b1;
      end
      9'd86: begin
        out_b13 = 1'b1;
      end
      9'd87: begin
        out_b13 = 1'b1;
      end
      9'd88: begin
        out_b13 = 1'b1;
      end
      9'd89: begin
        out_b13 = 1'b1;
      end
      9'd90: begin
        out_b13 = 1'b1;
      end
      9'd91: begin
        out_b13 = 1'b1;
      end
      9'd92: begin
        out_b13 = 1'b1;
      end
      9'd93: begin
        out_b13 = 1'b1;
      end
      9'd94: begin
        out_b13 = 1'b1;
      end
      9'd95: begin
        out_b13 = 1'b1;
      end
      9'd96: begin
        out_b13 = 1'b1;
      end
      9'd97: begin
        out_b13 = 1'b1;
      end
      9'd98: begin
        out_b13 = 1'b1;
      end
      9'd99: begin
        out_b13 = 1'b1;
      end
      9'd100: begin
        out_b13 = 1'b1;
      end
      9'd101: begin
        out_b13 = 1'b1;
      end
      9'd102: begin
        out_b13 = 1'b1;
      end
      9'd103: begin
        out_b13 = 1'b1;
      end
      9'd104: begin
        out_b13 = 1'b1;
      end
      9'd105: begin
        out_b13 = 1'b1;
      end
      9'd106: begin
        out_b13 = 1'b1;
      end
      9'd107: begin
        out_b13 = 1'b1;
      end
      9'd108: begin
        out_b13 = 1'b1;
      end
      9'd109: begin
        out_b13 = 1'b1;
      end
      9'd110: begin
        out_b13 = 1'b1;
      end
      9'd111: begin
        out_b13 = 1'b1;
      end
      9'd112: begin
        out_b13 = 1'b1;
      end
      9'd113: begin
        out_b13 = 1'b1;
      end
      9'd114: begin
        out_b13 = 1'b1;
      end
      9'd115: begin
        out_b13 = 1'b1;
      end
      9'd116: begin
        out_b13 = 1'b1;
      end
      9'd117: begin
        out_b13 = 1'b1;
      end
      9'd118: begin
        out_b13 = 1'b1;
      end
      9'd119: begin
        out_b13 = 1'b1;
      end
      9'd120: begin
        out_b13 = 1'b1;
      end
      9'd121: begin
        out_b13 = 1'b1;
      end
      9'd122: begin
        out_b13 = 1'b1;
      end
      9'd123: begin
        out_b13 = 1'b1;
      end
      9'd124: begin
        out_b13 = 1'b1;
      end
      9'd125: begin
        out_b13 = 1'b1;
      end
      9'd126: begin
        if (mant <= 7'd48) begin
          out_b13 = 1'b1;
        end else begin
          out_b13 = 1'b0;
        end
      end
      9'd127: begin
        out_b13 = 1'b0;
      end
      9'd128: begin
        out_b13 = 1'b0;
      end
      9'd129: begin
        out_b13 = 1'b0;
      end
      9'd130: begin
        out_b13 = 1'b0;
      end
      9'd131: begin
        out_b13 = 1'b0;
      end
      9'd132: begin
        if (mant <= 7'd52) begin
          out_b13 = 1'b0;
        end else begin
          out_b13 = 1'b1;
        end
      end
      9'd133: begin
        out_b13 = 1'b1;
      end
      9'd134: begin
        out_b13 = 1'b1;
      end
      9'd135: begin
        out_b13 = 1'b1;
      end
      9'd136: begin
        out_b13 = 1'b1;
      end
      9'd137: begin
        out_b13 = 1'b1;
      end
      9'd138: begin
        out_b13 = 1'b1;
      end
      9'd139: begin
        out_b13 = 1'b1;
      end
      9'd140: begin
        out_b13 = 1'b1;
      end
      9'd141: begin
        out_b13 = 1'b1;
      end
      9'd142: begin
        out_b13 = 1'b1;
      end
      9'd143: begin
        out_b13 = 1'b1;
      end
      9'd144: begin
        out_b13 = 1'b1;
      end
      9'd145: begin
        out_b13 = 1'b1;
      end
      9'd146: begin
        out_b13 = 1'b1;
      end
      9'd147: begin
        out_b13 = 1'b1;
      end
      9'd148: begin
        out_b13 = 1'b1;
      end
      9'd149: begin
        out_b13 = 1'b1;
      end
      9'd150: begin
        out_b13 = 1'b1;
      end
      9'd151: begin
        out_b13 = 1'b1;
      end
      9'd152: begin
        out_b13 = 1'b1;
      end
      9'd153: begin
        out_b13 = 1'b1;
      end
      9'd154: begin
        out_b13 = 1'b1;
      end
      9'd155: begin
        out_b13 = 1'b1;
      end
      9'd156: begin
        out_b13 = 1'b1;
      end
      9'd157: begin
        out_b13 = 1'b1;
      end
      9'd158: begin
        out_b13 = 1'b1;
      end
      9'd159: begin
        out_b13 = 1'b1;
      end
      9'd160: begin
        out_b13 = 1'b1;
      end
      9'd161: begin
        out_b13 = 1'b1;
      end
      9'd162: begin
        out_b13 = 1'b1;
      end
      9'd163: begin
        out_b13 = 1'b1;
      end
      9'd164: begin
        out_b13 = 1'b1;
      end
      9'd165: begin
        out_b13 = 1'b1;
      end
      9'd166: begin
        out_b13 = 1'b1;
      end
      9'd167: begin
        out_b13 = 1'b1;
      end
      9'd168: begin
        out_b13 = 1'b1;
      end
      9'd169: begin
        out_b13 = 1'b1;
      end
      9'd170: begin
        out_b13 = 1'b1;
      end
      9'd171: begin
        out_b13 = 1'b1;
      end
      9'd172: begin
        out_b13 = 1'b1;
      end
      9'd173: begin
        out_b13 = 1'b1;
      end
      9'd174: begin
        out_b13 = 1'b1;
      end
      9'd175: begin
        out_b13 = 1'b1;
      end
      9'd176: begin
        out_b13 = 1'b1;
      end
      9'd177: begin
        out_b13 = 1'b1;
      end
      9'd178: begin
        out_b13 = 1'b1;
      end
      9'd179: begin
        out_b13 = 1'b1;
      end
      9'd180: begin
        out_b13 = 1'b1;
      end
      9'd181: begin
        out_b13 = 1'b1;
      end
      9'd182: begin
        out_b13 = 1'b1;
      end
      9'd183: begin
        out_b13 = 1'b1;
      end
      9'd184: begin
        out_b13 = 1'b1;
      end
      9'd185: begin
        out_b13 = 1'b1;
      end
      9'd186: begin
        out_b13 = 1'b1;
      end
      9'd187: begin
        out_b13 = 1'b1;
      end
      9'd188: begin
        out_b13 = 1'b1;
      end
      9'd189: begin
        out_b13 = 1'b1;
      end
      9'd190: begin
        out_b13 = 1'b1;
      end
      9'd191: begin
        out_b13 = 1'b1;
      end
      9'd192: begin
        out_b13 = 1'b1;
      end
      9'd193: begin
        out_b13 = 1'b1;
      end
      9'd194: begin
        out_b13 = 1'b1;
      end
      9'd195: begin
        out_b13 = 1'b1;
      end
      9'd196: begin
        out_b13 = 1'b1;
      end
      9'd197: begin
        out_b13 = 1'b1;
      end
      9'd198: begin
        out_b13 = 1'b1;
      end
      9'd199: begin
        out_b13 = 1'b1;
      end
      9'd200: begin
        out_b13 = 1'b1;
      end
      9'd201: begin
        out_b13 = 1'b1;
      end
      9'd202: begin
        out_b13 = 1'b1;
      end
      9'd203: begin
        out_b13 = 1'b1;
      end
      9'd204: begin
        out_b13 = 1'b1;
      end
      9'd205: begin
        out_b13 = 1'b1;
      end
      9'd206: begin
        out_b13 = 1'b1;
      end
      9'd207: begin
        out_b13 = 1'b1;
      end
      9'd208: begin
        out_b13 = 1'b1;
      end
      9'd209: begin
        out_b13 = 1'b1;
      end
      9'd210: begin
        out_b13 = 1'b1;
      end
      9'd211: begin
        out_b13 = 1'b1;
      end
      9'd212: begin
        out_b13 = 1'b1;
      end
      9'd213: begin
        out_b13 = 1'b1;
      end
      9'd214: begin
        out_b13 = 1'b1;
      end
      9'd215: begin
        out_b13 = 1'b1;
      end
      9'd216: begin
        out_b13 = 1'b1;
      end
      9'd217: begin
        out_b13 = 1'b1;
      end
      9'd218: begin
        out_b13 = 1'b1;
      end
      9'd219: begin
        out_b13 = 1'b1;
      end
      9'd220: begin
        out_b13 = 1'b1;
      end
      9'd221: begin
        out_b13 = 1'b1;
      end
      9'd222: begin
        out_b13 = 1'b1;
      end
      9'd223: begin
        out_b13 = 1'b1;
      end
      9'd224: begin
        out_b13 = 1'b1;
      end
      9'd225: begin
        out_b13 = 1'b1;
      end
      9'd226: begin
        out_b13 = 1'b1;
      end
      9'd227: begin
        out_b13 = 1'b1;
      end
      9'd228: begin
        out_b13 = 1'b1;
      end
      9'd229: begin
        out_b13 = 1'b1;
      end
      9'd230: begin
        out_b13 = 1'b1;
      end
      9'd231: begin
        out_b13 = 1'b1;
      end
      9'd232: begin
        out_b13 = 1'b1;
      end
      9'd233: begin
        out_b13 = 1'b1;
      end
      9'd234: begin
        out_b13 = 1'b1;
      end
      9'd235: begin
        out_b13 = 1'b1;
      end
      9'd236: begin
        out_b13 = 1'b1;
      end
      9'd237: begin
        out_b13 = 1'b1;
      end
      9'd238: begin
        out_b13 = 1'b1;
      end
      9'd239: begin
        out_b13 = 1'b1;
      end
      9'd240: begin
        out_b13 = 1'b1;
      end
      9'd241: begin
        out_b13 = 1'b1;
      end
      9'd242: begin
        out_b13 = 1'b1;
      end
      9'd243: begin
        out_b13 = 1'b1;
      end
      9'd244: begin
        out_b13 = 1'b1;
      end
      9'd245: begin
        out_b13 = 1'b1;
      end
      9'd246: begin
        out_b13 = 1'b1;
      end
      9'd247: begin
        out_b13 = 1'b1;
      end
      9'd248: begin
        out_b13 = 1'b1;
      end
      9'd249: begin
        out_b13 = 1'b1;
      end
      9'd250: begin
        out_b13 = 1'b1;
      end
      9'd251: begin
        out_b13 = 1'b1;
      end
      9'd252: begin
        out_b13 = 1'b1;
      end
      9'd253: begin
        out_b13 = 1'b1;
      end
      9'd254: begin
        out_b13 = 1'b1;
      end
      9'd255: begin
        out_b13 = 1'b1;
      end
      9'd256: begin
        out_b13 = 1'b1;
      end
      9'd257: begin
        out_b13 = 1'b1;
      end
      9'd258: begin
        out_b13 = 1'b1;
      end
      9'd259: begin
        out_b13 = 1'b1;
      end
      9'd260: begin
        out_b13 = 1'b1;
      end
      9'd261: begin
        out_b13 = 1'b1;
      end
      9'd262: begin
        out_b13 = 1'b1;
      end
      9'd263: begin
        out_b13 = 1'b1;
      end
      9'd264: begin
        out_b13 = 1'b1;
      end
      9'd265: begin
        out_b13 = 1'b1;
      end
      9'd266: begin
        out_b13 = 1'b1;
      end
      9'd267: begin
        out_b13 = 1'b1;
      end
      9'd268: begin
        out_b13 = 1'b1;
      end
      9'd269: begin
        out_b13 = 1'b1;
      end
      9'd270: begin
        out_b13 = 1'b1;
      end
      9'd271: begin
        out_b13 = 1'b1;
      end
      9'd272: begin
        out_b13 = 1'b1;
      end
      9'd273: begin
        out_b13 = 1'b1;
      end
      9'd274: begin
        out_b13 = 1'b1;
      end
      9'd275: begin
        out_b13 = 1'b1;
      end
      9'd276: begin
        out_b13 = 1'b1;
      end
      9'd277: begin
        out_b13 = 1'b1;
      end
      9'd278: begin
        out_b13 = 1'b1;
      end
      9'd279: begin
        out_b13 = 1'b1;
      end
      9'd280: begin
        out_b13 = 1'b1;
      end
      9'd281: begin
        out_b13 = 1'b1;
      end
      9'd282: begin
        out_b13 = 1'b1;
      end
      9'd283: begin
        out_b13 = 1'b1;
      end
      9'd284: begin
        out_b13 = 1'b1;
      end
      9'd285: begin
        out_b13 = 1'b1;
      end
      9'd286: begin
        out_b13 = 1'b1;
      end
      9'd287: begin
        out_b13 = 1'b1;
      end
      9'd288: begin
        out_b13 = 1'b1;
      end
      9'd289: begin
        out_b13 = 1'b1;
      end
      9'd290: begin
        out_b13 = 1'b1;
      end
      9'd291: begin
        out_b13 = 1'b1;
      end
      9'd292: begin
        out_b13 = 1'b1;
      end
      9'd293: begin
        out_b13 = 1'b1;
      end
      9'd294: begin
        out_b13 = 1'b1;
      end
      9'd295: begin
        out_b13 = 1'b1;
      end
      9'd296: begin
        out_b13 = 1'b1;
      end
      9'd297: begin
        out_b13 = 1'b1;
      end
      9'd298: begin
        out_b13 = 1'b1;
      end
      9'd299: begin
        out_b13 = 1'b1;
      end
      9'd300: begin
        out_b13 = 1'b1;
      end
      9'd301: begin
        out_b13 = 1'b1;
      end
      9'd302: begin
        out_b13 = 1'b1;
      end
      9'd303: begin
        out_b13 = 1'b1;
      end
      9'd304: begin
        out_b13 = 1'b1;
      end
      9'd305: begin
        out_b13 = 1'b1;
      end
      9'd306: begin
        out_b13 = 1'b1;
      end
      9'd307: begin
        out_b13 = 1'b1;
      end
      9'd308: begin
        out_b13 = 1'b1;
      end
      9'd309: begin
        out_b13 = 1'b1;
      end
      9'd310: begin
        out_b13 = 1'b1;
      end
      9'd311: begin
        out_b13 = 1'b1;
      end
      9'd312: begin
        out_b13 = 1'b1;
      end
      9'd313: begin
        out_b13 = 1'b1;
      end
      9'd314: begin
        out_b13 = 1'b1;
      end
      9'd315: begin
        out_b13 = 1'b1;
      end
      9'd316: begin
        out_b13 = 1'b1;
      end
      9'd317: begin
        out_b13 = 1'b1;
      end
      9'd318: begin
        out_b13 = 1'b1;
      end
      9'd319: begin
        out_b13 = 1'b1;
      end
      9'd320: begin
        out_b13 = 1'b1;
      end
      9'd321: begin
        out_b13 = 1'b1;
      end
      9'd322: begin
        out_b13 = 1'b1;
      end
      9'd323: begin
        out_b13 = 1'b1;
      end
      9'd324: begin
        out_b13 = 1'b1;
      end
      9'd325: begin
        out_b13 = 1'b1;
      end
      9'd326: begin
        out_b13 = 1'b1;
      end
      9'd327: begin
        out_b13 = 1'b1;
      end
      9'd328: begin
        out_b13 = 1'b1;
      end
      9'd329: begin
        out_b13 = 1'b1;
      end
      9'd330: begin
        out_b13 = 1'b1;
      end
      9'd331: begin
        out_b13 = 1'b1;
      end
      9'd332: begin
        out_b13 = 1'b1;
      end
      9'd333: begin
        out_b13 = 1'b1;
      end
      9'd334: begin
        out_b13 = 1'b1;
      end
      9'd335: begin
        out_b13 = 1'b1;
      end
      9'd336: begin
        out_b13 = 1'b1;
      end
      9'd337: begin
        out_b13 = 1'b1;
      end
      9'd338: begin
        out_b13 = 1'b1;
      end
      9'd339: begin
        out_b13 = 1'b1;
      end
      9'd340: begin
        out_b13 = 1'b1;
      end
      9'd341: begin
        out_b13 = 1'b1;
      end
      9'd342: begin
        out_b13 = 1'b1;
      end
      9'd343: begin
        out_b13 = 1'b1;
      end
      9'd344: begin
        out_b13 = 1'b1;
      end
      9'd345: begin
        out_b13 = 1'b1;
      end
      9'd346: begin
        out_b13 = 1'b1;
      end
      9'd347: begin
        out_b13 = 1'b1;
      end
      9'd348: begin
        out_b13 = 1'b1;
      end
      9'd349: begin
        out_b13 = 1'b1;
      end
      9'd350: begin
        out_b13 = 1'b1;
      end
      9'd351: begin
        out_b13 = 1'b1;
      end
      9'd352: begin
        out_b13 = 1'b1;
      end
      9'd353: begin
        out_b13 = 1'b1;
      end
      9'd354: begin
        out_b13 = 1'b1;
      end
      9'd355: begin
        out_b13 = 1'b1;
      end
      9'd356: begin
        out_b13 = 1'b1;
      end
      9'd357: begin
        out_b13 = 1'b1;
      end
      9'd358: begin
        out_b13 = 1'b1;
      end
      9'd359: begin
        out_b13 = 1'b1;
      end
      9'd360: begin
        out_b13 = 1'b1;
      end
      9'd361: begin
        out_b13 = 1'b1;
      end
      9'd362: begin
        out_b13 = 1'b1;
      end
      9'd363: begin
        out_b13 = 1'b1;
      end
      9'd364: begin
        out_b13 = 1'b1;
      end
      9'd365: begin
        out_b13 = 1'b1;
      end
      9'd366: begin
        out_b13 = 1'b1;
      end
      9'd367: begin
        out_b13 = 1'b1;
      end
      9'd368: begin
        out_b13 = 1'b1;
      end
      9'd369: begin
        out_b13 = 1'b1;
      end
      9'd370: begin
        out_b13 = 1'b1;
      end
      9'd371: begin
        out_b13 = 1'b1;
      end
      9'd372: begin
        out_b13 = 1'b1;
      end
      9'd373: begin
        out_b13 = 1'b1;
      end
      9'd374: begin
        out_b13 = 1'b1;
      end
      9'd375: begin
        out_b13 = 1'b1;
      end
      9'd376: begin
        out_b13 = 1'b1;
      end
      9'd377: begin
        out_b13 = 1'b1;
      end
      9'd378: begin
        out_b13 = 1'b1;
      end
      9'd379: begin
        out_b13 = 1'b1;
      end
      9'd380: begin
        out_b13 = 1'b1;
      end
      9'd381: begin
        out_b13 = 1'b1;
      end
      9'd382: begin
        out_b13 = 1'b1;
      end
      9'd383: begin
        out_b13 = 1'b1;
      end
      9'd384: begin
        out_b13 = 1'b1;
      end
      9'd385: begin
        out_b13 = 1'b1;
      end
      9'd386: begin
        out_b13 = 1'b1;
      end
      9'd387: begin
        out_b13 = 1'b1;
      end
      9'd388: begin
        if (mant <= 7'd46) begin
          out_b13 = 1'b1;
        end else begin
          out_b13 = 1'b0;
        end
      end
      9'd389: begin
        out_b13 = 1'b0;
      end
      9'd390: begin
        out_b13 = 1'b0;
      end
      9'd391: begin
        out_b13 = 1'b0;
      end
      9'd392: begin
        out_b13 = 1'b0;
      end
      9'd393: begin
        out_b13 = 1'b0;
      end
      9'd394: begin
        out_b13 = 1'b0;
      end
      9'd395: begin
        out_b13 = 1'b0;
      end
      9'd396: begin
        out_b13 = 1'b0;
      end
      9'd397: begin
        out_b13 = 1'b0;
      end
      9'd398: begin
        out_b13 = 1'b0;
      end
      9'd399: begin
        out_b13 = 1'b0;
      end
      9'd400: begin
        out_b13 = 1'b0;
      end
      9'd401: begin
        out_b13 = 1'b0;
      end
      9'd402: begin
        out_b13 = 1'b0;
      end
      9'd403: begin
        out_b13 = 1'b0;
      end
      9'd404: begin
        out_b13 = 1'b0;
      end
      9'd405: begin
        out_b13 = 1'b0;
      end
      9'd406: begin
        out_b13 = 1'b0;
      end
      9'd407: begin
        out_b13 = 1'b0;
      end
      9'd408: begin
        out_b13 = 1'b0;
      end
      9'd409: begin
        out_b13 = 1'b0;
      end
      9'd410: begin
        out_b13 = 1'b0;
      end
      9'd411: begin
        out_b13 = 1'b0;
      end
      9'd412: begin
        out_b13 = 1'b0;
      end
      9'd413: begin
        out_b13 = 1'b0;
      end
      9'd414: begin
        out_b13 = 1'b0;
      end
      9'd415: begin
        out_b13 = 1'b0;
      end
      9'd416: begin
        out_b13 = 1'b0;
      end
      9'd417: begin
        out_b13 = 1'b0;
      end
      9'd418: begin
        out_b13 = 1'b0;
      end
      9'd419: begin
        out_b13 = 1'b0;
      end
      9'd420: begin
        out_b13 = 1'b0;
      end
      9'd421: begin
        out_b13 = 1'b0;
      end
      9'd422: begin
        out_b13 = 1'b0;
      end
      9'd423: begin
        out_b13 = 1'b0;
      end
      9'd424: begin
        out_b13 = 1'b0;
      end
      9'd425: begin
        out_b13 = 1'b0;
      end
      9'd426: begin
        out_b13 = 1'b0;
      end
      9'd427: begin
        out_b13 = 1'b0;
      end
      9'd428: begin
        out_b13 = 1'b0;
      end
      9'd429: begin
        out_b13 = 1'b0;
      end
      9'd430: begin
        out_b13 = 1'b0;
      end
      9'd431: begin
        out_b13 = 1'b0;
      end
      9'd432: begin
        out_b13 = 1'b0;
      end
      9'd433: begin
        out_b13 = 1'b0;
      end
      9'd434: begin
        out_b13 = 1'b0;
      end
      9'd435: begin
        out_b13 = 1'b0;
      end
      9'd436: begin
        out_b13 = 1'b0;
      end
      9'd437: begin
        out_b13 = 1'b0;
      end
      9'd438: begin
        out_b13 = 1'b0;
      end
      9'd439: begin
        out_b13 = 1'b0;
      end
      9'd440: begin
        out_b13 = 1'b0;
      end
      9'd441: begin
        out_b13 = 1'b0;
      end
      9'd442: begin
        out_b13 = 1'b0;
      end
      9'd443: begin
        out_b13 = 1'b0;
      end
      9'd444: begin
        out_b13 = 1'b0;
      end
      9'd445: begin
        out_b13 = 1'b0;
      end
      9'd446: begin
        out_b13 = 1'b0;
      end
      9'd447: begin
        out_b13 = 1'b0;
      end
      9'd448: begin
        out_b13 = 1'b0;
      end
      9'd449: begin
        out_b13 = 1'b0;
      end
      9'd450: begin
        out_b13 = 1'b0;
      end
      9'd451: begin
        out_b13 = 1'b0;
      end
      9'd452: begin
        out_b13 = 1'b0;
      end
      9'd453: begin
        out_b13 = 1'b0;
      end
      9'd454: begin
        out_b13 = 1'b0;
      end
      9'd455: begin
        out_b13 = 1'b0;
      end
      9'd456: begin
        out_b13 = 1'b0;
      end
      9'd457: begin
        out_b13 = 1'b0;
      end
      9'd458: begin
        out_b13 = 1'b0;
      end
      9'd459: begin
        out_b13 = 1'b0;
      end
      9'd460: begin
        out_b13 = 1'b0;
      end
      9'd461: begin
        out_b13 = 1'b0;
      end
      9'd462: begin
        out_b13 = 1'b0;
      end
      9'd463: begin
        out_b13 = 1'b0;
      end
      9'd464: begin
        out_b13 = 1'b0;
      end
      9'd465: begin
        out_b13 = 1'b0;
      end
      9'd466: begin
        out_b13 = 1'b0;
      end
      9'd467: begin
        out_b13 = 1'b0;
      end
      9'd468: begin
        out_b13 = 1'b0;
      end
      9'd469: begin
        out_b13 = 1'b0;
      end
      9'd470: begin
        out_b13 = 1'b0;
      end
      9'd471: begin
        out_b13 = 1'b0;
      end
      9'd472: begin
        out_b13 = 1'b0;
      end
      9'd473: begin
        out_b13 = 1'b0;
      end
      9'd474: begin
        out_b13 = 1'b0;
      end
      9'd475: begin
        out_b13 = 1'b0;
      end
      9'd476: begin
        out_b13 = 1'b0;
      end
      9'd477: begin
        out_b13 = 1'b0;
      end
      9'd478: begin
        out_b13 = 1'b0;
      end
      9'd479: begin
        out_b13 = 1'b0;
      end
      9'd480: begin
        out_b13 = 1'b0;
      end
      9'd481: begin
        out_b13 = 1'b0;
      end
      9'd482: begin
        out_b13 = 1'b0;
      end
      9'd483: begin
        out_b13 = 1'b0;
      end
      9'd484: begin
        out_b13 = 1'b0;
      end
      9'd485: begin
        out_b13 = 1'b0;
      end
      9'd486: begin
        out_b13 = 1'b0;
      end
      9'd487: begin
        out_b13 = 1'b0;
      end
      9'd488: begin
        out_b13 = 1'b0;
      end
      9'd489: begin
        out_b13 = 1'b0;
      end
      9'd490: begin
        out_b13 = 1'b0;
      end
      9'd491: begin
        out_b13 = 1'b0;
      end
      9'd492: begin
        out_b13 = 1'b0;
      end
      9'd493: begin
        out_b13 = 1'b0;
      end
      9'd494: begin
        out_b13 = 1'b0;
      end
      9'd495: begin
        out_b13 = 1'b0;
      end
      9'd496: begin
        out_b13 = 1'b0;
      end
      9'd497: begin
        out_b13 = 1'b0;
      end
      9'd498: begin
        out_b13 = 1'b0;
      end
      9'd499: begin
        out_b13 = 1'b0;
      end
      9'd500: begin
        out_b13 = 1'b0;
      end
      9'd501: begin
        out_b13 = 1'b0;
      end
      9'd502: begin
        out_b13 = 1'b0;
      end
      9'd503: begin
        out_b13 = 1'b0;
      end
      9'd504: begin
        out_b13 = 1'b0;
      end
      9'd505: begin
        out_b13 = 1'b0;
      end
      9'd506: begin
        out_b13 = 1'b0;
      end
      9'd507: begin
        out_b13 = 1'b0;
      end
      9'd508: begin
        out_b13 = 1'b0;
      end
      9'd509: begin
        out_b13 = 1'b0;
      end
      9'd510: begin
        out_b13 = 1'b0;
      end
      9'd511: begin
        if (mant <= 7'd0) begin
          out_b13 = 1'b0;
        end else begin
          out_b13 = 1'b1;
        end
      end
      default: out_b13 = 1'b0;
    endcase
  end
  reg out_b12;
  always @* begin
    case (sign_exp)
      9'd0: begin
        out_b12 = 1'b1;
      end
      9'd1: begin
        out_b12 = 1'b1;
      end
      9'd2: begin
        out_b12 = 1'b1;
      end
      9'd3: begin
        out_b12 = 1'b1;
      end
      9'd4: begin
        out_b12 = 1'b1;
      end
      9'd5: begin
        out_b12 = 1'b1;
      end
      9'd6: begin
        out_b12 = 1'b1;
      end
      9'd7: begin
        out_b12 = 1'b1;
      end
      9'd8: begin
        out_b12 = 1'b1;
      end
      9'd9: begin
        out_b12 = 1'b1;
      end
      9'd10: begin
        out_b12 = 1'b1;
      end
      9'd11: begin
        out_b12 = 1'b1;
      end
      9'd12: begin
        out_b12 = 1'b1;
      end
      9'd13: begin
        out_b12 = 1'b1;
      end
      9'd14: begin
        out_b12 = 1'b1;
      end
      9'd15: begin
        out_b12 = 1'b1;
      end
      9'd16: begin
        out_b12 = 1'b1;
      end
      9'd17: begin
        out_b12 = 1'b1;
      end
      9'd18: begin
        out_b12 = 1'b1;
      end
      9'd19: begin
        out_b12 = 1'b1;
      end
      9'd20: begin
        out_b12 = 1'b1;
      end
      9'd21: begin
        out_b12 = 1'b1;
      end
      9'd22: begin
        out_b12 = 1'b1;
      end
      9'd23: begin
        out_b12 = 1'b1;
      end
      9'd24: begin
        out_b12 = 1'b1;
      end
      9'd25: begin
        out_b12 = 1'b1;
      end
      9'd26: begin
        out_b12 = 1'b1;
      end
      9'd27: begin
        out_b12 = 1'b1;
      end
      9'd28: begin
        out_b12 = 1'b1;
      end
      9'd29: begin
        out_b12 = 1'b1;
      end
      9'd30: begin
        out_b12 = 1'b1;
      end
      9'd31: begin
        out_b12 = 1'b1;
      end
      9'd32: begin
        out_b12 = 1'b1;
      end
      9'd33: begin
        out_b12 = 1'b1;
      end
      9'd34: begin
        out_b12 = 1'b1;
      end
      9'd35: begin
        out_b12 = 1'b1;
      end
      9'd36: begin
        out_b12 = 1'b1;
      end
      9'd37: begin
        out_b12 = 1'b1;
      end
      9'd38: begin
        out_b12 = 1'b1;
      end
      9'd39: begin
        out_b12 = 1'b1;
      end
      9'd40: begin
        out_b12 = 1'b1;
      end
      9'd41: begin
        out_b12 = 1'b1;
      end
      9'd42: begin
        out_b12 = 1'b1;
      end
      9'd43: begin
        out_b12 = 1'b1;
      end
      9'd44: begin
        out_b12 = 1'b1;
      end
      9'd45: begin
        out_b12 = 1'b1;
      end
      9'd46: begin
        out_b12 = 1'b1;
      end
      9'd47: begin
        out_b12 = 1'b1;
      end
      9'd48: begin
        out_b12 = 1'b1;
      end
      9'd49: begin
        out_b12 = 1'b1;
      end
      9'd50: begin
        out_b12 = 1'b1;
      end
      9'd51: begin
        out_b12 = 1'b1;
      end
      9'd52: begin
        out_b12 = 1'b1;
      end
      9'd53: begin
        out_b12 = 1'b1;
      end
      9'd54: begin
        out_b12 = 1'b1;
      end
      9'd55: begin
        out_b12 = 1'b1;
      end
      9'd56: begin
        out_b12 = 1'b1;
      end
      9'd57: begin
        out_b12 = 1'b1;
      end
      9'd58: begin
        out_b12 = 1'b1;
      end
      9'd59: begin
        out_b12 = 1'b1;
      end
      9'd60: begin
        out_b12 = 1'b1;
      end
      9'd61: begin
        out_b12 = 1'b1;
      end
      9'd62: begin
        out_b12 = 1'b1;
      end
      9'd63: begin
        out_b12 = 1'b1;
      end
      9'd64: begin
        out_b12 = 1'b1;
      end
      9'd65: begin
        out_b12 = 1'b1;
      end
      9'd66: begin
        out_b12 = 1'b1;
      end
      9'd67: begin
        out_b12 = 1'b1;
      end
      9'd68: begin
        out_b12 = 1'b1;
      end
      9'd69: begin
        out_b12 = 1'b1;
      end
      9'd70: begin
        out_b12 = 1'b1;
      end
      9'd71: begin
        out_b12 = 1'b1;
      end
      9'd72: begin
        out_b12 = 1'b1;
      end
      9'd73: begin
        out_b12 = 1'b1;
      end
      9'd74: begin
        out_b12 = 1'b1;
      end
      9'd75: begin
        out_b12 = 1'b1;
      end
      9'd76: begin
        out_b12 = 1'b1;
      end
      9'd77: begin
        out_b12 = 1'b1;
      end
      9'd78: begin
        out_b12 = 1'b1;
      end
      9'd79: begin
        out_b12 = 1'b1;
      end
      9'd80: begin
        out_b12 = 1'b1;
      end
      9'd81: begin
        out_b12 = 1'b1;
      end
      9'd82: begin
        out_b12 = 1'b1;
      end
      9'd83: begin
        out_b12 = 1'b1;
      end
      9'd84: begin
        out_b12 = 1'b1;
      end
      9'd85: begin
        out_b12 = 1'b1;
      end
      9'd86: begin
        out_b12 = 1'b1;
      end
      9'd87: begin
        out_b12 = 1'b1;
      end
      9'd88: begin
        out_b12 = 1'b1;
      end
      9'd89: begin
        out_b12 = 1'b1;
      end
      9'd90: begin
        out_b12 = 1'b1;
      end
      9'd91: begin
        out_b12 = 1'b1;
      end
      9'd92: begin
        out_b12 = 1'b1;
      end
      9'd93: begin
        out_b12 = 1'b1;
      end
      9'd94: begin
        out_b12 = 1'b1;
      end
      9'd95: begin
        out_b12 = 1'b1;
      end
      9'd96: begin
        out_b12 = 1'b1;
      end
      9'd97: begin
        out_b12 = 1'b1;
      end
      9'd98: begin
        out_b12 = 1'b1;
      end
      9'd99: begin
        out_b12 = 1'b1;
      end
      9'd100: begin
        out_b12 = 1'b1;
      end
      9'd101: begin
        out_b12 = 1'b1;
      end
      9'd102: begin
        out_b12 = 1'b1;
      end
      9'd103: begin
        out_b12 = 1'b1;
      end
      9'd104: begin
        out_b12 = 1'b1;
      end
      9'd105: begin
        out_b12 = 1'b1;
      end
      9'd106: begin
        out_b12 = 1'b1;
      end
      9'd107: begin
        out_b12 = 1'b1;
      end
      9'd108: begin
        out_b12 = 1'b1;
      end
      9'd109: begin
        out_b12 = 1'b1;
      end
      9'd110: begin
        out_b12 = 1'b1;
      end
      9'd111: begin
        out_b12 = 1'b1;
      end
      9'd112: begin
        out_b12 = 1'b1;
      end
      9'd113: begin
        out_b12 = 1'b1;
      end
      9'd114: begin
        out_b12 = 1'b1;
      end
      9'd115: begin
        out_b12 = 1'b1;
      end
      9'd116: begin
        out_b12 = 1'b1;
      end
      9'd117: begin
        out_b12 = 1'b1;
      end
      9'd118: begin
        out_b12 = 1'b1;
      end
      9'd119: begin
        out_b12 = 1'b1;
      end
      9'd120: begin
        out_b12 = 1'b1;
      end
      9'd121: begin
        out_b12 = 1'b1;
      end
      9'd122: begin
        out_b12 = 1'b1;
      end
      9'd123: begin
        out_b12 = 1'b1;
      end
      9'd124: begin
        out_b12 = 1'b1;
      end
      9'd125: begin
        out_b12 = 1'b1;
      end
      9'd126: begin
        if (mant <= 7'd48) begin
          out_b12 = 1'b1;
        end else begin
          out_b12 = 1'b0;
        end
      end
      9'd127: begin
        out_b12 = 1'b0;
      end
      9'd128: begin
        out_b12 = 1'b0;
      end
      9'd129: begin
        out_b12 = 1'b0;
      end
      9'd130: begin
        out_b12 = 1'b0;
      end
      9'd131: begin
        if (mant <= 7'd54) begin
          out_b12 = 1'b0;
        end else begin
          out_b12 = 1'b1;
        end
      end
      9'd132: begin
        if (mant <= 7'd52) begin
          out_b12 = 1'b1;
        end else begin
          out_b12 = 1'b0;
        end
      end
      9'd133: begin
        if (mant <= 7'd6) begin
          out_b12 = 1'b0;
        end else begin
          out_b12 = 1'b1;
        end
      end
      9'd134: begin
        out_b12 = 1'b1;
      end
      9'd135: begin
        out_b12 = 1'b1;
      end
      9'd136: begin
        out_b12 = 1'b1;
      end
      9'd137: begin
        out_b12 = 1'b1;
      end
      9'd138: begin
        out_b12 = 1'b1;
      end
      9'd139: begin
        out_b12 = 1'b1;
      end
      9'd140: begin
        out_b12 = 1'b1;
      end
      9'd141: begin
        out_b12 = 1'b1;
      end
      9'd142: begin
        out_b12 = 1'b1;
      end
      9'd143: begin
        out_b12 = 1'b1;
      end
      9'd144: begin
        out_b12 = 1'b1;
      end
      9'd145: begin
        out_b12 = 1'b1;
      end
      9'd146: begin
        out_b12 = 1'b1;
      end
      9'd147: begin
        out_b12 = 1'b1;
      end
      9'd148: begin
        out_b12 = 1'b1;
      end
      9'd149: begin
        out_b12 = 1'b1;
      end
      9'd150: begin
        out_b12 = 1'b1;
      end
      9'd151: begin
        out_b12 = 1'b1;
      end
      9'd152: begin
        out_b12 = 1'b1;
      end
      9'd153: begin
        out_b12 = 1'b1;
      end
      9'd154: begin
        out_b12 = 1'b1;
      end
      9'd155: begin
        out_b12 = 1'b1;
      end
      9'd156: begin
        out_b12 = 1'b1;
      end
      9'd157: begin
        out_b12 = 1'b1;
      end
      9'd158: begin
        out_b12 = 1'b1;
      end
      9'd159: begin
        out_b12 = 1'b1;
      end
      9'd160: begin
        out_b12 = 1'b1;
      end
      9'd161: begin
        out_b12 = 1'b1;
      end
      9'd162: begin
        out_b12 = 1'b1;
      end
      9'd163: begin
        out_b12 = 1'b1;
      end
      9'd164: begin
        out_b12 = 1'b1;
      end
      9'd165: begin
        out_b12 = 1'b1;
      end
      9'd166: begin
        out_b12 = 1'b1;
      end
      9'd167: begin
        out_b12 = 1'b1;
      end
      9'd168: begin
        out_b12 = 1'b1;
      end
      9'd169: begin
        out_b12 = 1'b1;
      end
      9'd170: begin
        out_b12 = 1'b1;
      end
      9'd171: begin
        out_b12 = 1'b1;
      end
      9'd172: begin
        out_b12 = 1'b1;
      end
      9'd173: begin
        out_b12 = 1'b1;
      end
      9'd174: begin
        out_b12 = 1'b1;
      end
      9'd175: begin
        out_b12 = 1'b1;
      end
      9'd176: begin
        out_b12 = 1'b1;
      end
      9'd177: begin
        out_b12 = 1'b1;
      end
      9'd178: begin
        out_b12 = 1'b1;
      end
      9'd179: begin
        out_b12 = 1'b1;
      end
      9'd180: begin
        out_b12 = 1'b1;
      end
      9'd181: begin
        out_b12 = 1'b1;
      end
      9'd182: begin
        out_b12 = 1'b1;
      end
      9'd183: begin
        out_b12 = 1'b1;
      end
      9'd184: begin
        out_b12 = 1'b1;
      end
      9'd185: begin
        out_b12 = 1'b1;
      end
      9'd186: begin
        out_b12 = 1'b1;
      end
      9'd187: begin
        out_b12 = 1'b1;
      end
      9'd188: begin
        out_b12 = 1'b1;
      end
      9'd189: begin
        out_b12 = 1'b1;
      end
      9'd190: begin
        out_b12 = 1'b1;
      end
      9'd191: begin
        out_b12 = 1'b1;
      end
      9'd192: begin
        out_b12 = 1'b1;
      end
      9'd193: begin
        out_b12 = 1'b1;
      end
      9'd194: begin
        out_b12 = 1'b1;
      end
      9'd195: begin
        out_b12 = 1'b1;
      end
      9'd196: begin
        out_b12 = 1'b1;
      end
      9'd197: begin
        out_b12 = 1'b1;
      end
      9'd198: begin
        out_b12 = 1'b1;
      end
      9'd199: begin
        out_b12 = 1'b1;
      end
      9'd200: begin
        out_b12 = 1'b1;
      end
      9'd201: begin
        out_b12 = 1'b1;
      end
      9'd202: begin
        out_b12 = 1'b1;
      end
      9'd203: begin
        out_b12 = 1'b1;
      end
      9'd204: begin
        out_b12 = 1'b1;
      end
      9'd205: begin
        out_b12 = 1'b1;
      end
      9'd206: begin
        out_b12 = 1'b1;
      end
      9'd207: begin
        out_b12 = 1'b1;
      end
      9'd208: begin
        out_b12 = 1'b1;
      end
      9'd209: begin
        out_b12 = 1'b1;
      end
      9'd210: begin
        out_b12 = 1'b1;
      end
      9'd211: begin
        out_b12 = 1'b1;
      end
      9'd212: begin
        out_b12 = 1'b1;
      end
      9'd213: begin
        out_b12 = 1'b1;
      end
      9'd214: begin
        out_b12 = 1'b1;
      end
      9'd215: begin
        out_b12 = 1'b1;
      end
      9'd216: begin
        out_b12 = 1'b1;
      end
      9'd217: begin
        out_b12 = 1'b1;
      end
      9'd218: begin
        out_b12 = 1'b1;
      end
      9'd219: begin
        out_b12 = 1'b1;
      end
      9'd220: begin
        out_b12 = 1'b1;
      end
      9'd221: begin
        out_b12 = 1'b1;
      end
      9'd222: begin
        out_b12 = 1'b1;
      end
      9'd223: begin
        out_b12 = 1'b1;
      end
      9'd224: begin
        out_b12 = 1'b1;
      end
      9'd225: begin
        out_b12 = 1'b1;
      end
      9'd226: begin
        out_b12 = 1'b1;
      end
      9'd227: begin
        out_b12 = 1'b1;
      end
      9'd228: begin
        out_b12 = 1'b1;
      end
      9'd229: begin
        out_b12 = 1'b1;
      end
      9'd230: begin
        out_b12 = 1'b1;
      end
      9'd231: begin
        out_b12 = 1'b1;
      end
      9'd232: begin
        out_b12 = 1'b1;
      end
      9'd233: begin
        out_b12 = 1'b1;
      end
      9'd234: begin
        out_b12 = 1'b1;
      end
      9'd235: begin
        out_b12 = 1'b1;
      end
      9'd236: begin
        out_b12 = 1'b1;
      end
      9'd237: begin
        out_b12 = 1'b1;
      end
      9'd238: begin
        out_b12 = 1'b1;
      end
      9'd239: begin
        out_b12 = 1'b1;
      end
      9'd240: begin
        out_b12 = 1'b1;
      end
      9'd241: begin
        out_b12 = 1'b1;
      end
      9'd242: begin
        out_b12 = 1'b1;
      end
      9'd243: begin
        out_b12 = 1'b1;
      end
      9'd244: begin
        out_b12 = 1'b1;
      end
      9'd245: begin
        out_b12 = 1'b1;
      end
      9'd246: begin
        out_b12 = 1'b1;
      end
      9'd247: begin
        out_b12 = 1'b1;
      end
      9'd248: begin
        out_b12 = 1'b1;
      end
      9'd249: begin
        out_b12 = 1'b1;
      end
      9'd250: begin
        out_b12 = 1'b1;
      end
      9'd251: begin
        out_b12 = 1'b1;
      end
      9'd252: begin
        out_b12 = 1'b1;
      end
      9'd253: begin
        out_b12 = 1'b1;
      end
      9'd254: begin
        out_b12 = 1'b1;
      end
      9'd255: begin
        out_b12 = 1'b1;
      end
      9'd256: begin
        out_b12 = 1'b1;
      end
      9'd257: begin
        out_b12 = 1'b1;
      end
      9'd258: begin
        out_b12 = 1'b1;
      end
      9'd259: begin
        out_b12 = 1'b1;
      end
      9'd260: begin
        out_b12 = 1'b1;
      end
      9'd261: begin
        out_b12 = 1'b1;
      end
      9'd262: begin
        out_b12 = 1'b1;
      end
      9'd263: begin
        out_b12 = 1'b1;
      end
      9'd264: begin
        out_b12 = 1'b1;
      end
      9'd265: begin
        out_b12 = 1'b1;
      end
      9'd266: begin
        out_b12 = 1'b1;
      end
      9'd267: begin
        out_b12 = 1'b1;
      end
      9'd268: begin
        out_b12 = 1'b1;
      end
      9'd269: begin
        out_b12 = 1'b1;
      end
      9'd270: begin
        out_b12 = 1'b1;
      end
      9'd271: begin
        out_b12 = 1'b1;
      end
      9'd272: begin
        out_b12 = 1'b1;
      end
      9'd273: begin
        out_b12 = 1'b1;
      end
      9'd274: begin
        out_b12 = 1'b1;
      end
      9'd275: begin
        out_b12 = 1'b1;
      end
      9'd276: begin
        out_b12 = 1'b1;
      end
      9'd277: begin
        out_b12 = 1'b1;
      end
      9'd278: begin
        out_b12 = 1'b1;
      end
      9'd279: begin
        out_b12 = 1'b1;
      end
      9'd280: begin
        out_b12 = 1'b1;
      end
      9'd281: begin
        out_b12 = 1'b1;
      end
      9'd282: begin
        out_b12 = 1'b1;
      end
      9'd283: begin
        out_b12 = 1'b1;
      end
      9'd284: begin
        out_b12 = 1'b1;
      end
      9'd285: begin
        out_b12 = 1'b1;
      end
      9'd286: begin
        out_b12 = 1'b1;
      end
      9'd287: begin
        out_b12 = 1'b1;
      end
      9'd288: begin
        out_b12 = 1'b1;
      end
      9'd289: begin
        out_b12 = 1'b1;
      end
      9'd290: begin
        out_b12 = 1'b1;
      end
      9'd291: begin
        out_b12 = 1'b1;
      end
      9'd292: begin
        out_b12 = 1'b1;
      end
      9'd293: begin
        out_b12 = 1'b1;
      end
      9'd294: begin
        out_b12 = 1'b1;
      end
      9'd295: begin
        out_b12 = 1'b1;
      end
      9'd296: begin
        out_b12 = 1'b1;
      end
      9'd297: begin
        out_b12 = 1'b1;
      end
      9'd298: begin
        out_b12 = 1'b1;
      end
      9'd299: begin
        out_b12 = 1'b1;
      end
      9'd300: begin
        out_b12 = 1'b1;
      end
      9'd301: begin
        out_b12 = 1'b1;
      end
      9'd302: begin
        out_b12 = 1'b1;
      end
      9'd303: begin
        out_b12 = 1'b1;
      end
      9'd304: begin
        out_b12 = 1'b1;
      end
      9'd305: begin
        out_b12 = 1'b1;
      end
      9'd306: begin
        out_b12 = 1'b1;
      end
      9'd307: begin
        out_b12 = 1'b1;
      end
      9'd308: begin
        out_b12 = 1'b1;
      end
      9'd309: begin
        out_b12 = 1'b1;
      end
      9'd310: begin
        out_b12 = 1'b1;
      end
      9'd311: begin
        out_b12 = 1'b1;
      end
      9'd312: begin
        out_b12 = 1'b1;
      end
      9'd313: begin
        out_b12 = 1'b1;
      end
      9'd314: begin
        out_b12 = 1'b1;
      end
      9'd315: begin
        out_b12 = 1'b1;
      end
      9'd316: begin
        out_b12 = 1'b1;
      end
      9'd317: begin
        out_b12 = 1'b1;
      end
      9'd318: begin
        out_b12 = 1'b1;
      end
      9'd319: begin
        out_b12 = 1'b1;
      end
      9'd320: begin
        out_b12 = 1'b1;
      end
      9'd321: begin
        out_b12 = 1'b1;
      end
      9'd322: begin
        out_b12 = 1'b1;
      end
      9'd323: begin
        out_b12 = 1'b1;
      end
      9'd324: begin
        out_b12 = 1'b1;
      end
      9'd325: begin
        out_b12 = 1'b1;
      end
      9'd326: begin
        out_b12 = 1'b1;
      end
      9'd327: begin
        out_b12 = 1'b1;
      end
      9'd328: begin
        out_b12 = 1'b1;
      end
      9'd329: begin
        out_b12 = 1'b1;
      end
      9'd330: begin
        out_b12 = 1'b1;
      end
      9'd331: begin
        out_b12 = 1'b1;
      end
      9'd332: begin
        out_b12 = 1'b1;
      end
      9'd333: begin
        out_b12 = 1'b1;
      end
      9'd334: begin
        out_b12 = 1'b1;
      end
      9'd335: begin
        out_b12 = 1'b1;
      end
      9'd336: begin
        out_b12 = 1'b1;
      end
      9'd337: begin
        out_b12 = 1'b1;
      end
      9'd338: begin
        out_b12 = 1'b1;
      end
      9'd339: begin
        out_b12 = 1'b1;
      end
      9'd340: begin
        out_b12 = 1'b1;
      end
      9'd341: begin
        out_b12 = 1'b1;
      end
      9'd342: begin
        out_b12 = 1'b1;
      end
      9'd343: begin
        out_b12 = 1'b1;
      end
      9'd344: begin
        out_b12 = 1'b1;
      end
      9'd345: begin
        out_b12 = 1'b1;
      end
      9'd346: begin
        out_b12 = 1'b1;
      end
      9'd347: begin
        out_b12 = 1'b1;
      end
      9'd348: begin
        out_b12 = 1'b1;
      end
      9'd349: begin
        out_b12 = 1'b1;
      end
      9'd350: begin
        out_b12 = 1'b1;
      end
      9'd351: begin
        out_b12 = 1'b1;
      end
      9'd352: begin
        out_b12 = 1'b1;
      end
      9'd353: begin
        out_b12 = 1'b1;
      end
      9'd354: begin
        out_b12 = 1'b1;
      end
      9'd355: begin
        out_b12 = 1'b1;
      end
      9'd356: begin
        out_b12 = 1'b1;
      end
      9'd357: begin
        out_b12 = 1'b1;
      end
      9'd358: begin
        out_b12 = 1'b1;
      end
      9'd359: begin
        out_b12 = 1'b1;
      end
      9'd360: begin
        out_b12 = 1'b1;
      end
      9'd361: begin
        out_b12 = 1'b1;
      end
      9'd362: begin
        out_b12 = 1'b1;
      end
      9'd363: begin
        out_b12 = 1'b1;
      end
      9'd364: begin
        out_b12 = 1'b1;
      end
      9'd365: begin
        out_b12 = 1'b1;
      end
      9'd366: begin
        out_b12 = 1'b1;
      end
      9'd367: begin
        out_b12 = 1'b1;
      end
      9'd368: begin
        out_b12 = 1'b1;
      end
      9'd369: begin
        out_b12 = 1'b1;
      end
      9'd370: begin
        out_b12 = 1'b1;
      end
      9'd371: begin
        out_b12 = 1'b1;
      end
      9'd372: begin
        out_b12 = 1'b1;
      end
      9'd373: begin
        out_b12 = 1'b1;
      end
      9'd374: begin
        out_b12 = 1'b1;
      end
      9'd375: begin
        out_b12 = 1'b1;
      end
      9'd376: begin
        out_b12 = 1'b1;
      end
      9'd377: begin
        out_b12 = 1'b1;
      end
      9'd378: begin
        out_b12 = 1'b1;
      end
      9'd379: begin
        out_b12 = 1'b1;
      end
      9'd380: begin
        out_b12 = 1'b1;
      end
      9'd381: begin
        out_b12 = 1'b1;
      end
      9'd382: begin
        out_b12 = 1'b1;
      end
      9'd383: begin
        out_b12 = 1'b1;
      end
      9'd384: begin
        out_b12 = 1'b1;
      end
      9'd385: begin
        out_b12 = 1'b1;
      end
      9'd386: begin
        out_b12 = 1'b1;
      end
      9'd387: begin
        if (mant <= 7'd43) begin
          out_b12 = 1'b1;
        end else begin
          out_b12 = 1'b0;
        end
      end
      9'd388: begin
        if (mant <= 7'd46) begin
          out_b12 = 1'b0;
        end else begin
          out_b12 = 1'b1;
        end
      end
      9'd389: begin
        if (mant <= 7'd3) begin
          out_b12 = 1'b1;
        end else begin
          out_b12 = 1'b0;
        end
      end
      9'd390: begin
        out_b12 = 1'b0;
      end
      9'd391: begin
        out_b12 = 1'b0;
      end
      9'd392: begin
        out_b12 = 1'b0;
      end
      9'd393: begin
        out_b12 = 1'b0;
      end
      9'd394: begin
        out_b12 = 1'b0;
      end
      9'd395: begin
        out_b12 = 1'b0;
      end
      9'd396: begin
        out_b12 = 1'b0;
      end
      9'd397: begin
        out_b12 = 1'b0;
      end
      9'd398: begin
        out_b12 = 1'b0;
      end
      9'd399: begin
        out_b12 = 1'b0;
      end
      9'd400: begin
        out_b12 = 1'b0;
      end
      9'd401: begin
        out_b12 = 1'b0;
      end
      9'd402: begin
        out_b12 = 1'b0;
      end
      9'd403: begin
        out_b12 = 1'b0;
      end
      9'd404: begin
        out_b12 = 1'b0;
      end
      9'd405: begin
        out_b12 = 1'b0;
      end
      9'd406: begin
        out_b12 = 1'b0;
      end
      9'd407: begin
        out_b12 = 1'b0;
      end
      9'd408: begin
        out_b12 = 1'b0;
      end
      9'd409: begin
        out_b12 = 1'b0;
      end
      9'd410: begin
        out_b12 = 1'b0;
      end
      9'd411: begin
        out_b12 = 1'b0;
      end
      9'd412: begin
        out_b12 = 1'b0;
      end
      9'd413: begin
        out_b12 = 1'b0;
      end
      9'd414: begin
        out_b12 = 1'b0;
      end
      9'd415: begin
        out_b12 = 1'b0;
      end
      9'd416: begin
        out_b12 = 1'b0;
      end
      9'd417: begin
        out_b12 = 1'b0;
      end
      9'd418: begin
        out_b12 = 1'b0;
      end
      9'd419: begin
        out_b12 = 1'b0;
      end
      9'd420: begin
        out_b12 = 1'b0;
      end
      9'd421: begin
        out_b12 = 1'b0;
      end
      9'd422: begin
        out_b12 = 1'b0;
      end
      9'd423: begin
        out_b12 = 1'b0;
      end
      9'd424: begin
        out_b12 = 1'b0;
      end
      9'd425: begin
        out_b12 = 1'b0;
      end
      9'd426: begin
        out_b12 = 1'b0;
      end
      9'd427: begin
        out_b12 = 1'b0;
      end
      9'd428: begin
        out_b12 = 1'b0;
      end
      9'd429: begin
        out_b12 = 1'b0;
      end
      9'd430: begin
        out_b12 = 1'b0;
      end
      9'd431: begin
        out_b12 = 1'b0;
      end
      9'd432: begin
        out_b12 = 1'b0;
      end
      9'd433: begin
        out_b12 = 1'b0;
      end
      9'd434: begin
        out_b12 = 1'b0;
      end
      9'd435: begin
        out_b12 = 1'b0;
      end
      9'd436: begin
        out_b12 = 1'b0;
      end
      9'd437: begin
        out_b12 = 1'b0;
      end
      9'd438: begin
        out_b12 = 1'b0;
      end
      9'd439: begin
        out_b12 = 1'b0;
      end
      9'd440: begin
        out_b12 = 1'b0;
      end
      9'd441: begin
        out_b12 = 1'b0;
      end
      9'd442: begin
        out_b12 = 1'b0;
      end
      9'd443: begin
        out_b12 = 1'b0;
      end
      9'd444: begin
        out_b12 = 1'b0;
      end
      9'd445: begin
        out_b12 = 1'b0;
      end
      9'd446: begin
        out_b12 = 1'b0;
      end
      9'd447: begin
        out_b12 = 1'b0;
      end
      9'd448: begin
        out_b12 = 1'b0;
      end
      9'd449: begin
        out_b12 = 1'b0;
      end
      9'd450: begin
        out_b12 = 1'b0;
      end
      9'd451: begin
        out_b12 = 1'b0;
      end
      9'd452: begin
        out_b12 = 1'b0;
      end
      9'd453: begin
        out_b12 = 1'b0;
      end
      9'd454: begin
        out_b12 = 1'b0;
      end
      9'd455: begin
        out_b12 = 1'b0;
      end
      9'd456: begin
        out_b12 = 1'b0;
      end
      9'd457: begin
        out_b12 = 1'b0;
      end
      9'd458: begin
        out_b12 = 1'b0;
      end
      9'd459: begin
        out_b12 = 1'b0;
      end
      9'd460: begin
        out_b12 = 1'b0;
      end
      9'd461: begin
        out_b12 = 1'b0;
      end
      9'd462: begin
        out_b12 = 1'b0;
      end
      9'd463: begin
        out_b12 = 1'b0;
      end
      9'd464: begin
        out_b12 = 1'b0;
      end
      9'd465: begin
        out_b12 = 1'b0;
      end
      9'd466: begin
        out_b12 = 1'b0;
      end
      9'd467: begin
        out_b12 = 1'b0;
      end
      9'd468: begin
        out_b12 = 1'b0;
      end
      9'd469: begin
        out_b12 = 1'b0;
      end
      9'd470: begin
        out_b12 = 1'b0;
      end
      9'd471: begin
        out_b12 = 1'b0;
      end
      9'd472: begin
        out_b12 = 1'b0;
      end
      9'd473: begin
        out_b12 = 1'b0;
      end
      9'd474: begin
        out_b12 = 1'b0;
      end
      9'd475: begin
        out_b12 = 1'b0;
      end
      9'd476: begin
        out_b12 = 1'b0;
      end
      9'd477: begin
        out_b12 = 1'b0;
      end
      9'd478: begin
        out_b12 = 1'b0;
      end
      9'd479: begin
        out_b12 = 1'b0;
      end
      9'd480: begin
        out_b12 = 1'b0;
      end
      9'd481: begin
        out_b12 = 1'b0;
      end
      9'd482: begin
        out_b12 = 1'b0;
      end
      9'd483: begin
        out_b12 = 1'b0;
      end
      9'd484: begin
        out_b12 = 1'b0;
      end
      9'd485: begin
        out_b12 = 1'b0;
      end
      9'd486: begin
        out_b12 = 1'b0;
      end
      9'd487: begin
        out_b12 = 1'b0;
      end
      9'd488: begin
        out_b12 = 1'b0;
      end
      9'd489: begin
        out_b12 = 1'b0;
      end
      9'd490: begin
        out_b12 = 1'b0;
      end
      9'd491: begin
        out_b12 = 1'b0;
      end
      9'd492: begin
        out_b12 = 1'b0;
      end
      9'd493: begin
        out_b12 = 1'b0;
      end
      9'd494: begin
        out_b12 = 1'b0;
      end
      9'd495: begin
        out_b12 = 1'b0;
      end
      9'd496: begin
        out_b12 = 1'b0;
      end
      9'd497: begin
        out_b12 = 1'b0;
      end
      9'd498: begin
        out_b12 = 1'b0;
      end
      9'd499: begin
        out_b12 = 1'b0;
      end
      9'd500: begin
        out_b12 = 1'b0;
      end
      9'd501: begin
        out_b12 = 1'b0;
      end
      9'd502: begin
        out_b12 = 1'b0;
      end
      9'd503: begin
        out_b12 = 1'b0;
      end
      9'd504: begin
        out_b12 = 1'b0;
      end
      9'd505: begin
        out_b12 = 1'b0;
      end
      9'd506: begin
        out_b12 = 1'b0;
      end
      9'd507: begin
        out_b12 = 1'b0;
      end
      9'd508: begin
        out_b12 = 1'b0;
      end
      9'd509: begin
        out_b12 = 1'b0;
      end
      9'd510: begin
        out_b12 = 1'b0;
      end
      9'd511: begin
        if (mant <= 7'd0) begin
          out_b12 = 1'b0;
        end else begin
          out_b12 = 1'b1;
        end
      end
      default: out_b12 = 1'b0;
    endcase
  end
  assign out = {out_b15, out_b14, out_b13, out_b12, out_low};
endmodule
