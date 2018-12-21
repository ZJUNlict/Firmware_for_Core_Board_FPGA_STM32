// shoot_timer_shoot.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module shoot_timer_shoot (
		input  wire        clk,    //    clock_reset.clk
		input  wire        reset,  //               .reset_n
		input  wire [31:0] wrdata, // avalon_slave_0.writedata
		input  wire        wr_n,   //               .write_n
		input  wire        rd_n,   //               .read_n
		output wire [31:0] rddata, //               .readdata
		output wire        Dout    //    conduit_end.export
	);

	shoot_timer #(
		.Bit_32 (32)
	) shoot_timer_shoot (
		.clk    (clk),    //    clock_reset.clk
		.reset  (reset),  //               .reset_n
		.wrdata (wrdata), // avalon_slave_0.writedata
		.wr_n   (wr_n),   //               .write_n
		.rd_n   (rd_n),   //               .read_n
		.rddata (rddata), //               .readdata
		.Dout   (Dout)    //    conduit_end.export
	);

endmodule
