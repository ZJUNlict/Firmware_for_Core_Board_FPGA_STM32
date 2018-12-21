module code_db(clk,rst_n,SigA,SigB,SigC,Start,Clr,Dout);
input clk,rst_n,SigA,SigB,SigC,Start,Clr;
output [31:0]Dout;
reg [31:0]Dout,DoutTemp;
reg LastSigA,LastSigB,LastSigC;
reg ClkOut,DirOut;
always @ (posedge clk)
begin
   if (rst_n == 0) 
	   DirOut <= 1'b0;
   else
   begin
       if ((SigA == 1) & (LastSigA == 0)) DirOut <= SigB ? 1'b1 : 1'b0;//
       else DirOut <= DirOut;
    
       if ((SigA == 1) & (LastSigA == 0)) ClkOut <= 1'b1;
       else if ((SigA == 0) & (LastSigA == 1)) ClkOut <= 1'b1;
       else if ((SigB == 1) & (LastSigB == 0)) ClkOut <= 1'b1;
       else if ((SigB == 0) & (LastSigB == 1)) ClkOut <= 1'b1;
       else if ((SigC == 1) & (LastSigC == 0)) ClkOut <= 1'b1;
       else if ((SigC == 0) & (LastSigC == 1)) ClkOut <= 1'b1;
       else ClkOut <= 1'b0;
       
       LastSigA <= SigA;
       LastSigB <= SigB;
       LastSigC <= SigC;
   end  
end

always@(posedge clk or negedge Clr)
begin
   if (Clr == 1'b0) DoutTemp<=0;
   else if (ClkOut & Start)
   begin
     if (DirOut == 1'b1)
     begin
         if (DoutTemp == (32'b1<<31)-1) DoutTemp <= 32'b1;
         else DoutTemp <= DoutTemp +1'b1;
     end
     else
     begin
         if (DoutTemp == (32'b1<<31)) DoutTemp <= -32'b1;
         else DoutTemp <= DoutTemp -1'b1;
     end
     Dout <= DoutTemp << 7;
   end
   else Dout <= DoutTemp << 7;
end

endmodule 