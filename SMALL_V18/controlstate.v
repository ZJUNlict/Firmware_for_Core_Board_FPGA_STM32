module controlstate(clk,rst_n,enable,cod_start,cod_clr,PI_en,dl_en,ADD_en,dp_en,mc_en,filter_en,over);
input clk,rst_n,enable,over;
output cod_start,cod_clr,PI_en,dl_en,ADD_en,dp_en,mc_en,filter_en;
reg cod_start,cod_clr,PI_en,dl_en,ADD_en,dp_en,mc_en,filter_en;
reg [4:0]state;
always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
	cod_start<=1'b0;
	cod_clr<=1'b0;
	filter_en<=0;
	PI_en<=1'b0;
	dl_en<=1'b0;
	dp_en<=1'b0;
	mc_en<=1'b0;
	ADD_en<=1'b0;
	state<=4'd0;
	end
else
	begin
		if(enable==1'b1)
		state<=4'd1;
		else 
		state<=state;
		
		case (state)
		4'd1:
			begin
			{cod_start,cod_clr,filter_en,PI_en,dl_en,ADD_en,dp_en,mc_en}<=8'b00000001;
			state<=4'd2;
			end
		4'd2:
			begin
			{cod_start,cod_clr,filter_en,PI_en,dl_en,ADD_en,dp_en,mc_en}<=8'b00100001;
			if(over == 1)  state<=4'd3;
			end				
		4'd3:
			begin
			{cod_start,cod_clr,filter_en,PI_en,dl_en,ADD_en,dp_en,mc_en}<=8'b00010001;
			state<=4'd4;
			end
		4'd4:
			begin
			{cod_start,cod_clr,filter_en,PI_en,dl_en,ADD_en,dp_en,mc_en}<=8'b00001001;	
			state<=4'd5;
			end
		4'd5:
			begin
			{cod_start,cod_clr,filter_en,PI_en,dl_en,ADD_en,dp_en,mc_en}<=8'b00000101;	
			state<=4'd6;
			end			
		4'd6:
			begin
			{cod_start,cod_clr,filter_en,PI_en,dl_en,ADD_en,dp_en,mc_en}<=8'b00000011;
			state<=4'd7;	
			end		
		4'd7:
			begin
			{cod_start,cod_clr,filter_en,PI_en,dl_en,ADD_en,dp_en,mc_en}<=8'b01000001;
			state<=4'd8;	
			end			
		4'd8:
			begin
			{cod_start,cod_clr,filter_en,PI_en,dl_en,ADD_en,dp_en,mc_en}<=8'b10000001;		  
			state<=4'd9;			    
			end 
		4'd9: 	
		    begin
			{cod_start,cod_clr,filter_en,PI_en,dl_en,ADD_en,dp_en,mc_en}<=8'b10000001;		  
			state<=4'd0;			    
			end 	  
		 default:;
		endcase				

	end
end//always
endmodule 