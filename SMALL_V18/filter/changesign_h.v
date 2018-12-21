module changesign_h(datain,dataout,signout,clk,rst_n);
input clk,rst_n;
input [15:0]datain;
output [15:0]dataout;
output signout;
reg [15:0]dataout;
reg signout;

always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
		dataout <= 16'd0;
		signout <= 0;
	end
else
    if(datain[15] == 0)
    begin
    dataout <= datain;
    signout <= 0;
    end
    else
    begin
    dataout <= (~datain) + 1;
    signout <= 1;
    end
end
endmodule
    