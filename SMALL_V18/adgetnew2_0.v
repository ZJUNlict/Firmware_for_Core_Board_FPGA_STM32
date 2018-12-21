// adgetnew2_0.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module adgetnew2_0 (
		input  wire        clk,      //    clock_reset.clk
		input  wire        reset_n,  //               .reset_n
		input  wire [1:0]  addr,     // avalon_slave_0.address
		input  wire        read_n,   //               .read_n
		input  wire        cs_n,     //               .chipselect_n
		output wire [15:0] readdata, //               .readdata
		output wire        clk_out,  //    conduit_end.export
		output wire        din,      //               .export
		input  wire        dout,     //               .export
		output wire        cs,       //               .export
		input  wire        sars      //               .export
	);

	adgetnew2 adgetnew2_0 (
		.clk      (clk),      //    clock_reset.clk
		.reset_n  (reset_n),  //               .reset_n
		.addr     (addr),     // avalon_slave_0.address
		.read_n   (read_n),   //               .read_n
		.cs_n     (cs_n),     //               .chipselect_n
		.readdata (readdata), //               .readdata
		.clk_out  (clk_out),  //    conduit_end.export
		.din      (din),      //               .export
		.dout     (dout),     //               .export
		.cs       (cs),       //               .export
		.sars     (sars)      //               .export
	);

endmodule
