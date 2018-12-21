module HULL_CHECK(clk,reset,dir,SA_in,SB_in,SC_in,fault);
input clk,reset,dir,SA_in,SB_in,SC_in;
output fault;
reg SA_out,SB_out,SC_out,fault;
reg arbt;
reg [16:0]clk_counter;
reg [16:0]clk_reg;
reg [2:0]default_counter;
reg [1:0]fault_counter;

always@(posedge clk or negedge reset)
begin
if(reset==1'b0)
begin
	fault <= 1'b1;
	SA_out <= SA_in;
	SB_out <= SB_in;
	SC_out <= SC_in;
	clk_counter[16:0] <= 0;
	clk_reg[16:0] <= 0; 
	fault_counter[1:0] <= 2'b0;
	default_counter[2:0] <= 3'b0;
end
else
begin
   clk_counter[16:0] <= clk_counter[16:0] + 1'b1;    
   if(clk_counter[16:0] > 16'd50000)
   begin
       clk_counter[16:0] <= 0;
       clk_reg[16:0] <= clk_reg[16:0] + 1'b1;
   end
   if(clk_reg[16:0] > 16'd1000)
   begin 
      clk_reg[16:0] <= 0;
       fault <= 1'b1;      //??????????
   end
   
if({SA_in,SB_in,SC_in} != {SA_out,SB_out,SC_out})
	begin		//100 110 010 011 001 101

	   case({SA_in,SB_in,SC_in})
	   3'b100:
	   begin
		   arbt = (({SA_out,SB_out,SC_out} == 3'b101) || ({SA_out,SB_out,SC_out} == 3'b110))?1'b1:1'b0;   
	   end

	   3'b110:
	   begin  //100 110 010 011 001 101
		   arbt = (({SA_out,SB_out,SC_out} == 3'b100) || ({SA_out,SB_out,SC_out} == 3'b010))?1'b1:1'b0;
	   end	
	   
	   3'b010:
	   begin      //100 110 010 011 001 101
		   arbt = (({SA_out,SB_out,SC_out} == 3'b110) || ({SA_out,SB_out,SC_out} == 3'b011))?1'b1:1'b0;
	   end
		
	   3'b011:
	   begin      //100 110 010 011 001 101
		   arbt = (({SA_out,SB_out,SC_out} == 3'b010) || ({SA_out,SB_out,SC_out} == 3'b001))?1'b1:1'b0;
	   end	

	   3'b001:
	   begin      //100 110 010 011 001 101
		   arbt = (({SA_out,SB_out,SC_out} == 3'b011) || ({SA_out,SB_out,SC_out} == 3'b101))?1'b1:1'b0;
	   end

	   3'b101:
	   begin      //100 110 010 011 001 101
		   arbt = (({SA_out,SB_out,SC_out} == 3'b001) || ({SA_out,SB_out,SC_out} == 3'b100))?1'b1:1'b0;
	   end	
	
	   default:
	   begin
		   fault <= 1'b0;
		   default_counter <= 3'b0;
		   fault_counter <= 2'b0;
	   end
	   
	   endcase
	
	   if(arbt != 1'b1)
	   begin
		   fault_counter <= fault_counter + 1'b1; 
		   default_counter <= 3'b0;                                                                                                                                                                                 
	   end
	   else
	   begin
		   default_counter <= default_counter + 1'b1;	
	   end
      
      if(default_counter == 3'b111)
      begin
         default_counter <= 3'b0;
         fault_counter <= 2'b0;
         //fault <= 1'b1;    //never auto-restart when fault
      end
      
      if(fault_counter == 2'b11)
      begin
          fault_counter <= 2'b0;
          default_counter <= 3'b0;
          fault <= 1'b0;
      end
      
      SA_out <= SA_in;
	  SB_out <= SB_in;
	  SC_out <= SC_in;
	   
end       
end
end
endmodule