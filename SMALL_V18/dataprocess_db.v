module dataprocess_db(clk,rst_n,enable,datain,dataout,dir,feedback);
input clk,rst_n,enable;
//input infrain; // add for dribbling
input [31:0]datain,feedback;
output [31:0]dataout;
output dir;
wire [31:0]dataout;
//integer buffer;
//integer max;
//integer min;
reg signed [31:0] buffer,buffer1,buffer2;
reg signed [31:0] limit;
reg dir;
//reg infrain;

wire [31:0]buff,buff1;
always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
		limit<=32'sd750;
		buffer<=32'sd0;
		dir<=1'b0;
		//infrain <= 1'b1;//initial value
	end
else
	begin
	  if(enable==1'b1)
  	  begin
		  if(datain[31]==1'b0)
			   begin
			   buffer<=datain;
			   dir<=1'b0;
			   end	 
		  else
			   begin
			   buffer<=(~datain)+1'b1;
			   dir<=1'b1;
			   end 
		//buffer <= buffer * 31875 / (31875 - feedback * 250 / 175);  
	  end
      else ;
	end
end//always

assign buff=buffer;

always @(buff)
begin
	buffer1[19:0]<=buff[31:12];
	buffer1[31:20]<=5'b00000;
end
assign buff1=buffer1 ;//* 31875 / (31875 - feedback * 25 / 18);
always @(buff1)
begin
  if(buff1>limit)
    buffer2<=limit;
  else
    buffer2<=buff1;
end

assign dataout=buffer2;//??????
endmodule 