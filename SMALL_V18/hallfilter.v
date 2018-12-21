module hallfilter(clk,rst_n,SA_in,SB_in,SC_in,SA_out,SB_out,SC_out);
input clk,rst_n,SA_in,SB_in,SC_in;
output SA_out,SB_out,SC_out; 
reg SA_out,SB_out,SC_out;
reg [2:0]buffer; 
reg [3:0]counter; 
always@(posedge clk or negedge rst_n)

begin
if(rst_n==1'b0)
	begin
		SA_out<=1'b0; 
		SB_out<=1'b0; 
		SC_out<=1'b0; 
		buffer<=3'b000; 
		counter<=4'b0000; 
	end
else
	begin
		if(buffer=={SA_in,SB_in,SC_in})
			begin
			counter<=counter+1'b1; 
			if(counter==4'b1001)
				begin
				SA_out<=SA_in; 
				SB_out<=SB_in; 
				SC_out<=SC_in; 			
				end
			else
				begin
				SA_out<=SA_out; 
				SB_out<=SB_out; 
				SC_out<=SC_out; 				
				end			
			end
		else
			begin
			counter<=4'b0000; 
			end
		buffer<={SA_in,SB_in,SC_in}; 		
end//rst_n==1; 
end//always
endmodule 