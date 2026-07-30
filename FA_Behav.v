module FA_Behav
(
  input  wire A, 
  input  wire B,
  input  wire Cin,
  
  output reg sum,
  output reg cout
);
  always@(*) 
    begin
      {cout, sum} = A + B + Cin;  
	end
  
endmodule