module pwmOut_44k(clk,pwmOut); 
input clk; 
output pwmOut; 
reg pwmOut;
reg[11:0] count;
always@(posedge clk)
begin
    count <= count+1;
    if (count==658) 
    //if (count==578) 
	 begin
		pwmOut <= 1'b1;
	 end
	 else
		begin
			if(count==1316) 
			//if(count==1136) 
			begin
				pwmOut <= 1'b0;
				count<=12'b0;
			end
		end
	 
end
endmodule 
