module code_hold(clk,rst_n,hold,datain,dataout);
input clk,rst_n,hold;
input [31:0]datain;
output [31:0]dataout;
reg [31:0]dataout;
always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
	dataout<=32'd0;
	end
else
	begin
	if(hold==1'b1)
		begin
		dataout<=datain;
		end
	else
		begin
		dataout<=dataout;
		end
	end
end
endmodule 