module PWM_2(clk,addr,wr_n,wrdata,reset,pwm,dir_out);
input clk,wr_n,reset;
input [1:0]addr;
input [31:0]wrdata;
output pwm,dir_out;

reg [15:0]duty;
reg [15:0]period;
reg [15:0]counter;
reg start;
reg out;
reg direct;
reg pwm,dir_out;



always @(posedge clk or negedge reset)  //write reg
begin
    if (reset == 1'b0)
    begin
     			duty[15:0] <= 16'h7fff;
			{direct,start} <= 2'b00;
			period[15:0] <= 16'hffff;//
    end 
    else
    begin  
       if (wr_n == 1'b0)
       begin
           
          if (addr[1:0] == 2'b00) 
		    begin
			   {direct,start} <= wrdata[1:0];
			   period[15:0] <= period[15:0];
			   duty[15:0] <= duty[15:0];
		    end

          else if (addr[1:0] == 2'b01) 
		    begin
			   start <= start;
			   direct <= direct;
			   period[15:0] <= wrdata[15:0];
			   duty[15:0] <= duty[15:0];
		    end
		    
          else if (addr[1:0] == 2'b10) 
		    begin
			   duty[15:0] <= wrdata[15:0];
			   start <= start;
			   direct <= direct;
			   period[15:0] <= period[15:0];
		    end
		    
		    else
		    begin
			   duty[15:0] <= duty[15:0];
			   start <= start;
			   direct <= direct;
			   period[15:0] <= period[15:0];
		    end	
    
       end
	    else
	    begin
		   duty[15:0] <= duty[15:0];
		   start <= start;
		   direct <= direct;
		   period[15:0] <= period[15:0];
	    end
   end   
end

always @(posedge clk)  //pwm generate
begin
    
    if ((wr_n == 1'b0) && (addr[1:0] == 2'b11)) 
    begin
       counter[15:0] <= wrdata[15:0];
    end
    else if (start == 1'b1)
    begin
        if (counter[15:0] < period[15:0]) counter[15:0] <= counter[15:0] + 16'b1;
        else counter[15:0] <= 16'b0;
    end
    else counter[15:0] <= counter[15:0];
    
    if (start == 1'b1)
    begin
       if (counter[15:0] <= duty[15:0]) out <= 1'b1;
       else out <= 1'b0;
   end
   else out <= 1'b0;
end

always @(out or start or direct)   //output
begin

    if(start == 1'b0)
    begin
    	pwm = 1'b0;
    	dir_out = 1'b0;
    end
    
    else if (direct == 1'b0)
    begin
    	pwm = out;
    	dir_out = 1'b0;
    end
    
    else
    begin
    	pwm = out;
    	dir_out = 1'b1;
    end
    
end



endmodule



    
           
        
        
        
        
        
        
        
        
        
        
        
        
        
