//use SPI 3 mode,CHOL = 1,CHAL = 1
module spi(input clk,
              input rst_n,
              input CS_N,
              input SCK,
              input MOSI,
				  input MOSI_2,
              input [7:0] txd_data,
              output reg MISO,
              output [7:0] rxd_data,
				  output [7:0] rxd_data_2,
              output rxd_flag, 
				  output reg ledState, 
				  output [2:0]rxd_state_show
				  );

reg [7:0]rxd_data_temp;//temporarily store the data
reg [7:0]rxd_data_temp_2;
	//-------------------------capture the sck-----------------------------          
reg sck_r0,sck_r1;
wire sck_n,sck_p;
always@(posedge clk or negedge rst_n)
begin
   if(!rst_n)
   begin
		sck_r0 <= 1'b0;
		sck_r1 <= 1'b0;
	end
	else
	begin
		sck_r0 <= SCK;
		sck_r1 <= sck_r0;
	end
end

assign sck_n = (~sck_r0 & sck_r1)? 1'b1:1'b0;   //capture the sck negedge
assign sck_p = (~sck_r1 & sck_r0)? 1'b1:1'b0;   //capture the sck posedge

////-----------------------spi_slaver read data-------------------------------
reg rxd_flag_r;
reg [2:0] rxd_state;

always@(negedge rst_n or posedge clk)
begin
    if(!rst_n)
        begin
            rxd_data_temp[7:0] <= 8'b0;
				rxd_data_temp_2[7:0] <= 8'b0;
            rxd_flag_r <= 1'b0;
            rxd_state <= 3'b0;
        end
    else if(!CS_N && sck_n)   
        begin
				if (rxd_state <= 3'd6)
				begin
					rxd_data_temp[7-rxd_state] <= MOSI;
					rxd_data_temp_2[7-rxd_state] <= MOSI_2;
					rxd_state <= rxd_state+1;
					rxd_flag_r <= 1'b0;
				end
				else if(rxd_state == 3'd7)
				begin
					rxd_data_temp[0] <= MOSI;
					rxd_data_temp_2[0] <= MOSI_2;
					rxd_state <= 3'd0;				
					rxd_flag_r = 1'b1;
				end
        end
	 else if (CS_N)
	 begin
		rxd_state <= 1'b0;
		rxd_flag_r <= 1'b0;
	 end
end

always@(posedge CS_N or negedge rst_n) 
	if(!rst_n)
	ledState <= 1'b1;
	else
	ledState <= ~ledState ;
//reg [24:0]cnt;	//定义计数器寄存器
//
//    //计数器计数进程	
//	always@(posedge clk or negedge rst_n)
//	begin
//	if(rst_n == 1'b0)
//		cnt <= 25'd0;
//	else if(cnt == 25'd24_999_999)
//	//else if(cnt == 25'd24_999) //仅为测试
//		cnt <= 25'd0;
//	else
//		cnt <= cnt + 1'b1;
//	end
//
//    //led输出控制进程
//	always@(posedge clk or negedge rst_n)
//	begin
//	if(rst_n == 1'b0)
//		ledState <= 1'b1;
//	else if(cnt == 25'd24_999_999)
//	//else if(cnt == 25'd24_999)  //仅为测试
//		ledState <= ~ledState;
//	else
//		ledState <= ledState;
//	end

//--------------------capture spi_flag posedge--------------------------------
reg rxd_flag_r0,rxd_flag_r1;
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        begin
            rxd_flag_r0 <= 1'b0;
            rxd_flag_r1 <= 1'b0;
        end
    else
        begin
            rxd_flag_r0 <= rxd_flag_r;
            rxd_flag_r1 <= rxd_flag_r0;
        end
end

assign rxd_flag = (~rxd_flag_r1 & rxd_flag_r0)? 1'b1:1'b0;   
assign rxd_data[7:0] = (rxd_flag == 1'b1)? rxd_data_temp[7:0] : rxd_data[7:0];
assign rxd_data_2[7:0] = (rxd_flag == 1'b1)? rxd_data_temp_2[7:0] : rxd_data_2[7:0];
assign rxd_state_show[2:0] = rxd_state[2:0];
//
//
//reg [2:0] txd_state;
//always@ (posedge clk or negedge rst_n)
//begin
//	if(!rst_n)
//	begin
//		txd_state <= 1'b0;
//	end
//	else if(sck_n && !CS_N)//change the value when the device is enabled and the sck is at the negedge
//	begin
//		if (txd_state <= 3'd6)
//		begin
//			MISO <= txd_data[7-rxd_state];
//			txd_state <= txd_state+1;
//		end
//		else if(txd_state == 3'd7)
//		begin
//			MISO <= txd_data[0];
//			txd_state <= 3'd0;
//		end
//	end// and the value will be read at the posedge of sck, but nothing to do.
//	else if (CS_N)
//	begin
//		txd_state <= 1'b0;
//	end
//end
//
endmodule