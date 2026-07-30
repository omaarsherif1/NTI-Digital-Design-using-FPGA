module fa_all
(
  input  wire A, 
  input  wire B,
  input  wire Cin,
  
  output reg sum_behav,
  output reg cout_behav,
  
  output wire sum_df,
  output wire cout_df,
  
  output wire sum_Gl,
  output wire cout_Gl,
  
  output wire sum_Struct,
  output wire cout_Struct
);

FA_Behav FA_Behav0(.A(A),.B(A),.Cin(Cin),.sum(sum_behav),.cout(cout_behav));
FA_data_flow FA_data_flow0(.A(A),.B(A),.Cin(Cin),.sum(sum_df),.cout(cout_df));
FA_GL FA_GL0(.A(A),.B(A),.Cin(Cin),.sum(sum_Gl),.cout(cout_Gl));
FA_Struct FA_Struct0(.A(A),.B(A),.Cin(Cin),.sum(sum_Struct),.cout(cout_Struct));
endmodule