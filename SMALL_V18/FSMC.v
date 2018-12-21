module FSMC(clk,Rst_n,Data,Address,NWE,NE,led,v1,v2,v3,v4,vdb,strength,shoot_enable);
	input clk;
	input Rst_n;
	input [15:0]Data;
	input [7:0]Address;
	input NWE;
	inout NE;
	output reg led;
	output signed [31:0]v1; 
	output signed [31:0]v2;
	output signed [31:0]v3;
	output signed [31:0]v4; 
	output signed [31:0]vdb;
	output [7:0]strength;
	output shoot_enable;
	

reg [31:0]v1_temp;
reg [31:0]v2_temp;
reg [31:0]v3_temp;
reg [31:0]v4_temp;
reg [31:0]vdb_temp;
reg [7:0]strength_temp;
reg shoot_enable_temp;


always@(posedge NWE or negedge Rst_n)//FSMC读取 不用片选线测试效果也较好
begin
	if(!Rst_n)
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
	
	if(Address == 8'd0) begin v1_temp <= {{16{Data[15]}}, Data}; end
	if(Address == 8'd1) begin v2_temp <= {{16{Data[15]}}, Data}; end
	if(Address == 8'd2) begin v3_temp <= {{16{Data[15]}}, Data}; end
	if(Address == 8'd3) begin v4_temp <= {{16{Data[15]}}, Data}; end
	if(Address == 8'd4) begin vdb_temp <= {{16{Data[15]}}, Data}; end

	end
end

always@(posedge NWE or negedge Rst_n)
if(!Rst_n)
    led <= 1'b0;

else 
	 led <= 1'b0;

assign v1 = v1_temp;
assign v2 = v2_temp;
assign v3 = v3_temp;
assign v4 = v4_temp;
assign vdb = vdb_temp;
assign strength = strength_temp;
assign shoot_enable = (Address == 7'd5) ? 1'b1 : 1'b0;


endmodule	