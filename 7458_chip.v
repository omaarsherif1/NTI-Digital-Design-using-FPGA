module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
wire out_A0,out_A1,out_A2,out_A3;
assign out_A0 = p2a & p2b;
assign out_A1 = p2c & p2d;
assign out_A2 = p1a & p1b & p1c;
assign out_A3 = p1d & p1e & p1f;
assign p2y = out_A0 | out_A1;
assign p1y = out_A2 | out_A3; 
endmodule