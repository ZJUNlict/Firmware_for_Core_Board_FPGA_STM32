module shoot(clk,wrdata,reset,Dout,shoot,detect,Done);
input clk,reset,shoot,detect;
input [31:0]wrdata;
output Dout,Done;

reg [31:0] counter,delay,delay_set,counter_temp,delay_Done,delay_done_set;
reg shoot_flag,flag,Done;

always @(posedge clk)
begin
    if(reset==0)
    begin
        shoot_flag<=0;
        delay<=0;
        delay_set<=50000000;
        delay_done_set<=1600;
        counter<=0;
        counter_temp<=0;
        Done<=0;
    end   
    else
    begin 
        if(shoot==1&&(!Dout))
        begin
            shoot_flag<=1;
            delay<=0;
            counter_temp<=wrdata;
        end
        else if(shoot==0)
        begin
            if(delay>=delay_set) 
            begin
                shoot_flag<=0;
            end
            else delay<=delay+1;
        end
        
        if(shoot_flag&&detect&&(counter==0)) 
        begin
            flag <= 1;
        end
        else;
    
        if(flag==1) 
        begin
            counter <= counter_temp;
            flag<=0;
            shoot_flag<=0;
            Done<=1;
            delay_Done<=0;
        end
        else;
   
        if(counter > 0) 
        begin
            counter <= counter - 1;
        end
        else ;
        
        
        if(delay_Done>=delay_done_set) 
        begin
            Done<=0;
        end
        else delay_Done<=delay_Done+1;
    end
    
    
end

assign Dout = (counter)?1'b1:1'b0;

endmodule
    
    
