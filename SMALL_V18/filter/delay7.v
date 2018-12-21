module delay7(datain,dataout,clk,rst_n);
input clk, rst_n;
input [6:0]datain;
output [6:0]dataout;
reg [6:0]dataout;
always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
		dataout <= 0;
	end
else dataout <= datain;
end
endmodule
    