module adgetnew2(clk,reset_n,addr,read_n,cs_n,readdata,clk_out,din,dout,cs,sars);
input clk,read_n,reset_n,cs_n,dout,sars;
input [1:0]addr;
output din,cs,clk_out;
output [15:0]readdata;

reg choice,din,cs,clk_out;
reg [5:0]cnt;
reg [5:0]cnt2;
reg [15:0]readdata;
reg [7:0]powv,capv,powv_tmp,capv_tmp;
reg clk_tmp;
reg [8:0]cntcnt;
reg flag;

always @(posedge clk or negedge reset_n)
begin
     if(reset_n==1'b0)
          readdata[15:0]<=16'd0;
     else
     begin
        if(!read_n&&!cs_n)
        begin
               if(addr==2'b00)
					begin
                 readdata[7:0]<=powv[7:0];
			     readdata[15:8]<={7'd0,sars};
					end
               else if(addr==2'b01)
					begin
                 readdata[7:0]<=capv[7:0];
				 readdata[15:8]<={7'd0,sars};
					end
				else
				begin
				readdata<=readdata;
				end
        end
        else
                 readdata[15:0]<=readdata[15:0];
      end
end


always @(posedge clk) begin
 if(reset_n==1'b0)
 cntcnt<=0;
 else  begin
 if(cntcnt==511) begin
 cntcnt<=0;
 clk_tmp<=!clk_tmp;
 end
 else begin
 cntcnt<=cntcnt+1;
 clk_tmp<=clk_tmp;
 end
 end
 end


always @(posedge clk_tmp) begin
if(reset_n==1'b0)
begin
cnt<=0;
cnt2<=0;
flag<=0;
end

else  begin
if(flag==1'b1)       //ch1  Get_PowVoltage 1110
begin
case(cnt)
                  5'b00000:begin cs<=1;din<=0;clk_out<=0;end//0
   /*start*/      5'b00001:begin cs<=0;din<=1;           end//1
                  5'b00010:begin              clk_out<=1;end//2
   /*SGL (H)*/    5'b00011:begin              clk_out<=0;end
                  5'b00100:begin       din<=1;           end
                  5'b00101:begin              clk_out<=1;end
   /*ODD (H)*/    5'b00110:begin              clk_out<=0;end
                  5'b00111:begin       din<=1;           end
                  5'b01000:begin              clk_out<=1;end
   /*SELECT (L)*/ 5'b01001:begin              clk_out<=0;end
                  5'b01010:begin       din<=0;           end//10
                  5'b01011:begin              clk_out<=1;end

   /* start conversion and wait for SARS to be pulled up */
                  5'b01100:begin              clk_out<=0;end
                  5'b01101:begin              clk_out<=0;end
                  5'b01110:begin              clk_out<=1;end
                  
                  5'b01111:begin              clk_out<=0;end
                  5'b10000:begin powv_tmp[7]<=dout;clk_out<=1;end
                  5'b10001:begin              clk_out<=0;end//17
                  5'b10010:begin powv_tmp[6]<=dout;clk_out<=1;end
                  5'b10011:begin              clk_out<=0;end
                  5'b10100:begin powv_tmp[5]<=dout;clk_out<=1;end
                  5'b10101:begin              clk_out<=0;end
                  5'b10110:begin powv_tmp[4]<=dout;clk_out<=1;end
                  5'b10111:begin              clk_out<=0;end
                  5'b11000:begin powv_tmp[3]<=dout;clk_out<=1;end
                  5'b11001:begin              clk_out<=0;end
                  5'b11010:begin powv_tmp[2]<=dout;clk_out<=1;end
                  5'b11011:begin              clk_out<=0;end
                  5'b11100:begin powv_tmp[1]<=dout;clk_out<=1;end
                  5'b11101:begin              clk_out<=0;end//29
                  5'b11110:begin powv_tmp[0]<=dout;clk_out<=1;end
                  default: begin powv<=powv_tmp;clk_out<=0;flag<=1'b0;end
endcase
cnt<=cnt+1;
end 

else //ch0  Get_CapVoltage 1100
begin
case(cnt2)
                  5'b00000:begin cs<=1;din<=0;clk_out<=0;end
   /*start*/      5'b00001:begin cs<=0;din<=1;           end
                  5'b00010:begin              clk_out<=1;end
   /*SGL (H)*/    5'b00011:begin              clk_out<=0;end
                  5'b00100:begin       din<=1;           end
                  5'b00101:begin              clk_out<=1;end
   /*ODD (L)*/    5'b00110:begin              clk_out<=0;end
                  5'b00111:begin       din<=0;           end
                  5'b01000:begin              clk_out<=1;end
   /*SELECT (L)*/ 5'b01001:begin              clk_out<=0;end
                  5'b01010:begin       din<=0;           end
                  5'b01011:begin              clk_out<=1;end

   /* start conversion and wait for SARS to be pulled up */
                  5'b01100:begin              clk_out<=0;end
                  5'b01101:begin              clk_out<=0;end
                  5'b01110:begin              clk_out<=1;end
                  
                  5'b01111:begin              clk_out<=0;end
                  5'b10000:begin capv_tmp[7]<=dout;clk_out<=1;end
                  5'b10001:begin              clk_out<=0;end
                  5'b10010:begin capv_tmp[6]<=dout;clk_out<=1;end
                  5'b10011:begin              clk_out<=0;end
                  5'b10100:begin capv_tmp[5]<=dout;clk_out<=1;end
                  5'b10101:begin              clk_out<=0;end
                  5'b10110:begin capv_tmp[4]<=dout;clk_out<=1;end
                  5'b10111:begin              clk_out<=0;end
                  5'b11000:begin capv_tmp[3]<=dout;clk_out<=1;end
                  5'b11001:begin              clk_out<=0;end
                  5'b11010:begin capv_tmp[2]<=dout;clk_out<=1;end
                  5'b11011:begin              clk_out<=0;end
                  5'b11100:begin capv_tmp[1]<=dout;clk_out<=1;end
                  5'b11101:begin              clk_out<=0;end
                  5'b11110:begin capv_tmp[0]<=dout;clk_out<=1;end
                  default: begin capv<=capv_tmp;   clk_out<=0;flag<=1'b1;end
endcase
cnt2<=cnt2+1;
end 

end
end
          
endmodule
