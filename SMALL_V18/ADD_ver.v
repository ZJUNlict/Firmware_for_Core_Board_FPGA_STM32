module ADD_ver(clk,rst_n,enable,delta,result);
input clk,rst_n,enable;
input [31:0]delta;
output [31:0]result;
reg [31:0]result,result1,limit;
always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
	result1<=32'd0;
	limit <= 10240000;
	end
else
	begin
	    result1<=result;
		if(enable==1'b1)
		begin
	        result1 <= result1 + delta;
		end
		else;
	end
end


always @(result1)
begin
    if((result1[31]==0) && (result1 > limit))
    begin
	    result <= limit;
    end
    else if((result1[31]==1) && (result1 < -10240000))
    begin
	    result <= -10240000; 
    end
    else
    begin
        result <= result1;
    end
end
endmodule
