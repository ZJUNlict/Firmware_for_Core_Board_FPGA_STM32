module Timer (Clk,Enable,Start,Clr,Dir,Dout);

parameter Bit=32;
    
input Clk,Enable,Clr,Dir,Start;
output [Bit-1:0]Dout;

reg [Bit-1:0]Dout;

always@(posedge Clk or negedge Clr)
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
   else Dout <= Dout;
end

endmodule