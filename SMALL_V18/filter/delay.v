module delay(datain,dataout,clk,rst_n);
input clk, rst_n;
input datain;
output dataout;
reg dataout;
always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
		dataout <= 0;
	end
else dataout <= datain;
end
endmodule
    