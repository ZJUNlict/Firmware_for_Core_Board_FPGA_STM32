module Timer_hull (Clk,rst_n,Enable,Start,Clr,Dir,Dout1);

parameter Bit=32;
    
input Clk,rst_n,Enable,Clr,Dir,Start;
output [Bit-1:0]Dout1;

reg [Bit-1:0]Dout,Dout1;

always@(posedge Clk or negedge Clr or negedge rst_n)
begin
if(rst_n==1'b0)
begin
  Dout<=32'd0;
  Dout1<=32'd0;
end
else
begin
   if (Clr == 1'b0) Dout<=0;
   else if (Enable & Start)
   begin
     if (Dir == 1'b1)
     begin
         if (Dout == (32'b1<<(Bit-1))-1) Dout <= 32'b1;
         else Dout <= Dout +1'b1;
     end
     else
     begin
         if (Dout == (32'b1<<(Bit-1))) Dout <= -32'b1;
         else Dout <= Dout -1'b1;
     end
   end
   else if(Start==1'b0) Dout1<=Dout;
   else Dout <= Dout;
end     
end

endmodule