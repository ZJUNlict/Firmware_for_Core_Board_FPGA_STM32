module address_x(clk,rst_n,enable,wren,rden,address_w,address_r,address);
input clk, rst_n, enable;
input [6:0]address;
output wren,rden;
output [6:0]address_w;
output [6:0]address_r;
reg wren,rden;
reg preenable;
reg [6:0]address_w;
reg [6:0]address_wr;
reg [6:0]address_r;
always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
		wren <= 0;
		rden <= 0;
		address_wr <= 0;
		address_w <= 0;
		address_r <= 0;
		preenable <= 0;
	end
else
	begin
	preenable <= enable;
		if((enable==1'b1)&(preenable==0))
		begin
			address_w <= address_wr;
			if(address_wr == 65) address_wr <= 0;
			else address_wr <= address_wr + 1;
			wren = 1;
		end
		else if(enable==1'b1)
		begin
	        if(address_w >= address) address_r = address_w - address;
	        else  address_r = 66 + address_w - address;
	        rden = 1;
	        wren = 0;
	    end
	    else
	    begin
	        rden = 0;
	        wren = 0;
	    end
	end
end
endmodule  