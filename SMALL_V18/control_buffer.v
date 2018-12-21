module control_buffer(input clk0, 
							 input rst_n, 
							 input [15:0]data,  
							 input [2:0]data_type,
							 input NWE,
							 output signed [31:0]v1, 
							 output signed [31:0]v2, 
							 output signed [31:0]v3, 
							 output signed [31:0]v4, 
							 output signed [31:0]vdb, 
							 output [7:0]strength, 
							 output shoot_enable);
reg [31:0]v1_temp;
reg [31:0]v2_temp;
reg [31:0]v3_temp;
reg [31:0]v4_temp;
reg [31:0]vdb_temp;
reg [7:0]strength_temp;
reg shoot_enable_temp;
always@(posedge NWE or negedge rst_n)
begin
	if(!rst_n)
	begin
		v1_temp <= 32'b0;
		v2_temp <= 32'b0;
		v3_temp <= 32'b0;
		v4_temp <= 32'b0;
		vdb_temp <= 32'b0;
		strength_temp <= 8'b0;
	end
	else
	begin
		 //v1_temp = {{16{data[15]}}, data};
		
			 v2_temp = 32'd5;
			//3'd1: v2_temp = {{16{data[15]}}, data};
			//3'd2: v3_temp = {{16{data[15]}}, data};
			//3'd3: v4_temp = {{16{data[15]}}, data};
			//3'd4: vdb_temp = {{16{data[15]}}, data};
			//3'd5: strength_temp = data;
			
		//endcase
	end

	end	

					 	 
assign v1 = v1_temp;
assign v2 = v2_temp;
assign v3 = v3_temp;
assign v4 = v4_temp;
assign vdb = vdb_temp;
assign strength = strength_temp;
assign shoot_enable = (data_type == 7'd5) ? 1'b1 : 1'b0;
endmodule