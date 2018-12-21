module judgePorN(clk,rst_n,datain,dataout,dir);
input clk,rst_n;
input [31:0]datain;
output [31:0]dataout;
input dir;
reg [31:0]dataout;
always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
		dataout<=32'd0;
	end
else
	begin
	  if(dir==1'b0)
		begin
		dataout<=(~datain)+1'b1;
		end
	  else
		begin
		dataout<=datain;
		end

	end
end//always
endmodule 