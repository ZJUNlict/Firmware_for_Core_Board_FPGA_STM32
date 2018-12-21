// PWM_2_infra_pwm.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module PWM_2_infra_pwm (
		input  wire        reset,   //    clock_reset.reset_n
		input  wire        clk,     //               .clk
		input  wire [1:0]  addr,    // avalon_slave_0.address
		input  wire        wr_n,    //               .write_n
		input  wire [31:0] wrdata,  //               .writedata
		output wire        pwm,     //    conduit_end.export
		output wire        dir_out  //               .export
	);

	PWM_2 pwm_2_infra_pwm (
		.reset   (reset),   //    clock_reset.reset_n
		.clk     (clk),     //               .clk
		.addr    (addr),    // avalon_slave_0.address
		.wr_n    (wr_n),    //               .write_n
		.wrdata  (wrdata),  //               .writedata
		.pwm     (pwm),     //    conduit_end.export
		.dir_out (dir_out)  //               .export
	);

endmodule
