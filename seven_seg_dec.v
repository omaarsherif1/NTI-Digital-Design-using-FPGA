module seven_seg_dec
(
  input wire [3:0] binaryin,
  output reg a,b,c,d,e,f,g
);

always@(*) begin
  if (binaryin == 4'd0) begin
  //active law:all on except led g
    a = 0; b = 0; c = 0;d = 0;e = 0;f = 0;g = 1;
  end
  else if (binaryin == 4'd1) begin
    a = 1; b = 0; c = 0; d = 1; e = 1; f = 1; g = 1;
  end
  else if (binaryin == 4'd2) begin
    a = 0; b = 0; c = 1; d = 0; e = 0; f = 1; g = 0;
  end
  else if (binaryin == 4'd3) begin
    a = 0; b = 0; c = 0; d = 0; e = 1; f = 1; g = 0;
  end
  else if (binaryin == 4'd4) begin
    a = 1; b = 0; c = 0; d = 1; e = 1; f = 0; g = 0;
  end
  else if (binaryin == 4'd5) begin
  a = 0;b = 1;c = 0;d = 0;e = 1;f = 0;g = 0;
  end
  else if (binaryin == 4'd6) begin
    a = 1; b = 1; c = 0; d = 0; e = 0; f = 0; g = 0;
  end
  else if (binaryin == 4'd7) begin
    a = 0; b = 0; c = 0; d = 1; e = 1; f = 1; g = 0;
  end
  else if (binaryin == 4'd8) begin
    a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0;
  end 
  else if (binaryin == 4'd9) begin
    a = 0; b = 0; c = 0; d = 0; e = 1; f = 0; g = 0;
  end
  else begin
    a = 1; b = 1; c = 1; d = 1; e = 1; f = 1; g = 1;
  end
end
   
endmodule 