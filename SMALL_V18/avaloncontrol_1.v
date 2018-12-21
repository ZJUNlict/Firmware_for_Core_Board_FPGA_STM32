// avaloncontrol_1.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module avaloncontrol_1 (
		input  wire        clk,        //    clock_reset.clk
		input  wire        rst_n,      //               .reset_n
		input  wire        cs_n,       // avalon_slave_0.chipselect_n
		output wire [31:0] rddata,     //               .readdata
		input  wire [31:0] wrdata,     //               .writedata
		input  wire        rd_n,       //               .read_n
		input  wire        wr_n,       //               .write_n
		input  wire [2:0]  addr,       //               .address
		output wire [31:0] set,        //    conduit_end.export
		input  wire [31:0] code0,      //               .export
		input  wire [31:0] code1,      //               .export
		input  wire [31:0] code2,      //               .export
		input  wire [31:0] code3,      //               .export
		output wire [31:0] A,          //               .export
		output wire [31:0] B,          //               .export
		output wire        IsOpenLoop  //               .export
	);

	avaloncontrol avaloncontrol_1 (
		.clk        (clk),        //    clock_reset.clk
		.rst_n      (rst_n),      //               .reset_n
		.cs_n       (cs_n),       // avalon_slave_0.chipselect_n
		.rddata     (rddata),     //               .readdata
		.wrdata     (wrdata),     //               .writedata
		.rd_n       (rd_n),       //               .read_n
		.wr_n       (wr_n),       //               .write_n
		.addr       (addr),       //               .address
		.set        (set),        //    conduit_end.export
		.code0      (code0),      //               .export
		.code1      (code1),      //               .export
		.code2      (code2),      //               .export
		.code3      (code3),      //               .export
		.A          (A),          //               .export
		.B          (B),          //               .export
		.IsOpenLoop (IsOpenLoop)  //               .export
	);

endmodule
