module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
wire [7:0] out_d0,out_d1,out_d2;

my_dff8 D0 (
  .clk(clk),
  .d(d),
  .q(out_d0)
);
my_dff8 D1 (
  .clk(clk),
  .d(out_d0),
  .q(out_d1)
);
my_dff8 D2 (
  .clk(clk),
  .d(out_d1),
  .q(out_d2)
);

always @(*) begin
  case(sel)
    2'b00: q = d;
	2'b01: q = out_d0;
	2'b10: q = out_d1;
	2'b11: q = out_d2;
	endcase	
end
endmodule