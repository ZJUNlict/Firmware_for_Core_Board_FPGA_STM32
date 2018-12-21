module timer_ver(clk,rst_n,en_out);
input clk,rst_n;
output en_out;
reg en_out;
reg [31:0]counter;
reg [31:0]trig_time;
always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
	en_out<=1'b0;
	counter<=32'd0;
	trig_time<=32'd100000;//2ms
	end
else
	begin
	counter<=counter+32'd1;
	if(counter==trig_time)
		begin
		counter<=32'd0;
		en_out<=1'b1;
		end
	else
		begin
		en_out<=1'b0;
		end
	end
end //awlays
endmodule 