module I2t(clk,rst_n,over_current,act);
input clk,rst_n,over_current;
output act;
reg act;
reg [31:0]flag;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		flag<=32'd2;
		act<=1'b1;
	end
	else
	begin
		if(over_current==1'b1)
		begin
			flag<=flag+32'd4;
			if(flag>32'd100000000)
			begin
				act<=1'b1;
				flag<=32'd100000002;
			end
			else
			begin
				act<=1'b1;
			end
		end
		else
		begin
			flag<=flag-32'd2;
			if(flag>32'd3)
			begin
			act<=act;
			end
			else
			begin
			act<=1'd1;
			flag<=32'd2;
			end
		end
	end
end
endmodule 
