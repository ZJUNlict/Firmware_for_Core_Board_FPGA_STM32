module pwm_counter_DB(clk,rst_n,enable,duty,pwm_up,pwm_down); 
input clk,rst_n,enable; 
output pwm_up,pwm_down; 
input [31:0]duty;
reg pwm_up,pwm_down; 
reg [31:0]period; 
reg [31:0]counter;
reg [31:0]deadtime; 
always@(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
	pwm_up<=1'b0; 
	pwm_down<=1'b0;
	counter<=32'h0; 
	//duty<=16'h7fff;
	period<=32'd500;
	deadtime<=32'd20;
	end
else
	begin
		if(enable==1'b1)
			begin	    
				if(counter<period)
					counter<=counter+32'b1; 
				else
				begin
					counter<=32'h0; 
					if(duty>deadtime)
						begin
							if(counter<duty) 
								pwm_up<=1'b1;
							else 
								pwm_up<=1'b0; 				
							if(counter<deadtime) 
								pwm_down<=1'b0;
							else if(counter<(duty-deadtime))
								pwm_down<=1'b1;
							else
								pwm_down<=1'b0;
						end	
					else
						begin
						if(counter<duty) 
							begin
							pwm_up<=1'b1;
							pwm_down<=1'b1;						
							end
						else 
							begin
							pwm_up<=1'b0;
							pwm_down<=1'b0;						
							end 
						end
				end				
			end//end enable
		else
			begin
			counter<=32'h0;
			pwm_up<=1'b0;  
			pwm_down<=1'b0;
			end
		
	end	//if reset
end
endmodule 
