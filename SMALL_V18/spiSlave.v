module spiSlave(data_o,data_i,sck,mosi,cs,ledState);
input sck,cs,mosi;
input [7:0]data_o;
output [7:0]data_i;
output ledState;

reg ledState;
reg [7:0]cnt;
wire [7:0]data_i;
reg [7:0]temp_input;
reg [7:0]temp_input_result;

always@(negedge sck)
begin
if(cs==1'd1)//disable spi
	begin
		temp_input<=0;
		ledState = 1'b1;
		cnt<=0;
	end
else//spi is enabled
	begin
		case(cnt)
			0,1,2,3,4,5,6:
			begin
				temp_input = (temp_input<<1);
				temp_input[0] = mosi;
				cnt<=cnt+1;
			end
			7:
			begin
				temp_input = (temp_input<<1);
				temp_input[0] = mosi;
				temp_input_result[7:0] = temp_input[7:0];//data_i is the data received from STM32
				cnt = 0;
				
				if(temp_input_result==255)//judge the state of the led
				begin
				ledState = 1'b0;
				end
				else if(temp_input_result==1)
				begin
				ledState = 1'b1;
				end
				
			end
			default:
				cnt<=0;
		endcase
	end
end//always

assign data_i[7:0] = temp_input_result[7:0];

endmodule
