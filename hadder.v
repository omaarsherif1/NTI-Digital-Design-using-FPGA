module hadder 
(
  input A,
  input B,
  
  output sum,
  output cout
);
assign sum = A ^ B;
assign cout = A & B;
endmodule