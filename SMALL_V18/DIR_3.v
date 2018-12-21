module DIR_3 (Clk,reset,SA,SB,SC,ClkOut,DirOut);

input SA,SB,SC,Clk,reset;
output ClkOut,DirOut;

reg LastSA,LastSB,LastSC;
reg ClkOut,DirOut;

always @ (posedge Clk)
begin
   if (reset == 0) 
     begin
	   DirOut <= 1'b0;
	   ClkOut<=1'b0;
	   LastSA<=1'b0;
	   LastSB<=1'b0;
	   LastSC<=1'b0;
	   end
   else
   begin
       if ((SA == 1) & (LastSA == 0)) DirOut <= SB ? 1'b0 : 1'b1;
       else DirOut <= DirOut;
    
       if ((SA == 1) & (LastSA == 0)) ClkOut <= 1'b1;
       else if ((SA == 0) & (LastSA == 1)) ClkOut <= 1'b1;
       else if ((SB == 1) & (LastSB == 0)) ClkOut <= 1'b1;
       else if ((SB == 0) & (LastSB == 1)) ClkOut <= 1'b1;
       else if ((SC == 1) & (LastSC == 0)) ClkOut <= 1'b1;
       else if ((SC == 0) & (LastSC == 1)) ClkOut <= 1'b1;       
       else ClkOut <= 1'b0;
       
       LastSA <= SA;
       LastSB <= SB;
       LastSC <= SC;       
   end  
end
endmodule 