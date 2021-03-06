module finaloutput(clk,rst_n,enable,datain,dataout,overin,overout,sign);
input clk, rst_n, enable,overin,sign;
input [31:0]datain;
output [31:0]dataout;
output overout;
reg [31:0]dataout;
reg overout,preenable;
always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
		dataout <= 32'sd0;
		overout <= 0;
	end
else
	begin
	    preenable <= enable;
		if((enable==1'b1)&(preenable==0))
		begin
		    dataout <= 32'sd0;
		    overout <= 0;
		end
		else if(enable==1'b1 & overin == 1)
		begin
	        if(sign == 0)
	        begin
	            dataout <= datain / 10000;
	        end
	        else
	        begin
	            dataout <= 0-datain / 10000;
	        end
	        overout <= 1;
	    end
	    else
	    begin
            dataout <= dataout; 
            overout <= 0;
	    end
	end
end
endmodule 