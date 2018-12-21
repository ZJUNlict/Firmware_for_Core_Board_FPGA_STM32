module delta_limit(clk,rst_n,enable,datain,dataout);
input clk,rst_n,enable;
input [31:0]datain;
output [31:0]dataout;
reg [31:0]dataout;
reg [31:0]delta_max;
reg [31:0]delta_min;
always @(posedge clk or negedge rst_n)
if(!rst_n)
	begin
	dataout<=32'd0;
	delta_max<=32'd10240000;
	delta_min<=-32'd10240000;
	end
else
	begin
	if(enable==1'b1)
		begin
		if(datain[31]==1'b0)//datain is positive number
			begin
			if(datain>delta_max)
				dataout<=delta_max;
			else
				dataout<=datain;
			end
		else//datain is negative number
			begin
			if(datain<delta_min)
				dataout<=delta_min;
			else
				dataout<=datain;
			end
		end
	else
		begin
		dataout<=datain;
		end
	end
endmodule
