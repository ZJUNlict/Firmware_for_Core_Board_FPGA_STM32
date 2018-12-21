module PI_ver_db(clk,rst_n,enable,set,feedback,A,B,infrain,result);//add infrain
input clk,rst_n,enable, infrain;
input [31:0]set;
input [31:0]feedback;
output [31:0]result;
wire [31:0]result;
input [31:0] A;//A=Kp+Ki;
input [31:0] B;//B=Kp;
reg [31:0] Error;
reg [31:0] preError;
reg [31:0] set_buffer;

wire [31:0] P_buffer;
wire [31:0] I_buffer;
reg [31:0]A_t,B_t;
//reg [15:0]result_buffer;
reg [31:0]delta;
//parameter OPEN_DRIBBLE_VALUE = 32'sd100;
 
always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
	begin
		//A_t<= 32'd360; //when level 1, a little stuck
		//A_t <= 32'd720;// Kp + Ki
		A_t <= 32'd360;// Kp + Ki
		B_t<= 32'd210;
		Error<=32'sd0;
		preError<=32'sd0;
		set_buffer = 32'sd0;//when infrain is logic true, the set = set_buffer
	end
else
	begin
		if(enable==1'b1)
		begin
		    //if(set == 0)
		    //begin
		    //    A_t<= 100;
		    //    B_t<= 70;
		    //end
		    //else
		    //begin
		    //    A_t<= A; 
		    //    B_t<= B;
		    //end
		    preError<=Error;
		    
		    if((infrain == 1'b0) || (set == 0))// ball is detected
				set_buffer <= set;
			else 
				set_buffer <= -32'd40;
				
				
		    if((set_buffer *128-feedback < 32) && (set_buffer *128-feedback > -32))
		        Error <= 0;
		    else
			    Error <= set_buffer *128-feedback;	
		end
		else ;
	end
end//end always

assign P_buffer=A_t*Error;
assign I_buffer=B_t*preError;
//LPM_multi LPM_multi_t1(A,Error,P_buffer);
//LPM_multi LPM_multi_t2(B,preError,I_buffer);

always @(P_buffer,I_buffer)
begin
	 delta<=P_buffer-I_buffer;	
end//end always
assign result=delta;
endmodule  