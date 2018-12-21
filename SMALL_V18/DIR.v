module DIR (SigA,SigB,Clk,reset,ClkOut,DirOut);

input SigA,SigB,Clk,reset;
output ClkOut,DirOut;

reg LastSigA,LastSigB;
reg ClkOut,DirOut;

always @ (posedge Clk)
begin
   if (reset == 0) 
	   DirOut <= 1'b0;
   else
   begin
       if ((SigA == 1) & (LastSigA == 0)) DirOut <= SigB ? 1'b0 : 1'b1;
       else DirOut <= DirOut;
    
       if ((SigA == 1) & (LastSigA == 0)) ClkOut <= 1'b1;
       else if ((SigA == 0) & (LastSigA == 1)) ClkOut <= 1'b1;
       else if ((SigB == 1) & (LastSigB == 0)) ClkOut <= 1'b1;
       else if ((SigB == 0) & (LastSigB == 1)) ClkOut <= 1'b1;
       else ClkOut <= 1'b0;
       
       LastSigA <= SigA;
       LastSigB <= SigB;
   end  
end
endmodule 