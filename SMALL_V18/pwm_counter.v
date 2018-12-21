module pwm_counter(clk,rst_n,enable,duty,pwm); 
input clk,rst_n,enable; 
output pwm; 
input [31:0]duty;
reg pwm; 
reg [31:0]period; 
reg [31:0]counter;
always@(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
	pwm<=1'b0; 
	counter<=32'h0; 
	//duty<=16'h7fff;
	period<=32'd2500;
	end
else
	begin
		if(enable==1'b1)
		begin	    
			if(counter<period)
				counter<=counter+32'b1; 
			else
				counter<=32'h0; 
			if(counter<duty) 
				pwm<=1'b1;
			else 
				pwm<=1'b0; 
		end
		else
			begin
			counter<=32'h0;
			pwm<=1'b0;  
			end
		
	end	
end
endmodule 
