module ex240_semantic_add_scaled(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire nan_a = (a[6:3] == 4'd15) && (a[2:0] == 3'd7);
  wire nan_b = (b[6:3] == 4'd15) && (b[2:0] == 3'd7);
  function [17:0] fp8_mag;
    input [7:0] v;
    reg [3:0] e;
    reg [2:0] m;
    begin
      e = v[6:3];
      m = v[2:0];
      if (e == 4'd15 && m == 3'd7) begin
        fp8_mag = 18'd0;
      end else if (e == 4'd0) begin
        fp8_mag = {15'd0, m};
      end else begin
        fp8_mag = ({11'd0, 1'b1, m}) << (e - 4'd1);
      end
    end
  endfunction

  function [7:0] quant_int;
    input [18:0] mag;
    input sign;
    input neg_zero;
    begin
      if (mag == 19'd0) begin
        quant_int = neg_zero ? 8'h80 : 8'h00;
      end else if (mag == 19'd1) begin
        quant_int = {sign, 7'h01};
      end else if (mag == 19'd2) begin
        quant_int = {sign, 7'h02};
      end else if (mag == 19'd3) begin
        quant_int = {sign, 7'h03};
      end else if (mag == 19'd4) begin
        quant_int = {sign, 7'h04};
      end else if (mag == 19'd5) begin
        quant_int = {sign, 7'h05};
      end else if (mag == 19'd6) begin
        quant_int = {sign, 7'h06};
      end else if (mag == 19'd7) begin
        quant_int = {sign, 7'h07};
      end else if (mag == 19'd8) begin
        quant_int = {sign, 7'h08};
      end else if (mag == 19'd9) begin
        quant_int = {sign, 7'h09};
      end else if (mag == 19'd10) begin
        quant_int = {sign, 7'h0a};
      end else if (mag == 19'd11) begin
        quant_int = {sign, 7'h0b};
      end else if (mag == 19'd12) begin
        quant_int = {sign, 7'h0c};
      end else if (mag == 19'd13) begin
        quant_int = {sign, 7'h0d};
      end else if (mag == 19'd14) begin
        quant_int = {sign, 7'h0e};
      end else if (mag == 19'd15) begin
        quant_int = {sign, 7'h0f};
      end else if (mag >= 19'd16 && mag <= 19'd17) begin
        quant_int = {sign, 7'h10};
      end else if (mag == 19'd18) begin
        quant_int = {sign, 7'h11};
      end else if (mag >= 19'd19 && mag <= 19'd21) begin
        quant_int = {sign, 7'h12};
      end else if (mag == 19'd22) begin
        quant_int = {sign, 7'h13};
      end else if (mag >= 19'd23 && mag <= 19'd25) begin
        quant_int = {sign, 7'h14};
      end else if (mag == 19'd26) begin
        quant_int = {sign, 7'h15};
      end else if (mag >= 19'd27 && mag <= 19'd29) begin
        quant_int = {sign, 7'h16};
      end else if (mag == 19'd30) begin
        quant_int = {sign, 7'h17};
      end else if (mag >= 19'd31 && mag <= 19'd34) begin
        quant_int = {sign, 7'h18};
      end else if (mag >= 19'd35 && mag <= 19'd37) begin
        quant_int = {sign, 7'h19};
      end else if (mag >= 19'd38 && mag <= 19'd42) begin
        quant_int = {sign, 7'h1a};
      end else if (mag >= 19'd43 && mag <= 19'd45) begin
        quant_int = {sign, 7'h1b};
      end else if (mag >= 19'd46 && mag <= 19'd50) begin
        quant_int = {sign, 7'h1c};
      end else if (mag >= 19'd51 && mag <= 19'd53) begin
        quant_int = {sign, 7'h1d};
      end else if (mag >= 19'd54 && mag <= 19'd58) begin
        quant_int = {sign, 7'h1e};
      end else if (mag >= 19'd59 && mag <= 19'd61) begin
        quant_int = {sign, 7'h1f};
      end else if (mag >= 19'd62 && mag <= 19'd68) begin
        quant_int = {sign, 7'h20};
      end else if (mag >= 19'd69 && mag <= 19'd75) begin
        quant_int = {sign, 7'h21};
      end else if (mag >= 19'd76 && mag <= 19'd84) begin
        quant_int = {sign, 7'h22};
      end else if (mag >= 19'd85 && mag <= 19'd91) begin
        quant_int = {sign, 7'h23};
      end else if (mag >= 19'd92 && mag <= 19'd100) begin
        quant_int = {sign, 7'h24};
      end else if (mag >= 19'd101 && mag <= 19'd107) begin
        quant_int = {sign, 7'h25};
      end else if (mag >= 19'd108 && mag <= 19'd116) begin
        quant_int = {sign, 7'h26};
      end else if (mag >= 19'd117 && mag <= 19'd123) begin
        quant_int = {sign, 7'h27};
      end else if (mag >= 19'd124 && mag <= 19'd136) begin
        quant_int = {sign, 7'h28};
      end else if (mag >= 19'd137 && mag <= 19'd151) begin
        quant_int = {sign, 7'h29};
      end else if (mag >= 19'd152 && mag <= 19'd168) begin
        quant_int = {sign, 7'h2a};
      end else if (mag >= 19'd169 && mag <= 19'd183) begin
        quant_int = {sign, 7'h2b};
      end else if (mag >= 19'd184 && mag <= 19'd200) begin
        quant_int = {sign, 7'h2c};
      end else if (mag >= 19'd201 && mag <= 19'd215) begin
        quant_int = {sign, 7'h2d};
      end else if (mag >= 19'd216 && mag <= 19'd232) begin
        quant_int = {sign, 7'h2e};
      end else if (mag >= 19'd233 && mag <= 19'd247) begin
        quant_int = {sign, 7'h2f};
      end else if (mag >= 19'd248 && mag <= 19'd272) begin
        quant_int = {sign, 7'h30};
      end else if (mag >= 19'd273 && mag <= 19'd303) begin
        quant_int = {sign, 7'h31};
      end else if (mag >= 19'd304 && mag <= 19'd336) begin
        quant_int = {sign, 7'h32};
      end else if (mag >= 19'd337 && mag <= 19'd367) begin
        quant_int = {sign, 7'h33};
      end else if (mag >= 19'd368 && mag <= 19'd400) begin
        quant_int = {sign, 7'h34};
      end else if (mag >= 19'd401 && mag <= 19'd431) begin
        quant_int = {sign, 7'h35};
      end else if (mag >= 19'd432 && mag <= 19'd464) begin
        quant_int = {sign, 7'h36};
      end else if (mag >= 19'd465 && mag <= 19'd495) begin
        quant_int = {sign, 7'h37};
      end else if (mag >= 19'd496 && mag <= 19'd544) begin
        quant_int = {sign, 7'h38};
      end else if (mag >= 19'd545 && mag <= 19'd607) begin
        quant_int = {sign, 7'h39};
      end else if (mag >= 19'd608 && mag <= 19'd672) begin
        quant_int = {sign, 7'h3a};
      end else if (mag >= 19'd673 && mag <= 19'd735) begin
        quant_int = {sign, 7'h3b};
      end else if (mag >= 19'd736 && mag <= 19'd800) begin
        quant_int = {sign, 7'h3c};
      end else if (mag >= 19'd801 && mag <= 19'd863) begin
        quant_int = {sign, 7'h3d};
      end else if (mag >= 19'd864 && mag <= 19'd928) begin
        quant_int = {sign, 7'h3e};
      end else if (mag >= 19'd929 && mag <= 19'd991) begin
        quant_int = {sign, 7'h3f};
      end else if (mag >= 19'd992 && mag <= 19'd1088) begin
        quant_int = {sign, 7'h40};
      end else if (mag >= 19'd1089 && mag <= 19'd1215) begin
        quant_int = {sign, 7'h41};
      end else if (mag >= 19'd1216 && mag <= 19'd1344) begin
        quant_int = {sign, 7'h42};
      end else if (mag >= 19'd1345 && mag <= 19'd1471) begin
        quant_int = {sign, 7'h43};
      end else if (mag >= 19'd1472 && mag <= 19'd1600) begin
        quant_int = {sign, 7'h44};
      end else if (mag >= 19'd1601 && mag <= 19'd1727) begin
        quant_int = {sign, 7'h45};
      end else if (mag >= 19'd1728 && mag <= 19'd1856) begin
        quant_int = {sign, 7'h46};
      end else if (mag >= 19'd1857 && mag <= 19'd1983) begin
        quant_int = {sign, 7'h47};
      end else if (mag >= 19'd1984 && mag <= 19'd2176) begin
        quant_int = {sign, 7'h48};
      end else if (mag >= 19'd2177 && mag <= 19'd2431) begin
        quant_int = {sign, 7'h49};
      end else if (mag >= 19'd2432 && mag <= 19'd2688) begin
        quant_int = {sign, 7'h4a};
      end else if (mag >= 19'd2689 && mag <= 19'd2943) begin
        quant_int = {sign, 7'h4b};
      end else if (mag >= 19'd2944 && mag <= 19'd3200) begin
        quant_int = {sign, 7'h4c};
      end else if (mag >= 19'd3201 && mag <= 19'd3455) begin
        quant_int = {sign, 7'h4d};
      end else if (mag >= 19'd3456 && mag <= 19'd3712) begin
        quant_int = {sign, 7'h4e};
      end else if (mag >= 19'd3713 && mag <= 19'd3967) begin
        quant_int = {sign, 7'h4f};
      end else if (mag >= 19'd3968 && mag <= 19'd4352) begin
        quant_int = {sign, 7'h50};
      end else if (mag >= 19'd4353 && mag <= 19'd4863) begin
        quant_int = {sign, 7'h51};
      end else if (mag >= 19'd4864 && mag <= 19'd5376) begin
        quant_int = {sign, 7'h52};
      end else if (mag >= 19'd5377 && mag <= 19'd5887) begin
        quant_int = {sign, 7'h53};
      end else if (mag >= 19'd5888 && mag <= 19'd6400) begin
        quant_int = {sign, 7'h54};
      end else if (mag >= 19'd6401 && mag <= 19'd6911) begin
        quant_int = {sign, 7'h55};
      end else if (mag >= 19'd6912 && mag <= 19'd7424) begin
        quant_int = {sign, 7'h56};
      end else if (mag >= 19'd7425 && mag <= 19'd7935) begin
        quant_int = {sign, 7'h57};
      end else if (mag >= 19'd7936 && mag <= 19'd8704) begin
        quant_int = {sign, 7'h58};
      end else if (mag >= 19'd8705 && mag <= 19'd9727) begin
        quant_int = {sign, 7'h59};
      end else if (mag >= 19'd9728 && mag <= 19'd10752) begin
        quant_int = {sign, 7'h5a};
      end else if (mag >= 19'd10753 && mag <= 19'd11775) begin
        quant_int = {sign, 7'h5b};
      end else if (mag >= 19'd11776 && mag <= 19'd12800) begin
        quant_int = {sign, 7'h5c};
      end else if (mag >= 19'd12801 && mag <= 19'd13823) begin
        quant_int = {sign, 7'h5d};
      end else if (mag >= 19'd13824 && mag <= 19'd14848) begin
        quant_int = {sign, 7'h5e};
      end else if (mag >= 19'd14849 && mag <= 19'd15871) begin
        quant_int = {sign, 7'h5f};
      end else if (mag >= 19'd15872 && mag <= 19'd17408) begin
        quant_int = {sign, 7'h60};
      end else if (mag >= 19'd17409 && mag <= 19'd19455) begin
        quant_int = {sign, 7'h61};
      end else if (mag >= 19'd19456 && mag <= 19'd21504) begin
        quant_int = {sign, 7'h62};
      end else if (mag >= 19'd21505 && mag <= 19'd23551) begin
        quant_int = {sign, 7'h63};
      end else if (mag >= 19'd23552 && mag <= 19'd25600) begin
        quant_int = {sign, 7'h64};
      end else if (mag >= 19'd25601 && mag <= 19'd27647) begin
        quant_int = {sign, 7'h65};
      end else if (mag >= 19'd27648 && mag <= 19'd29696) begin
        quant_int = {sign, 7'h66};
      end else if (mag >= 19'd29697 && mag <= 19'd31743) begin
        quant_int = {sign, 7'h67};
      end else if (mag >= 19'd31744 && mag <= 19'd34816) begin
        quant_int = {sign, 7'h68};
      end else if (mag >= 19'd34817 && mag <= 19'd38911) begin
        quant_int = {sign, 7'h69};
      end else if (mag >= 19'd38912 && mag <= 19'd43008) begin
        quant_int = {sign, 7'h6a};
      end else if (mag >= 19'd43009 && mag <= 19'd47103) begin
        quant_int = {sign, 7'h6b};
      end else if (mag >= 19'd47104 && mag <= 19'd51200) begin
        quant_int = {sign, 7'h6c};
      end else if (mag >= 19'd51201 && mag <= 19'd55295) begin
        quant_int = {sign, 7'h6d};
      end else if (mag >= 19'd55296 && mag <= 19'd59392) begin
        quant_int = {sign, 7'h6e};
      end else if (mag >= 19'd59393 && mag <= 19'd63487) begin
        quant_int = {sign, 7'h6f};
      end else if (mag >= 19'd63488 && mag <= 19'd69632) begin
        quant_int = {sign, 7'h70};
      end else if (mag >= 19'd69633 && mag <= 19'd77823) begin
        quant_int = {sign, 7'h71};
      end else if (mag >= 19'd77824 && mag <= 19'd86016) begin
        quant_int = {sign, 7'h72};
      end else if (mag >= 19'd86017 && mag <= 19'd94207) begin
        quant_int = {sign, 7'h73};
      end else if (mag >= 19'd94208 && mag <= 19'd102400) begin
        quant_int = {sign, 7'h74};
      end else if (mag >= 19'd102401 && mag <= 19'd110591) begin
        quant_int = {sign, 7'h75};
      end else if (mag >= 19'd110592 && mag <= 19'd118784) begin
        quant_int = {sign, 7'h76};
      end else if (mag >= 19'd118785 && mag <= 19'd126975) begin
        quant_int = {sign, 7'h77};
      end else if (mag >= 19'd126976 && mag <= 19'd139264) begin
        quant_int = {sign, 7'h78};
      end else if (mag >= 19'd139265 && mag <= 19'd155647) begin
        quant_int = {sign, 7'h79};
      end else if (mag >= 19'd155648 && mag <= 19'd172032) begin
        quant_int = {sign, 7'h7a};
      end else if (mag >= 19'd172033 && mag <= 19'd188415) begin
        quant_int = {sign, 7'h7b};
      end else if (mag >= 19'd188416 && mag <= 19'd204800) begin
        quant_int = {sign, 7'h7c};
      end else if (mag >= 19'd204801 && mag <= 19'd221183) begin
        quant_int = {sign, 7'h7d};
      end else if (mag >= 19'd221184 && mag <= 19'd458752) begin
        quant_int = {sign, 7'h7e};
      end else begin
        quant_int = {sign, 7'h7e};
      end
    end
  endfunction

  wire [17:0] mag_a = fp8_mag(a);
  wire [17:0] mag_b = fp8_mag(b);
  wire signed [19:0] sval_a = a[7] ? -$signed({2'b00, mag_a}) : $signed({2'b00, mag_a});
  wire signed [19:0] sval_b = b[7] ? -$signed({2'b00, mag_b}) : $signed({2'b00, mag_b});
  wire signed [19:0] sum = sval_a + sval_b;
  wire sign = sum[19];
  wire [18:0] abs_sum = sign ? -sum[18:0] : sum[18:0];
  wire neg_zero = (mag_a == 18'd0) && (mag_b == 18'd0) && a[7] && b[7];
  assign out = (nan_a || nan_b) ? 8'h7f : quant_int(abs_sum, sign, neg_zero);
endmodule
