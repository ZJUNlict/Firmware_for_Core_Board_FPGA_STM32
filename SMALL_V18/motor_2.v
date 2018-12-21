// motor_2.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module motor_2 (
		input  wire        clk,         //    clock_reset.clk
		input  wire        rst_n,       //               .reset_n
		input  wire        rd_n,        // avalon_slave_0.read_n
		input  wire        wr_n,        //               .write_n
		input  wire        cs_n,        //               .chipselect_n
		output wire [31:0] rddata,      //               .readdata
		input  wire [31:0] wrdata,      //               .writedata
		input  wire [2:0]  addr,        //               .address
		input  wire [31:0] code0,       //    conduit_end.export
		input  wire [31:0] code1,       //               .export
		input  wire [31:0] code2,       //               .export
		input  wire [31:0] code3,       //               .export
		output wire [31:0] set,         //               .export
		output wire [31:0] A,           //               .export
		output wire [31:0] B,           //               .export
		output wire        Z_Brushless, //               .export
		output wire        Z_OpenLoop   //               .export
	);

	motor motor_2 (
		.clk         (clk),         //    clock_reset.clk
		.rst_n       (rst_n),       //               .reset_n
		.rd_n        (rd_n),        // avalon_slave_0.read_n
		.wr_n        (wr_n),        //               .write_n
		.cs_n        (cs_n),        //               .chipselect_n
		.rddata      (rddata),      //               .readdata
		.wrdata      (wrdata),      //               .writedata
		.addr        (addr),        //               .address
		.code0       (code0),       //    conduit_end.export
		.code1       (code1),       //               .export
		.code2       (code2),       //               .export
		.code3       (code3),       //               .export
		.set         (set),         //               .export
		.A           (A),           //               .export
		.B           (B),           //               .export
		.Z_Brushless (Z_Brushless), //               .export
		.Z_OpenLoop  (Z_OpenLoop)   //               .export
	);

endmodule
