`timescale 1ns/100ps

module seven_seg_dec_tb;

reg [3:0] binaryin;
wire a,b,c,d,e,f,g;

seven_seg_dec D0(
.binaryin(binaryin),
.a(a),
.b(b),
.c(c),
.d(d),
.e(e),
.f(f),
.g(g)
);

initial begin 
  binaryin = 4'd0;
  #10; binaryin = 4'd1; #10; binaryin = 4'd2; #10; binaryin = 4'd3; 
  #10; binaryin = 4'd4; #10; binaryin = 4'd5; #10; binaryin = 4'd6; #10; binaryin = 4'd7; 
  #10; binaryin = 4'd8; #10; binaryin = 4'd9; #10; binaryin = 4'd10; #10; binaryin = 4'd15;
  #10;
  $stop;
end

endmodule