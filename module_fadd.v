
module add1(
  input a,
  input b,
  input cin,
  output sum,
  output cout
);
assign sum  = a ^ b ^ cin;
assign cout = (a & b) | (a & cin) | (b & cin);

endmodule

module top_module (
  input [31:0] a,
  input [31:0] b,
  output [31:0] sum
);

wire c_inter;
add16 adder_lower (
  .a(a[15:0]),
  .b(b[15:0]),
  .cin(1'b0),
  .sum(sum[15:0]),
  .cout(c_inter)
);

    add16 adder_upper (
  .a(a[31:16]),
  .b(b[31:16]),
  .cin(c_inter),
  .sum(sum[31:16]),
  .cout() 
);

endmodule