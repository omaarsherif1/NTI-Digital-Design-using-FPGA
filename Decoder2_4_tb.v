`timescale 1ns/100ps
// module name
module Decoder2_4_tb;
//tb signals
reg A;
reg B;
reg E;
wire [3:0]f;
//module instansation
Decoder2_4 Decoder_tb 
(
.A(A),
.B(B),
.E(E),
.f(f)
);
//signal stimulas
initial
begin
  A = 0; B = 0; E = 1;
  #10; A = 0; B = 0; E = 1;
  #10; A = 0; B = 1; E = 1;
  #10; A = 1; B = 0; E = 1;
  #10; A = 1; B = 1; E = 1;
   
  #10; A = 0; B = 0; E = 0;
  #10; A = 0; B = 1; E = 0;
  #10; A = 1; B = 0; E = 0;
  #10; A = 1; B = 1; E = 0;
  $stop;
end
endmodule