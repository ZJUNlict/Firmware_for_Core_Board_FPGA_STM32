module code_mt(clk,rst_n,SigA,SigB,Start,Clr,Dout,DoutM);
input clk,rst_n,SigA,SigB,Start,Clr;
output [31:0]Dout,DoutM;
reg [31:0]Dout,DoutM;
reg [31:0]Dout1;
reg [31:0]count,countreg,count1,countreg1;
reg LastSigA,LastSigB;
reg ClkOut,DirOut,preDir;
initial
begin
   countreg <= 32'b01111111111111111111111111111111;
   Dout <= 0;
end
always @ (posedge clk)
begin
   if (rst_n == 0)
   begin  
       DirOut <= 1'b0;
   end
   else
   begin
       if ((SigA == 1) & (LastSigA == 0)) 
       begin
         DirOut <= SigB ? 1'b0 : 1'b1;
         preDir <= DirOut;
       end
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


always@(posedge clk or negedge Clr)
begin
   if (Clr == 1'b0)
     begin
       Dout <= 0;
       count <= count;
       count1 <= 0;
       countreg <= countreg;
       Dout1 <= 0;
       countreg1 <= 0;
     end
     
   else if (ClkOut & Start)
   begin  
     if(count < 400000) countreg <= count;
     else countreg <= 400000;
     count <= 0;
     if(Dout1 == 0) countreg1 <= ((count1 << 7) / countreg) * (2 * DirOut - 1);
     count1 <= 0;
   
     if (DirOut == 1'b1)
     begin
         if (Dout1 == (32'b1<<31)-1) Dout1 <= 32'b1;
         else Dout1 <= Dout1 +32'b1;
     end
     
     else
     begin
         if (Dout1 == (32'b1<<31)) Dout1 <= -32'b1;
         else Dout1 <= Dout1 -32'b1;
     end
   end
   
   
   else 
   begin
     count <= count + 1;
     count1 <= count1 + 1;
     //Dout <= (Dout1-2*DirOut + 1) * 100 + count1 * 100 / countreg + countreg1;
     if(Dout1 < 2) Dout <= Dout1 << 7;
     else Dout <= (Dout1-2*DirOut + 1) *128 + ((count1 *128) / countreg) * (2 * DirOut - 1) + countreg1;
     DoutM <= Dout1<< 7;
   end
end

endmodule 