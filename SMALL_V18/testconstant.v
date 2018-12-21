module testconstant(clk,rst_n,infrain,testInput,test_int,constOut,ledConst);
input clk,rst_n,infrain,testInput;
output [31:0]test_int;
output [15:0]constOut;
output ledConst;

reg [31:0]tempConst;
reg [1:0]tempLed;


always @ (posedge clk)
begin
   if (rst_n == 0) 
	   tempConst <= 32'b00000000000000000000000010101010;
   else
   begin
		if(infrain == 1'b1)
			begin
				tempConst <= 32'b00000000000000000000000010101010;
			end
		else
			begin
				tempConst <= 32'b00000000000000000000000010101010;
			end
	end
end

assign test_int = tempConst;
assign ledConst = infrain;
assign constOut = 32'b00000000000000000000000000001111;

endmodule