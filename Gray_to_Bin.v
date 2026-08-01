module Gray_to_Bin
(
  input wire [3:0] G,
  output wire [3:0] B
);
// my idea was to make general width gray to bi but i found that it will need loop
assign B[3] = G[3];
assign B[2] = B[3] ^ G[2];
assign B[1] = B[2] ^ G[1];
assign B[0] = B[1] ^ G[0];
endmodule