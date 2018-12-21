module SwitchData(datainm,datainf,dataout,clk,rst_n,over,overout);
input clk,rst_n,over;
input [31:0]datainm,datainf;
output overout;
output [31:0]dataout;
reg [31:0]dataout;
reg overout;

always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
		dataout <= 16'd0;
	end
else if(over == 1)
    begin
        if((datainf>(datainm-256)) && (datainf<(datainm+256)))
        begin
        dataout <= datainf;
        end
        else
        begin
        dataout <= datainm;
        end
        overout <= 1;
    end
else
    begin
    dataout <= dataout;
    overout <= 0;
    end
end
endmodule 