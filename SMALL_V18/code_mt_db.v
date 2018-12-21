module code_mt_db(clk,rst_n,SigA,SigB,SigC,Start,Clr,Dout,DoutM);
input clk,rst_n,SigA,SigB,SigC,Start,Clr;
output [31:0]Dout,DoutM;
reg [31:0]Dout,DoutM;
reg [31:0]Dout1;
reg [31:0]count,countreg,count1,countreg1;
reg LastSigA,LastSigB,LastSigC;
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
         //DirOut <= SigB ? 1'b0 : 1'b1;
         DirOut <= SigB ? 1'b1: 1'b0;//change the direction
         preDir <= DirOut;
       end
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
   if (Clr == 1'b0)//20ms refresh the Clr
     begin
       Dout <= 0;
       count <= count;
       count1 <= 0;
       countreg <= countreg;
       Dout1 <= 0;
       countreg1 <= 0;
     end
     
   else if (ClkOut & Start)//edge change && start sigal 20ms per && edge change
   begin  
     if(count < 6000000) countreg <= count;//change from 400000 to 600,0000
     else countreg <= 6000000;
     count <= 0;
     if(Dout1 == 0) countreg1 <= ((count1 << 7) / countreg) * (2 * DirOut - 1);//
     count1 <= 0;
   
     if (DirOut == 1'b1)//judge from the SigA and SigB, when positive direction
     begin
         if (Dout1 == (32'b1<<31)-1) Dout1 <= 32'b1;
         else Dout1 <= Dout1 +32'b1;//Dout1++
     end
     
     else//when negative direction,l Dout1--
     begin
         if (Dout1 == (32'b1<<31)) Dout1 <= -32'b1;
         else Dout1 <= Dout1 -32'b1;//negative rotate
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