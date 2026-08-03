module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

wire cin_inter;
wire [31:0] out_xor;
assign out_xor = b[31:0] ^ {32{sub}};
add16 a1(
  .a(a[15:0]),
  .b(out_xor[15:0]),
  .cin(sub),
  .cout(cin_inter),
  .sum(sum[15:0])
);
add16 a2(
  .a(a[31:16]),
  .b(out_xor[31:16]),
  .cin(cin_inter),
  .cout(),
  .sum(sum[31:16])
);

endmodule
