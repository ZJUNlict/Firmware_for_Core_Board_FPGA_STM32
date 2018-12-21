module shoot_timer(clk,wrdata,wr_n,rd_n,reset,rddata,Dout);
    
parameter Bit_32 = 24;
    
input clk,wr_n,rd_n,reset;
input [Bit_32-1:0]wrdata;
output [Bit_32-1:0]rddata;
output Dout;

reg [Bit_32-1:0] counter;

always @(posedge clk)
begin
    if(reset == 1'b0) counter <= 24'b0;
    else if(wr_n == 1'b0) counter <= wrdata;
    else if(counter != 0) counter <= counter - 1;
    else counter <= counter;
end

assign Dout = (counter)?1'b1:1'b0;
assign rddata = {23'b0,Dout};

endmodule
    
    
