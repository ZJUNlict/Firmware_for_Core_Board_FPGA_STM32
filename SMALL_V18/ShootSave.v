module ShootSave(clk,shoot,chip,out); 
input clk;
input[31:0] shoot,chip; 
output out; 
reg out;
always@(posedge clk)
begin
	if(shoot==0 && chip ==0)
		out <= 0;
	else
		out <= 1;
end
endmodule 
