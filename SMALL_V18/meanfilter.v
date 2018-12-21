module meanfilter(datain,enable,rst_n,clk,dataout,over);
input enable,clk,rst_n;
input[31:0] datain;
output over;
output[31:0] dataout;
reg[31:0] dataout,data1,data2,data3,data4,data5,data6,data7,data8,datatemp;
reg over;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
	begin
        data1 <= 0;
        data2 <= 0;
        data3 <= 0;
        data4 <= 0;
        data5 <= 0;
        data6 <= 0;
        data7 <= 0;
        data8 <= 0;
	end
    else
	begin
	    if(enable == 1 && over == 0)
	    begin
	        data8 <= data7;
	        data7 <= data6;
	        data6 <= data5;
	        data5 <= data4;
	        data4 <= data3;
	        data3 <= data2;
	        data2 <= data1;
	        data1 <= datain;
	        over <= 1;
	    /*if(datain[31]==0)
	    begin
            data1[28:0] <= datain[31:3];
            data1[31:0] <= 3'd0;
        end
        else
        begin
            data1[28:0] <= datain[31:3];
            data1[31:0] <= 3'd1;
	    end*/
	    end
	    else if(enable == 0)
	    begin
	        over <= 0;
	    end
	end
end

always@(data1)
begin
    datatemp <= data1 + data2 + data3 + data4 + data5 + data6 + data7 + data8;
end

always@(datatemp)
begin
    if(datatemp[31]==1)
	begin
        dataout[28:0] <= datatemp[31:3];
        dataout[31:29] <= 3'd111;
    end
    else
    begin
        dataout[28:0] <= datatemp[31:3];
        dataout[31:29] <= 3'd0;
	end
end
endmodule 