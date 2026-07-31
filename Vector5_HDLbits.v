module top_module (
    input a, b, c, d, e,
    output [24:0] out );
/*out[24] = ~(a^a);
out[23] = ~(a^b);
out[22] = ~(a^c);
out[21] = ~(a^d);
out[20] = ~(a^e);
out[19] = ~(b^a);
out[18] = ~(b^b);
out[17] = ~(b^c);
out[16] = ~(b^d);
out[15] = ~(b^e);
out[14] = ~(c^a);
out[13] = ~(c^b);
out[12] = ~(c^c);
out[11] = ~(c^d);
out[10] = ~(c^e);
out[9] = ~(d^a);
out[8] = ~(d^b);
out[7] = ~(d^c);
out[6] = ~(d^d);
out[5] = ~(d^e);
out[4] = ~(e^a);
out[3] = ~(e^b);
out[2] = ~(e^c);
out[1] = ~(e^d);
out[0] = ~(e^e);*/
// v1 =25'baaaaa_bbbbb_ccccc_ddddd_eeeee
wire [24;0] v1 ={{5{a}},{5{b}},{5{c}},{5{d}},{5{e}}};
// v2 = 25'babcde_abcde_abcde_abcde_abcde
wire [24;0] v2 ={5{a,b,c,d,e}};
assign out = v1 ~^ v2 ;
endmodule
