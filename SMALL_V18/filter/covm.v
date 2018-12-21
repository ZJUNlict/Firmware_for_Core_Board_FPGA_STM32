module covm(clk,rst_n,enable,x,h,y,address,sign,over);
input clk, rst_n, enable,sign;
input [31:0]x;
input [15:0]h;
output [31:0]y;
output [6:0]address;
output over;
reg [31:0] x1;
reg [31:0] h1;
reg preenable,signtemp,over;
reg [6:0]address;
reg [31:0]y;
reg [31:0]newy;
always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
		newy <= 32'sd0;
		preenable <= 0;
		address <= 0;
		y <= 0;
		signtemp <= 0;
	end
else
	begin
	preenable <= enable;
	signtemp <= sign;
		if((enable==1'b1)&(preenable==0))
		begin
		    newy <= 0;
		    y <= 0;
		    address <= 0;
		    over <= 0;
		    signtemp <= 0;
		end
		else if(enable==1'b1 & address <= 70)
		begin
	        newy <= x * h ;
	        address <= address + 1;
	        if(signtemp == 0)
	        begin
	            y <= newy + y;
	        end
	        else
	        begin
	            y <= y - newy;
	        end
	    end
	    else if(address == 71)
	    begin
	        y <= y;
	        over <= 1; 
	        address <= address + 1;
	    end
	    else
	    begin
	        y <= y;
	        over <= 0; 
	    end
	end
end
endmodule 