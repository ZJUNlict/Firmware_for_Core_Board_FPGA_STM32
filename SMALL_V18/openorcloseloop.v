module OpenOrCloseLoop(clk,rst_n,set,Open_dec,dir_in,set_Open,set_Close,dir_out);
input clk,rst_n,Open_dec,dir_in;
output [31:0]set;
output dir_out;
input [31:0]set_Open,set_Close;
reg [31:0]set;
reg dir_out;
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
	begin
		set<=32'd0;
		dir_out<=1'b0;
	end
    else
	begin
	    if(Open_dec==1'b1)
		begin
			if(set_Open[31]==1'b0 && set_Open[30:0] != 0)
		    begin
				set<=set_Open;
				dir_out<=1'b0;
			end
			else
			begin
				set<=(~set_Open)+1;
				dir_out<=1'b1;
			end
		end
	    else
		begin
		    set<=set_Close;
		    dir_out<=dir_in;
		end

	end
end//always
endmodule 