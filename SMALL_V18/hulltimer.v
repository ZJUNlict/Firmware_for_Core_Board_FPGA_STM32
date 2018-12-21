module hulltimer (clk,rst_n,start,clr);
    
input clk,rst_n;
output start,clr;
reg start,clr;
reg [31:0]counter;

always@(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
	start<=1'b0;
	clr<=1'b0;
	counter<=32'd0;
	end
else
	begin
	counter<=counter+32'd1;
	if(counter==32'd799998)
		begin
		start<=1'b0;
		end
	else if(counter==32'd799999)
		begin
		clr<=1'b1;
		end
	else if(counter==32'd800000)//16ms
		begin
		start<=1'b1;
		clr<=1'b0;
		counter<=32'd0;
		end
	else
		begin
		start<=start;
		clr<=clr;
		end
	end
end

endmodule 