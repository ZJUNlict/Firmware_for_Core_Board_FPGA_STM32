module clkdi(clk,clk1); 
input clk; 
output clk1; 
reg clk1;
reg[15:0] count;
always@(posedge clk)
begin
    count <= count+1;
    if (count==0) clk1 <= !clk1;
end
endmodule 
