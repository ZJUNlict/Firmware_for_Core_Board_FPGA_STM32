module motor(clk,rst_n,rd_n,wr_n,cs_n,rddata,wrdata,addr,code0,code1,code2,code3,set,A,B,Z_OpenLoop,Z_Brushless);
input clk,rst_n,rd_n,wr_n,cs_n;
input [31:0]code0,code1,code2,code3,wrdata;
input [2:0]addr;
output [31:0]A,B,rddata,set;
output Z_OpenLoop,Z_Brushless;
reg [31:0]A,B,rddata,set;
reg Z_OpenLoop,Z_Brushless;
always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
	A<=32'd170;
	B<=32'd100;
	rddata<=32'd0;
	set<=32'd0;
	Z_OpenLoop<=1'b0;
	Z_Brushless<=1'b1;
	end
else
	begin
	if(!wr_n&&!cs_n)
		begin
		if(addr==3'b000)
			begin
			A<=wrdata;
			end
		else if(addr==3'b001)
			begin
			B<=wrdata;
			end
		else if(addr==3'b010)
			begin
			set<=wrdata;
			end
		else if(addr==3'b011)
			begin
			Z_OpenLoop<=wrdata[0];
			end		
		else if(addr==3'b100)
			begin
			Z_Brushless<=wrdata[0];
			end				
		else
			begin
			A<=A;
			B<=B;
			set<=set;
			Z_OpenLoop<=Z_OpenLoop;
			Z_Brushless<=Z_Brushless;
			end
		end
	else if(!rd_n&&!cs_n)
		begin
		if(addr==3'b000)
			begin
			rddata<=code0;
			end
		else if(addr==3'b001)
			begin
			rddata<=code1;
			end
		else if(addr==3'b010)
			begin
			rddata<=code2;
			end			
		else if(addr==3'b011)
			begin
			rddata<=code3;
			end							
		else
			begin
			rddata<=rddata;
			end
		end
	else
		begin
		A<=A;
		B<=B;
		set<=set;
		end
	end
end
endmodule 