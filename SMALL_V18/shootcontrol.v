module shootcontrol(input clk0,
						  input rst_n, 
						  input [7:0]strength, 
						  input en, 
						  output shoot_out, 
						  output chip_out, 
						  output shoot_ok);
reg enable;
reg [31:0]counter;
reg [31:0]subcounter;
reg shoot_out_temp, chip_out_temp;

always@ (posedge clk0 or negedge rst_n)
begin
  if(!rst_n)
  begin
	 shoot_out_temp <= 1'b0;
	 chip_out_temp <= 1'b0;
  end
  else
  begin
    if (strength[7] == 1'b0 && counter < strength[6:0])
	 begin
		shoot_out_temp <= 1'b1;
		chip_out_temp <= 1'b0;
	 end
	 else if(strength[7] == 1'b1 && counter < strength[6:0])
	 begin
	   shoot_out_temp <= 1'b0;
		chip_out_temp <= 1'b1;
	 end
	 else if(counter >= strength[6:0])
	 begin
	   shoot_out_temp <= 1'b0;
	   chip_out_temp <= 1'b0;
	 end
  end
end//always

always@(posedge clk0 or negedge rst_n)
begin
  if(!rst_n)
  begin
    counter <= 32'b0;
	 subcounter <= 32'b0;
  end
  else if (!enable)
  begin
    counter <= 32'b0;
	 subcounter <= 32'b0;
  end
  else
  begin
    if(subcounter > 2500)
    begin
      subcounter <= 32'b0;
		counter <= counter+1;
    end
    else
    begin
      subcounter <= subcounter + 1;
    end
  end
end


always@ (posedge clk0 or negedge rst_n)
begin
  if (!rst_n)
  begin
    enable <= 1'b0;
  end
  else if(~en_flag_r1 & en_flag_r0)
  begin
    enable <= 1'b1;
  end
  else if(counter >= 32'd10000)
  begin
    enable <= 1'b0;
  end 
end

reg en_flag_r0, en_flag_r1;
always@(posedge clk0 or negedge rst_n)
begin
    if(!rst_n)
        begin
            en_flag_r0 <= 1'b0;
            en_flag_r1 <= 1'b0;
        end
    else
        begin
            en_flag_r0 <= en;
            en_flag_r1 <= en_flag_r0;
        end
end


assign shoot_out = shoot_out_temp & enable;
assign chip_out = chip_out_temp & enable ;

endmodule