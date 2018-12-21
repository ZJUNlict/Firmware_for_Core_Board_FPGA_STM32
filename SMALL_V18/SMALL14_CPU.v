//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2016 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module PWM_2_infra_pwm_avalon_slave_0_arbitrator (
                                                   // inputs:
                                                    clk,
                                                    cpu_0_data_master_address_to_slave,
                                                    cpu_0_data_master_latency_counter,
                                                    cpu_0_data_master_read,
                                                    cpu_0_data_master_write,
                                                    cpu_0_data_master_writedata,
                                                    reset_n,

                                                   // outputs:
                                                    PWM_2_infra_pwm_avalon_slave_0_address,
                                                    PWM_2_infra_pwm_avalon_slave_0_reset_n,
                                                    PWM_2_infra_pwm_avalon_slave_0_write_n,
                                                    PWM_2_infra_pwm_avalon_slave_0_writedata,
                                                    cpu_0_data_master_granted_PWM_2_infra_pwm_avalon_slave_0,
                                                    cpu_0_data_master_qualified_request_PWM_2_infra_pwm_avalon_slave_0,
                                                    cpu_0_data_master_read_data_valid_PWM_2_infra_pwm_avalon_slave_0,
                                                    cpu_0_data_master_requests_PWM_2_infra_pwm_avalon_slave_0,
                                                    d1_PWM_2_infra_pwm_avalon_slave_0_end_xfer
                                                 )
;

  output  [  1: 0] PWM_2_infra_pwm_avalon_slave_0_address;
  output           PWM_2_infra_pwm_avalon_slave_0_reset_n;
  output           PWM_2_infra_pwm_avalon_slave_0_write_n;
  output  [ 31: 0] PWM_2_infra_pwm_avalon_slave_0_writedata;
  output           cpu_0_data_master_granted_PWM_2_infra_pwm_avalon_slave_0;
  output           cpu_0_data_master_qualified_request_PWM_2_infra_pwm_avalon_slave_0;
  output           cpu_0_data_master_read_data_valid_PWM_2_infra_pwm_avalon_slave_0;
  output           cpu_0_data_master_requests_PWM_2_infra_pwm_avalon_slave_0;
  output           d1_PWM_2_infra_pwm_avalon_slave_0_end_xfer;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] PWM_2_infra_pwm_avalon_slave_0_address;
  wire             PWM_2_infra_pwm_avalon_slave_0_allgrants;
  wire             PWM_2_infra_pwm_avalon_slave_0_allow_new_arb_cycle;
  wire             PWM_2_infra_pwm_avalon_slave_0_any_bursting_master_saved_grant;
  wire             PWM_2_infra_pwm_avalon_slave_0_any_continuerequest;
  wire             PWM_2_infra_pwm_avalon_slave_0_arb_counter_enable;
  reg     [  1: 0] PWM_2_infra_pwm_avalon_slave_0_arb_share_counter;
  wire    [  1: 0] PWM_2_infra_pwm_avalon_slave_0_arb_share_counter_next_value;
  wire    [  1: 0] PWM_2_infra_pwm_avalon_slave_0_arb_share_set_values;
  wire             PWM_2_infra_pwm_avalon_slave_0_beginbursttransfer_internal;
  wire             PWM_2_infra_pwm_avalon_slave_0_begins_xfer;
  wire             PWM_2_infra_pwm_avalon_slave_0_end_xfer;
  wire             PWM_2_infra_pwm_avalon_slave_0_firsttransfer;
  wire             PWM_2_infra_pwm_avalon_slave_0_grant_vector;
  wire             PWM_2_infra_pwm_avalon_slave_0_in_a_read_cycle;
  wire             PWM_2_infra_pwm_avalon_slave_0_in_a_write_cycle;
  wire             PWM_2_infra_pwm_avalon_slave_0_master_qreq_vector;
  wire             PWM_2_infra_pwm_avalon_slave_0_non_bursting_master_requests;
  reg              PWM_2_infra_pwm_avalon_slave_0_reg_firsttransfer;
  wire             PWM_2_infra_pwm_avalon_slave_0_reset_n;
  reg              PWM_2_infra_pwm_avalon_slave_0_slavearbiterlockenable;
  wire             PWM_2_infra_pwm_avalon_slave_0_slavearbiterlockenable2;
  wire             PWM_2_infra_pwm_avalon_slave_0_unreg_firsttransfer;
  wire             PWM_2_infra_pwm_avalon_slave_0_waits_for_read;
  wire             PWM_2_infra_pwm_avalon_slave_0_waits_for_write;
  wire             PWM_2_infra_pwm_avalon_slave_0_write_n;
  wire    [ 31: 0] PWM_2_infra_pwm_avalon_slave_0_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_PWM_2_infra_pwm_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_PWM_2_infra_pwm_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_PWM_2_infra_pwm_avalon_slave_0;
  wire             cpu_0_data_master_requests_PWM_2_infra_pwm_avalon_slave_0;
  wire             cpu_0_data_master_saved_grant_PWM_2_infra_pwm_avalon_slave_0;
  reg              d1_PWM_2_infra_pwm_avalon_slave_0_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_PWM_2_infra_pwm_avalon_slave_0;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_PWM_2_infra_pwm_avalon_slave_0_from_cpu_0_data_master;
  wire             wait_for_PWM_2_infra_pwm_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~PWM_2_infra_pwm_avalon_slave_0_end_xfer;
    end


  assign PWM_2_infra_pwm_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_PWM_2_infra_pwm_avalon_slave_0));
  assign cpu_0_data_master_requests_PWM_2_infra_pwm_avalon_slave_0 = (({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1002200) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_write;
  //PWM_2_infra_pwm_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign PWM_2_infra_pwm_avalon_slave_0_arb_share_set_values = 1;

  //PWM_2_infra_pwm_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign PWM_2_infra_pwm_avalon_slave_0_non_bursting_master_requests = cpu_0_data_master_requests_PWM_2_infra_pwm_avalon_slave_0;

  //PWM_2_infra_pwm_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign PWM_2_infra_pwm_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //PWM_2_infra_pwm_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign PWM_2_infra_pwm_avalon_slave_0_arb_share_counter_next_value = PWM_2_infra_pwm_avalon_slave_0_firsttransfer ? (PWM_2_infra_pwm_avalon_slave_0_arb_share_set_values - 1) : |PWM_2_infra_pwm_avalon_slave_0_arb_share_counter ? (PWM_2_infra_pwm_avalon_slave_0_arb_share_counter - 1) : 0;

  //PWM_2_infra_pwm_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign PWM_2_infra_pwm_avalon_slave_0_allgrants = |PWM_2_infra_pwm_avalon_slave_0_grant_vector;

  //PWM_2_infra_pwm_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign PWM_2_infra_pwm_avalon_slave_0_end_xfer = ~(PWM_2_infra_pwm_avalon_slave_0_waits_for_read | PWM_2_infra_pwm_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_PWM_2_infra_pwm_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_PWM_2_infra_pwm_avalon_slave_0 = PWM_2_infra_pwm_avalon_slave_0_end_xfer & (~PWM_2_infra_pwm_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //PWM_2_infra_pwm_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign PWM_2_infra_pwm_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_PWM_2_infra_pwm_avalon_slave_0 & PWM_2_infra_pwm_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_PWM_2_infra_pwm_avalon_slave_0 & ~PWM_2_infra_pwm_avalon_slave_0_non_bursting_master_requests);

  //PWM_2_infra_pwm_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          PWM_2_infra_pwm_avalon_slave_0_arb_share_counter <= 0;
      else if (PWM_2_infra_pwm_avalon_slave_0_arb_counter_enable)
          PWM_2_infra_pwm_avalon_slave_0_arb_share_counter <= PWM_2_infra_pwm_avalon_slave_0_arb_share_counter_next_value;
    end


  //PWM_2_infra_pwm_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          PWM_2_infra_pwm_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|PWM_2_infra_pwm_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_PWM_2_infra_pwm_avalon_slave_0) | (end_xfer_arb_share_counter_term_PWM_2_infra_pwm_avalon_slave_0 & ~PWM_2_infra_pwm_avalon_slave_0_non_bursting_master_requests))
          PWM_2_infra_pwm_avalon_slave_0_slavearbiterlockenable <= |PWM_2_infra_pwm_avalon_slave_0_arb_share_counter_next_value;
    end


  //cpu_0/data_master PWM_2_infra_pwm/avalon_slave_0 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = PWM_2_infra_pwm_avalon_slave_0_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //PWM_2_infra_pwm_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign PWM_2_infra_pwm_avalon_slave_0_slavearbiterlockenable2 = |PWM_2_infra_pwm_avalon_slave_0_arb_share_counter_next_value;

  //cpu_0/data_master PWM_2_infra_pwm/avalon_slave_0 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = PWM_2_infra_pwm_avalon_slave_0_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //PWM_2_infra_pwm_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  assign PWM_2_infra_pwm_avalon_slave_0_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_PWM_2_infra_pwm_avalon_slave_0 = cpu_0_data_master_requests_PWM_2_infra_pwm_avalon_slave_0;
  //local readdatavalid cpu_0_data_master_read_data_valid_PWM_2_infra_pwm_avalon_slave_0, which is an e_mux
  assign cpu_0_data_master_read_data_valid_PWM_2_infra_pwm_avalon_slave_0 = cpu_0_data_master_granted_PWM_2_infra_pwm_avalon_slave_0 & cpu_0_data_master_read & ~PWM_2_infra_pwm_avalon_slave_0_waits_for_read;

  //PWM_2_infra_pwm_avalon_slave_0_writedata mux, which is an e_mux
  assign PWM_2_infra_pwm_avalon_slave_0_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_PWM_2_infra_pwm_avalon_slave_0 = cpu_0_data_master_qualified_request_PWM_2_infra_pwm_avalon_slave_0;

  //cpu_0/data_master saved-grant PWM_2_infra_pwm/avalon_slave_0, which is an e_assign
  assign cpu_0_data_master_saved_grant_PWM_2_infra_pwm_avalon_slave_0 = cpu_0_data_master_requests_PWM_2_infra_pwm_avalon_slave_0;

  //allow new arb cycle for PWM_2_infra_pwm/avalon_slave_0, which is an e_assign
  assign PWM_2_infra_pwm_avalon_slave_0_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign PWM_2_infra_pwm_avalon_slave_0_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign PWM_2_infra_pwm_avalon_slave_0_master_qreq_vector = 1;

  //PWM_2_infra_pwm_avalon_slave_0_reset_n assignment, which is an e_assign
  assign PWM_2_infra_pwm_avalon_slave_0_reset_n = reset_n;

  //PWM_2_infra_pwm_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign PWM_2_infra_pwm_avalon_slave_0_firsttransfer = PWM_2_infra_pwm_avalon_slave_0_begins_xfer ? PWM_2_infra_pwm_avalon_slave_0_unreg_firsttransfer : PWM_2_infra_pwm_avalon_slave_0_reg_firsttransfer;

  //PWM_2_infra_pwm_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  assign PWM_2_infra_pwm_avalon_slave_0_unreg_firsttransfer = ~(PWM_2_infra_pwm_avalon_slave_0_slavearbiterlockenable & PWM_2_infra_pwm_avalon_slave_0_any_continuerequest);

  //PWM_2_infra_pwm_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          PWM_2_infra_pwm_avalon_slave_0_reg_firsttransfer <= 1'b1;
      else if (PWM_2_infra_pwm_avalon_slave_0_begins_xfer)
          PWM_2_infra_pwm_avalon_slave_0_reg_firsttransfer <= PWM_2_infra_pwm_avalon_slave_0_unreg_firsttransfer;
    end


  //PWM_2_infra_pwm_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign PWM_2_infra_pwm_avalon_slave_0_beginbursttransfer_internal = PWM_2_infra_pwm_avalon_slave_0_begins_xfer;

  //~PWM_2_infra_pwm_avalon_slave_0_write_n assignment, which is an e_mux
  assign PWM_2_infra_pwm_avalon_slave_0_write_n = ~(cpu_0_data_master_granted_PWM_2_infra_pwm_avalon_slave_0 & cpu_0_data_master_write);

  assign shifted_address_to_PWM_2_infra_pwm_avalon_slave_0_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //PWM_2_infra_pwm_avalon_slave_0_address mux, which is an e_mux
  assign PWM_2_infra_pwm_avalon_slave_0_address = shifted_address_to_PWM_2_infra_pwm_avalon_slave_0_from_cpu_0_data_master >> 2;

  //d1_PWM_2_infra_pwm_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_PWM_2_infra_pwm_avalon_slave_0_end_xfer <= 1;
      else 
        d1_PWM_2_infra_pwm_avalon_slave_0_end_xfer <= PWM_2_infra_pwm_avalon_slave_0_end_xfer;
    end


  //PWM_2_infra_pwm_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign PWM_2_infra_pwm_avalon_slave_0_waits_for_read = PWM_2_infra_pwm_avalon_slave_0_in_a_read_cycle & PWM_2_infra_pwm_avalon_slave_0_begins_xfer;

  //PWM_2_infra_pwm_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign PWM_2_infra_pwm_avalon_slave_0_in_a_read_cycle = cpu_0_data_master_granted_PWM_2_infra_pwm_avalon_slave_0 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = PWM_2_infra_pwm_avalon_slave_0_in_a_read_cycle;

  //PWM_2_infra_pwm_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign PWM_2_infra_pwm_avalon_slave_0_waits_for_write = PWM_2_infra_pwm_avalon_slave_0_in_a_write_cycle & 0;

  //PWM_2_infra_pwm_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign PWM_2_infra_pwm_avalon_slave_0_in_a_write_cycle = cpu_0_data_master_granted_PWM_2_infra_pwm_avalon_slave_0 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = PWM_2_infra_pwm_avalon_slave_0_in_a_write_cycle;

  assign wait_for_PWM_2_infra_pwm_avalon_slave_0_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //PWM_2_infra_pwm/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module adgetnew2_0_avalon_slave_0_arbitrator (
                                               // inputs:
                                                adgetnew2_0_avalon_slave_0_readdata,
                                                clk,
                                                cpu_0_data_master_address_to_slave,
                                                cpu_0_data_master_dbs_address,
                                                cpu_0_data_master_latency_counter,
                                                cpu_0_data_master_read,
                                                cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                                cpu_0_data_master_write,
                                                reset_n,

                                               // outputs:
                                                adgetnew2_0_avalon_slave_0_address,
                                                adgetnew2_0_avalon_slave_0_chipselect_n,
                                                adgetnew2_0_avalon_slave_0_read_n,
                                                adgetnew2_0_avalon_slave_0_readdata_from_sa,
                                                adgetnew2_0_avalon_slave_0_reset_n,
                                                cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0,
                                                cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0,
                                                cpu_0_data_master_read_data_valid_adgetnew2_0_avalon_slave_0,
                                                cpu_0_data_master_requests_adgetnew2_0_avalon_slave_0,
                                                d1_adgetnew2_0_avalon_slave_0_end_xfer
                                             )
;

  output  [  1: 0] adgetnew2_0_avalon_slave_0_address;
  output           adgetnew2_0_avalon_slave_0_chipselect_n;
  output           adgetnew2_0_avalon_slave_0_read_n;
  output  [ 15: 0] adgetnew2_0_avalon_slave_0_readdata_from_sa;
  output           adgetnew2_0_avalon_slave_0_reset_n;
  output           cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0;
  output           cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0;
  output           cpu_0_data_master_read_data_valid_adgetnew2_0_avalon_slave_0;
  output           cpu_0_data_master_requests_adgetnew2_0_avalon_slave_0;
  output           d1_adgetnew2_0_avalon_slave_0_end_xfer;
  input   [ 15: 0] adgetnew2_0_avalon_slave_0_readdata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input            reset_n;

  wire    [  1: 0] adgetnew2_0_avalon_slave_0_address;
  wire             adgetnew2_0_avalon_slave_0_allgrants;
  wire             adgetnew2_0_avalon_slave_0_allow_new_arb_cycle;
  wire             adgetnew2_0_avalon_slave_0_any_bursting_master_saved_grant;
  wire             adgetnew2_0_avalon_slave_0_any_continuerequest;
  wire             adgetnew2_0_avalon_slave_0_arb_counter_enable;
  reg     [  1: 0] adgetnew2_0_avalon_slave_0_arb_share_counter;
  wire    [  1: 0] adgetnew2_0_avalon_slave_0_arb_share_counter_next_value;
  wire    [  1: 0] adgetnew2_0_avalon_slave_0_arb_share_set_values;
  wire             adgetnew2_0_avalon_slave_0_beginbursttransfer_internal;
  wire             adgetnew2_0_avalon_slave_0_begins_xfer;
  wire             adgetnew2_0_avalon_slave_0_chipselect_n;
  wire             adgetnew2_0_avalon_slave_0_end_xfer;
  wire             adgetnew2_0_avalon_slave_0_firsttransfer;
  wire             adgetnew2_0_avalon_slave_0_grant_vector;
  wire             adgetnew2_0_avalon_slave_0_in_a_read_cycle;
  wire             adgetnew2_0_avalon_slave_0_in_a_write_cycle;
  wire             adgetnew2_0_avalon_slave_0_master_qreq_vector;
  wire             adgetnew2_0_avalon_slave_0_non_bursting_master_requests;
  wire             adgetnew2_0_avalon_slave_0_read_n;
  wire    [ 15: 0] adgetnew2_0_avalon_slave_0_readdata_from_sa;
  reg              adgetnew2_0_avalon_slave_0_reg_firsttransfer;
  wire             adgetnew2_0_avalon_slave_0_reset_n;
  reg              adgetnew2_0_avalon_slave_0_slavearbiterlockenable;
  wire             adgetnew2_0_avalon_slave_0_slavearbiterlockenable2;
  wire             adgetnew2_0_avalon_slave_0_unreg_firsttransfer;
  wire             adgetnew2_0_avalon_slave_0_waits_for_read;
  wire             adgetnew2_0_avalon_slave_0_waits_for_write;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_adgetnew2_0_avalon_slave_0;
  wire             cpu_0_data_master_requests_adgetnew2_0_avalon_slave_0;
  wire             cpu_0_data_master_saved_grant_adgetnew2_0_avalon_slave_0;
  reg              d1_adgetnew2_0_avalon_slave_0_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_adgetnew2_0_avalon_slave_0;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_adgetnew2_0_avalon_slave_0_from_cpu_0_data_master;
  wire             wait_for_adgetnew2_0_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~adgetnew2_0_avalon_slave_0_end_xfer;
    end


  assign adgetnew2_0_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0));
  //assign adgetnew2_0_avalon_slave_0_readdata_from_sa = adgetnew2_0_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign adgetnew2_0_avalon_slave_0_readdata_from_sa = adgetnew2_0_avalon_slave_0_readdata;

  assign cpu_0_data_master_requests_adgetnew2_0_avalon_slave_0 = (({cpu_0_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h1002290) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //adgetnew2_0_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign adgetnew2_0_avalon_slave_0_arb_share_set_values = (cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0)? 2 :
    1;

  //adgetnew2_0_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign adgetnew2_0_avalon_slave_0_non_bursting_master_requests = cpu_0_data_master_requests_adgetnew2_0_avalon_slave_0;

  //adgetnew2_0_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign adgetnew2_0_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //adgetnew2_0_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign adgetnew2_0_avalon_slave_0_arb_share_counter_next_value = adgetnew2_0_avalon_slave_0_firsttransfer ? (adgetnew2_0_avalon_slave_0_arb_share_set_values - 1) : |adgetnew2_0_avalon_slave_0_arb_share_counter ? (adgetnew2_0_avalon_slave_0_arb_share_counter - 1) : 0;

  //adgetnew2_0_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign adgetnew2_0_avalon_slave_0_allgrants = |adgetnew2_0_avalon_slave_0_grant_vector;

  //adgetnew2_0_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign adgetnew2_0_avalon_slave_0_end_xfer = ~(adgetnew2_0_avalon_slave_0_waits_for_read | adgetnew2_0_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_adgetnew2_0_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_adgetnew2_0_avalon_slave_0 = adgetnew2_0_avalon_slave_0_end_xfer & (~adgetnew2_0_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //adgetnew2_0_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign adgetnew2_0_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_adgetnew2_0_avalon_slave_0 & adgetnew2_0_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_adgetnew2_0_avalon_slave_0 & ~adgetnew2_0_avalon_slave_0_non_bursting_master_requests);

  //adgetnew2_0_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          adgetnew2_0_avalon_slave_0_arb_share_counter <= 0;
      else if (adgetnew2_0_avalon_slave_0_arb_counter_enable)
          adgetnew2_0_avalon_slave_0_arb_share_counter <= adgetnew2_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //adgetnew2_0_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          adgetnew2_0_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|adgetnew2_0_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_adgetnew2_0_avalon_slave_0) | (end_xfer_arb_share_counter_term_adgetnew2_0_avalon_slave_0 & ~adgetnew2_0_avalon_slave_0_non_bursting_master_requests))
          adgetnew2_0_avalon_slave_0_slavearbiterlockenable <= |adgetnew2_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //cpu_0/data_master adgetnew2_0/avalon_slave_0 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = adgetnew2_0_avalon_slave_0_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //adgetnew2_0_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign adgetnew2_0_avalon_slave_0_slavearbiterlockenable2 = |adgetnew2_0_avalon_slave_0_arb_share_counter_next_value;

  //cpu_0/data_master adgetnew2_0/avalon_slave_0 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = adgetnew2_0_avalon_slave_0_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //adgetnew2_0_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  assign adgetnew2_0_avalon_slave_0_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0 = cpu_0_data_master_requests_adgetnew2_0_avalon_slave_0 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_adgetnew2_0_avalon_slave_0, which is an e_mux
  assign cpu_0_data_master_read_data_valid_adgetnew2_0_avalon_slave_0 = cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0 & cpu_0_data_master_read & ~adgetnew2_0_avalon_slave_0_waits_for_read;

  //master is always granted when requested
  assign cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0 = cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0;

  //cpu_0/data_master saved-grant adgetnew2_0/avalon_slave_0, which is an e_assign
  assign cpu_0_data_master_saved_grant_adgetnew2_0_avalon_slave_0 = cpu_0_data_master_requests_adgetnew2_0_avalon_slave_0;

  //allow new arb cycle for adgetnew2_0/avalon_slave_0, which is an e_assign
  assign adgetnew2_0_avalon_slave_0_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign adgetnew2_0_avalon_slave_0_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign adgetnew2_0_avalon_slave_0_master_qreq_vector = 1;

  //adgetnew2_0_avalon_slave_0_reset_n assignment, which is an e_assign
  assign adgetnew2_0_avalon_slave_0_reset_n = reset_n;

  assign adgetnew2_0_avalon_slave_0_chipselect_n = ~cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0;
  //adgetnew2_0_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign adgetnew2_0_avalon_slave_0_firsttransfer = adgetnew2_0_avalon_slave_0_begins_xfer ? adgetnew2_0_avalon_slave_0_unreg_firsttransfer : adgetnew2_0_avalon_slave_0_reg_firsttransfer;

  //adgetnew2_0_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  assign adgetnew2_0_avalon_slave_0_unreg_firsttransfer = ~(adgetnew2_0_avalon_slave_0_slavearbiterlockenable & adgetnew2_0_avalon_slave_0_any_continuerequest);

  //adgetnew2_0_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          adgetnew2_0_avalon_slave_0_reg_firsttransfer <= 1'b1;
      else if (adgetnew2_0_avalon_slave_0_begins_xfer)
          adgetnew2_0_avalon_slave_0_reg_firsttransfer <= adgetnew2_0_avalon_slave_0_unreg_firsttransfer;
    end


  //adgetnew2_0_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign adgetnew2_0_avalon_slave_0_beginbursttransfer_internal = adgetnew2_0_avalon_slave_0_begins_xfer;

  //~adgetnew2_0_avalon_slave_0_read_n assignment, which is an e_mux
  assign adgetnew2_0_avalon_slave_0_read_n = ~(cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0 & cpu_0_data_master_read);

  assign shifted_address_to_adgetnew2_0_avalon_slave_0_from_cpu_0_data_master = {cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1],
    {1 {1'b0}}};

  //adgetnew2_0_avalon_slave_0_address mux, which is an e_mux
  assign adgetnew2_0_avalon_slave_0_address = shifted_address_to_adgetnew2_0_avalon_slave_0_from_cpu_0_data_master >> 1;

  //d1_adgetnew2_0_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_adgetnew2_0_avalon_slave_0_end_xfer <= 1;
      else 
        d1_adgetnew2_0_avalon_slave_0_end_xfer <= adgetnew2_0_avalon_slave_0_end_xfer;
    end


  //adgetnew2_0_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign adgetnew2_0_avalon_slave_0_waits_for_read = adgetnew2_0_avalon_slave_0_in_a_read_cycle & adgetnew2_0_avalon_slave_0_begins_xfer;

  //adgetnew2_0_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign adgetnew2_0_avalon_slave_0_in_a_read_cycle = cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = adgetnew2_0_avalon_slave_0_in_a_read_cycle;

  //adgetnew2_0_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign adgetnew2_0_avalon_slave_0_waits_for_write = adgetnew2_0_avalon_slave_0_in_a_write_cycle & 0;

  //adgetnew2_0_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign adgetnew2_0_avalon_slave_0_in_a_write_cycle = cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = adgetnew2_0_avalon_slave_0_in_a_write_cycle;

  assign wait_for_adgetnew2_0_avalon_slave_0_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //adgetnew2_0/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_jtag_debug_module_arbitrator (
                                            // inputs:
                                             clk,
                                             cpu_0_data_master_address_to_slave,
                                             cpu_0_data_master_byteenable,
                                             cpu_0_data_master_debugaccess,
                                             cpu_0_data_master_latency_counter,
                                             cpu_0_data_master_read,
                                             cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                             cpu_0_data_master_write,
                                             cpu_0_data_master_writedata,
                                             cpu_0_instruction_master_address_to_slave,
                                             cpu_0_instruction_master_latency_counter,
                                             cpu_0_instruction_master_read,
                                             cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register,
                                             cpu_0_jtag_debug_module_readdata,
                                             cpu_0_jtag_debug_module_resetrequest,
                                             reset_n,

                                            // outputs:
                                             cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                             cpu_0_jtag_debug_module_address,
                                             cpu_0_jtag_debug_module_begintransfer,
                                             cpu_0_jtag_debug_module_byteenable,
                                             cpu_0_jtag_debug_module_chipselect,
                                             cpu_0_jtag_debug_module_debugaccess,
                                             cpu_0_jtag_debug_module_readdata_from_sa,
                                             cpu_0_jtag_debug_module_reset_n,
                                             cpu_0_jtag_debug_module_resetrequest_from_sa,
                                             cpu_0_jtag_debug_module_write,
                                             cpu_0_jtag_debug_module_writedata,
                                             d1_cpu_0_jtag_debug_module_end_xfer
                                          )
;

  output           cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  output  [  8: 0] cpu_0_jtag_debug_module_address;
  output           cpu_0_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_0_jtag_debug_module_byteenable;
  output           cpu_0_jtag_debug_module_chipselect;
  output           cpu_0_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  output           cpu_0_jtag_debug_module_reset_n;
  output           cpu_0_jtag_debug_module_resetrequest_from_sa;
  output           cpu_0_jtag_debug_module_write;
  output  [ 31: 0] cpu_0_jtag_debug_module_writedata;
  output           d1_cpu_0_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_debugaccess;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata;
  input            cpu_0_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_allgrants;
  wire             cpu_0_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_0_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_0_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_0_jtag_debug_module_arb_addend;
  wire             cpu_0_jtag_debug_module_arb_counter_enable;
  reg     [  1: 0] cpu_0_jtag_debug_module_arb_share_counter;
  wire    [  1: 0] cpu_0_jtag_debug_module_arb_share_counter_next_value;
  wire    [  1: 0] cpu_0_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_0_jtag_debug_module_arb_winner;
  wire             cpu_0_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_0_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_0_jtag_debug_module_begins_xfer;
  wire             cpu_0_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_0_jtag_debug_module_byteenable;
  wire             cpu_0_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_0_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_0_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_0_jtag_debug_module_debugaccess;
  wire             cpu_0_jtag_debug_module_end_xfer;
  wire             cpu_0_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_0_jtag_debug_module_grant_vector;
  wire             cpu_0_jtag_debug_module_in_a_read_cycle;
  wire             cpu_0_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_0_jtag_debug_module_master_qreq_vector;
  wire             cpu_0_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  reg              cpu_0_jtag_debug_module_reg_firsttransfer;
  wire             cpu_0_jtag_debug_module_reset_n;
  wire             cpu_0_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_0_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_0_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_0_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_0_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_0_jtag_debug_module_waits_for_read;
  wire             cpu_0_jtag_debug_module_waits_for_write;
  wire             cpu_0_jtag_debug_module_write;
  wire    [ 31: 0] cpu_0_jtag_debug_module_writedata;
  reg              d1_cpu_0_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module;
  wire    [ 24: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master;
  wire    [ 24: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master;
  wire             wait_for_cpu_0_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_0_jtag_debug_module_end_xfer;
    end


  assign cpu_0_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module));
  //assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata;

  assign cpu_0_data_master_requests_cpu_0_jtag_debug_module = ({cpu_0_data_master_address_to_slave[24 : 11] , 11'b0} == 25'h1001000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //cpu_0_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_0_jtag_debug_module_arb_share_set_values = 1;

  //cpu_0_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_0_jtag_debug_module_non_bursting_master_requests = cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_requests_cpu_0_jtag_debug_module |
    cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_0_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_0_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_arb_share_counter_next_value = cpu_0_jtag_debug_module_firsttransfer ? (cpu_0_jtag_debug_module_arb_share_set_values - 1) : |cpu_0_jtag_debug_module_arb_share_counter ? (cpu_0_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_0_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_0_jtag_debug_module_allgrants = (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector);

  //cpu_0_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_end_xfer = ~(cpu_0_jtag_debug_module_waits_for_read | cpu_0_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_end_xfer & (~cpu_0_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_0_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_0_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & cpu_0_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & ~cpu_0_jtag_debug_module_non_bursting_master_requests);

  //cpu_0_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_0_jtag_debug_module_arb_counter_enable)
          cpu_0_jtag_debug_module_arb_share_counter <= cpu_0_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_0_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_0_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & ~cpu_0_jtag_debug_module_non_bursting_master_requests))
          cpu_0_jtag_debug_module_slavearbiterlockenable <= |cpu_0_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_0/data_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //cpu_0_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_0_jtag_debug_module_slavearbiterlockenable2 = |cpu_0_jtag_debug_module_arb_share_counter_next_value;

  //cpu_0/data_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_0_jtag_debug_module_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_data_master_requests_cpu_0_jtag_debug_module & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))) | cpu_0_instruction_master_arbiterlock);
  //local readdatavalid cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module, which is an e_mux
  assign cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_read & ~cpu_0_jtag_debug_module_waits_for_read;

  //cpu_0_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_0_jtag_debug_module_writedata = cpu_0_data_master_writedata;

  assign cpu_0_instruction_master_requests_cpu_0_jtag_debug_module = (({cpu_0_instruction_master_address_to_slave[24 : 11] , 11'b0} == 25'h1001000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  assign cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_instruction_master_requests_cpu_0_jtag_debug_module & ~((cpu_0_instruction_master_read & ((cpu_0_instruction_master_latency_counter != 0) | (|cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //local readdatavalid cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module = cpu_0_instruction_master_granted_cpu_0_jtag_debug_module & cpu_0_instruction_master_read & ~cpu_0_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;

  //cpu_0/instruction_master grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_instruction_master_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[0];

  //cpu_0/instruction_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[0] && cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0/data_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[1] = cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;

  //cpu_0/data_master grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_data_master_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[1];

  //cpu_0/data_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[1] && cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  //cpu_0/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_0_jtag_debug_module_chosen_master_double_vector = {cpu_0_jtag_debug_module_master_qreq_vector, cpu_0_jtag_debug_module_master_qreq_vector} & ({~cpu_0_jtag_debug_module_master_qreq_vector, ~cpu_0_jtag_debug_module_master_qreq_vector} + cpu_0_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_0_jtag_debug_module_arb_winner = (cpu_0_jtag_debug_module_allow_new_arb_cycle & | cpu_0_jtag_debug_module_grant_vector) ? cpu_0_jtag_debug_module_grant_vector : cpu_0_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_0_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_0_jtag_debug_module_allow_new_arb_cycle)
          cpu_0_jtag_debug_module_saved_chosen_master_vector <= |cpu_0_jtag_debug_module_grant_vector ? cpu_0_jtag_debug_module_grant_vector : cpu_0_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_0_jtag_debug_module_grant_vector = {(cpu_0_jtag_debug_module_chosen_master_double_vector[1] | cpu_0_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_0_jtag_debug_module_chosen_master_double_vector[0] | cpu_0_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu_0/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_0_jtag_debug_module_chosen_master_rot_left = (cpu_0_jtag_debug_module_arb_winner << 1) ? (cpu_0_jtag_debug_module_arb_winner << 1) : 1;

  //cpu_0/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_0_jtag_debug_module_grant_vector)
          cpu_0_jtag_debug_module_arb_addend <= cpu_0_jtag_debug_module_end_xfer? cpu_0_jtag_debug_module_chosen_master_rot_left : cpu_0_jtag_debug_module_grant_vector;
    end


  assign cpu_0_jtag_debug_module_begintransfer = cpu_0_jtag_debug_module_begins_xfer;
  //cpu_0_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_reset_n = reset_n;

  //assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest;

  assign cpu_0_jtag_debug_module_chipselect = cpu_0_data_master_granted_cpu_0_jtag_debug_module | cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  //cpu_0_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_0_jtag_debug_module_firsttransfer = cpu_0_jtag_debug_module_begins_xfer ? cpu_0_jtag_debug_module_unreg_firsttransfer : cpu_0_jtag_debug_module_reg_firsttransfer;

  //cpu_0_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_0_jtag_debug_module_unreg_firsttransfer = ~(cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_jtag_debug_module_any_continuerequest);

  //cpu_0_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_0_jtag_debug_module_begins_xfer)
          cpu_0_jtag_debug_module_reg_firsttransfer <= cpu_0_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_0_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_0_jtag_debug_module_beginbursttransfer_internal = cpu_0_jtag_debug_module_begins_xfer;

  //cpu_0_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_0_jtag_debug_module_arbitration_holdoff_internal = cpu_0_jtag_debug_module_begins_xfer & cpu_0_jtag_debug_module_firsttransfer;

  //cpu_0_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_0_jtag_debug_module_write = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write;

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //cpu_0_jtag_debug_module_address mux, which is an e_mux
  assign cpu_0_jtag_debug_module_address = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master >> 2) :
    (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master >> 2);

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  //d1_cpu_0_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_0_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_0_jtag_debug_module_end_xfer <= cpu_0_jtag_debug_module_end_xfer;
    end


  //cpu_0_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_read = cpu_0_jtag_debug_module_in_a_read_cycle & cpu_0_jtag_debug_module_begins_xfer;

  //cpu_0_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_read_cycle = (cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_0_jtag_debug_module_in_a_read_cycle;

  //cpu_0_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_write = cpu_0_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_0_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_write_cycle = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_0_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_0_jtag_debug_module_counter = 0;
  //cpu_0_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_0_jtag_debug_module_byteenable = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_0_jtag_debug_module_debugaccess = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_cpu_0_jtag_debug_module + cpu_0_instruction_master_granted_cpu_0_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module + cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_data_master_arbitrator (
                                      // inputs:
                                       adgetnew2_0_avalon_slave_0_readdata_from_sa,
                                       clk,
                                       cpu_0_data_master_address,
                                       cpu_0_data_master_byteenable,
                                       cpu_0_data_master_byteenable_sdram_0_s1,
                                       cpu_0_data_master_granted_PWM_2_infra_pwm_avalon_slave_0,
                                       cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0,
                                       cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port,
                                       cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_granted_motor_0_avalon_slave_0,
                                       cpu_0_data_master_granted_motor_1_avalon_slave_0,
                                       cpu_0_data_master_granted_motor_2_avalon_slave_0,
                                       cpu_0_data_master_granted_motor_3_avalon_slave_0,
                                       cpu_0_data_master_granted_motor_4_avalon_slave_0,
                                       cpu_0_data_master_granted_pio_buzzer_s1,
                                       cpu_0_data_master_granted_pio_hull_fault1_s1,
                                       cpu_0_data_master_granted_pio_hull_fault2_s1,
                                       cpu_0_data_master_granted_pio_hull_fault3_s1,
                                       cpu_0_data_master_granted_pio_hull_fault4_s1,
                                       cpu_0_data_master_granted_pio_infra_s1,
                                       cpu_0_data_master_granted_pio_led_s1,
                                       cpu_0_data_master_granted_pio_nF2401_in_s1,
                                       cpu_0_data_master_granted_pio_nF2401_inout_s1,
                                       cpu_0_data_master_granted_pio_nF2401_out_s1,
                                       cpu_0_data_master_granted_pio_reset_9557_s1,
                                       cpu_0_data_master_granted_pio_scl_24_s1,
                                       cpu_0_data_master_granted_pio_scl_9557_s1,
                                       cpu_0_data_master_granted_pio_sda_24_s1,
                                       cpu_0_data_master_granted_pio_sda_9557_s1,
                                       cpu_0_data_master_granted_pio_shoot_off_s1,
                                       cpu_0_data_master_granted_sdram_0_s1,
                                       cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0,
                                       cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0,
                                       cpu_0_data_master_granted_sysid_control_slave,
                                       cpu_0_data_master_granted_timer_0_s1,
                                       cpu_0_data_master_granted_timer_watchdog_s1,
                                       cpu_0_data_master_qualified_request_PWM_2_infra_pwm_avalon_slave_0,
                                       cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0,
                                       cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port,
                                       cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_qualified_request_motor_0_avalon_slave_0,
                                       cpu_0_data_master_qualified_request_motor_1_avalon_slave_0,
                                       cpu_0_data_master_qualified_request_motor_2_avalon_slave_0,
                                       cpu_0_data_master_qualified_request_motor_3_avalon_slave_0,
                                       cpu_0_data_master_qualified_request_motor_4_avalon_slave_0,
                                       cpu_0_data_master_qualified_request_pio_buzzer_s1,
                                       cpu_0_data_master_qualified_request_pio_hull_fault1_s1,
                                       cpu_0_data_master_qualified_request_pio_hull_fault2_s1,
                                       cpu_0_data_master_qualified_request_pio_hull_fault3_s1,
                                       cpu_0_data_master_qualified_request_pio_hull_fault4_s1,
                                       cpu_0_data_master_qualified_request_pio_infra_s1,
                                       cpu_0_data_master_qualified_request_pio_led_s1,
                                       cpu_0_data_master_qualified_request_pio_nF2401_in_s1,
                                       cpu_0_data_master_qualified_request_pio_nF2401_inout_s1,
                                       cpu_0_data_master_qualified_request_pio_nF2401_out_s1,
                                       cpu_0_data_master_qualified_request_pio_reset_9557_s1,
                                       cpu_0_data_master_qualified_request_pio_scl_24_s1,
                                       cpu_0_data_master_qualified_request_pio_scl_9557_s1,
                                       cpu_0_data_master_qualified_request_pio_sda_24_s1,
                                       cpu_0_data_master_qualified_request_pio_sda_9557_s1,
                                       cpu_0_data_master_qualified_request_pio_shoot_off_s1,
                                       cpu_0_data_master_qualified_request_sdram_0_s1,
                                       cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0,
                                       cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0,
                                       cpu_0_data_master_qualified_request_sysid_control_slave,
                                       cpu_0_data_master_qualified_request_timer_0_s1,
                                       cpu_0_data_master_qualified_request_timer_watchdog_s1,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_PWM_2_infra_pwm_avalon_slave_0,
                                       cpu_0_data_master_read_data_valid_adgetnew2_0_avalon_slave_0,
                                       cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_read_data_valid_epcs_flash_controller_0_epcs_control_port,
                                       cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_read_data_valid_motor_0_avalon_slave_0,
                                       cpu_0_data_master_read_data_valid_motor_1_avalon_slave_0,
                                       cpu_0_data_master_read_data_valid_motor_2_avalon_slave_0,
                                       cpu_0_data_master_read_data_valid_motor_3_avalon_slave_0,
                                       cpu_0_data_master_read_data_valid_motor_4_avalon_slave_0,
                                       cpu_0_data_master_read_data_valid_pio_buzzer_s1,
                                       cpu_0_data_master_read_data_valid_pio_hull_fault1_s1,
                                       cpu_0_data_master_read_data_valid_pio_hull_fault2_s1,
                                       cpu_0_data_master_read_data_valid_pio_hull_fault3_s1,
                                       cpu_0_data_master_read_data_valid_pio_hull_fault4_s1,
                                       cpu_0_data_master_read_data_valid_pio_infra_s1,
                                       cpu_0_data_master_read_data_valid_pio_led_s1,
                                       cpu_0_data_master_read_data_valid_pio_nF2401_in_s1,
                                       cpu_0_data_master_read_data_valid_pio_nF2401_inout_s1,
                                       cpu_0_data_master_read_data_valid_pio_nF2401_out_s1,
                                       cpu_0_data_master_read_data_valid_pio_reset_9557_s1,
                                       cpu_0_data_master_read_data_valid_pio_scl_24_s1,
                                       cpu_0_data_master_read_data_valid_pio_scl_9557_s1,
                                       cpu_0_data_master_read_data_valid_pio_sda_24_s1,
                                       cpu_0_data_master_read_data_valid_pio_sda_9557_s1,
                                       cpu_0_data_master_read_data_valid_pio_shoot_off_s1,
                                       cpu_0_data_master_read_data_valid_sdram_0_s1,
                                       cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                       cpu_0_data_master_read_data_valid_shoot_timer_chip_avalon_slave_0,
                                       cpu_0_data_master_read_data_valid_shoot_timer_shoot_avalon_slave_0,
                                       cpu_0_data_master_read_data_valid_sysid_control_slave,
                                       cpu_0_data_master_read_data_valid_timer_0_s1,
                                       cpu_0_data_master_read_data_valid_timer_watchdog_s1,
                                       cpu_0_data_master_requests_PWM_2_infra_pwm_avalon_slave_0,
                                       cpu_0_data_master_requests_adgetnew2_0_avalon_slave_0,
                                       cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port,
                                       cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_requests_motor_0_avalon_slave_0,
                                       cpu_0_data_master_requests_motor_1_avalon_slave_0,
                                       cpu_0_data_master_requests_motor_2_avalon_slave_0,
                                       cpu_0_data_master_requests_motor_3_avalon_slave_0,
                                       cpu_0_data_master_requests_motor_4_avalon_slave_0,
                                       cpu_0_data_master_requests_pio_buzzer_s1,
                                       cpu_0_data_master_requests_pio_hull_fault1_s1,
                                       cpu_0_data_master_requests_pio_hull_fault2_s1,
                                       cpu_0_data_master_requests_pio_hull_fault3_s1,
                                       cpu_0_data_master_requests_pio_hull_fault4_s1,
                                       cpu_0_data_master_requests_pio_infra_s1,
                                       cpu_0_data_master_requests_pio_led_s1,
                                       cpu_0_data_master_requests_pio_nF2401_in_s1,
                                       cpu_0_data_master_requests_pio_nF2401_inout_s1,
                                       cpu_0_data_master_requests_pio_nF2401_out_s1,
                                       cpu_0_data_master_requests_pio_reset_9557_s1,
                                       cpu_0_data_master_requests_pio_scl_24_s1,
                                       cpu_0_data_master_requests_pio_scl_9557_s1,
                                       cpu_0_data_master_requests_pio_sda_24_s1,
                                       cpu_0_data_master_requests_pio_sda_9557_s1,
                                       cpu_0_data_master_requests_pio_shoot_off_s1,
                                       cpu_0_data_master_requests_sdram_0_s1,
                                       cpu_0_data_master_requests_shoot_timer_chip_avalon_slave_0,
                                       cpu_0_data_master_requests_shoot_timer_shoot_avalon_slave_0,
                                       cpu_0_data_master_requests_sysid_control_slave,
                                       cpu_0_data_master_requests_timer_0_s1,
                                       cpu_0_data_master_requests_timer_watchdog_s1,
                                       cpu_0_data_master_write,
                                       cpu_0_data_master_writedata,
                                       cpu_0_jtag_debug_module_readdata_from_sa,
                                       d1_PWM_2_infra_pwm_avalon_slave_0_end_xfer,
                                       d1_adgetnew2_0_avalon_slave_0_end_xfer,
                                       d1_cpu_0_jtag_debug_module_end_xfer,
                                       d1_epcs_flash_controller_0_epcs_control_port_end_xfer,
                                       d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                       d1_motor_0_avalon_slave_0_end_xfer,
                                       d1_motor_1_avalon_slave_0_end_xfer,
                                       d1_motor_2_avalon_slave_0_end_xfer,
                                       d1_motor_3_avalon_slave_0_end_xfer,
                                       d1_motor_4_avalon_slave_0_end_xfer,
                                       d1_pio_buzzer_s1_end_xfer,
                                       d1_pio_hull_fault1_s1_end_xfer,
                                       d1_pio_hull_fault2_s1_end_xfer,
                                       d1_pio_hull_fault3_s1_end_xfer,
                                       d1_pio_hull_fault4_s1_end_xfer,
                                       d1_pio_infra_s1_end_xfer,
                                       d1_pio_led_s1_end_xfer,
                                       d1_pio_nF2401_in_s1_end_xfer,
                                       d1_pio_nF2401_inout_s1_end_xfer,
                                       d1_pio_nF2401_out_s1_end_xfer,
                                       d1_pio_reset_9557_s1_end_xfer,
                                       d1_pio_scl_24_s1_end_xfer,
                                       d1_pio_scl_9557_s1_end_xfer,
                                       d1_pio_sda_24_s1_end_xfer,
                                       d1_pio_sda_9557_s1_end_xfer,
                                       d1_pio_shoot_off_s1_end_xfer,
                                       d1_sdram_0_s1_end_xfer,
                                       d1_shoot_timer_chip_avalon_slave_0_end_xfer,
                                       d1_shoot_timer_shoot_avalon_slave_0_end_xfer,
                                       d1_sysid_control_slave_end_xfer,
                                       d1_timer_0_s1_end_xfer,
                                       d1_timer_watchdog_s1_end_xfer,
                                       epcs_flash_controller_0_epcs_control_port_irq_from_sa,
                                       epcs_flash_controller_0_epcs_control_port_readdata_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                       motor_0_avalon_slave_0_readdata_from_sa,
                                       motor_1_avalon_slave_0_readdata_from_sa,
                                       motor_2_avalon_slave_0_readdata_from_sa,
                                       motor_3_avalon_slave_0_readdata_from_sa,
                                       motor_4_avalon_slave_0_readdata_from_sa,
                                       pio_buzzer_s1_readdata_from_sa,
                                       pio_hull_fault1_s1_readdata_from_sa,
                                       pio_hull_fault2_s1_readdata_from_sa,
                                       pio_hull_fault3_s1_readdata_from_sa,
                                       pio_hull_fault4_s1_readdata_from_sa,
                                       pio_infra_s1_irq_from_sa,
                                       pio_infra_s1_readdata_from_sa,
                                       pio_led_s1_readdata_from_sa,
                                       pio_nF2401_in_s1_irq_from_sa,
                                       pio_nF2401_in_s1_readdata_from_sa,
                                       pio_nF2401_inout_s1_readdata_from_sa,
                                       pio_nF2401_out_s1_readdata_from_sa,
                                       pio_reset_9557_s1_readdata_from_sa,
                                       pio_scl_24_s1_readdata_from_sa,
                                       pio_scl_9557_s1_readdata_from_sa,
                                       pio_sda_24_s1_readdata_from_sa,
                                       pio_sda_9557_s1_readdata_from_sa,
                                       pio_shoot_off_s1_readdata_from_sa,
                                       reset_n,
                                       sdram_0_s1_readdata_from_sa,
                                       sdram_0_s1_waitrequest_from_sa,
                                       shoot_timer_chip_avalon_slave_0_readdata_from_sa,
                                       shoot_timer_shoot_avalon_slave_0_readdata_from_sa,
                                       sysid_control_slave_readdata_from_sa,
                                       timer_0_s1_irq_from_sa,
                                       timer_0_s1_readdata_from_sa,
                                       timer_watchdog_s1_irq_from_sa,
                                       timer_watchdog_s1_readdata_from_sa,

                                      // outputs:
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_dbs_address,
                                       cpu_0_data_master_dbs_write_16,
                                       cpu_0_data_master_irq,
                                       cpu_0_data_master_latency_counter,
                                       cpu_0_data_master_readdata,
                                       cpu_0_data_master_readdatavalid,
                                       cpu_0_data_master_waitrequest
                                    )
;

  output  [ 24: 0] cpu_0_data_master_address_to_slave;
  output  [  1: 0] cpu_0_data_master_dbs_address;
  output  [ 15: 0] cpu_0_data_master_dbs_write_16;
  output  [ 31: 0] cpu_0_data_master_irq;
  output           cpu_0_data_master_latency_counter;
  output  [ 31: 0] cpu_0_data_master_readdata;
  output           cpu_0_data_master_readdatavalid;
  output           cpu_0_data_master_waitrequest;
  input   [ 15: 0] adgetnew2_0_avalon_slave_0_readdata_from_sa;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1;
  input            cpu_0_data_master_granted_PWM_2_infra_pwm_avalon_slave_0;
  input            cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0;
  input            cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port;
  input            cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_granted_motor_0_avalon_slave_0;
  input            cpu_0_data_master_granted_motor_1_avalon_slave_0;
  input            cpu_0_data_master_granted_motor_2_avalon_slave_0;
  input            cpu_0_data_master_granted_motor_3_avalon_slave_0;
  input            cpu_0_data_master_granted_motor_4_avalon_slave_0;
  input            cpu_0_data_master_granted_pio_buzzer_s1;
  input            cpu_0_data_master_granted_pio_hull_fault1_s1;
  input            cpu_0_data_master_granted_pio_hull_fault2_s1;
  input            cpu_0_data_master_granted_pio_hull_fault3_s1;
  input            cpu_0_data_master_granted_pio_hull_fault4_s1;
  input            cpu_0_data_master_granted_pio_infra_s1;
  input            cpu_0_data_master_granted_pio_led_s1;
  input            cpu_0_data_master_granted_pio_nF2401_in_s1;
  input            cpu_0_data_master_granted_pio_nF2401_inout_s1;
  input            cpu_0_data_master_granted_pio_nF2401_out_s1;
  input            cpu_0_data_master_granted_pio_reset_9557_s1;
  input            cpu_0_data_master_granted_pio_scl_24_s1;
  input            cpu_0_data_master_granted_pio_scl_9557_s1;
  input            cpu_0_data_master_granted_pio_sda_24_s1;
  input            cpu_0_data_master_granted_pio_sda_9557_s1;
  input            cpu_0_data_master_granted_pio_shoot_off_s1;
  input            cpu_0_data_master_granted_sdram_0_s1;
  input            cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0;
  input            cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0;
  input            cpu_0_data_master_granted_sysid_control_slave;
  input            cpu_0_data_master_granted_timer_0_s1;
  input            cpu_0_data_master_granted_timer_watchdog_s1;
  input            cpu_0_data_master_qualified_request_PWM_2_infra_pwm_avalon_slave_0;
  input            cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0;
  input            cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port;
  input            cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_qualified_request_motor_0_avalon_slave_0;
  input            cpu_0_data_master_qualified_request_motor_1_avalon_slave_0;
  input            cpu_0_data_master_qualified_request_motor_2_avalon_slave_0;
  input            cpu_0_data_master_qualified_request_motor_3_avalon_slave_0;
  input            cpu_0_data_master_qualified_request_motor_4_avalon_slave_0;
  input            cpu_0_data_master_qualified_request_pio_buzzer_s1;
  input            cpu_0_data_master_qualified_request_pio_hull_fault1_s1;
  input            cpu_0_data_master_qualified_request_pio_hull_fault2_s1;
  input            cpu_0_data_master_qualified_request_pio_hull_fault3_s1;
  input            cpu_0_data_master_qualified_request_pio_hull_fault4_s1;
  input            cpu_0_data_master_qualified_request_pio_infra_s1;
  input            cpu_0_data_master_qualified_request_pio_led_s1;
  input            cpu_0_data_master_qualified_request_pio_nF2401_in_s1;
  input            cpu_0_data_master_qualified_request_pio_nF2401_inout_s1;
  input            cpu_0_data_master_qualified_request_pio_nF2401_out_s1;
  input            cpu_0_data_master_qualified_request_pio_reset_9557_s1;
  input            cpu_0_data_master_qualified_request_pio_scl_24_s1;
  input            cpu_0_data_master_qualified_request_pio_scl_9557_s1;
  input            cpu_0_data_master_qualified_request_pio_sda_24_s1;
  input            cpu_0_data_master_qualified_request_pio_sda_9557_s1;
  input            cpu_0_data_master_qualified_request_pio_shoot_off_s1;
  input            cpu_0_data_master_qualified_request_sdram_0_s1;
  input            cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0;
  input            cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0;
  input            cpu_0_data_master_qualified_request_sysid_control_slave;
  input            cpu_0_data_master_qualified_request_timer_0_s1;
  input            cpu_0_data_master_qualified_request_timer_watchdog_s1;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_PWM_2_infra_pwm_avalon_slave_0;
  input            cpu_0_data_master_read_data_valid_adgetnew2_0_avalon_slave_0;
  input            cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_read_data_valid_epcs_flash_controller_0_epcs_control_port;
  input            cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_read_data_valid_motor_0_avalon_slave_0;
  input            cpu_0_data_master_read_data_valid_motor_1_avalon_slave_0;
  input            cpu_0_data_master_read_data_valid_motor_2_avalon_slave_0;
  input            cpu_0_data_master_read_data_valid_motor_3_avalon_slave_0;
  input            cpu_0_data_master_read_data_valid_motor_4_avalon_slave_0;
  input            cpu_0_data_master_read_data_valid_pio_buzzer_s1;
  input            cpu_0_data_master_read_data_valid_pio_hull_fault1_s1;
  input            cpu_0_data_master_read_data_valid_pio_hull_fault2_s1;
  input            cpu_0_data_master_read_data_valid_pio_hull_fault3_s1;
  input            cpu_0_data_master_read_data_valid_pio_hull_fault4_s1;
  input            cpu_0_data_master_read_data_valid_pio_infra_s1;
  input            cpu_0_data_master_read_data_valid_pio_led_s1;
  input            cpu_0_data_master_read_data_valid_pio_nF2401_in_s1;
  input            cpu_0_data_master_read_data_valid_pio_nF2401_inout_s1;
  input            cpu_0_data_master_read_data_valid_pio_nF2401_out_s1;
  input            cpu_0_data_master_read_data_valid_pio_reset_9557_s1;
  input            cpu_0_data_master_read_data_valid_pio_scl_24_s1;
  input            cpu_0_data_master_read_data_valid_pio_scl_9557_s1;
  input            cpu_0_data_master_read_data_valid_pio_sda_24_s1;
  input            cpu_0_data_master_read_data_valid_pio_sda_9557_s1;
  input            cpu_0_data_master_read_data_valid_pio_shoot_off_s1;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_read_data_valid_shoot_timer_chip_avalon_slave_0;
  input            cpu_0_data_master_read_data_valid_shoot_timer_shoot_avalon_slave_0;
  input            cpu_0_data_master_read_data_valid_sysid_control_slave;
  input            cpu_0_data_master_read_data_valid_timer_0_s1;
  input            cpu_0_data_master_read_data_valid_timer_watchdog_s1;
  input            cpu_0_data_master_requests_PWM_2_infra_pwm_avalon_slave_0;
  input            cpu_0_data_master_requests_adgetnew2_0_avalon_slave_0;
  input            cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port;
  input            cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_requests_motor_0_avalon_slave_0;
  input            cpu_0_data_master_requests_motor_1_avalon_slave_0;
  input            cpu_0_data_master_requests_motor_2_avalon_slave_0;
  input            cpu_0_data_master_requests_motor_3_avalon_slave_0;
  input            cpu_0_data_master_requests_motor_4_avalon_slave_0;
  input            cpu_0_data_master_requests_pio_buzzer_s1;
  input            cpu_0_data_master_requests_pio_hull_fault1_s1;
  input            cpu_0_data_master_requests_pio_hull_fault2_s1;
  input            cpu_0_data_master_requests_pio_hull_fault3_s1;
  input            cpu_0_data_master_requests_pio_hull_fault4_s1;
  input            cpu_0_data_master_requests_pio_infra_s1;
  input            cpu_0_data_master_requests_pio_led_s1;
  input            cpu_0_data_master_requests_pio_nF2401_in_s1;
  input            cpu_0_data_master_requests_pio_nF2401_inout_s1;
  input            cpu_0_data_master_requests_pio_nF2401_out_s1;
  input            cpu_0_data_master_requests_pio_reset_9557_s1;
  input            cpu_0_data_master_requests_pio_scl_24_s1;
  input            cpu_0_data_master_requests_pio_scl_9557_s1;
  input            cpu_0_data_master_requests_pio_sda_24_s1;
  input            cpu_0_data_master_requests_pio_sda_9557_s1;
  input            cpu_0_data_master_requests_pio_shoot_off_s1;
  input            cpu_0_data_master_requests_sdram_0_s1;
  input            cpu_0_data_master_requests_shoot_timer_chip_avalon_slave_0;
  input            cpu_0_data_master_requests_shoot_timer_shoot_avalon_slave_0;
  input            cpu_0_data_master_requests_sysid_control_slave;
  input            cpu_0_data_master_requests_timer_0_s1;
  input            cpu_0_data_master_requests_timer_watchdog_s1;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_PWM_2_infra_pwm_avalon_slave_0_end_xfer;
  input            d1_adgetnew2_0_avalon_slave_0_end_xfer;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            d1_epcs_flash_controller_0_epcs_control_port_end_xfer;
  input            d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  input            d1_motor_0_avalon_slave_0_end_xfer;
  input            d1_motor_1_avalon_slave_0_end_xfer;
  input            d1_motor_2_avalon_slave_0_end_xfer;
  input            d1_motor_3_avalon_slave_0_end_xfer;
  input            d1_motor_4_avalon_slave_0_end_xfer;
  input            d1_pio_buzzer_s1_end_xfer;
  input            d1_pio_hull_fault1_s1_end_xfer;
  input            d1_pio_hull_fault2_s1_end_xfer;
  input            d1_pio_hull_fault3_s1_end_xfer;
  input            d1_pio_hull_fault4_s1_end_xfer;
  input            d1_pio_infra_s1_end_xfer;
  input            d1_pio_led_s1_end_xfer;
  input            d1_pio_nF2401_in_s1_end_xfer;
  input            d1_pio_nF2401_inout_s1_end_xfer;
  input            d1_pio_nF2401_out_s1_end_xfer;
  input            d1_pio_reset_9557_s1_end_xfer;
  input            d1_pio_scl_24_s1_end_xfer;
  input            d1_pio_scl_9557_s1_end_xfer;
  input            d1_pio_sda_24_s1_end_xfer;
  input            d1_pio_sda_9557_s1_end_xfer;
  input            d1_pio_shoot_off_s1_end_xfer;
  input            d1_sdram_0_s1_end_xfer;
  input            d1_shoot_timer_chip_avalon_slave_0_end_xfer;
  input            d1_shoot_timer_shoot_avalon_slave_0_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            d1_timer_0_s1_end_xfer;
  input            d1_timer_watchdog_s1_end_xfer;
  input            epcs_flash_controller_0_epcs_control_port_irq_from_sa;
  input   [ 31: 0] epcs_flash_controller_0_epcs_control_port_readdata_from_sa;
  input            jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  input   [ 31: 0] motor_0_avalon_slave_0_readdata_from_sa;
  input   [ 31: 0] motor_1_avalon_slave_0_readdata_from_sa;
  input   [ 31: 0] motor_2_avalon_slave_0_readdata_from_sa;
  input   [ 31: 0] motor_3_avalon_slave_0_readdata_from_sa;
  input   [ 31: 0] motor_4_avalon_slave_0_readdata_from_sa;
  input            pio_buzzer_s1_readdata_from_sa;
  input            pio_hull_fault1_s1_readdata_from_sa;
  input            pio_hull_fault2_s1_readdata_from_sa;
  input            pio_hull_fault3_s1_readdata_from_sa;
  input            pio_hull_fault4_s1_readdata_from_sa;
  input            pio_infra_s1_irq_from_sa;
  input            pio_infra_s1_readdata_from_sa;
  input   [  1: 0] pio_led_s1_readdata_from_sa;
  input            pio_nF2401_in_s1_irq_from_sa;
  input            pio_nF2401_in_s1_readdata_from_sa;
  input   [  2: 0] pio_nF2401_inout_s1_readdata_from_sa;
  input   [  2: 0] pio_nF2401_out_s1_readdata_from_sa;
  input            pio_reset_9557_s1_readdata_from_sa;
  input            pio_scl_24_s1_readdata_from_sa;
  input            pio_scl_9557_s1_readdata_from_sa;
  input            pio_sda_24_s1_readdata_from_sa;
  input            pio_sda_9557_s1_readdata_from_sa;
  input            pio_shoot_off_s1_readdata_from_sa;
  input            reset_n;
  input   [ 15: 0] sdram_0_s1_readdata_from_sa;
  input            sdram_0_s1_waitrequest_from_sa;
  input   [ 31: 0] shoot_timer_chip_avalon_slave_0_readdata_from_sa;
  input   [ 31: 0] shoot_timer_shoot_avalon_slave_0_readdata_from_sa;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;
  input            timer_0_s1_irq_from_sa;
  input   [ 15: 0] timer_0_s1_readdata_from_sa;
  input            timer_watchdog_s1_irq_from_sa;
  input   [ 15: 0] timer_watchdog_s1_readdata_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 24: 0] cpu_0_data_master_address_last_time;
  wire    [ 24: 0] cpu_0_data_master_address_to_slave;
  reg     [  3: 0] cpu_0_data_master_byteenable_last_time;
  reg     [  1: 0] cpu_0_data_master_dbs_address;
  wire    [  1: 0] cpu_0_data_master_dbs_increment;
  reg     [  1: 0] cpu_0_data_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_0_data_master_dbs_rdv_counter_inc;
  wire    [ 15: 0] cpu_0_data_master_dbs_write_16;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_is_granted_some_slave;
  reg              cpu_0_data_master_latency_counter;
  wire    [  1: 0] cpu_0_data_master_next_dbs_rdv_counter;
  reg              cpu_0_data_master_read_but_no_slave_selected;
  reg              cpu_0_data_master_read_last_time;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_readdatavalid;
  wire             cpu_0_data_master_run;
  wire             cpu_0_data_master_waitrequest;
  reg              cpu_0_data_master_write_last_time;
  reg     [ 31: 0] cpu_0_data_master_writedata_last_time;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire             latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire             p1_cpu_0_data_master_latency_counter;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_0_data_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  wire             r_3;
  wire             r_4;
  wire             r_5;
  wire             r_6;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((~cpu_0_data_master_qualified_request_PWM_2_infra_pwm_avalon_slave_0 | ~cpu_0_data_master_read | (1 & ~d1_PWM_2_infra_pwm_avalon_slave_0_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_PWM_2_infra_pwm_avalon_slave_0 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0 | ~cpu_0_data_master_requests_adgetnew2_0_avalon_slave_0) & ((~cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0 | ~cpu_0_data_master_read | (1 & ~d1_adgetnew2_0_avalon_slave_0_end_xfer & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0 | ~cpu_0_data_master_write | (1 & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) & (cpu_0_data_master_granted_cpu_0_jtag_debug_module | ~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port | ~cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port) & (cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port | ~cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port) & ((~cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~d1_epcs_flash_controller_0_epcs_control_port_end_xfer & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~d1_epcs_flash_controller_0_epcs_control_port_end_xfer & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave) & ((~cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_data_master_run = r_0 & r_1 & r_2 & r_3 & r_4 & r_5 & r_6;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_motor_0_avalon_slave_0 | ~cpu_0_data_master_requests_motor_0_avalon_slave_0) & ((~cpu_0_data_master_qualified_request_motor_0_avalon_slave_0 | ~cpu_0_data_master_read | (1 & ~d1_motor_0_avalon_slave_0_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_motor_0_avalon_slave_0 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_motor_1_avalon_slave_0 | ~cpu_0_data_master_requests_motor_1_avalon_slave_0) & ((~cpu_0_data_master_qualified_request_motor_1_avalon_slave_0 | ~cpu_0_data_master_read | (1 & ~d1_motor_1_avalon_slave_0_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_motor_1_avalon_slave_0 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_motor_2_avalon_slave_0 | ~cpu_0_data_master_requests_motor_2_avalon_slave_0) & ((~cpu_0_data_master_qualified_request_motor_2_avalon_slave_0 | ~cpu_0_data_master_read | (1 & ~d1_motor_2_avalon_slave_0_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_motor_2_avalon_slave_0 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_motor_3_avalon_slave_0 | ~cpu_0_data_master_requests_motor_3_avalon_slave_0) & ((~cpu_0_data_master_qualified_request_motor_3_avalon_slave_0 | ~cpu_0_data_master_read | (1 & ~d1_motor_3_avalon_slave_0_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_motor_3_avalon_slave_0 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_motor_4_avalon_slave_0 | ~cpu_0_data_master_requests_motor_4_avalon_slave_0) & ((~cpu_0_data_master_qualified_request_motor_4_avalon_slave_0 | ~cpu_0_data_master_read | (1 & ~d1_motor_4_avalon_slave_0_end_xfer & cpu_0_data_master_read)));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = ((~cpu_0_data_master_qualified_request_motor_4_avalon_slave_0 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_buzzer_s1 | ~cpu_0_data_master_requests_pio_buzzer_s1) & ((~cpu_0_data_master_qualified_request_pio_buzzer_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_buzzer_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_pio_buzzer_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_hull_fault1_s1 | ~cpu_0_data_master_requests_pio_hull_fault1_s1) & ((~cpu_0_data_master_qualified_request_pio_hull_fault1_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_hull_fault1_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_pio_hull_fault1_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_hull_fault2_s1 | ~cpu_0_data_master_requests_pio_hull_fault2_s1) & ((~cpu_0_data_master_qualified_request_pio_hull_fault2_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_hull_fault2_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_pio_hull_fault2_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_hull_fault3_s1 | ~cpu_0_data_master_requests_pio_hull_fault3_s1) & ((~cpu_0_data_master_qualified_request_pio_hull_fault3_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_hull_fault3_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_pio_hull_fault3_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_hull_fault4_s1 | ~cpu_0_data_master_requests_pio_hull_fault4_s1) & ((~cpu_0_data_master_qualified_request_pio_hull_fault4_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_hull_fault4_s1_end_xfer & cpu_0_data_master_read)));

  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = ((~cpu_0_data_master_qualified_request_pio_hull_fault4_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_infra_s1 | ~cpu_0_data_master_requests_pio_infra_s1) & ((~cpu_0_data_master_qualified_request_pio_infra_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_infra_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_pio_infra_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_led_s1 | ~cpu_0_data_master_requests_pio_led_s1) & ((~cpu_0_data_master_qualified_request_pio_led_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_led_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_pio_led_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_nF2401_in_s1 | ~cpu_0_data_master_requests_pio_nF2401_in_s1) & ((~cpu_0_data_master_qualified_request_pio_nF2401_in_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_nF2401_in_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_pio_nF2401_in_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_nF2401_inout_s1 | ~cpu_0_data_master_requests_pio_nF2401_inout_s1) & ((~cpu_0_data_master_qualified_request_pio_nF2401_inout_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_nF2401_inout_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_pio_nF2401_inout_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_nF2401_out_s1 | ~cpu_0_data_master_requests_pio_nF2401_out_s1) & ((~cpu_0_data_master_qualified_request_pio_nF2401_out_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_nF2401_out_s1_end_xfer & cpu_0_data_master_read)));

  //r_4 master_run cascaded wait assignment, which is an e_assign
  assign r_4 = ((~cpu_0_data_master_qualified_request_pio_nF2401_out_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_reset_9557_s1 | ~cpu_0_data_master_requests_pio_reset_9557_s1) & ((~cpu_0_data_master_qualified_request_pio_reset_9557_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_reset_9557_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_pio_reset_9557_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_scl_24_s1 | ~cpu_0_data_master_requests_pio_scl_24_s1) & ((~cpu_0_data_master_qualified_request_pio_scl_24_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_scl_24_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_pio_scl_24_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_scl_9557_s1 | ~cpu_0_data_master_requests_pio_scl_9557_s1) & ((~cpu_0_data_master_qualified_request_pio_scl_9557_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_scl_9557_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_pio_scl_9557_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_sda_24_s1 | ~cpu_0_data_master_requests_pio_sda_24_s1) & ((~cpu_0_data_master_qualified_request_pio_sda_24_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_sda_24_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_pio_sda_24_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_sda_9557_s1 | ~cpu_0_data_master_requests_pio_sda_9557_s1) & ((~cpu_0_data_master_qualified_request_pio_sda_9557_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_sda_9557_s1_end_xfer & cpu_0_data_master_read)));

  //r_5 master_run cascaded wait assignment, which is an e_assign
  assign r_5 = ((~cpu_0_data_master_qualified_request_pio_sda_9557_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_shoot_off_s1 | ~cpu_0_data_master_requests_pio_shoot_off_s1) & ((~cpu_0_data_master_qualified_request_pio_shoot_off_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_shoot_off_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_pio_shoot_off_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_sdram_0_s1 | (cpu_0_data_master_write & !cpu_0_data_master_byteenable_sdram_0_s1 & cpu_0_data_master_dbs_address[1]) | ~cpu_0_data_master_requests_sdram_0_s1) & (cpu_0_data_master_granted_sdram_0_s1 | ~cpu_0_data_master_qualified_request_sdram_0_s1) & ((~cpu_0_data_master_qualified_request_sdram_0_s1 | ~cpu_0_data_master_read | (1 & ~sdram_0_s1_waitrequest_from_sa & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_sdram_0_s1 | ~cpu_0_data_master_write | (1 & ~sdram_0_s1_waitrequest_from_sa & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0 | ~cpu_0_data_master_requests_shoot_timer_chip_avalon_slave_0) & ((~cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0 | ~cpu_0_data_master_read | (1 & ~d1_shoot_timer_chip_avalon_slave_0_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0 | ~cpu_0_data_master_requests_shoot_timer_shoot_avalon_slave_0) & ((~cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0 | ~cpu_0_data_master_read | (1 & ~d1_shoot_timer_shoot_avalon_slave_0_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_sysid_control_slave | ~cpu_0_data_master_requests_sysid_control_slave);

  //r_6 master_run cascaded wait assignment, which is an e_assign
  assign r_6 = ((~cpu_0_data_master_qualified_request_sysid_control_slave | ~cpu_0_data_master_read | (1 & ~d1_sysid_control_slave_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_sysid_control_slave | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_timer_0_s1 | ~cpu_0_data_master_requests_timer_0_s1) & ((~cpu_0_data_master_qualified_request_timer_0_s1 | ~cpu_0_data_master_read | (1 & ~d1_timer_0_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_timer_0_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_timer_watchdog_s1 | ~cpu_0_data_master_requests_timer_watchdog_s1) & ((~cpu_0_data_master_qualified_request_timer_watchdog_s1 | ~cpu_0_data_master_read | (1 & ~d1_timer_watchdog_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_timer_watchdog_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_data_master_address_to_slave = cpu_0_data_master_address[24 : 0];

  //cpu_0_data_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_but_no_slave_selected <= 0;
      else 
        cpu_0_data_master_read_but_no_slave_selected <= cpu_0_data_master_read & cpu_0_data_master_run & ~cpu_0_data_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_0_data_master_is_granted_some_slave = cpu_0_data_master_granted_PWM_2_infra_pwm_avalon_slave_0 |
    cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0 |
    cpu_0_data_master_granted_cpu_0_jtag_debug_module |
    cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port |
    cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave |
    cpu_0_data_master_granted_motor_0_avalon_slave_0 |
    cpu_0_data_master_granted_motor_1_avalon_slave_0 |
    cpu_0_data_master_granted_motor_2_avalon_slave_0 |
    cpu_0_data_master_granted_motor_3_avalon_slave_0 |
    cpu_0_data_master_granted_motor_4_avalon_slave_0 |
    cpu_0_data_master_granted_pio_buzzer_s1 |
    cpu_0_data_master_granted_pio_hull_fault1_s1 |
    cpu_0_data_master_granted_pio_hull_fault2_s1 |
    cpu_0_data_master_granted_pio_hull_fault3_s1 |
    cpu_0_data_master_granted_pio_hull_fault4_s1 |
    cpu_0_data_master_granted_pio_infra_s1 |
    cpu_0_data_master_granted_pio_led_s1 |
    cpu_0_data_master_granted_pio_nF2401_in_s1 |
    cpu_0_data_master_granted_pio_nF2401_inout_s1 |
    cpu_0_data_master_granted_pio_nF2401_out_s1 |
    cpu_0_data_master_granted_pio_reset_9557_s1 |
    cpu_0_data_master_granted_pio_scl_24_s1 |
    cpu_0_data_master_granted_pio_scl_9557_s1 |
    cpu_0_data_master_granted_pio_sda_24_s1 |
    cpu_0_data_master_granted_pio_sda_9557_s1 |
    cpu_0_data_master_granted_pio_shoot_off_s1 |
    cpu_0_data_master_granted_sdram_0_s1 |
    cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0 |
    cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0 |
    cpu_0_data_master_granted_sysid_control_slave |
    cpu_0_data_master_granted_timer_0_s1 |
    cpu_0_data_master_granted_timer_watchdog_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_0_data_master_readdatavalid = cpu_0_data_master_read_data_valid_sdram_0_s1 & dbs_rdv_counter_overflow;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_0_data_master_readdatavalid = cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_PWM_2_infra_pwm_avalon_slave_0 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    (cpu_0_data_master_read_data_valid_adgetnew2_0_avalon_slave_0 & dbs_counter_overflow) |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_epcs_flash_controller_0_epcs_control_port |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_motor_0_avalon_slave_0 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_motor_1_avalon_slave_0 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_motor_2_avalon_slave_0 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_motor_3_avalon_slave_0 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_motor_4_avalon_slave_0 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_buzzer_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_hull_fault1_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_hull_fault2_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_hull_fault3_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_hull_fault4_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_infra_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_led_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_nF2401_in_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_nF2401_inout_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_nF2401_out_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_reset_9557_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_scl_24_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_scl_9557_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_sda_24_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_sda_9557_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_shoot_off_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_shoot_timer_chip_avalon_slave_0 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_shoot_timer_shoot_avalon_slave_0 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_sysid_control_slave |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_timer_0_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_timer_watchdog_s1;

  //actual waitrequest port, which is an e_assign
  assign cpu_0_data_master_waitrequest = ~cpu_0_data_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_latency_counter <= 0;
      else 
        cpu_0_data_master_latency_counter <= p1_cpu_0_data_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_0_data_master_latency_counter = ((cpu_0_data_master_run & cpu_0_data_master_read))? latency_load_value :
    (cpu_0_data_master_latency_counter)? cpu_0_data_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = adgetnew2_0_avalon_slave_0_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //cpu_0/data_master readdata mux, which is an e_mux
  assign cpu_0_data_master_readdata = ({32 {~(cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0 & cpu_0_data_master_read)}} | {adgetnew2_0_avalon_slave_0_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~(cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module & cpu_0_data_master_read)}} | cpu_0_jtag_debug_module_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port & cpu_0_data_master_read)}} | epcs_flash_controller_0_epcs_control_port_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read)}} | jtag_uart_0_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_motor_0_avalon_slave_0 & cpu_0_data_master_read)}} | motor_0_avalon_slave_0_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_motor_1_avalon_slave_0 & cpu_0_data_master_read)}} | motor_1_avalon_slave_0_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_motor_2_avalon_slave_0 & cpu_0_data_master_read)}} | motor_2_avalon_slave_0_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_motor_3_avalon_slave_0 & cpu_0_data_master_read)}} | motor_3_avalon_slave_0_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_motor_4_avalon_slave_0 & cpu_0_data_master_read)}} | motor_4_avalon_slave_0_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_buzzer_s1 & cpu_0_data_master_read)}} | pio_buzzer_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_hull_fault1_s1 & cpu_0_data_master_read)}} | pio_hull_fault1_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_hull_fault2_s1 & cpu_0_data_master_read)}} | pio_hull_fault2_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_hull_fault3_s1 & cpu_0_data_master_read)}} | pio_hull_fault3_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_hull_fault4_s1 & cpu_0_data_master_read)}} | pio_hull_fault4_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_infra_s1 & cpu_0_data_master_read)}} | pio_infra_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_led_s1 & cpu_0_data_master_read)}} | pio_led_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_nF2401_in_s1 & cpu_0_data_master_read)}} | pio_nF2401_in_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_nF2401_inout_s1 & cpu_0_data_master_read)}} | pio_nF2401_inout_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_nF2401_out_s1 & cpu_0_data_master_read)}} | pio_nF2401_out_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_reset_9557_s1 & cpu_0_data_master_read)}} | pio_reset_9557_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_scl_24_s1 & cpu_0_data_master_read)}} | pio_scl_24_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_scl_9557_s1 & cpu_0_data_master_read)}} | pio_scl_9557_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_sda_24_s1 & cpu_0_data_master_read)}} | pio_sda_24_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_sda_9557_s1 & cpu_0_data_master_read)}} | pio_sda_9557_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_shoot_off_s1 & cpu_0_data_master_read)}} | pio_shoot_off_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_read_data_valid_sdram_0_s1}} | {sdram_0_s1_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~(cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0 & cpu_0_data_master_read)}} | shoot_timer_chip_avalon_slave_0_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0 & cpu_0_data_master_read)}} | shoot_timer_shoot_avalon_slave_0_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_sysid_control_slave & cpu_0_data_master_read)}} | sysid_control_slave_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_timer_0_s1 & cpu_0_data_master_read)}} | timer_0_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_timer_watchdog_s1 & cpu_0_data_master_read)}} | timer_watchdog_s1_readdata_from_sa);

  //dbs count increment, which is an e_mux
  assign cpu_0_data_master_dbs_increment = (cpu_0_data_master_requests_adgetnew2_0_avalon_slave_0)? 2 :
    (cpu_0_data_master_requests_sdram_0_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_0_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_0_data_master_dbs_address + cpu_0_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_0_data_master_dbs_address <= next_dbs_address;
    end


  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0 & cpu_0_data_master_read & 1 & 1 & ~d1_adgetnew2_0_avalon_slave_0_end_xfer) |
    (cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0 & cpu_0_data_master_write & 1 & 1) |
    (((~0) & cpu_0_data_master_requests_sdram_0_s1 & cpu_0_data_master_write & !cpu_0_data_master_byteenable_sdram_0_s1)) |
    (cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_read & 1 & 1 & ~sdram_0_s1_waitrequest_from_sa) |
    (cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_write & 1 & 1 & ~sdram_0_s1_waitrequest_from_sa);

  //irq assign, which is an e_assign
  assign cpu_0_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    pio_nF2401_in_s1_irq_from_sa,
    pio_infra_s1_irq_from_sa,
    timer_watchdog_s1_irq_from_sa,
    timer_0_s1_irq_from_sa,
    epcs_flash_controller_0_epcs_control_port_irq_from_sa,
    jtag_uart_0_avalon_jtag_slave_irq_from_sa};

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = sdram_0_s1_readdata_from_sa;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_0_data_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign cpu_0_data_master_dbs_write_16 = (cpu_0_data_master_dbs_address[1])? cpu_0_data_master_writedata[31 : 16] :
    cpu_0_data_master_writedata[15 : 0];

  //p1 dbs rdv counter, which is an e_assign
  assign cpu_0_data_master_next_dbs_rdv_counter = cpu_0_data_master_dbs_rdv_counter + cpu_0_data_master_dbs_rdv_counter_inc;

  //cpu_0_data_master_rdv_inc_mux, which is an e_mux
  assign cpu_0_data_master_dbs_rdv_counter_inc = 2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_0_data_master_read_data_valid_sdram_0_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_0_data_master_dbs_rdv_counter <= cpu_0_data_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_0_data_master_dbs_rdv_counter[1] & ~cpu_0_data_master_next_dbs_rdv_counter[1];


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0_data_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_address_last_time <= 0;
      else 
        cpu_0_data_master_address_last_time <= cpu_0_data_master_address;
    end


  //cpu_0/data_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_0_data_master_waitrequest & (cpu_0_data_master_read | cpu_0_data_master_write);
    end


  //cpu_0_data_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_address != cpu_0_data_master_address_last_time))
        begin
          $write("%0d ns: cpu_0_data_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_data_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_byteenable_last_time <= 0;
      else 
        cpu_0_data_master_byteenable_last_time <= cpu_0_data_master_byteenable;
    end


  //cpu_0_data_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_byteenable != cpu_0_data_master_byteenable_last_time))
        begin
          $write("%0d ns: cpu_0_data_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_data_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_last_time <= 0;
      else 
        cpu_0_data_master_read_last_time <= cpu_0_data_master_read;
    end


  //cpu_0_data_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_read != cpu_0_data_master_read_last_time))
        begin
          $write("%0d ns: cpu_0_data_master_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_data_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_write_last_time <= 0;
      else 
        cpu_0_data_master_write_last_time <= cpu_0_data_master_write;
    end


  //cpu_0_data_master_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_write != cpu_0_data_master_write_last_time))
        begin
          $write("%0d ns: cpu_0_data_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_data_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_writedata_last_time <= 0;
      else 
        cpu_0_data_master_writedata_last_time <= cpu_0_data_master_writedata;
    end


  //cpu_0_data_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_writedata != cpu_0_data_master_writedata_last_time) & cpu_0_data_master_write)
        begin
          $write("%0d ns: cpu_0_data_master_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_instruction_master_arbitrator (
                                             // inputs:
                                              clk,
                                              cpu_0_instruction_master_address,
                                              cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port,
                                              cpu_0_instruction_master_granted_sdram_0_s1,
                                              cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port,
                                              cpu_0_instruction_master_qualified_request_sdram_0_s1,
                                              cpu_0_instruction_master_read,
                                              cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_read_data_valid_epcs_flash_controller_0_epcs_control_port,
                                              cpu_0_instruction_master_read_data_valid_sdram_0_s1,
                                              cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register,
                                              cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port,
                                              cpu_0_instruction_master_requests_sdram_0_s1,
                                              cpu_0_jtag_debug_module_readdata_from_sa,
                                              d1_cpu_0_jtag_debug_module_end_xfer,
                                              d1_epcs_flash_controller_0_epcs_control_port_end_xfer,
                                              d1_sdram_0_s1_end_xfer,
                                              epcs_flash_controller_0_epcs_control_port_readdata_from_sa,
                                              reset_n,
                                              sdram_0_s1_readdata_from_sa,
                                              sdram_0_s1_waitrequest_from_sa,

                                             // outputs:
                                              cpu_0_instruction_master_address_to_slave,
                                              cpu_0_instruction_master_dbs_address,
                                              cpu_0_instruction_master_latency_counter,
                                              cpu_0_instruction_master_readdata,
                                              cpu_0_instruction_master_readdatavalid,
                                              cpu_0_instruction_master_waitrequest
                                           )
;

  output  [ 24: 0] cpu_0_instruction_master_address_to_slave;
  output  [  1: 0] cpu_0_instruction_master_dbs_address;
  output           cpu_0_instruction_master_latency_counter;
  output  [ 31: 0] cpu_0_instruction_master_readdata;
  output           cpu_0_instruction_master_readdatavalid;
  output           cpu_0_instruction_master_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_0_instruction_master_address;
  input            cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port;
  input            cpu_0_instruction_master_granted_sdram_0_s1;
  input            cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port;
  input            cpu_0_instruction_master_qualified_request_sdram_0_s1;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_read_data_valid_epcs_flash_controller_0_epcs_control_port;
  input            cpu_0_instruction_master_read_data_valid_sdram_0_s1;
  input            cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port;
  input            cpu_0_instruction_master_requests_sdram_0_s1;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            d1_epcs_flash_controller_0_epcs_control_port_end_xfer;
  input            d1_sdram_0_s1_end_xfer;
  input   [ 31: 0] epcs_flash_controller_0_epcs_control_port_readdata_from_sa;
  input            reset_n;
  input   [ 15: 0] sdram_0_s1_readdata_from_sa;
  input            sdram_0_s1_waitrequest_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 24: 0] cpu_0_instruction_master_address_last_time;
  wire    [ 24: 0] cpu_0_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_0_instruction_master_dbs_address;
  wire    [  1: 0] cpu_0_instruction_master_dbs_increment;
  reg     [  1: 0] cpu_0_instruction_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_0_instruction_master_dbs_rdv_counter_inc;
  wire             cpu_0_instruction_master_is_granted_some_slave;
  reg              cpu_0_instruction_master_latency_counter;
  wire    [  1: 0] cpu_0_instruction_master_next_dbs_rdv_counter;
  reg              cpu_0_instruction_master_read_but_no_slave_selected;
  reg              cpu_0_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_readdatavalid;
  wire             cpu_0_instruction_master_run;
  wire             cpu_0_instruction_master_waitrequest;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire             latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire             p1_cpu_0_instruction_master_latency_counter;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_0_instruction_master_readdatavalid;
  wire             r_0;
  wire             r_5;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) & (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port | ~cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port) & (cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port | ~cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port) & ((~cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port | ~(cpu_0_instruction_master_read) | (1 & ~d1_epcs_flash_controller_0_epcs_control_port_end_xfer & (cpu_0_instruction_master_read))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_instruction_master_run = r_0 & r_5;

  //r_5 master_run cascaded wait assignment, which is an e_assign
  assign r_5 = 1 & (cpu_0_instruction_master_qualified_request_sdram_0_s1 | ~cpu_0_instruction_master_requests_sdram_0_s1) & (cpu_0_instruction_master_granted_sdram_0_s1 | ~cpu_0_instruction_master_qualified_request_sdram_0_s1) & ((~cpu_0_instruction_master_qualified_request_sdram_0_s1 | ~cpu_0_instruction_master_read | (1 & ~sdram_0_s1_waitrequest_from_sa & (cpu_0_instruction_master_dbs_address[1]) & cpu_0_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_instruction_master_address_to_slave = cpu_0_instruction_master_address[24 : 0];

  //cpu_0_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_0_instruction_master_read_but_no_slave_selected <= cpu_0_instruction_master_read & cpu_0_instruction_master_run & ~cpu_0_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_0_instruction_master_is_granted_some_slave = cpu_0_instruction_master_granted_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port |
    cpu_0_instruction_master_granted_sdram_0_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_0_instruction_master_readdatavalid = cpu_0_instruction_master_read_data_valid_sdram_0_s1 & dbs_rdv_counter_overflow;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_0_instruction_master_readdatavalid = cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid |
    cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid |
    cpu_0_instruction_master_read_data_valid_epcs_flash_controller_0_epcs_control_port |
    cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid;

  //cpu_0/instruction_master readdata mux, which is an e_mux
  assign cpu_0_instruction_master_readdata = ({32 {~(cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module & cpu_0_instruction_master_read)}} | cpu_0_jtag_debug_module_readdata_from_sa) &
    ({32 {~(cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port & cpu_0_instruction_master_read)}} | epcs_flash_controller_0_epcs_control_port_readdata_from_sa) &
    ({32 {~cpu_0_instruction_master_read_data_valid_sdram_0_s1}} | {sdram_0_s1_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_0_instruction_master_waitrequest = ~cpu_0_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_latency_counter <= 0;
      else 
        cpu_0_instruction_master_latency_counter <= p1_cpu_0_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_0_instruction_master_latency_counter = ((cpu_0_instruction_master_run & cpu_0_instruction_master_read))? latency_load_value :
    (cpu_0_instruction_master_latency_counter)? cpu_0_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = sdram_0_s1_readdata_from_sa;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_0_instruction_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign cpu_0_instruction_master_dbs_increment = (cpu_0_instruction_master_requests_sdram_0_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_0_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_0_instruction_master_dbs_address + cpu_0_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_0_instruction_master_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign cpu_0_instruction_master_next_dbs_rdv_counter = cpu_0_instruction_master_dbs_rdv_counter + cpu_0_instruction_master_dbs_rdv_counter_inc;

  //cpu_0_instruction_master_rdv_inc_mux, which is an e_mux
  assign cpu_0_instruction_master_dbs_rdv_counter_inc = 2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_0_instruction_master_read_data_valid_sdram_0_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_0_instruction_master_dbs_rdv_counter <= cpu_0_instruction_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_0_instruction_master_dbs_rdv_counter[1] & ~cpu_0_instruction_master_next_dbs_rdv_counter[1];

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = cpu_0_instruction_master_granted_sdram_0_s1 & cpu_0_instruction_master_read & 1 & 1 & ~sdram_0_s1_waitrequest_from_sa;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_address_last_time <= 0;
      else 
        cpu_0_instruction_master_address_last_time <= cpu_0_instruction_master_address;
    end


  //cpu_0/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_0_instruction_master_waitrequest & (cpu_0_instruction_master_read);
    end


  //cpu_0_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_address != cpu_0_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_last_time <= 0;
      else 
        cpu_0_instruction_master_read_last_time <= cpu_0_instruction_master_read;
    end


  //cpu_0_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_read != cpu_0_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module epcs_flash_controller_0_epcs_control_port_arbitrator (
                                                              // inputs:
                                                               clk,
                                                               cpu_0_data_master_address_to_slave,
                                                               cpu_0_data_master_latency_counter,
                                                               cpu_0_data_master_read,
                                                               cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                                               cpu_0_data_master_write,
                                                               cpu_0_data_master_writedata,
                                                               cpu_0_instruction_master_address_to_slave,
                                                               cpu_0_instruction_master_latency_counter,
                                                               cpu_0_instruction_master_read,
                                                               cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register,
                                                               epcs_flash_controller_0_epcs_control_port_dataavailable,
                                                               epcs_flash_controller_0_epcs_control_port_endofpacket,
                                                               epcs_flash_controller_0_epcs_control_port_irq,
                                                               epcs_flash_controller_0_epcs_control_port_readdata,
                                                               epcs_flash_controller_0_epcs_control_port_readyfordata,
                                                               reset_n,

                                                              // outputs:
                                                               cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port,
                                                               cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port,
                                                               cpu_0_data_master_read_data_valid_epcs_flash_controller_0_epcs_control_port,
                                                               cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port,
                                                               cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port,
                                                               cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port,
                                                               cpu_0_instruction_master_read_data_valid_epcs_flash_controller_0_epcs_control_port,
                                                               cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port,
                                                               d1_epcs_flash_controller_0_epcs_control_port_end_xfer,
                                                               epcs_flash_controller_0_epcs_control_port_address,
                                                               epcs_flash_controller_0_epcs_control_port_chipselect,
                                                               epcs_flash_controller_0_epcs_control_port_dataavailable_from_sa,
                                                               epcs_flash_controller_0_epcs_control_port_endofpacket_from_sa,
                                                               epcs_flash_controller_0_epcs_control_port_irq_from_sa,
                                                               epcs_flash_controller_0_epcs_control_port_read_n,
                                                               epcs_flash_controller_0_epcs_control_port_readdata_from_sa,
                                                               epcs_flash_controller_0_epcs_control_port_readyfordata_from_sa,
                                                               epcs_flash_controller_0_epcs_control_port_reset_n,
                                                               epcs_flash_controller_0_epcs_control_port_write_n,
                                                               epcs_flash_controller_0_epcs_control_port_writedata
                                                            )
;

  output           cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port;
  output           cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port;
  output           cpu_0_data_master_read_data_valid_epcs_flash_controller_0_epcs_control_port;
  output           cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port;
  output           cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port;
  output           cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port;
  output           cpu_0_instruction_master_read_data_valid_epcs_flash_controller_0_epcs_control_port;
  output           cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port;
  output           d1_epcs_flash_controller_0_epcs_control_port_end_xfer;
  output  [  8: 0] epcs_flash_controller_0_epcs_control_port_address;
  output           epcs_flash_controller_0_epcs_control_port_chipselect;
  output           epcs_flash_controller_0_epcs_control_port_dataavailable_from_sa;
  output           epcs_flash_controller_0_epcs_control_port_endofpacket_from_sa;
  output           epcs_flash_controller_0_epcs_control_port_irq_from_sa;
  output           epcs_flash_controller_0_epcs_control_port_read_n;
  output  [ 31: 0] epcs_flash_controller_0_epcs_control_port_readdata_from_sa;
  output           epcs_flash_controller_0_epcs_control_port_readyfordata_from_sa;
  output           epcs_flash_controller_0_epcs_control_port_reset_n;
  output           epcs_flash_controller_0_epcs_control_port_write_n;
  output  [ 31: 0] epcs_flash_controller_0_epcs_control_port_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  input            epcs_flash_controller_0_epcs_control_port_dataavailable;
  input            epcs_flash_controller_0_epcs_control_port_endofpacket;
  input            epcs_flash_controller_0_epcs_control_port_irq;
  input   [ 31: 0] epcs_flash_controller_0_epcs_control_port_readdata;
  input            epcs_flash_controller_0_epcs_control_port_readyfordata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_data_master_read_data_valid_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_data_master_saved_grant_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_instruction_master_read_data_valid_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_instruction_master_saved_grant_epcs_flash_controller_0_epcs_control_port;
  reg              d1_epcs_flash_controller_0_epcs_control_port_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_epcs_flash_controller_0_epcs_control_port;
  wire    [  8: 0] epcs_flash_controller_0_epcs_control_port_address;
  wire             epcs_flash_controller_0_epcs_control_port_allgrants;
  wire             epcs_flash_controller_0_epcs_control_port_allow_new_arb_cycle;
  wire             epcs_flash_controller_0_epcs_control_port_any_bursting_master_saved_grant;
  wire             epcs_flash_controller_0_epcs_control_port_any_continuerequest;
  reg     [  1: 0] epcs_flash_controller_0_epcs_control_port_arb_addend;
  wire             epcs_flash_controller_0_epcs_control_port_arb_counter_enable;
  reg     [  1: 0] epcs_flash_controller_0_epcs_control_port_arb_share_counter;
  wire    [  1: 0] epcs_flash_controller_0_epcs_control_port_arb_share_counter_next_value;
  wire    [  1: 0] epcs_flash_controller_0_epcs_control_port_arb_share_set_values;
  wire    [  1: 0] epcs_flash_controller_0_epcs_control_port_arb_winner;
  wire             epcs_flash_controller_0_epcs_control_port_arbitration_holdoff_internal;
  wire             epcs_flash_controller_0_epcs_control_port_beginbursttransfer_internal;
  wire             epcs_flash_controller_0_epcs_control_port_begins_xfer;
  wire             epcs_flash_controller_0_epcs_control_port_chipselect;
  wire    [  3: 0] epcs_flash_controller_0_epcs_control_port_chosen_master_double_vector;
  wire    [  1: 0] epcs_flash_controller_0_epcs_control_port_chosen_master_rot_left;
  wire             epcs_flash_controller_0_epcs_control_port_dataavailable_from_sa;
  wire             epcs_flash_controller_0_epcs_control_port_end_xfer;
  wire             epcs_flash_controller_0_epcs_control_port_endofpacket_from_sa;
  wire             epcs_flash_controller_0_epcs_control_port_firsttransfer;
  wire    [  1: 0] epcs_flash_controller_0_epcs_control_port_grant_vector;
  wire             epcs_flash_controller_0_epcs_control_port_in_a_read_cycle;
  wire             epcs_flash_controller_0_epcs_control_port_in_a_write_cycle;
  wire             epcs_flash_controller_0_epcs_control_port_irq_from_sa;
  wire    [  1: 0] epcs_flash_controller_0_epcs_control_port_master_qreq_vector;
  wire             epcs_flash_controller_0_epcs_control_port_non_bursting_master_requests;
  wire             epcs_flash_controller_0_epcs_control_port_read_n;
  wire    [ 31: 0] epcs_flash_controller_0_epcs_control_port_readdata_from_sa;
  wire             epcs_flash_controller_0_epcs_control_port_readyfordata_from_sa;
  reg              epcs_flash_controller_0_epcs_control_port_reg_firsttransfer;
  wire             epcs_flash_controller_0_epcs_control_port_reset_n;
  reg     [  1: 0] epcs_flash_controller_0_epcs_control_port_saved_chosen_master_vector;
  reg              epcs_flash_controller_0_epcs_control_port_slavearbiterlockenable;
  wire             epcs_flash_controller_0_epcs_control_port_slavearbiterlockenable2;
  wire             epcs_flash_controller_0_epcs_control_port_unreg_firsttransfer;
  wire             epcs_flash_controller_0_epcs_control_port_waits_for_read;
  wire             epcs_flash_controller_0_epcs_control_port_waits_for_write;
  wire             epcs_flash_controller_0_epcs_control_port_write_n;
  wire    [ 31: 0] epcs_flash_controller_0_epcs_control_port_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_epcs_flash_controller_0_epcs_control_port;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_epcs_flash_controller_0_epcs_control_port;
  wire    [ 24: 0] shifted_address_to_epcs_flash_controller_0_epcs_control_port_from_cpu_0_data_master;
  wire    [ 24: 0] shifted_address_to_epcs_flash_controller_0_epcs_control_port_from_cpu_0_instruction_master;
  wire             wait_for_epcs_flash_controller_0_epcs_control_port_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~epcs_flash_controller_0_epcs_control_port_end_xfer;
    end


  assign epcs_flash_controller_0_epcs_control_port_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port | cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port));
  //assign epcs_flash_controller_0_epcs_control_port_readdata_from_sa = epcs_flash_controller_0_epcs_control_port_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_readdata_from_sa = epcs_flash_controller_0_epcs_control_port_readdata;

  assign cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port = ({cpu_0_data_master_address_to_slave[24 : 11] , 11'b0} == 25'h1001800) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign epcs_flash_controller_0_epcs_control_port_dataavailable_from_sa = epcs_flash_controller_0_epcs_control_port_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_dataavailable_from_sa = epcs_flash_controller_0_epcs_control_port_dataavailable;

  //assign epcs_flash_controller_0_epcs_control_port_readyfordata_from_sa = epcs_flash_controller_0_epcs_control_port_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_readyfordata_from_sa = epcs_flash_controller_0_epcs_control_port_readyfordata;

  //epcs_flash_controller_0_epcs_control_port_arb_share_counter set values, which is an e_mux
  assign epcs_flash_controller_0_epcs_control_port_arb_share_set_values = 1;

  //epcs_flash_controller_0_epcs_control_port_non_bursting_master_requests mux, which is an e_mux
  assign epcs_flash_controller_0_epcs_control_port_non_bursting_master_requests = cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port |
    cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port |
    cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port |
    cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port;

  //epcs_flash_controller_0_epcs_control_port_any_bursting_master_saved_grant mux, which is an e_mux
  assign epcs_flash_controller_0_epcs_control_port_any_bursting_master_saved_grant = 0;

  //epcs_flash_controller_0_epcs_control_port_arb_share_counter_next_value assignment, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_arb_share_counter_next_value = epcs_flash_controller_0_epcs_control_port_firsttransfer ? (epcs_flash_controller_0_epcs_control_port_arb_share_set_values - 1) : |epcs_flash_controller_0_epcs_control_port_arb_share_counter ? (epcs_flash_controller_0_epcs_control_port_arb_share_counter - 1) : 0;

  //epcs_flash_controller_0_epcs_control_port_allgrants all slave grants, which is an e_mux
  assign epcs_flash_controller_0_epcs_control_port_allgrants = (|epcs_flash_controller_0_epcs_control_port_grant_vector) |
    (|epcs_flash_controller_0_epcs_control_port_grant_vector) |
    (|epcs_flash_controller_0_epcs_control_port_grant_vector) |
    (|epcs_flash_controller_0_epcs_control_port_grant_vector);

  //epcs_flash_controller_0_epcs_control_port_end_xfer assignment, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_end_xfer = ~(epcs_flash_controller_0_epcs_control_port_waits_for_read | epcs_flash_controller_0_epcs_control_port_waits_for_write);

  //end_xfer_arb_share_counter_term_epcs_flash_controller_0_epcs_control_port arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_epcs_flash_controller_0_epcs_control_port = epcs_flash_controller_0_epcs_control_port_end_xfer & (~epcs_flash_controller_0_epcs_control_port_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //epcs_flash_controller_0_epcs_control_port_arb_share_counter arbitration counter enable, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_arb_counter_enable = (end_xfer_arb_share_counter_term_epcs_flash_controller_0_epcs_control_port & epcs_flash_controller_0_epcs_control_port_allgrants) | (end_xfer_arb_share_counter_term_epcs_flash_controller_0_epcs_control_port & ~epcs_flash_controller_0_epcs_control_port_non_bursting_master_requests);

  //epcs_flash_controller_0_epcs_control_port_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_flash_controller_0_epcs_control_port_arb_share_counter <= 0;
      else if (epcs_flash_controller_0_epcs_control_port_arb_counter_enable)
          epcs_flash_controller_0_epcs_control_port_arb_share_counter <= epcs_flash_controller_0_epcs_control_port_arb_share_counter_next_value;
    end


  //epcs_flash_controller_0_epcs_control_port_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_flash_controller_0_epcs_control_port_slavearbiterlockenable <= 0;
      else if ((|epcs_flash_controller_0_epcs_control_port_master_qreq_vector & end_xfer_arb_share_counter_term_epcs_flash_controller_0_epcs_control_port) | (end_xfer_arb_share_counter_term_epcs_flash_controller_0_epcs_control_port & ~epcs_flash_controller_0_epcs_control_port_non_bursting_master_requests))
          epcs_flash_controller_0_epcs_control_port_slavearbiterlockenable <= |epcs_flash_controller_0_epcs_control_port_arb_share_counter_next_value;
    end


  //cpu_0/data_master epcs_flash_controller_0/epcs_control_port arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = epcs_flash_controller_0_epcs_control_port_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //epcs_flash_controller_0_epcs_control_port_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_slavearbiterlockenable2 = |epcs_flash_controller_0_epcs_control_port_arb_share_counter_next_value;

  //cpu_0/data_master epcs_flash_controller_0/epcs_control_port arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = epcs_flash_controller_0_epcs_control_port_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master epcs_flash_controller_0/epcs_control_port arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = epcs_flash_controller_0_epcs_control_port_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master epcs_flash_controller_0/epcs_control_port arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = epcs_flash_controller_0_epcs_control_port_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted epcs_flash_controller_0/epcs_control_port last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_epcs_flash_controller_0_epcs_control_port <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_epcs_flash_controller_0_epcs_control_port <= cpu_0_instruction_master_saved_grant_epcs_flash_controller_0_epcs_control_port ? 1 : (epcs_flash_controller_0_epcs_control_port_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_epcs_flash_controller_0_epcs_control_port;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_epcs_flash_controller_0_epcs_control_port & cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port;

  //epcs_flash_controller_0_epcs_control_port_any_continuerequest at least one master continues requesting, which is an e_mux
  assign epcs_flash_controller_0_epcs_control_port_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port = cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))) | cpu_0_instruction_master_arbiterlock);
  //local readdatavalid cpu_0_data_master_read_data_valid_epcs_flash_controller_0_epcs_control_port, which is an e_mux
  assign cpu_0_data_master_read_data_valid_epcs_flash_controller_0_epcs_control_port = cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port & cpu_0_data_master_read & ~epcs_flash_controller_0_epcs_control_port_waits_for_read;

  //epcs_flash_controller_0_epcs_control_port_writedata mux, which is an e_mux
  assign epcs_flash_controller_0_epcs_control_port_writedata = cpu_0_data_master_writedata;

  //assign epcs_flash_controller_0_epcs_control_port_endofpacket_from_sa = epcs_flash_controller_0_epcs_control_port_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_endofpacket_from_sa = epcs_flash_controller_0_epcs_control_port_endofpacket;

  assign cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port = (({cpu_0_instruction_master_address_to_slave[24 : 11] , 11'b0} == 25'h1001800) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted epcs_flash_controller_0/epcs_control_port last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_epcs_flash_controller_0_epcs_control_port <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_epcs_flash_controller_0_epcs_control_port <= cpu_0_data_master_saved_grant_epcs_flash_controller_0_epcs_control_port ? 1 : (epcs_flash_controller_0_epcs_control_port_arbitration_holdoff_internal | ~cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port) ? 0 : last_cycle_cpu_0_data_master_granted_slave_epcs_flash_controller_0_epcs_control_port;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_epcs_flash_controller_0_epcs_control_port & cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port;

  assign cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port = cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port & ~((cpu_0_instruction_master_read & ((cpu_0_instruction_master_latency_counter != 0) | (|cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //local readdatavalid cpu_0_instruction_master_read_data_valid_epcs_flash_controller_0_epcs_control_port, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_epcs_flash_controller_0_epcs_control_port = cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port & cpu_0_instruction_master_read & ~epcs_flash_controller_0_epcs_control_port_waits_for_read;

  //allow new arb cycle for epcs_flash_controller_0/epcs_control_port, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for epcs_flash_controller_0/epcs_control_port, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port;

  //cpu_0/instruction_master grant epcs_flash_controller_0/epcs_control_port, which is an e_assign
  assign cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port = epcs_flash_controller_0_epcs_control_port_grant_vector[0];

  //cpu_0/instruction_master saved-grant epcs_flash_controller_0/epcs_control_port, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_epcs_flash_controller_0_epcs_control_port = epcs_flash_controller_0_epcs_control_port_arb_winner[0] && cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port;

  //cpu_0/data_master assignment into master qualified-requests vector for epcs_flash_controller_0/epcs_control_port, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_master_qreq_vector[1] = cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port;

  //cpu_0/data_master grant epcs_flash_controller_0/epcs_control_port, which is an e_assign
  assign cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port = epcs_flash_controller_0_epcs_control_port_grant_vector[1];

  //cpu_0/data_master saved-grant epcs_flash_controller_0/epcs_control_port, which is an e_assign
  assign cpu_0_data_master_saved_grant_epcs_flash_controller_0_epcs_control_port = epcs_flash_controller_0_epcs_control_port_arb_winner[1] && cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port;

  //epcs_flash_controller_0/epcs_control_port chosen-master double-vector, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_chosen_master_double_vector = {epcs_flash_controller_0_epcs_control_port_master_qreq_vector, epcs_flash_controller_0_epcs_control_port_master_qreq_vector} & ({~epcs_flash_controller_0_epcs_control_port_master_qreq_vector, ~epcs_flash_controller_0_epcs_control_port_master_qreq_vector} + epcs_flash_controller_0_epcs_control_port_arb_addend);

  //stable onehot encoding of arb winner
  assign epcs_flash_controller_0_epcs_control_port_arb_winner = (epcs_flash_controller_0_epcs_control_port_allow_new_arb_cycle & | epcs_flash_controller_0_epcs_control_port_grant_vector) ? epcs_flash_controller_0_epcs_control_port_grant_vector : epcs_flash_controller_0_epcs_control_port_saved_chosen_master_vector;

  //saved epcs_flash_controller_0_epcs_control_port_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_flash_controller_0_epcs_control_port_saved_chosen_master_vector <= 0;
      else if (epcs_flash_controller_0_epcs_control_port_allow_new_arb_cycle)
          epcs_flash_controller_0_epcs_control_port_saved_chosen_master_vector <= |epcs_flash_controller_0_epcs_control_port_grant_vector ? epcs_flash_controller_0_epcs_control_port_grant_vector : epcs_flash_controller_0_epcs_control_port_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign epcs_flash_controller_0_epcs_control_port_grant_vector = {(epcs_flash_controller_0_epcs_control_port_chosen_master_double_vector[1] | epcs_flash_controller_0_epcs_control_port_chosen_master_double_vector[3]),
    (epcs_flash_controller_0_epcs_control_port_chosen_master_double_vector[0] | epcs_flash_controller_0_epcs_control_port_chosen_master_double_vector[2])};

  //epcs_flash_controller_0/epcs_control_port chosen master rotated left, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_chosen_master_rot_left = (epcs_flash_controller_0_epcs_control_port_arb_winner << 1) ? (epcs_flash_controller_0_epcs_control_port_arb_winner << 1) : 1;

  //epcs_flash_controller_0/epcs_control_port's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_flash_controller_0_epcs_control_port_arb_addend <= 1;
      else if (|epcs_flash_controller_0_epcs_control_port_grant_vector)
          epcs_flash_controller_0_epcs_control_port_arb_addend <= epcs_flash_controller_0_epcs_control_port_end_xfer? epcs_flash_controller_0_epcs_control_port_chosen_master_rot_left : epcs_flash_controller_0_epcs_control_port_grant_vector;
    end


  //epcs_flash_controller_0_epcs_control_port_reset_n assignment, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_reset_n = reset_n;

  assign epcs_flash_controller_0_epcs_control_port_chipselect = cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port | cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port;
  //epcs_flash_controller_0_epcs_control_port_firsttransfer first transaction, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_firsttransfer = epcs_flash_controller_0_epcs_control_port_begins_xfer ? epcs_flash_controller_0_epcs_control_port_unreg_firsttransfer : epcs_flash_controller_0_epcs_control_port_reg_firsttransfer;

  //epcs_flash_controller_0_epcs_control_port_unreg_firsttransfer first transaction, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_unreg_firsttransfer = ~(epcs_flash_controller_0_epcs_control_port_slavearbiterlockenable & epcs_flash_controller_0_epcs_control_port_any_continuerequest);

  //epcs_flash_controller_0_epcs_control_port_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_flash_controller_0_epcs_control_port_reg_firsttransfer <= 1'b1;
      else if (epcs_flash_controller_0_epcs_control_port_begins_xfer)
          epcs_flash_controller_0_epcs_control_port_reg_firsttransfer <= epcs_flash_controller_0_epcs_control_port_unreg_firsttransfer;
    end


  //epcs_flash_controller_0_epcs_control_port_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_beginbursttransfer_internal = epcs_flash_controller_0_epcs_control_port_begins_xfer;

  //epcs_flash_controller_0_epcs_control_port_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_arbitration_holdoff_internal = epcs_flash_controller_0_epcs_control_port_begins_xfer & epcs_flash_controller_0_epcs_control_port_firsttransfer;

  //~epcs_flash_controller_0_epcs_control_port_read_n assignment, which is an e_mux
  assign epcs_flash_controller_0_epcs_control_port_read_n = ~((cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port & cpu_0_instruction_master_read));

  //~epcs_flash_controller_0_epcs_control_port_write_n assignment, which is an e_mux
  assign epcs_flash_controller_0_epcs_control_port_write_n = ~(cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port & cpu_0_data_master_write);

  assign shifted_address_to_epcs_flash_controller_0_epcs_control_port_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //epcs_flash_controller_0_epcs_control_port_address mux, which is an e_mux
  assign epcs_flash_controller_0_epcs_control_port_address = (cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port)? (shifted_address_to_epcs_flash_controller_0_epcs_control_port_from_cpu_0_data_master >> 2) :
    (shifted_address_to_epcs_flash_controller_0_epcs_control_port_from_cpu_0_instruction_master >> 2);

  assign shifted_address_to_epcs_flash_controller_0_epcs_control_port_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  //d1_epcs_flash_controller_0_epcs_control_port_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_epcs_flash_controller_0_epcs_control_port_end_xfer <= 1;
      else 
        d1_epcs_flash_controller_0_epcs_control_port_end_xfer <= epcs_flash_controller_0_epcs_control_port_end_xfer;
    end


  //epcs_flash_controller_0_epcs_control_port_waits_for_read in a cycle, which is an e_mux
  assign epcs_flash_controller_0_epcs_control_port_waits_for_read = epcs_flash_controller_0_epcs_control_port_in_a_read_cycle & epcs_flash_controller_0_epcs_control_port_begins_xfer;

  //epcs_flash_controller_0_epcs_control_port_in_a_read_cycle assignment, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_in_a_read_cycle = (cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = epcs_flash_controller_0_epcs_control_port_in_a_read_cycle;

  //epcs_flash_controller_0_epcs_control_port_waits_for_write in a cycle, which is an e_mux
  assign epcs_flash_controller_0_epcs_control_port_waits_for_write = epcs_flash_controller_0_epcs_control_port_in_a_write_cycle & epcs_flash_controller_0_epcs_control_port_begins_xfer;

  //epcs_flash_controller_0_epcs_control_port_in_a_write_cycle assignment, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_in_a_write_cycle = cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = epcs_flash_controller_0_epcs_control_port_in_a_write_cycle;

  assign wait_for_epcs_flash_controller_0_epcs_control_port_counter = 0;
  //assign epcs_flash_controller_0_epcs_control_port_irq_from_sa = epcs_flash_controller_0_epcs_control_port_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_flash_controller_0_epcs_control_port_irq_from_sa = epcs_flash_controller_0_epcs_control_port_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //epcs_flash_controller_0/epcs_control_port enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port + cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_epcs_flash_controller_0_epcs_control_port + cpu_0_instruction_master_saved_grant_epcs_flash_controller_0_epcs_control_port > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_0_avalon_jtag_slave_arbitrator (
                                                  // inputs:
                                                   clk,
                                                   cpu_0_data_master_address_to_slave,
                                                   cpu_0_data_master_latency_counter,
                                                   cpu_0_data_master_read,
                                                   cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                                   cpu_0_data_master_write,
                                                   cpu_0_data_master_writedata,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable,
                                                   jtag_uart_0_avalon_jtag_slave_irq,
                                                   jtag_uart_0_avalon_jtag_slave_readdata,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest,
                                                   reset_n,

                                                  // outputs:
                                                   cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
                                                   d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                                   jtag_uart_0_avalon_jtag_slave_address,
                                                   jtag_uart_0_avalon_jtag_slave_chipselect,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_read_n,
                                                   jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_reset_n,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_write_n,
                                                   jtag_uart_0_avalon_jtag_slave_writedata
                                                )
;

  output           cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  output           d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  output           jtag_uart_0_avalon_jtag_slave_address;
  output           jtag_uart_0_avalon_jtag_slave_chipselect;
  output           jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_reset_n;
  output           jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            jtag_uart_0_avalon_jtag_slave_dataavailable;
  input            jtag_uart_0_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  input            jtag_uart_0_avalon_jtag_slave_readyfordata;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave;
  reg              d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_allgrants;
  wire             jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_0_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_0_avalon_jtag_slave_arb_counter_enable;
  reg     [  1: 0] jtag_uart_0_avalon_jtag_slave_arb_share_counter;
  wire    [  1: 0] jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  1: 0] jtag_uart_0_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_0_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  reg              jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire    [ 24: 0] shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master;
  wire             wait_for_jtag_uart_0_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_0_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave));
  //assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata;

  assign cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave = ({cpu_0_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h1002280) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;

  //jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_0_avalon_jtag_slave_firsttransfer ? (jtag_uart_0_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_0_avalon_jtag_slave_arb_share_counter ? (jtag_uart_0_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_0_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_allgrants = |jtag_uart_0_avalon_jtag_slave_grant_vector;

  //jtag_uart_0_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_end_xfer = ~(jtag_uart_0_avalon_jtag_slave_waits_for_read | jtag_uart_0_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave = jtag_uart_0_avalon_jtag_slave_end_xfer & (~jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & jtag_uart_0_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_0_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_0_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read & ~jtag_uart_0_avalon_jtag_slave_waits_for_read;

  //jtag_uart_0_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;

  //cpu_0/data_master saved-grant jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_0_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_0_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_0_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_0_avalon_jtag_slave_chipselect = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  //jtag_uart_0_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_firsttransfer = jtag_uart_0_avalon_jtag_slave_begins_xfer ? jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_0_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_0_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_0_avalon_jtag_slave_begins_xfer)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_0_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_0_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_read_n = ~(cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read);

  //~jtag_uart_0_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_write_n = ~(cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_write);

  assign shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //jtag_uart_0_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_address = shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master >> 2;

  //d1_jtag_uart_0_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_0_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_read = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_read_cycle = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_0_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_write = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_write_cycle = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_0_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart_0/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module motor_0_avalon_slave_0_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_0_data_master_address_to_slave,
                                            cpu_0_data_master_latency_counter,
                                            cpu_0_data_master_read,
                                            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                            cpu_0_data_master_write,
                                            cpu_0_data_master_writedata,
                                            motor_0_avalon_slave_0_readdata,
                                            reset_n,

                                           // outputs:
                                            cpu_0_data_master_granted_motor_0_avalon_slave_0,
                                            cpu_0_data_master_qualified_request_motor_0_avalon_slave_0,
                                            cpu_0_data_master_read_data_valid_motor_0_avalon_slave_0,
                                            cpu_0_data_master_requests_motor_0_avalon_slave_0,
                                            d1_motor_0_avalon_slave_0_end_xfer,
                                            motor_0_avalon_slave_0_address,
                                            motor_0_avalon_slave_0_chipselect_n,
                                            motor_0_avalon_slave_0_read_n,
                                            motor_0_avalon_slave_0_readdata_from_sa,
                                            motor_0_avalon_slave_0_reset_n,
                                            motor_0_avalon_slave_0_write_n,
                                            motor_0_avalon_slave_0_writedata
                                         )
;

  output           cpu_0_data_master_granted_motor_0_avalon_slave_0;
  output           cpu_0_data_master_qualified_request_motor_0_avalon_slave_0;
  output           cpu_0_data_master_read_data_valid_motor_0_avalon_slave_0;
  output           cpu_0_data_master_requests_motor_0_avalon_slave_0;
  output           d1_motor_0_avalon_slave_0_end_xfer;
  output  [  2: 0] motor_0_avalon_slave_0_address;
  output           motor_0_avalon_slave_0_chipselect_n;
  output           motor_0_avalon_slave_0_read_n;
  output  [ 31: 0] motor_0_avalon_slave_0_readdata_from_sa;
  output           motor_0_avalon_slave_0_reset_n;
  output           motor_0_avalon_slave_0_write_n;
  output  [ 31: 0] motor_0_avalon_slave_0_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] motor_0_avalon_slave_0_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_motor_0_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_motor_0_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_motor_0_avalon_slave_0;
  wire             cpu_0_data_master_requests_motor_0_avalon_slave_0;
  wire             cpu_0_data_master_saved_grant_motor_0_avalon_slave_0;
  reg              d1_motor_0_avalon_slave_0_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_motor_0_avalon_slave_0;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] motor_0_avalon_slave_0_address;
  wire             motor_0_avalon_slave_0_allgrants;
  wire             motor_0_avalon_slave_0_allow_new_arb_cycle;
  wire             motor_0_avalon_slave_0_any_bursting_master_saved_grant;
  wire             motor_0_avalon_slave_0_any_continuerequest;
  wire             motor_0_avalon_slave_0_arb_counter_enable;
  reg     [  1: 0] motor_0_avalon_slave_0_arb_share_counter;
  wire    [  1: 0] motor_0_avalon_slave_0_arb_share_counter_next_value;
  wire    [  1: 0] motor_0_avalon_slave_0_arb_share_set_values;
  wire             motor_0_avalon_slave_0_beginbursttransfer_internal;
  wire             motor_0_avalon_slave_0_begins_xfer;
  wire             motor_0_avalon_slave_0_chipselect_n;
  wire             motor_0_avalon_slave_0_end_xfer;
  wire             motor_0_avalon_slave_0_firsttransfer;
  wire             motor_0_avalon_slave_0_grant_vector;
  wire             motor_0_avalon_slave_0_in_a_read_cycle;
  wire             motor_0_avalon_slave_0_in_a_write_cycle;
  wire             motor_0_avalon_slave_0_master_qreq_vector;
  wire             motor_0_avalon_slave_0_non_bursting_master_requests;
  wire             motor_0_avalon_slave_0_read_n;
  wire    [ 31: 0] motor_0_avalon_slave_0_readdata_from_sa;
  reg              motor_0_avalon_slave_0_reg_firsttransfer;
  wire             motor_0_avalon_slave_0_reset_n;
  reg              motor_0_avalon_slave_0_slavearbiterlockenable;
  wire             motor_0_avalon_slave_0_slavearbiterlockenable2;
  wire             motor_0_avalon_slave_0_unreg_firsttransfer;
  wire             motor_0_avalon_slave_0_waits_for_read;
  wire             motor_0_avalon_slave_0_waits_for_write;
  wire             motor_0_avalon_slave_0_write_n;
  wire    [ 31: 0] motor_0_avalon_slave_0_writedata;
  wire    [ 24: 0] shifted_address_to_motor_0_avalon_slave_0_from_cpu_0_data_master;
  wire             wait_for_motor_0_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~motor_0_avalon_slave_0_end_xfer;
    end


  assign motor_0_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_motor_0_avalon_slave_0));
  //assign motor_0_avalon_slave_0_readdata_from_sa = motor_0_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign motor_0_avalon_slave_0_readdata_from_sa = motor_0_avalon_slave_0_readdata;

  assign cpu_0_data_master_requests_motor_0_avalon_slave_0 = ({cpu_0_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1002080) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //motor_0_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign motor_0_avalon_slave_0_arb_share_set_values = 1;

  //motor_0_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign motor_0_avalon_slave_0_non_bursting_master_requests = cpu_0_data_master_requests_motor_0_avalon_slave_0;

  //motor_0_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign motor_0_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //motor_0_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign motor_0_avalon_slave_0_arb_share_counter_next_value = motor_0_avalon_slave_0_firsttransfer ? (motor_0_avalon_slave_0_arb_share_set_values - 1) : |motor_0_avalon_slave_0_arb_share_counter ? (motor_0_avalon_slave_0_arb_share_counter - 1) : 0;

  //motor_0_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign motor_0_avalon_slave_0_allgrants = |motor_0_avalon_slave_0_grant_vector;

  //motor_0_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign motor_0_avalon_slave_0_end_xfer = ~(motor_0_avalon_slave_0_waits_for_read | motor_0_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_motor_0_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_motor_0_avalon_slave_0 = motor_0_avalon_slave_0_end_xfer & (~motor_0_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //motor_0_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign motor_0_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_motor_0_avalon_slave_0 & motor_0_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_motor_0_avalon_slave_0 & ~motor_0_avalon_slave_0_non_bursting_master_requests);

  //motor_0_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          motor_0_avalon_slave_0_arb_share_counter <= 0;
      else if (motor_0_avalon_slave_0_arb_counter_enable)
          motor_0_avalon_slave_0_arb_share_counter <= motor_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //motor_0_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          motor_0_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|motor_0_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_motor_0_avalon_slave_0) | (end_xfer_arb_share_counter_term_motor_0_avalon_slave_0 & ~motor_0_avalon_slave_0_non_bursting_master_requests))
          motor_0_avalon_slave_0_slavearbiterlockenable <= |motor_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //cpu_0/data_master motor_0/avalon_slave_0 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = motor_0_avalon_slave_0_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //motor_0_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign motor_0_avalon_slave_0_slavearbiterlockenable2 = |motor_0_avalon_slave_0_arb_share_counter_next_value;

  //cpu_0/data_master motor_0/avalon_slave_0 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = motor_0_avalon_slave_0_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //motor_0_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  assign motor_0_avalon_slave_0_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_motor_0_avalon_slave_0 = cpu_0_data_master_requests_motor_0_avalon_slave_0 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_motor_0_avalon_slave_0, which is an e_mux
  assign cpu_0_data_master_read_data_valid_motor_0_avalon_slave_0 = cpu_0_data_master_granted_motor_0_avalon_slave_0 & cpu_0_data_master_read & ~motor_0_avalon_slave_0_waits_for_read;

  //motor_0_avalon_slave_0_writedata mux, which is an e_mux
  assign motor_0_avalon_slave_0_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_motor_0_avalon_slave_0 = cpu_0_data_master_qualified_request_motor_0_avalon_slave_0;

  //cpu_0/data_master saved-grant motor_0/avalon_slave_0, which is an e_assign
  assign cpu_0_data_master_saved_grant_motor_0_avalon_slave_0 = cpu_0_data_master_requests_motor_0_avalon_slave_0;

  //allow new arb cycle for motor_0/avalon_slave_0, which is an e_assign
  assign motor_0_avalon_slave_0_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign motor_0_avalon_slave_0_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign motor_0_avalon_slave_0_master_qreq_vector = 1;

  //motor_0_avalon_slave_0_reset_n assignment, which is an e_assign
  assign motor_0_avalon_slave_0_reset_n = reset_n;

  assign motor_0_avalon_slave_0_chipselect_n = ~cpu_0_data_master_granted_motor_0_avalon_slave_0;
  //motor_0_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign motor_0_avalon_slave_0_firsttransfer = motor_0_avalon_slave_0_begins_xfer ? motor_0_avalon_slave_0_unreg_firsttransfer : motor_0_avalon_slave_0_reg_firsttransfer;

  //motor_0_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  assign motor_0_avalon_slave_0_unreg_firsttransfer = ~(motor_0_avalon_slave_0_slavearbiterlockenable & motor_0_avalon_slave_0_any_continuerequest);

  //motor_0_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          motor_0_avalon_slave_0_reg_firsttransfer <= 1'b1;
      else if (motor_0_avalon_slave_0_begins_xfer)
          motor_0_avalon_slave_0_reg_firsttransfer <= motor_0_avalon_slave_0_unreg_firsttransfer;
    end


  //motor_0_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign motor_0_avalon_slave_0_beginbursttransfer_internal = motor_0_avalon_slave_0_begins_xfer;

  //~motor_0_avalon_slave_0_read_n assignment, which is an e_mux
  assign motor_0_avalon_slave_0_read_n = ~(cpu_0_data_master_granted_motor_0_avalon_slave_0 & cpu_0_data_master_read);

  //~motor_0_avalon_slave_0_write_n assignment, which is an e_mux
  assign motor_0_avalon_slave_0_write_n = ~(cpu_0_data_master_granted_motor_0_avalon_slave_0 & cpu_0_data_master_write);

  assign shifted_address_to_motor_0_avalon_slave_0_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //motor_0_avalon_slave_0_address mux, which is an e_mux
  assign motor_0_avalon_slave_0_address = shifted_address_to_motor_0_avalon_slave_0_from_cpu_0_data_master >> 2;

  //d1_motor_0_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_motor_0_avalon_slave_0_end_xfer <= 1;
      else 
        d1_motor_0_avalon_slave_0_end_xfer <= motor_0_avalon_slave_0_end_xfer;
    end


  //motor_0_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign motor_0_avalon_slave_0_waits_for_read = motor_0_avalon_slave_0_in_a_read_cycle & motor_0_avalon_slave_0_begins_xfer;

  //motor_0_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign motor_0_avalon_slave_0_in_a_read_cycle = cpu_0_data_master_granted_motor_0_avalon_slave_0 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = motor_0_avalon_slave_0_in_a_read_cycle;

  //motor_0_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign motor_0_avalon_slave_0_waits_for_write = motor_0_avalon_slave_0_in_a_write_cycle & 0;

  //motor_0_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign motor_0_avalon_slave_0_in_a_write_cycle = cpu_0_data_master_granted_motor_0_avalon_slave_0 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = motor_0_avalon_slave_0_in_a_write_cycle;

  assign wait_for_motor_0_avalon_slave_0_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //motor_0/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module motor_1_avalon_slave_0_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_0_data_master_address_to_slave,
                                            cpu_0_data_master_latency_counter,
                                            cpu_0_data_master_read,
                                            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                            cpu_0_data_master_write,
                                            cpu_0_data_master_writedata,
                                            motor_1_avalon_slave_0_readdata,
                                            reset_n,

                                           // outputs:
                                            cpu_0_data_master_granted_motor_1_avalon_slave_0,
                                            cpu_0_data_master_qualified_request_motor_1_avalon_slave_0,
                                            cpu_0_data_master_read_data_valid_motor_1_avalon_slave_0,
                                            cpu_0_data_master_requests_motor_1_avalon_slave_0,
                                            d1_motor_1_avalon_slave_0_end_xfer,
                                            motor_1_avalon_slave_0_address,
                                            motor_1_avalon_slave_0_chipselect_n,
                                            motor_1_avalon_slave_0_read_n,
                                            motor_1_avalon_slave_0_readdata_from_sa,
                                            motor_1_avalon_slave_0_reset_n,
                                            motor_1_avalon_slave_0_write_n,
                                            motor_1_avalon_slave_0_writedata
                                         )
;

  output           cpu_0_data_master_granted_motor_1_avalon_slave_0;
  output           cpu_0_data_master_qualified_request_motor_1_avalon_slave_0;
  output           cpu_0_data_master_read_data_valid_motor_1_avalon_slave_0;
  output           cpu_0_data_master_requests_motor_1_avalon_slave_0;
  output           d1_motor_1_avalon_slave_0_end_xfer;
  output  [  2: 0] motor_1_avalon_slave_0_address;
  output           motor_1_avalon_slave_0_chipselect_n;
  output           motor_1_avalon_slave_0_read_n;
  output  [ 31: 0] motor_1_avalon_slave_0_readdata_from_sa;
  output           motor_1_avalon_slave_0_reset_n;
  output           motor_1_avalon_slave_0_write_n;
  output  [ 31: 0] motor_1_avalon_slave_0_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] motor_1_avalon_slave_0_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_motor_1_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_motor_1_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_motor_1_avalon_slave_0;
  wire             cpu_0_data_master_requests_motor_1_avalon_slave_0;
  wire             cpu_0_data_master_saved_grant_motor_1_avalon_slave_0;
  reg              d1_motor_1_avalon_slave_0_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_motor_1_avalon_slave_0;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] motor_1_avalon_slave_0_address;
  wire             motor_1_avalon_slave_0_allgrants;
  wire             motor_1_avalon_slave_0_allow_new_arb_cycle;
  wire             motor_1_avalon_slave_0_any_bursting_master_saved_grant;
  wire             motor_1_avalon_slave_0_any_continuerequest;
  wire             motor_1_avalon_slave_0_arb_counter_enable;
  reg     [  1: 0] motor_1_avalon_slave_0_arb_share_counter;
  wire    [  1: 0] motor_1_avalon_slave_0_arb_share_counter_next_value;
  wire    [  1: 0] motor_1_avalon_slave_0_arb_share_set_values;
  wire             motor_1_avalon_slave_0_beginbursttransfer_internal;
  wire             motor_1_avalon_slave_0_begins_xfer;
  wire             motor_1_avalon_slave_0_chipselect_n;
  wire             motor_1_avalon_slave_0_end_xfer;
  wire             motor_1_avalon_slave_0_firsttransfer;
  wire             motor_1_avalon_slave_0_grant_vector;
  wire             motor_1_avalon_slave_0_in_a_read_cycle;
  wire             motor_1_avalon_slave_0_in_a_write_cycle;
  wire             motor_1_avalon_slave_0_master_qreq_vector;
  wire             motor_1_avalon_slave_0_non_bursting_master_requests;
  wire             motor_1_avalon_slave_0_read_n;
  wire    [ 31: 0] motor_1_avalon_slave_0_readdata_from_sa;
  reg              motor_1_avalon_slave_0_reg_firsttransfer;
  wire             motor_1_avalon_slave_0_reset_n;
  reg              motor_1_avalon_slave_0_slavearbiterlockenable;
  wire             motor_1_avalon_slave_0_slavearbiterlockenable2;
  wire             motor_1_avalon_slave_0_unreg_firsttransfer;
  wire             motor_1_avalon_slave_0_waits_for_read;
  wire             motor_1_avalon_slave_0_waits_for_write;
  wire             motor_1_avalon_slave_0_write_n;
  wire    [ 31: 0] motor_1_avalon_slave_0_writedata;
  wire    [ 24: 0] shifted_address_to_motor_1_avalon_slave_0_from_cpu_0_data_master;
  wire             wait_for_motor_1_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~motor_1_avalon_slave_0_end_xfer;
    end


  assign motor_1_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_motor_1_avalon_slave_0));
  //assign motor_1_avalon_slave_0_readdata_from_sa = motor_1_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign motor_1_avalon_slave_0_readdata_from_sa = motor_1_avalon_slave_0_readdata;

  assign cpu_0_data_master_requests_motor_1_avalon_slave_0 = ({cpu_0_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h10020a0) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //motor_1_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign motor_1_avalon_slave_0_arb_share_set_values = 1;

  //motor_1_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign motor_1_avalon_slave_0_non_bursting_master_requests = cpu_0_data_master_requests_motor_1_avalon_slave_0;

  //motor_1_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign motor_1_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //motor_1_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign motor_1_avalon_slave_0_arb_share_counter_next_value = motor_1_avalon_slave_0_firsttransfer ? (motor_1_avalon_slave_0_arb_share_set_values - 1) : |motor_1_avalon_slave_0_arb_share_counter ? (motor_1_avalon_slave_0_arb_share_counter - 1) : 0;

  //motor_1_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign motor_1_avalon_slave_0_allgrants = |motor_1_avalon_slave_0_grant_vector;

  //motor_1_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign motor_1_avalon_slave_0_end_xfer = ~(motor_1_avalon_slave_0_waits_for_read | motor_1_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_motor_1_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_motor_1_avalon_slave_0 = motor_1_avalon_slave_0_end_xfer & (~motor_1_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //motor_1_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign motor_1_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_motor_1_avalon_slave_0 & motor_1_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_motor_1_avalon_slave_0 & ~motor_1_avalon_slave_0_non_bursting_master_requests);

  //motor_1_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          motor_1_avalon_slave_0_arb_share_counter <= 0;
      else if (motor_1_avalon_slave_0_arb_counter_enable)
          motor_1_avalon_slave_0_arb_share_counter <= motor_1_avalon_slave_0_arb_share_counter_next_value;
    end


  //motor_1_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          motor_1_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|motor_1_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_motor_1_avalon_slave_0) | (end_xfer_arb_share_counter_term_motor_1_avalon_slave_0 & ~motor_1_avalon_slave_0_non_bursting_master_requests))
          motor_1_avalon_slave_0_slavearbiterlockenable <= |motor_1_avalon_slave_0_arb_share_counter_next_value;
    end


  //cpu_0/data_master motor_1/avalon_slave_0 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = motor_1_avalon_slave_0_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //motor_1_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign motor_1_avalon_slave_0_slavearbiterlockenable2 = |motor_1_avalon_slave_0_arb_share_counter_next_value;

  //cpu_0/data_master motor_1/avalon_slave_0 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = motor_1_avalon_slave_0_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //motor_1_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  assign motor_1_avalon_slave_0_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_motor_1_avalon_slave_0 = cpu_0_data_master_requests_motor_1_avalon_slave_0 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_motor_1_avalon_slave_0, which is an e_mux
  assign cpu_0_data_master_read_data_valid_motor_1_avalon_slave_0 = cpu_0_data_master_granted_motor_1_avalon_slave_0 & cpu_0_data_master_read & ~motor_1_avalon_slave_0_waits_for_read;

  //motor_1_avalon_slave_0_writedata mux, which is an e_mux
  assign motor_1_avalon_slave_0_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_motor_1_avalon_slave_0 = cpu_0_data_master_qualified_request_motor_1_avalon_slave_0;

  //cpu_0/data_master saved-grant motor_1/avalon_slave_0, which is an e_assign
  assign cpu_0_data_master_saved_grant_motor_1_avalon_slave_0 = cpu_0_data_master_requests_motor_1_avalon_slave_0;

  //allow new arb cycle for motor_1/avalon_slave_0, which is an e_assign
  assign motor_1_avalon_slave_0_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign motor_1_avalon_slave_0_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign motor_1_avalon_slave_0_master_qreq_vector = 1;

  //motor_1_avalon_slave_0_reset_n assignment, which is an e_assign
  assign motor_1_avalon_slave_0_reset_n = reset_n;

  assign motor_1_avalon_slave_0_chipselect_n = ~cpu_0_data_master_granted_motor_1_avalon_slave_0;
  //motor_1_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign motor_1_avalon_slave_0_firsttransfer = motor_1_avalon_slave_0_begins_xfer ? motor_1_avalon_slave_0_unreg_firsttransfer : motor_1_avalon_slave_0_reg_firsttransfer;

  //motor_1_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  assign motor_1_avalon_slave_0_unreg_firsttransfer = ~(motor_1_avalon_slave_0_slavearbiterlockenable & motor_1_avalon_slave_0_any_continuerequest);

  //motor_1_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          motor_1_avalon_slave_0_reg_firsttransfer <= 1'b1;
      else if (motor_1_avalon_slave_0_begins_xfer)
          motor_1_avalon_slave_0_reg_firsttransfer <= motor_1_avalon_slave_0_unreg_firsttransfer;
    end


  //motor_1_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign motor_1_avalon_slave_0_beginbursttransfer_internal = motor_1_avalon_slave_0_begins_xfer;

  //~motor_1_avalon_slave_0_read_n assignment, which is an e_mux
  assign motor_1_avalon_slave_0_read_n = ~(cpu_0_data_master_granted_motor_1_avalon_slave_0 & cpu_0_data_master_read);

  //~motor_1_avalon_slave_0_write_n assignment, which is an e_mux
  assign motor_1_avalon_slave_0_write_n = ~(cpu_0_data_master_granted_motor_1_avalon_slave_0 & cpu_0_data_master_write);

  assign shifted_address_to_motor_1_avalon_slave_0_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //motor_1_avalon_slave_0_address mux, which is an e_mux
  assign motor_1_avalon_slave_0_address = shifted_address_to_motor_1_avalon_slave_0_from_cpu_0_data_master >> 2;

  //d1_motor_1_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_motor_1_avalon_slave_0_end_xfer <= 1;
      else 
        d1_motor_1_avalon_slave_0_end_xfer <= motor_1_avalon_slave_0_end_xfer;
    end


  //motor_1_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign motor_1_avalon_slave_0_waits_for_read = motor_1_avalon_slave_0_in_a_read_cycle & motor_1_avalon_slave_0_begins_xfer;

  //motor_1_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign motor_1_avalon_slave_0_in_a_read_cycle = cpu_0_data_master_granted_motor_1_avalon_slave_0 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = motor_1_avalon_slave_0_in_a_read_cycle;

  //motor_1_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign motor_1_avalon_slave_0_waits_for_write = motor_1_avalon_slave_0_in_a_write_cycle & 0;

  //motor_1_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign motor_1_avalon_slave_0_in_a_write_cycle = cpu_0_data_master_granted_motor_1_avalon_slave_0 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = motor_1_avalon_slave_0_in_a_write_cycle;

  assign wait_for_motor_1_avalon_slave_0_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //motor_1/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module motor_2_avalon_slave_0_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_0_data_master_address_to_slave,
                                            cpu_0_data_master_latency_counter,
                                            cpu_0_data_master_read,
                                            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                            cpu_0_data_master_write,
                                            cpu_0_data_master_writedata,
                                            motor_2_avalon_slave_0_readdata,
                                            reset_n,

                                           // outputs:
                                            cpu_0_data_master_granted_motor_2_avalon_slave_0,
                                            cpu_0_data_master_qualified_request_motor_2_avalon_slave_0,
                                            cpu_0_data_master_read_data_valid_motor_2_avalon_slave_0,
                                            cpu_0_data_master_requests_motor_2_avalon_slave_0,
                                            d1_motor_2_avalon_slave_0_end_xfer,
                                            motor_2_avalon_slave_0_address,
                                            motor_2_avalon_slave_0_chipselect_n,
                                            motor_2_avalon_slave_0_read_n,
                                            motor_2_avalon_slave_0_readdata_from_sa,
                                            motor_2_avalon_slave_0_reset_n,
                                            motor_2_avalon_slave_0_write_n,
                                            motor_2_avalon_slave_0_writedata
                                         )
;

  output           cpu_0_data_master_granted_motor_2_avalon_slave_0;
  output           cpu_0_data_master_qualified_request_motor_2_avalon_slave_0;
  output           cpu_0_data_master_read_data_valid_motor_2_avalon_slave_0;
  output           cpu_0_data_master_requests_motor_2_avalon_slave_0;
  output           d1_motor_2_avalon_slave_0_end_xfer;
  output  [  2: 0] motor_2_avalon_slave_0_address;
  output           motor_2_avalon_slave_0_chipselect_n;
  output           motor_2_avalon_slave_0_read_n;
  output  [ 31: 0] motor_2_avalon_slave_0_readdata_from_sa;
  output           motor_2_avalon_slave_0_reset_n;
  output           motor_2_avalon_slave_0_write_n;
  output  [ 31: 0] motor_2_avalon_slave_0_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] motor_2_avalon_slave_0_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_motor_2_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_motor_2_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_motor_2_avalon_slave_0;
  wire             cpu_0_data_master_requests_motor_2_avalon_slave_0;
  wire             cpu_0_data_master_saved_grant_motor_2_avalon_slave_0;
  reg              d1_motor_2_avalon_slave_0_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_motor_2_avalon_slave_0;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] motor_2_avalon_slave_0_address;
  wire             motor_2_avalon_slave_0_allgrants;
  wire             motor_2_avalon_slave_0_allow_new_arb_cycle;
  wire             motor_2_avalon_slave_0_any_bursting_master_saved_grant;
  wire             motor_2_avalon_slave_0_any_continuerequest;
  wire             motor_2_avalon_slave_0_arb_counter_enable;
  reg     [  1: 0] motor_2_avalon_slave_0_arb_share_counter;
  wire    [  1: 0] motor_2_avalon_slave_0_arb_share_counter_next_value;
  wire    [  1: 0] motor_2_avalon_slave_0_arb_share_set_values;
  wire             motor_2_avalon_slave_0_beginbursttransfer_internal;
  wire             motor_2_avalon_slave_0_begins_xfer;
  wire             motor_2_avalon_slave_0_chipselect_n;
  wire             motor_2_avalon_slave_0_end_xfer;
  wire             motor_2_avalon_slave_0_firsttransfer;
  wire             motor_2_avalon_slave_0_grant_vector;
  wire             motor_2_avalon_slave_0_in_a_read_cycle;
  wire             motor_2_avalon_slave_0_in_a_write_cycle;
  wire             motor_2_avalon_slave_0_master_qreq_vector;
  wire             motor_2_avalon_slave_0_non_bursting_master_requests;
  wire             motor_2_avalon_slave_0_read_n;
  wire    [ 31: 0] motor_2_avalon_slave_0_readdata_from_sa;
  reg              motor_2_avalon_slave_0_reg_firsttransfer;
  wire             motor_2_avalon_slave_0_reset_n;
  reg              motor_2_avalon_slave_0_slavearbiterlockenable;
  wire             motor_2_avalon_slave_0_slavearbiterlockenable2;
  wire             motor_2_avalon_slave_0_unreg_firsttransfer;
  wire             motor_2_avalon_slave_0_waits_for_read;
  wire             motor_2_avalon_slave_0_waits_for_write;
  wire             motor_2_avalon_slave_0_write_n;
  wire    [ 31: 0] motor_2_avalon_slave_0_writedata;
  wire    [ 24: 0] shifted_address_to_motor_2_avalon_slave_0_from_cpu_0_data_master;
  wire             wait_for_motor_2_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~motor_2_avalon_slave_0_end_xfer;
    end


  assign motor_2_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_motor_2_avalon_slave_0));
  //assign motor_2_avalon_slave_0_readdata_from_sa = motor_2_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign motor_2_avalon_slave_0_readdata_from_sa = motor_2_avalon_slave_0_readdata;

  assign cpu_0_data_master_requests_motor_2_avalon_slave_0 = ({cpu_0_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h10020c0) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //motor_2_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign motor_2_avalon_slave_0_arb_share_set_values = 1;

  //motor_2_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign motor_2_avalon_slave_0_non_bursting_master_requests = cpu_0_data_master_requests_motor_2_avalon_slave_0;

  //motor_2_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign motor_2_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //motor_2_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign motor_2_avalon_slave_0_arb_share_counter_next_value = motor_2_avalon_slave_0_firsttransfer ? (motor_2_avalon_slave_0_arb_share_set_values - 1) : |motor_2_avalon_slave_0_arb_share_counter ? (motor_2_avalon_slave_0_arb_share_counter - 1) : 0;

  //motor_2_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign motor_2_avalon_slave_0_allgrants = |motor_2_avalon_slave_0_grant_vector;

  //motor_2_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign motor_2_avalon_slave_0_end_xfer = ~(motor_2_avalon_slave_0_waits_for_read | motor_2_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_motor_2_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_motor_2_avalon_slave_0 = motor_2_avalon_slave_0_end_xfer & (~motor_2_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //motor_2_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign motor_2_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_motor_2_avalon_slave_0 & motor_2_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_motor_2_avalon_slave_0 & ~motor_2_avalon_slave_0_non_bursting_master_requests);

  //motor_2_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          motor_2_avalon_slave_0_arb_share_counter <= 0;
      else if (motor_2_avalon_slave_0_arb_counter_enable)
          motor_2_avalon_slave_0_arb_share_counter <= motor_2_avalon_slave_0_arb_share_counter_next_value;
    end


  //motor_2_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          motor_2_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|motor_2_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_motor_2_avalon_slave_0) | (end_xfer_arb_share_counter_term_motor_2_avalon_slave_0 & ~motor_2_avalon_slave_0_non_bursting_master_requests))
          motor_2_avalon_slave_0_slavearbiterlockenable <= |motor_2_avalon_slave_0_arb_share_counter_next_value;
    end


  //cpu_0/data_master motor_2/avalon_slave_0 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = motor_2_avalon_slave_0_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //motor_2_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign motor_2_avalon_slave_0_slavearbiterlockenable2 = |motor_2_avalon_slave_0_arb_share_counter_next_value;

  //cpu_0/data_master motor_2/avalon_slave_0 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = motor_2_avalon_slave_0_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //motor_2_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  assign motor_2_avalon_slave_0_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_motor_2_avalon_slave_0 = cpu_0_data_master_requests_motor_2_avalon_slave_0 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_motor_2_avalon_slave_0, which is an e_mux
  assign cpu_0_data_master_read_data_valid_motor_2_avalon_slave_0 = cpu_0_data_master_granted_motor_2_avalon_slave_0 & cpu_0_data_master_read & ~motor_2_avalon_slave_0_waits_for_read;

  //motor_2_avalon_slave_0_writedata mux, which is an e_mux
  assign motor_2_avalon_slave_0_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_motor_2_avalon_slave_0 = cpu_0_data_master_qualified_request_motor_2_avalon_slave_0;

  //cpu_0/data_master saved-grant motor_2/avalon_slave_0, which is an e_assign
  assign cpu_0_data_master_saved_grant_motor_2_avalon_slave_0 = cpu_0_data_master_requests_motor_2_avalon_slave_0;

  //allow new arb cycle for motor_2/avalon_slave_0, which is an e_assign
  assign motor_2_avalon_slave_0_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign motor_2_avalon_slave_0_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign motor_2_avalon_slave_0_master_qreq_vector = 1;

  //motor_2_avalon_slave_0_reset_n assignment, which is an e_assign
  assign motor_2_avalon_slave_0_reset_n = reset_n;

  assign motor_2_avalon_slave_0_chipselect_n = ~cpu_0_data_master_granted_motor_2_avalon_slave_0;
  //motor_2_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign motor_2_avalon_slave_0_firsttransfer = motor_2_avalon_slave_0_begins_xfer ? motor_2_avalon_slave_0_unreg_firsttransfer : motor_2_avalon_slave_0_reg_firsttransfer;

  //motor_2_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  assign motor_2_avalon_slave_0_unreg_firsttransfer = ~(motor_2_avalon_slave_0_slavearbiterlockenable & motor_2_avalon_slave_0_any_continuerequest);

  //motor_2_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          motor_2_avalon_slave_0_reg_firsttransfer <= 1'b1;
      else if (motor_2_avalon_slave_0_begins_xfer)
          motor_2_avalon_slave_0_reg_firsttransfer <= motor_2_avalon_slave_0_unreg_firsttransfer;
    end


  //motor_2_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign motor_2_avalon_slave_0_beginbursttransfer_internal = motor_2_avalon_slave_0_begins_xfer;

  //~motor_2_avalon_slave_0_read_n assignment, which is an e_mux
  assign motor_2_avalon_slave_0_read_n = ~(cpu_0_data_master_granted_motor_2_avalon_slave_0 & cpu_0_data_master_read);

  //~motor_2_avalon_slave_0_write_n assignment, which is an e_mux
  assign motor_2_avalon_slave_0_write_n = ~(cpu_0_data_master_granted_motor_2_avalon_slave_0 & cpu_0_data_master_write);

  assign shifted_address_to_motor_2_avalon_slave_0_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //motor_2_avalon_slave_0_address mux, which is an e_mux
  assign motor_2_avalon_slave_0_address = shifted_address_to_motor_2_avalon_slave_0_from_cpu_0_data_master >> 2;

  //d1_motor_2_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_motor_2_avalon_slave_0_end_xfer <= 1;
      else 
        d1_motor_2_avalon_slave_0_end_xfer <= motor_2_avalon_slave_0_end_xfer;
    end


  //motor_2_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign motor_2_avalon_slave_0_waits_for_read = motor_2_avalon_slave_0_in_a_read_cycle & motor_2_avalon_slave_0_begins_xfer;

  //motor_2_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign motor_2_avalon_slave_0_in_a_read_cycle = cpu_0_data_master_granted_motor_2_avalon_slave_0 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = motor_2_avalon_slave_0_in_a_read_cycle;

  //motor_2_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign motor_2_avalon_slave_0_waits_for_write = motor_2_avalon_slave_0_in_a_write_cycle & 0;

  //motor_2_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign motor_2_avalon_slave_0_in_a_write_cycle = cpu_0_data_master_granted_motor_2_avalon_slave_0 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = motor_2_avalon_slave_0_in_a_write_cycle;

  assign wait_for_motor_2_avalon_slave_0_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //motor_2/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module motor_3_avalon_slave_0_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_0_data_master_address_to_slave,
                                            cpu_0_data_master_latency_counter,
                                            cpu_0_data_master_read,
                                            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                            cpu_0_data_master_write,
                                            cpu_0_data_master_writedata,
                                            motor_3_avalon_slave_0_readdata,
                                            reset_n,

                                           // outputs:
                                            cpu_0_data_master_granted_motor_3_avalon_slave_0,
                                            cpu_0_data_master_qualified_request_motor_3_avalon_slave_0,
                                            cpu_0_data_master_read_data_valid_motor_3_avalon_slave_0,
                                            cpu_0_data_master_requests_motor_3_avalon_slave_0,
                                            d1_motor_3_avalon_slave_0_end_xfer,
                                            motor_3_avalon_slave_0_address,
                                            motor_3_avalon_slave_0_chipselect_n,
                                            motor_3_avalon_slave_0_read_n,
                                            motor_3_avalon_slave_0_readdata_from_sa,
                                            motor_3_avalon_slave_0_reset_n,
                                            motor_3_avalon_slave_0_write_n,
                                            motor_3_avalon_slave_0_writedata
                                         )
;

  output           cpu_0_data_master_granted_motor_3_avalon_slave_0;
  output           cpu_0_data_master_qualified_request_motor_3_avalon_slave_0;
  output           cpu_0_data_master_read_data_valid_motor_3_avalon_slave_0;
  output           cpu_0_data_master_requests_motor_3_avalon_slave_0;
  output           d1_motor_3_avalon_slave_0_end_xfer;
  output  [  2: 0] motor_3_avalon_slave_0_address;
  output           motor_3_avalon_slave_0_chipselect_n;
  output           motor_3_avalon_slave_0_read_n;
  output  [ 31: 0] motor_3_avalon_slave_0_readdata_from_sa;
  output           motor_3_avalon_slave_0_reset_n;
  output           motor_3_avalon_slave_0_write_n;
  output  [ 31: 0] motor_3_avalon_slave_0_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] motor_3_avalon_slave_0_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_motor_3_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_motor_3_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_motor_3_avalon_slave_0;
  wire             cpu_0_data_master_requests_motor_3_avalon_slave_0;
  wire             cpu_0_data_master_saved_grant_motor_3_avalon_slave_0;
  reg              d1_motor_3_avalon_slave_0_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_motor_3_avalon_slave_0;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] motor_3_avalon_slave_0_address;
  wire             motor_3_avalon_slave_0_allgrants;
  wire             motor_3_avalon_slave_0_allow_new_arb_cycle;
  wire             motor_3_avalon_slave_0_any_bursting_master_saved_grant;
  wire             motor_3_avalon_slave_0_any_continuerequest;
  wire             motor_3_avalon_slave_0_arb_counter_enable;
  reg     [  1: 0] motor_3_avalon_slave_0_arb_share_counter;
  wire    [  1: 0] motor_3_avalon_slave_0_arb_share_counter_next_value;
  wire    [  1: 0] motor_3_avalon_slave_0_arb_share_set_values;
  wire             motor_3_avalon_slave_0_beginbursttransfer_internal;
  wire             motor_3_avalon_slave_0_begins_xfer;
  wire             motor_3_avalon_slave_0_chipselect_n;
  wire             motor_3_avalon_slave_0_end_xfer;
  wire             motor_3_avalon_slave_0_firsttransfer;
  wire             motor_3_avalon_slave_0_grant_vector;
  wire             motor_3_avalon_slave_0_in_a_read_cycle;
  wire             motor_3_avalon_slave_0_in_a_write_cycle;
  wire             motor_3_avalon_slave_0_master_qreq_vector;
  wire             motor_3_avalon_slave_0_non_bursting_master_requests;
  wire             motor_3_avalon_slave_0_read_n;
  wire    [ 31: 0] motor_3_avalon_slave_0_readdata_from_sa;
  reg              motor_3_avalon_slave_0_reg_firsttransfer;
  wire             motor_3_avalon_slave_0_reset_n;
  reg              motor_3_avalon_slave_0_slavearbiterlockenable;
  wire             motor_3_avalon_slave_0_slavearbiterlockenable2;
  wire             motor_3_avalon_slave_0_unreg_firsttransfer;
  wire             motor_3_avalon_slave_0_waits_for_read;
  wire             motor_3_avalon_slave_0_waits_for_write;
  wire             motor_3_avalon_slave_0_write_n;
  wire    [ 31: 0] motor_3_avalon_slave_0_writedata;
  wire    [ 24: 0] shifted_address_to_motor_3_avalon_slave_0_from_cpu_0_data_master;
  wire             wait_for_motor_3_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~motor_3_avalon_slave_0_end_xfer;
    end


  assign motor_3_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_motor_3_avalon_slave_0));
  //assign motor_3_avalon_slave_0_readdata_from_sa = motor_3_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign motor_3_avalon_slave_0_readdata_from_sa = motor_3_avalon_slave_0_readdata;

  assign cpu_0_data_master_requests_motor_3_avalon_slave_0 = ({cpu_0_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h10020e0) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //motor_3_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign motor_3_avalon_slave_0_arb_share_set_values = 1;

  //motor_3_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign motor_3_avalon_slave_0_non_bursting_master_requests = cpu_0_data_master_requests_motor_3_avalon_slave_0;

  //motor_3_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign motor_3_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //motor_3_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign motor_3_avalon_slave_0_arb_share_counter_next_value = motor_3_avalon_slave_0_firsttransfer ? (motor_3_avalon_slave_0_arb_share_set_values - 1) : |motor_3_avalon_slave_0_arb_share_counter ? (motor_3_avalon_slave_0_arb_share_counter - 1) : 0;

  //motor_3_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign motor_3_avalon_slave_0_allgrants = |motor_3_avalon_slave_0_grant_vector;

  //motor_3_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign motor_3_avalon_slave_0_end_xfer = ~(motor_3_avalon_slave_0_waits_for_read | motor_3_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_motor_3_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_motor_3_avalon_slave_0 = motor_3_avalon_slave_0_end_xfer & (~motor_3_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //motor_3_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign motor_3_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_motor_3_avalon_slave_0 & motor_3_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_motor_3_avalon_slave_0 & ~motor_3_avalon_slave_0_non_bursting_master_requests);

  //motor_3_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          motor_3_avalon_slave_0_arb_share_counter <= 0;
      else if (motor_3_avalon_slave_0_arb_counter_enable)
          motor_3_avalon_slave_0_arb_share_counter <= motor_3_avalon_slave_0_arb_share_counter_next_value;
    end


  //motor_3_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          motor_3_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|motor_3_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_motor_3_avalon_slave_0) | (end_xfer_arb_share_counter_term_motor_3_avalon_slave_0 & ~motor_3_avalon_slave_0_non_bursting_master_requests))
          motor_3_avalon_slave_0_slavearbiterlockenable <= |motor_3_avalon_slave_0_arb_share_counter_next_value;
    end


  //cpu_0/data_master motor_3/avalon_slave_0 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = motor_3_avalon_slave_0_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //motor_3_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign motor_3_avalon_slave_0_slavearbiterlockenable2 = |motor_3_avalon_slave_0_arb_share_counter_next_value;

  //cpu_0/data_master motor_3/avalon_slave_0 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = motor_3_avalon_slave_0_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //motor_3_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  assign motor_3_avalon_slave_0_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_motor_3_avalon_slave_0 = cpu_0_data_master_requests_motor_3_avalon_slave_0 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_motor_3_avalon_slave_0, which is an e_mux
  assign cpu_0_data_master_read_data_valid_motor_3_avalon_slave_0 = cpu_0_data_master_granted_motor_3_avalon_slave_0 & cpu_0_data_master_read & ~motor_3_avalon_slave_0_waits_for_read;

  //motor_3_avalon_slave_0_writedata mux, which is an e_mux
  assign motor_3_avalon_slave_0_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_motor_3_avalon_slave_0 = cpu_0_data_master_qualified_request_motor_3_avalon_slave_0;

  //cpu_0/data_master saved-grant motor_3/avalon_slave_0, which is an e_assign
  assign cpu_0_data_master_saved_grant_motor_3_avalon_slave_0 = cpu_0_data_master_requests_motor_3_avalon_slave_0;

  //allow new arb cycle for motor_3/avalon_slave_0, which is an e_assign
  assign motor_3_avalon_slave_0_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign motor_3_avalon_slave_0_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign motor_3_avalon_slave_0_master_qreq_vector = 1;

  //motor_3_avalon_slave_0_reset_n assignment, which is an e_assign
  assign motor_3_avalon_slave_0_reset_n = reset_n;

  assign motor_3_avalon_slave_0_chipselect_n = ~cpu_0_data_master_granted_motor_3_avalon_slave_0;
  //motor_3_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign motor_3_avalon_slave_0_firsttransfer = motor_3_avalon_slave_0_begins_xfer ? motor_3_avalon_slave_0_unreg_firsttransfer : motor_3_avalon_slave_0_reg_firsttransfer;

  //motor_3_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  assign motor_3_avalon_slave_0_unreg_firsttransfer = ~(motor_3_avalon_slave_0_slavearbiterlockenable & motor_3_avalon_slave_0_any_continuerequest);

  //motor_3_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          motor_3_avalon_slave_0_reg_firsttransfer <= 1'b1;
      else if (motor_3_avalon_slave_0_begins_xfer)
          motor_3_avalon_slave_0_reg_firsttransfer <= motor_3_avalon_slave_0_unreg_firsttransfer;
    end


  //motor_3_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign motor_3_avalon_slave_0_beginbursttransfer_internal = motor_3_avalon_slave_0_begins_xfer;

  //~motor_3_avalon_slave_0_read_n assignment, which is an e_mux
  assign motor_3_avalon_slave_0_read_n = ~(cpu_0_data_master_granted_motor_3_avalon_slave_0 & cpu_0_data_master_read);

  //~motor_3_avalon_slave_0_write_n assignment, which is an e_mux
  assign motor_3_avalon_slave_0_write_n = ~(cpu_0_data_master_granted_motor_3_avalon_slave_0 & cpu_0_data_master_write);

  assign shifted_address_to_motor_3_avalon_slave_0_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //motor_3_avalon_slave_0_address mux, which is an e_mux
  assign motor_3_avalon_slave_0_address = shifted_address_to_motor_3_avalon_slave_0_from_cpu_0_data_master >> 2;

  //d1_motor_3_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_motor_3_avalon_slave_0_end_xfer <= 1;
      else 
        d1_motor_3_avalon_slave_0_end_xfer <= motor_3_avalon_slave_0_end_xfer;
    end


  //motor_3_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign motor_3_avalon_slave_0_waits_for_read = motor_3_avalon_slave_0_in_a_read_cycle & motor_3_avalon_slave_0_begins_xfer;

  //motor_3_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign motor_3_avalon_slave_0_in_a_read_cycle = cpu_0_data_master_granted_motor_3_avalon_slave_0 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = motor_3_avalon_slave_0_in_a_read_cycle;

  //motor_3_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign motor_3_avalon_slave_0_waits_for_write = motor_3_avalon_slave_0_in_a_write_cycle & 0;

  //motor_3_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign motor_3_avalon_slave_0_in_a_write_cycle = cpu_0_data_master_granted_motor_3_avalon_slave_0 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = motor_3_avalon_slave_0_in_a_write_cycle;

  assign wait_for_motor_3_avalon_slave_0_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //motor_3/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module motor_4_avalon_slave_0_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_0_data_master_address_to_slave,
                                            cpu_0_data_master_latency_counter,
                                            cpu_0_data_master_read,
                                            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                            cpu_0_data_master_write,
                                            cpu_0_data_master_writedata,
                                            motor_4_avalon_slave_0_readdata,
                                            reset_n,

                                           // outputs:
                                            cpu_0_data_master_granted_motor_4_avalon_slave_0,
                                            cpu_0_data_master_qualified_request_motor_4_avalon_slave_0,
                                            cpu_0_data_master_read_data_valid_motor_4_avalon_slave_0,
                                            cpu_0_data_master_requests_motor_4_avalon_slave_0,
                                            d1_motor_4_avalon_slave_0_end_xfer,
                                            motor_4_avalon_slave_0_address,
                                            motor_4_avalon_slave_0_chipselect_n,
                                            motor_4_avalon_slave_0_read_n,
                                            motor_4_avalon_slave_0_readdata_from_sa,
                                            motor_4_avalon_slave_0_reset_n,
                                            motor_4_avalon_slave_0_write_n,
                                            motor_4_avalon_slave_0_writedata
                                         )
;

  output           cpu_0_data_master_granted_motor_4_avalon_slave_0;
  output           cpu_0_data_master_qualified_request_motor_4_avalon_slave_0;
  output           cpu_0_data_master_read_data_valid_motor_4_avalon_slave_0;
  output           cpu_0_data_master_requests_motor_4_avalon_slave_0;
  output           d1_motor_4_avalon_slave_0_end_xfer;
  output  [  2: 0] motor_4_avalon_slave_0_address;
  output           motor_4_avalon_slave_0_chipselect_n;
  output           motor_4_avalon_slave_0_read_n;
  output  [ 31: 0] motor_4_avalon_slave_0_readdata_from_sa;
  output           motor_4_avalon_slave_0_reset_n;
  output           motor_4_avalon_slave_0_write_n;
  output  [ 31: 0] motor_4_avalon_slave_0_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] motor_4_avalon_slave_0_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_motor_4_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_motor_4_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_motor_4_avalon_slave_0;
  wire             cpu_0_data_master_requests_motor_4_avalon_slave_0;
  wire             cpu_0_data_master_saved_grant_motor_4_avalon_slave_0;
  reg              d1_motor_4_avalon_slave_0_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_motor_4_avalon_slave_0;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] motor_4_avalon_slave_0_address;
  wire             motor_4_avalon_slave_0_allgrants;
  wire             motor_4_avalon_slave_0_allow_new_arb_cycle;
  wire             motor_4_avalon_slave_0_any_bursting_master_saved_grant;
  wire             motor_4_avalon_slave_0_any_continuerequest;
  wire             motor_4_avalon_slave_0_arb_counter_enable;
  reg     [  1: 0] motor_4_avalon_slave_0_arb_share_counter;
  wire    [  1: 0] motor_4_avalon_slave_0_arb_share_counter_next_value;
  wire    [  1: 0] motor_4_avalon_slave_0_arb_share_set_values;
  wire             motor_4_avalon_slave_0_beginbursttransfer_internal;
  wire             motor_4_avalon_slave_0_begins_xfer;
  wire             motor_4_avalon_slave_0_chipselect_n;
  wire             motor_4_avalon_slave_0_end_xfer;
  wire             motor_4_avalon_slave_0_firsttransfer;
  wire             motor_4_avalon_slave_0_grant_vector;
  wire             motor_4_avalon_slave_0_in_a_read_cycle;
  wire             motor_4_avalon_slave_0_in_a_write_cycle;
  wire             motor_4_avalon_slave_0_master_qreq_vector;
  wire             motor_4_avalon_slave_0_non_bursting_master_requests;
  wire             motor_4_avalon_slave_0_read_n;
  wire    [ 31: 0] motor_4_avalon_slave_0_readdata_from_sa;
  reg              motor_4_avalon_slave_0_reg_firsttransfer;
  wire             motor_4_avalon_slave_0_reset_n;
  reg              motor_4_avalon_slave_0_slavearbiterlockenable;
  wire             motor_4_avalon_slave_0_slavearbiterlockenable2;
  wire             motor_4_avalon_slave_0_unreg_firsttransfer;
  wire             motor_4_avalon_slave_0_waits_for_read;
  wire             motor_4_avalon_slave_0_waits_for_write;
  wire             motor_4_avalon_slave_0_write_n;
  wire    [ 31: 0] motor_4_avalon_slave_0_writedata;
  wire    [ 24: 0] shifted_address_to_motor_4_avalon_slave_0_from_cpu_0_data_master;
  wire             wait_for_motor_4_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~motor_4_avalon_slave_0_end_xfer;
    end


  assign motor_4_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_motor_4_avalon_slave_0));
  //assign motor_4_avalon_slave_0_readdata_from_sa = motor_4_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign motor_4_avalon_slave_0_readdata_from_sa = motor_4_avalon_slave_0_readdata;

  assign cpu_0_data_master_requests_motor_4_avalon_slave_0 = ({cpu_0_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1002100) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //motor_4_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign motor_4_avalon_slave_0_arb_share_set_values = 1;

  //motor_4_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign motor_4_avalon_slave_0_non_bursting_master_requests = cpu_0_data_master_requests_motor_4_avalon_slave_0;

  //motor_4_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign motor_4_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //motor_4_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign motor_4_avalon_slave_0_arb_share_counter_next_value = motor_4_avalon_slave_0_firsttransfer ? (motor_4_avalon_slave_0_arb_share_set_values - 1) : |motor_4_avalon_slave_0_arb_share_counter ? (motor_4_avalon_slave_0_arb_share_counter - 1) : 0;

  //motor_4_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign motor_4_avalon_slave_0_allgrants = |motor_4_avalon_slave_0_grant_vector;

  //motor_4_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign motor_4_avalon_slave_0_end_xfer = ~(motor_4_avalon_slave_0_waits_for_read | motor_4_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_motor_4_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_motor_4_avalon_slave_0 = motor_4_avalon_slave_0_end_xfer & (~motor_4_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //motor_4_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign motor_4_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_motor_4_avalon_slave_0 & motor_4_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_motor_4_avalon_slave_0 & ~motor_4_avalon_slave_0_non_bursting_master_requests);

  //motor_4_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          motor_4_avalon_slave_0_arb_share_counter <= 0;
      else if (motor_4_avalon_slave_0_arb_counter_enable)
          motor_4_avalon_slave_0_arb_share_counter <= motor_4_avalon_slave_0_arb_share_counter_next_value;
    end


  //motor_4_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          motor_4_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|motor_4_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_motor_4_avalon_slave_0) | (end_xfer_arb_share_counter_term_motor_4_avalon_slave_0 & ~motor_4_avalon_slave_0_non_bursting_master_requests))
          motor_4_avalon_slave_0_slavearbiterlockenable <= |motor_4_avalon_slave_0_arb_share_counter_next_value;
    end


  //cpu_0/data_master motor_4/avalon_slave_0 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = motor_4_avalon_slave_0_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //motor_4_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign motor_4_avalon_slave_0_slavearbiterlockenable2 = |motor_4_avalon_slave_0_arb_share_counter_next_value;

  //cpu_0/data_master motor_4/avalon_slave_0 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = motor_4_avalon_slave_0_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //motor_4_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  assign motor_4_avalon_slave_0_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_motor_4_avalon_slave_0 = cpu_0_data_master_requests_motor_4_avalon_slave_0 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_motor_4_avalon_slave_0, which is an e_mux
  assign cpu_0_data_master_read_data_valid_motor_4_avalon_slave_0 = cpu_0_data_master_granted_motor_4_avalon_slave_0 & cpu_0_data_master_read & ~motor_4_avalon_slave_0_waits_for_read;

  //motor_4_avalon_slave_0_writedata mux, which is an e_mux
  assign motor_4_avalon_slave_0_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_motor_4_avalon_slave_0 = cpu_0_data_master_qualified_request_motor_4_avalon_slave_0;

  //cpu_0/data_master saved-grant motor_4/avalon_slave_0, which is an e_assign
  assign cpu_0_data_master_saved_grant_motor_4_avalon_slave_0 = cpu_0_data_master_requests_motor_4_avalon_slave_0;

  //allow new arb cycle for motor_4/avalon_slave_0, which is an e_assign
  assign motor_4_avalon_slave_0_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign motor_4_avalon_slave_0_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign motor_4_avalon_slave_0_master_qreq_vector = 1;

  //motor_4_avalon_slave_0_reset_n assignment, which is an e_assign
  assign motor_4_avalon_slave_0_reset_n = reset_n;

  assign motor_4_avalon_slave_0_chipselect_n = ~cpu_0_data_master_granted_motor_4_avalon_slave_0;
  //motor_4_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign motor_4_avalon_slave_0_firsttransfer = motor_4_avalon_slave_0_begins_xfer ? motor_4_avalon_slave_0_unreg_firsttransfer : motor_4_avalon_slave_0_reg_firsttransfer;

  //motor_4_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  assign motor_4_avalon_slave_0_unreg_firsttransfer = ~(motor_4_avalon_slave_0_slavearbiterlockenable & motor_4_avalon_slave_0_any_continuerequest);

  //motor_4_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          motor_4_avalon_slave_0_reg_firsttransfer <= 1'b1;
      else if (motor_4_avalon_slave_0_begins_xfer)
          motor_4_avalon_slave_0_reg_firsttransfer <= motor_4_avalon_slave_0_unreg_firsttransfer;
    end


  //motor_4_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign motor_4_avalon_slave_0_beginbursttransfer_internal = motor_4_avalon_slave_0_begins_xfer;

  //~motor_4_avalon_slave_0_read_n assignment, which is an e_mux
  assign motor_4_avalon_slave_0_read_n = ~(cpu_0_data_master_granted_motor_4_avalon_slave_0 & cpu_0_data_master_read);

  //~motor_4_avalon_slave_0_write_n assignment, which is an e_mux
  assign motor_4_avalon_slave_0_write_n = ~(cpu_0_data_master_granted_motor_4_avalon_slave_0 & cpu_0_data_master_write);

  assign shifted_address_to_motor_4_avalon_slave_0_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //motor_4_avalon_slave_0_address mux, which is an e_mux
  assign motor_4_avalon_slave_0_address = shifted_address_to_motor_4_avalon_slave_0_from_cpu_0_data_master >> 2;

  //d1_motor_4_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_motor_4_avalon_slave_0_end_xfer <= 1;
      else 
        d1_motor_4_avalon_slave_0_end_xfer <= motor_4_avalon_slave_0_end_xfer;
    end


  //motor_4_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign motor_4_avalon_slave_0_waits_for_read = motor_4_avalon_slave_0_in_a_read_cycle & motor_4_avalon_slave_0_begins_xfer;

  //motor_4_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign motor_4_avalon_slave_0_in_a_read_cycle = cpu_0_data_master_granted_motor_4_avalon_slave_0 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = motor_4_avalon_slave_0_in_a_read_cycle;

  //motor_4_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign motor_4_avalon_slave_0_waits_for_write = motor_4_avalon_slave_0_in_a_write_cycle & 0;

  //motor_4_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign motor_4_avalon_slave_0_in_a_write_cycle = cpu_0_data_master_granted_motor_4_avalon_slave_0 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = motor_4_avalon_slave_0_in_a_write_cycle;

  assign wait_for_motor_4_avalon_slave_0_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //motor_4/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_buzzer_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_0_data_master_address_to_slave,
                                   cpu_0_data_master_latency_counter,
                                   cpu_0_data_master_read,
                                   cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                   cpu_0_data_master_write,
                                   cpu_0_data_master_writedata,
                                   pio_buzzer_s1_readdata,
                                   reset_n,

                                  // outputs:
                                   cpu_0_data_master_granted_pio_buzzer_s1,
                                   cpu_0_data_master_qualified_request_pio_buzzer_s1,
                                   cpu_0_data_master_read_data_valid_pio_buzzer_s1,
                                   cpu_0_data_master_requests_pio_buzzer_s1,
                                   d1_pio_buzzer_s1_end_xfer,
                                   pio_buzzer_s1_address,
                                   pio_buzzer_s1_chipselect,
                                   pio_buzzer_s1_readdata_from_sa,
                                   pio_buzzer_s1_reset_n,
                                   pio_buzzer_s1_write_n,
                                   pio_buzzer_s1_writedata
                                )
;

  output           cpu_0_data_master_granted_pio_buzzer_s1;
  output           cpu_0_data_master_qualified_request_pio_buzzer_s1;
  output           cpu_0_data_master_read_data_valid_pio_buzzer_s1;
  output           cpu_0_data_master_requests_pio_buzzer_s1;
  output           d1_pio_buzzer_s1_end_xfer;
  output  [  1: 0] pio_buzzer_s1_address;
  output           pio_buzzer_s1_chipselect;
  output           pio_buzzer_s1_readdata_from_sa;
  output           pio_buzzer_s1_reset_n;
  output           pio_buzzer_s1_write_n;
  output           pio_buzzer_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            pio_buzzer_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_buzzer_s1;
  wire             cpu_0_data_master_qualified_request_pio_buzzer_s1;
  wire             cpu_0_data_master_read_data_valid_pio_buzzer_s1;
  wire             cpu_0_data_master_requests_pio_buzzer_s1;
  wire             cpu_0_data_master_saved_grant_pio_buzzer_s1;
  reg              d1_pio_buzzer_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_buzzer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_buzzer_s1_address;
  wire             pio_buzzer_s1_allgrants;
  wire             pio_buzzer_s1_allow_new_arb_cycle;
  wire             pio_buzzer_s1_any_bursting_master_saved_grant;
  wire             pio_buzzer_s1_any_continuerequest;
  wire             pio_buzzer_s1_arb_counter_enable;
  reg     [  1: 0] pio_buzzer_s1_arb_share_counter;
  wire    [  1: 0] pio_buzzer_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_buzzer_s1_arb_share_set_values;
  wire             pio_buzzer_s1_beginbursttransfer_internal;
  wire             pio_buzzer_s1_begins_xfer;
  wire             pio_buzzer_s1_chipselect;
  wire             pio_buzzer_s1_end_xfer;
  wire             pio_buzzer_s1_firsttransfer;
  wire             pio_buzzer_s1_grant_vector;
  wire             pio_buzzer_s1_in_a_read_cycle;
  wire             pio_buzzer_s1_in_a_write_cycle;
  wire             pio_buzzer_s1_master_qreq_vector;
  wire             pio_buzzer_s1_non_bursting_master_requests;
  wire             pio_buzzer_s1_readdata_from_sa;
  reg              pio_buzzer_s1_reg_firsttransfer;
  wire             pio_buzzer_s1_reset_n;
  reg              pio_buzzer_s1_slavearbiterlockenable;
  wire             pio_buzzer_s1_slavearbiterlockenable2;
  wire             pio_buzzer_s1_unreg_firsttransfer;
  wire             pio_buzzer_s1_waits_for_read;
  wire             pio_buzzer_s1_waits_for_write;
  wire             pio_buzzer_s1_write_n;
  wire             pio_buzzer_s1_writedata;
  wire    [ 24: 0] shifted_address_to_pio_buzzer_s1_from_cpu_0_data_master;
  wire             wait_for_pio_buzzer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_buzzer_s1_end_xfer;
    end


  assign pio_buzzer_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_buzzer_s1));
  //assign pio_buzzer_s1_readdata_from_sa = pio_buzzer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_buzzer_s1_readdata_from_sa = pio_buzzer_s1_readdata;

  assign cpu_0_data_master_requests_pio_buzzer_s1 = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1002120) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //pio_buzzer_s1_arb_share_counter set values, which is an e_mux
  assign pio_buzzer_s1_arb_share_set_values = 1;

  //pio_buzzer_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_buzzer_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_buzzer_s1;

  //pio_buzzer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_buzzer_s1_any_bursting_master_saved_grant = 0;

  //pio_buzzer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_buzzer_s1_arb_share_counter_next_value = pio_buzzer_s1_firsttransfer ? (pio_buzzer_s1_arb_share_set_values - 1) : |pio_buzzer_s1_arb_share_counter ? (pio_buzzer_s1_arb_share_counter - 1) : 0;

  //pio_buzzer_s1_allgrants all slave grants, which is an e_mux
  assign pio_buzzer_s1_allgrants = |pio_buzzer_s1_grant_vector;

  //pio_buzzer_s1_end_xfer assignment, which is an e_assign
  assign pio_buzzer_s1_end_xfer = ~(pio_buzzer_s1_waits_for_read | pio_buzzer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_buzzer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_buzzer_s1 = pio_buzzer_s1_end_xfer & (~pio_buzzer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_buzzer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_buzzer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_buzzer_s1 & pio_buzzer_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_buzzer_s1 & ~pio_buzzer_s1_non_bursting_master_requests);

  //pio_buzzer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_buzzer_s1_arb_share_counter <= 0;
      else if (pio_buzzer_s1_arb_counter_enable)
          pio_buzzer_s1_arb_share_counter <= pio_buzzer_s1_arb_share_counter_next_value;
    end


  //pio_buzzer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_buzzer_s1_slavearbiterlockenable <= 0;
      else if ((|pio_buzzer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_buzzer_s1) | (end_xfer_arb_share_counter_term_pio_buzzer_s1 & ~pio_buzzer_s1_non_bursting_master_requests))
          pio_buzzer_s1_slavearbiterlockenable <= |pio_buzzer_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_buzzer/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_buzzer_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_buzzer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_buzzer_s1_slavearbiterlockenable2 = |pio_buzzer_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_buzzer/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_buzzer_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_buzzer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_buzzer_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_buzzer_s1 = cpu_0_data_master_requests_pio_buzzer_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_buzzer_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_buzzer_s1 = cpu_0_data_master_granted_pio_buzzer_s1 & cpu_0_data_master_read & ~pio_buzzer_s1_waits_for_read;

  //pio_buzzer_s1_writedata mux, which is an e_mux
  assign pio_buzzer_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_buzzer_s1 = cpu_0_data_master_qualified_request_pio_buzzer_s1;

  //cpu_0/data_master saved-grant pio_buzzer/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_buzzer_s1 = cpu_0_data_master_requests_pio_buzzer_s1;

  //allow new arb cycle for pio_buzzer/s1, which is an e_assign
  assign pio_buzzer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_buzzer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_buzzer_s1_master_qreq_vector = 1;

  //pio_buzzer_s1_reset_n assignment, which is an e_assign
  assign pio_buzzer_s1_reset_n = reset_n;

  assign pio_buzzer_s1_chipselect = cpu_0_data_master_granted_pio_buzzer_s1;
  //pio_buzzer_s1_firsttransfer first transaction, which is an e_assign
  assign pio_buzzer_s1_firsttransfer = pio_buzzer_s1_begins_xfer ? pio_buzzer_s1_unreg_firsttransfer : pio_buzzer_s1_reg_firsttransfer;

  //pio_buzzer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_buzzer_s1_unreg_firsttransfer = ~(pio_buzzer_s1_slavearbiterlockenable & pio_buzzer_s1_any_continuerequest);

  //pio_buzzer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_buzzer_s1_reg_firsttransfer <= 1'b1;
      else if (pio_buzzer_s1_begins_xfer)
          pio_buzzer_s1_reg_firsttransfer <= pio_buzzer_s1_unreg_firsttransfer;
    end


  //pio_buzzer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_buzzer_s1_beginbursttransfer_internal = pio_buzzer_s1_begins_xfer;

  //~pio_buzzer_s1_write_n assignment, which is an e_mux
  assign pio_buzzer_s1_write_n = ~(cpu_0_data_master_granted_pio_buzzer_s1 & cpu_0_data_master_write);

  assign shifted_address_to_pio_buzzer_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_buzzer_s1_address mux, which is an e_mux
  assign pio_buzzer_s1_address = shifted_address_to_pio_buzzer_s1_from_cpu_0_data_master >> 2;

  //d1_pio_buzzer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_buzzer_s1_end_xfer <= 1;
      else 
        d1_pio_buzzer_s1_end_xfer <= pio_buzzer_s1_end_xfer;
    end


  //pio_buzzer_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_buzzer_s1_waits_for_read = pio_buzzer_s1_in_a_read_cycle & pio_buzzer_s1_begins_xfer;

  //pio_buzzer_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_buzzer_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_buzzer_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_buzzer_s1_in_a_read_cycle;

  //pio_buzzer_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_buzzer_s1_waits_for_write = pio_buzzer_s1_in_a_write_cycle & 0;

  //pio_buzzer_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_buzzer_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_buzzer_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_buzzer_s1_in_a_write_cycle;

  assign wait_for_pio_buzzer_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_buzzer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_hull_fault1_s1_arbitrator (
                                       // inputs:
                                        clk,
                                        cpu_0_data_master_address_to_slave,
                                        cpu_0_data_master_latency_counter,
                                        cpu_0_data_master_read,
                                        cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                        cpu_0_data_master_write,
                                        pio_hull_fault1_s1_readdata,
                                        reset_n,

                                       // outputs:
                                        cpu_0_data_master_granted_pio_hull_fault1_s1,
                                        cpu_0_data_master_qualified_request_pio_hull_fault1_s1,
                                        cpu_0_data_master_read_data_valid_pio_hull_fault1_s1,
                                        cpu_0_data_master_requests_pio_hull_fault1_s1,
                                        d1_pio_hull_fault1_s1_end_xfer,
                                        pio_hull_fault1_s1_address,
                                        pio_hull_fault1_s1_readdata_from_sa,
                                        pio_hull_fault1_s1_reset_n
                                     )
;

  output           cpu_0_data_master_granted_pio_hull_fault1_s1;
  output           cpu_0_data_master_qualified_request_pio_hull_fault1_s1;
  output           cpu_0_data_master_read_data_valid_pio_hull_fault1_s1;
  output           cpu_0_data_master_requests_pio_hull_fault1_s1;
  output           d1_pio_hull_fault1_s1_end_xfer;
  output  [  1: 0] pio_hull_fault1_s1_address;
  output           pio_hull_fault1_s1_readdata_from_sa;
  output           pio_hull_fault1_s1_reset_n;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input            pio_hull_fault1_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_hull_fault1_s1;
  wire             cpu_0_data_master_qualified_request_pio_hull_fault1_s1;
  wire             cpu_0_data_master_read_data_valid_pio_hull_fault1_s1;
  wire             cpu_0_data_master_requests_pio_hull_fault1_s1;
  wire             cpu_0_data_master_saved_grant_pio_hull_fault1_s1;
  reg              d1_pio_hull_fault1_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_hull_fault1_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_hull_fault1_s1_address;
  wire             pio_hull_fault1_s1_allgrants;
  wire             pio_hull_fault1_s1_allow_new_arb_cycle;
  wire             pio_hull_fault1_s1_any_bursting_master_saved_grant;
  wire             pio_hull_fault1_s1_any_continuerequest;
  wire             pio_hull_fault1_s1_arb_counter_enable;
  reg     [  1: 0] pio_hull_fault1_s1_arb_share_counter;
  wire    [  1: 0] pio_hull_fault1_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_hull_fault1_s1_arb_share_set_values;
  wire             pio_hull_fault1_s1_beginbursttransfer_internal;
  wire             pio_hull_fault1_s1_begins_xfer;
  wire             pio_hull_fault1_s1_end_xfer;
  wire             pio_hull_fault1_s1_firsttransfer;
  wire             pio_hull_fault1_s1_grant_vector;
  wire             pio_hull_fault1_s1_in_a_read_cycle;
  wire             pio_hull_fault1_s1_in_a_write_cycle;
  wire             pio_hull_fault1_s1_master_qreq_vector;
  wire             pio_hull_fault1_s1_non_bursting_master_requests;
  wire             pio_hull_fault1_s1_readdata_from_sa;
  reg              pio_hull_fault1_s1_reg_firsttransfer;
  wire             pio_hull_fault1_s1_reset_n;
  reg              pio_hull_fault1_s1_slavearbiterlockenable;
  wire             pio_hull_fault1_s1_slavearbiterlockenable2;
  wire             pio_hull_fault1_s1_unreg_firsttransfer;
  wire             pio_hull_fault1_s1_waits_for_read;
  wire             pio_hull_fault1_s1_waits_for_write;
  wire    [ 24: 0] shifted_address_to_pio_hull_fault1_s1_from_cpu_0_data_master;
  wire             wait_for_pio_hull_fault1_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_hull_fault1_s1_end_xfer;
    end


  assign pio_hull_fault1_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_hull_fault1_s1));
  //assign pio_hull_fault1_s1_readdata_from_sa = pio_hull_fault1_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_hull_fault1_s1_readdata_from_sa = pio_hull_fault1_s1_readdata;

  assign cpu_0_data_master_requests_pio_hull_fault1_s1 = (({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1002210) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //pio_hull_fault1_s1_arb_share_counter set values, which is an e_mux
  assign pio_hull_fault1_s1_arb_share_set_values = 1;

  //pio_hull_fault1_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_hull_fault1_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_hull_fault1_s1;

  //pio_hull_fault1_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_hull_fault1_s1_any_bursting_master_saved_grant = 0;

  //pio_hull_fault1_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_hull_fault1_s1_arb_share_counter_next_value = pio_hull_fault1_s1_firsttransfer ? (pio_hull_fault1_s1_arb_share_set_values - 1) : |pio_hull_fault1_s1_arb_share_counter ? (pio_hull_fault1_s1_arb_share_counter - 1) : 0;

  //pio_hull_fault1_s1_allgrants all slave grants, which is an e_mux
  assign pio_hull_fault1_s1_allgrants = |pio_hull_fault1_s1_grant_vector;

  //pio_hull_fault1_s1_end_xfer assignment, which is an e_assign
  assign pio_hull_fault1_s1_end_xfer = ~(pio_hull_fault1_s1_waits_for_read | pio_hull_fault1_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_hull_fault1_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_hull_fault1_s1 = pio_hull_fault1_s1_end_xfer & (~pio_hull_fault1_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_hull_fault1_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_hull_fault1_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_hull_fault1_s1 & pio_hull_fault1_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_hull_fault1_s1 & ~pio_hull_fault1_s1_non_bursting_master_requests);

  //pio_hull_fault1_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_hull_fault1_s1_arb_share_counter <= 0;
      else if (pio_hull_fault1_s1_arb_counter_enable)
          pio_hull_fault1_s1_arb_share_counter <= pio_hull_fault1_s1_arb_share_counter_next_value;
    end


  //pio_hull_fault1_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_hull_fault1_s1_slavearbiterlockenable <= 0;
      else if ((|pio_hull_fault1_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_hull_fault1_s1) | (end_xfer_arb_share_counter_term_pio_hull_fault1_s1 & ~pio_hull_fault1_s1_non_bursting_master_requests))
          pio_hull_fault1_s1_slavearbiterlockenable <= |pio_hull_fault1_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_hull_fault1/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_hull_fault1_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_hull_fault1_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_hull_fault1_s1_slavearbiterlockenable2 = |pio_hull_fault1_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_hull_fault1/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_hull_fault1_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_hull_fault1_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_hull_fault1_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_hull_fault1_s1 = cpu_0_data_master_requests_pio_hull_fault1_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_hull_fault1_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_hull_fault1_s1 = cpu_0_data_master_granted_pio_hull_fault1_s1 & cpu_0_data_master_read & ~pio_hull_fault1_s1_waits_for_read;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_hull_fault1_s1 = cpu_0_data_master_qualified_request_pio_hull_fault1_s1;

  //cpu_0/data_master saved-grant pio_hull_fault1/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_hull_fault1_s1 = cpu_0_data_master_requests_pio_hull_fault1_s1;

  //allow new arb cycle for pio_hull_fault1/s1, which is an e_assign
  assign pio_hull_fault1_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_hull_fault1_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_hull_fault1_s1_master_qreq_vector = 1;

  //pio_hull_fault1_s1_reset_n assignment, which is an e_assign
  assign pio_hull_fault1_s1_reset_n = reset_n;

  //pio_hull_fault1_s1_firsttransfer first transaction, which is an e_assign
  assign pio_hull_fault1_s1_firsttransfer = pio_hull_fault1_s1_begins_xfer ? pio_hull_fault1_s1_unreg_firsttransfer : pio_hull_fault1_s1_reg_firsttransfer;

  //pio_hull_fault1_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_hull_fault1_s1_unreg_firsttransfer = ~(pio_hull_fault1_s1_slavearbiterlockenable & pio_hull_fault1_s1_any_continuerequest);

  //pio_hull_fault1_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_hull_fault1_s1_reg_firsttransfer <= 1'b1;
      else if (pio_hull_fault1_s1_begins_xfer)
          pio_hull_fault1_s1_reg_firsttransfer <= pio_hull_fault1_s1_unreg_firsttransfer;
    end


  //pio_hull_fault1_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_hull_fault1_s1_beginbursttransfer_internal = pio_hull_fault1_s1_begins_xfer;

  assign shifted_address_to_pio_hull_fault1_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_hull_fault1_s1_address mux, which is an e_mux
  assign pio_hull_fault1_s1_address = shifted_address_to_pio_hull_fault1_s1_from_cpu_0_data_master >> 2;

  //d1_pio_hull_fault1_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_hull_fault1_s1_end_xfer <= 1;
      else 
        d1_pio_hull_fault1_s1_end_xfer <= pio_hull_fault1_s1_end_xfer;
    end


  //pio_hull_fault1_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_hull_fault1_s1_waits_for_read = pio_hull_fault1_s1_in_a_read_cycle & pio_hull_fault1_s1_begins_xfer;

  //pio_hull_fault1_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_hull_fault1_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_hull_fault1_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_hull_fault1_s1_in_a_read_cycle;

  //pio_hull_fault1_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_hull_fault1_s1_waits_for_write = pio_hull_fault1_s1_in_a_write_cycle & 0;

  //pio_hull_fault1_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_hull_fault1_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_hull_fault1_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_hull_fault1_s1_in_a_write_cycle;

  assign wait_for_pio_hull_fault1_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_hull_fault1/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_hull_fault2_s1_arbitrator (
                                       // inputs:
                                        clk,
                                        cpu_0_data_master_address_to_slave,
                                        cpu_0_data_master_latency_counter,
                                        cpu_0_data_master_read,
                                        cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                        cpu_0_data_master_write,
                                        pio_hull_fault2_s1_readdata,
                                        reset_n,

                                       // outputs:
                                        cpu_0_data_master_granted_pio_hull_fault2_s1,
                                        cpu_0_data_master_qualified_request_pio_hull_fault2_s1,
                                        cpu_0_data_master_read_data_valid_pio_hull_fault2_s1,
                                        cpu_0_data_master_requests_pio_hull_fault2_s1,
                                        d1_pio_hull_fault2_s1_end_xfer,
                                        pio_hull_fault2_s1_address,
                                        pio_hull_fault2_s1_readdata_from_sa,
                                        pio_hull_fault2_s1_reset_n
                                     )
;

  output           cpu_0_data_master_granted_pio_hull_fault2_s1;
  output           cpu_0_data_master_qualified_request_pio_hull_fault2_s1;
  output           cpu_0_data_master_read_data_valid_pio_hull_fault2_s1;
  output           cpu_0_data_master_requests_pio_hull_fault2_s1;
  output           d1_pio_hull_fault2_s1_end_xfer;
  output  [  1: 0] pio_hull_fault2_s1_address;
  output           pio_hull_fault2_s1_readdata_from_sa;
  output           pio_hull_fault2_s1_reset_n;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input            pio_hull_fault2_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_hull_fault2_s1;
  wire             cpu_0_data_master_qualified_request_pio_hull_fault2_s1;
  wire             cpu_0_data_master_read_data_valid_pio_hull_fault2_s1;
  wire             cpu_0_data_master_requests_pio_hull_fault2_s1;
  wire             cpu_0_data_master_saved_grant_pio_hull_fault2_s1;
  reg              d1_pio_hull_fault2_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_hull_fault2_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_hull_fault2_s1_address;
  wire             pio_hull_fault2_s1_allgrants;
  wire             pio_hull_fault2_s1_allow_new_arb_cycle;
  wire             pio_hull_fault2_s1_any_bursting_master_saved_grant;
  wire             pio_hull_fault2_s1_any_continuerequest;
  wire             pio_hull_fault2_s1_arb_counter_enable;
  reg     [  1: 0] pio_hull_fault2_s1_arb_share_counter;
  wire    [  1: 0] pio_hull_fault2_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_hull_fault2_s1_arb_share_set_values;
  wire             pio_hull_fault2_s1_beginbursttransfer_internal;
  wire             pio_hull_fault2_s1_begins_xfer;
  wire             pio_hull_fault2_s1_end_xfer;
  wire             pio_hull_fault2_s1_firsttransfer;
  wire             pio_hull_fault2_s1_grant_vector;
  wire             pio_hull_fault2_s1_in_a_read_cycle;
  wire             pio_hull_fault2_s1_in_a_write_cycle;
  wire             pio_hull_fault2_s1_master_qreq_vector;
  wire             pio_hull_fault2_s1_non_bursting_master_requests;
  wire             pio_hull_fault2_s1_readdata_from_sa;
  reg              pio_hull_fault2_s1_reg_firsttransfer;
  wire             pio_hull_fault2_s1_reset_n;
  reg              pio_hull_fault2_s1_slavearbiterlockenable;
  wire             pio_hull_fault2_s1_slavearbiterlockenable2;
  wire             pio_hull_fault2_s1_unreg_firsttransfer;
  wire             pio_hull_fault2_s1_waits_for_read;
  wire             pio_hull_fault2_s1_waits_for_write;
  wire    [ 24: 0] shifted_address_to_pio_hull_fault2_s1_from_cpu_0_data_master;
  wire             wait_for_pio_hull_fault2_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_hull_fault2_s1_end_xfer;
    end


  assign pio_hull_fault2_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_hull_fault2_s1));
  //assign pio_hull_fault2_s1_readdata_from_sa = pio_hull_fault2_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_hull_fault2_s1_readdata_from_sa = pio_hull_fault2_s1_readdata;

  assign cpu_0_data_master_requests_pio_hull_fault2_s1 = (({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1002220) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //pio_hull_fault2_s1_arb_share_counter set values, which is an e_mux
  assign pio_hull_fault2_s1_arb_share_set_values = 1;

  //pio_hull_fault2_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_hull_fault2_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_hull_fault2_s1;

  //pio_hull_fault2_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_hull_fault2_s1_any_bursting_master_saved_grant = 0;

  //pio_hull_fault2_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_hull_fault2_s1_arb_share_counter_next_value = pio_hull_fault2_s1_firsttransfer ? (pio_hull_fault2_s1_arb_share_set_values - 1) : |pio_hull_fault2_s1_arb_share_counter ? (pio_hull_fault2_s1_arb_share_counter - 1) : 0;

  //pio_hull_fault2_s1_allgrants all slave grants, which is an e_mux
  assign pio_hull_fault2_s1_allgrants = |pio_hull_fault2_s1_grant_vector;

  //pio_hull_fault2_s1_end_xfer assignment, which is an e_assign
  assign pio_hull_fault2_s1_end_xfer = ~(pio_hull_fault2_s1_waits_for_read | pio_hull_fault2_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_hull_fault2_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_hull_fault2_s1 = pio_hull_fault2_s1_end_xfer & (~pio_hull_fault2_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_hull_fault2_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_hull_fault2_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_hull_fault2_s1 & pio_hull_fault2_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_hull_fault2_s1 & ~pio_hull_fault2_s1_non_bursting_master_requests);

  //pio_hull_fault2_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_hull_fault2_s1_arb_share_counter <= 0;
      else if (pio_hull_fault2_s1_arb_counter_enable)
          pio_hull_fault2_s1_arb_share_counter <= pio_hull_fault2_s1_arb_share_counter_next_value;
    end


  //pio_hull_fault2_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_hull_fault2_s1_slavearbiterlockenable <= 0;
      else if ((|pio_hull_fault2_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_hull_fault2_s1) | (end_xfer_arb_share_counter_term_pio_hull_fault2_s1 & ~pio_hull_fault2_s1_non_bursting_master_requests))
          pio_hull_fault2_s1_slavearbiterlockenable <= |pio_hull_fault2_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_hull_fault2/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_hull_fault2_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_hull_fault2_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_hull_fault2_s1_slavearbiterlockenable2 = |pio_hull_fault2_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_hull_fault2/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_hull_fault2_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_hull_fault2_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_hull_fault2_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_hull_fault2_s1 = cpu_0_data_master_requests_pio_hull_fault2_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_hull_fault2_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_hull_fault2_s1 = cpu_0_data_master_granted_pio_hull_fault2_s1 & cpu_0_data_master_read & ~pio_hull_fault2_s1_waits_for_read;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_hull_fault2_s1 = cpu_0_data_master_qualified_request_pio_hull_fault2_s1;

  //cpu_0/data_master saved-grant pio_hull_fault2/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_hull_fault2_s1 = cpu_0_data_master_requests_pio_hull_fault2_s1;

  //allow new arb cycle for pio_hull_fault2/s1, which is an e_assign
  assign pio_hull_fault2_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_hull_fault2_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_hull_fault2_s1_master_qreq_vector = 1;

  //pio_hull_fault2_s1_reset_n assignment, which is an e_assign
  assign pio_hull_fault2_s1_reset_n = reset_n;

  //pio_hull_fault2_s1_firsttransfer first transaction, which is an e_assign
  assign pio_hull_fault2_s1_firsttransfer = pio_hull_fault2_s1_begins_xfer ? pio_hull_fault2_s1_unreg_firsttransfer : pio_hull_fault2_s1_reg_firsttransfer;

  //pio_hull_fault2_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_hull_fault2_s1_unreg_firsttransfer = ~(pio_hull_fault2_s1_slavearbiterlockenable & pio_hull_fault2_s1_any_continuerequest);

  //pio_hull_fault2_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_hull_fault2_s1_reg_firsttransfer <= 1'b1;
      else if (pio_hull_fault2_s1_begins_xfer)
          pio_hull_fault2_s1_reg_firsttransfer <= pio_hull_fault2_s1_unreg_firsttransfer;
    end


  //pio_hull_fault2_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_hull_fault2_s1_beginbursttransfer_internal = pio_hull_fault2_s1_begins_xfer;

  assign shifted_address_to_pio_hull_fault2_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_hull_fault2_s1_address mux, which is an e_mux
  assign pio_hull_fault2_s1_address = shifted_address_to_pio_hull_fault2_s1_from_cpu_0_data_master >> 2;

  //d1_pio_hull_fault2_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_hull_fault2_s1_end_xfer <= 1;
      else 
        d1_pio_hull_fault2_s1_end_xfer <= pio_hull_fault2_s1_end_xfer;
    end


  //pio_hull_fault2_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_hull_fault2_s1_waits_for_read = pio_hull_fault2_s1_in_a_read_cycle & pio_hull_fault2_s1_begins_xfer;

  //pio_hull_fault2_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_hull_fault2_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_hull_fault2_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_hull_fault2_s1_in_a_read_cycle;

  //pio_hull_fault2_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_hull_fault2_s1_waits_for_write = pio_hull_fault2_s1_in_a_write_cycle & 0;

  //pio_hull_fault2_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_hull_fault2_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_hull_fault2_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_hull_fault2_s1_in_a_write_cycle;

  assign wait_for_pio_hull_fault2_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_hull_fault2/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_hull_fault3_s1_arbitrator (
                                       // inputs:
                                        clk,
                                        cpu_0_data_master_address_to_slave,
                                        cpu_0_data_master_latency_counter,
                                        cpu_0_data_master_read,
                                        cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                        cpu_0_data_master_write,
                                        pio_hull_fault3_s1_readdata,
                                        reset_n,

                                       // outputs:
                                        cpu_0_data_master_granted_pio_hull_fault3_s1,
                                        cpu_0_data_master_qualified_request_pio_hull_fault3_s1,
                                        cpu_0_data_master_read_data_valid_pio_hull_fault3_s1,
                                        cpu_0_data_master_requests_pio_hull_fault3_s1,
                                        d1_pio_hull_fault3_s1_end_xfer,
                                        pio_hull_fault3_s1_address,
                                        pio_hull_fault3_s1_readdata_from_sa,
                                        pio_hull_fault3_s1_reset_n
                                     )
;

  output           cpu_0_data_master_granted_pio_hull_fault3_s1;
  output           cpu_0_data_master_qualified_request_pio_hull_fault3_s1;
  output           cpu_0_data_master_read_data_valid_pio_hull_fault3_s1;
  output           cpu_0_data_master_requests_pio_hull_fault3_s1;
  output           d1_pio_hull_fault3_s1_end_xfer;
  output  [  1: 0] pio_hull_fault3_s1_address;
  output           pio_hull_fault3_s1_readdata_from_sa;
  output           pio_hull_fault3_s1_reset_n;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input            pio_hull_fault3_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_hull_fault3_s1;
  wire             cpu_0_data_master_qualified_request_pio_hull_fault3_s1;
  wire             cpu_0_data_master_read_data_valid_pio_hull_fault3_s1;
  wire             cpu_0_data_master_requests_pio_hull_fault3_s1;
  wire             cpu_0_data_master_saved_grant_pio_hull_fault3_s1;
  reg              d1_pio_hull_fault3_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_hull_fault3_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_hull_fault3_s1_address;
  wire             pio_hull_fault3_s1_allgrants;
  wire             pio_hull_fault3_s1_allow_new_arb_cycle;
  wire             pio_hull_fault3_s1_any_bursting_master_saved_grant;
  wire             pio_hull_fault3_s1_any_continuerequest;
  wire             pio_hull_fault3_s1_arb_counter_enable;
  reg     [  1: 0] pio_hull_fault3_s1_arb_share_counter;
  wire    [  1: 0] pio_hull_fault3_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_hull_fault3_s1_arb_share_set_values;
  wire             pio_hull_fault3_s1_beginbursttransfer_internal;
  wire             pio_hull_fault3_s1_begins_xfer;
  wire             pio_hull_fault3_s1_end_xfer;
  wire             pio_hull_fault3_s1_firsttransfer;
  wire             pio_hull_fault3_s1_grant_vector;
  wire             pio_hull_fault3_s1_in_a_read_cycle;
  wire             pio_hull_fault3_s1_in_a_write_cycle;
  wire             pio_hull_fault3_s1_master_qreq_vector;
  wire             pio_hull_fault3_s1_non_bursting_master_requests;
  wire             pio_hull_fault3_s1_readdata_from_sa;
  reg              pio_hull_fault3_s1_reg_firsttransfer;
  wire             pio_hull_fault3_s1_reset_n;
  reg              pio_hull_fault3_s1_slavearbiterlockenable;
  wire             pio_hull_fault3_s1_slavearbiterlockenable2;
  wire             pio_hull_fault3_s1_unreg_firsttransfer;
  wire             pio_hull_fault3_s1_waits_for_read;
  wire             pio_hull_fault3_s1_waits_for_write;
  wire    [ 24: 0] shifted_address_to_pio_hull_fault3_s1_from_cpu_0_data_master;
  wire             wait_for_pio_hull_fault3_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_hull_fault3_s1_end_xfer;
    end


  assign pio_hull_fault3_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_hull_fault3_s1));
  //assign pio_hull_fault3_s1_readdata_from_sa = pio_hull_fault3_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_hull_fault3_s1_readdata_from_sa = pio_hull_fault3_s1_readdata;

  assign cpu_0_data_master_requests_pio_hull_fault3_s1 = (({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1002230) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //pio_hull_fault3_s1_arb_share_counter set values, which is an e_mux
  assign pio_hull_fault3_s1_arb_share_set_values = 1;

  //pio_hull_fault3_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_hull_fault3_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_hull_fault3_s1;

  //pio_hull_fault3_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_hull_fault3_s1_any_bursting_master_saved_grant = 0;

  //pio_hull_fault3_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_hull_fault3_s1_arb_share_counter_next_value = pio_hull_fault3_s1_firsttransfer ? (pio_hull_fault3_s1_arb_share_set_values - 1) : |pio_hull_fault3_s1_arb_share_counter ? (pio_hull_fault3_s1_arb_share_counter - 1) : 0;

  //pio_hull_fault3_s1_allgrants all slave grants, which is an e_mux
  assign pio_hull_fault3_s1_allgrants = |pio_hull_fault3_s1_grant_vector;

  //pio_hull_fault3_s1_end_xfer assignment, which is an e_assign
  assign pio_hull_fault3_s1_end_xfer = ~(pio_hull_fault3_s1_waits_for_read | pio_hull_fault3_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_hull_fault3_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_hull_fault3_s1 = pio_hull_fault3_s1_end_xfer & (~pio_hull_fault3_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_hull_fault3_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_hull_fault3_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_hull_fault3_s1 & pio_hull_fault3_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_hull_fault3_s1 & ~pio_hull_fault3_s1_non_bursting_master_requests);

  //pio_hull_fault3_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_hull_fault3_s1_arb_share_counter <= 0;
      else if (pio_hull_fault3_s1_arb_counter_enable)
          pio_hull_fault3_s1_arb_share_counter <= pio_hull_fault3_s1_arb_share_counter_next_value;
    end


  //pio_hull_fault3_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_hull_fault3_s1_slavearbiterlockenable <= 0;
      else if ((|pio_hull_fault3_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_hull_fault3_s1) | (end_xfer_arb_share_counter_term_pio_hull_fault3_s1 & ~pio_hull_fault3_s1_non_bursting_master_requests))
          pio_hull_fault3_s1_slavearbiterlockenable <= |pio_hull_fault3_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_hull_fault3/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_hull_fault3_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_hull_fault3_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_hull_fault3_s1_slavearbiterlockenable2 = |pio_hull_fault3_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_hull_fault3/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_hull_fault3_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_hull_fault3_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_hull_fault3_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_hull_fault3_s1 = cpu_0_data_master_requests_pio_hull_fault3_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_hull_fault3_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_hull_fault3_s1 = cpu_0_data_master_granted_pio_hull_fault3_s1 & cpu_0_data_master_read & ~pio_hull_fault3_s1_waits_for_read;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_hull_fault3_s1 = cpu_0_data_master_qualified_request_pio_hull_fault3_s1;

  //cpu_0/data_master saved-grant pio_hull_fault3/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_hull_fault3_s1 = cpu_0_data_master_requests_pio_hull_fault3_s1;

  //allow new arb cycle for pio_hull_fault3/s1, which is an e_assign
  assign pio_hull_fault3_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_hull_fault3_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_hull_fault3_s1_master_qreq_vector = 1;

  //pio_hull_fault3_s1_reset_n assignment, which is an e_assign
  assign pio_hull_fault3_s1_reset_n = reset_n;

  //pio_hull_fault3_s1_firsttransfer first transaction, which is an e_assign
  assign pio_hull_fault3_s1_firsttransfer = pio_hull_fault3_s1_begins_xfer ? pio_hull_fault3_s1_unreg_firsttransfer : pio_hull_fault3_s1_reg_firsttransfer;

  //pio_hull_fault3_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_hull_fault3_s1_unreg_firsttransfer = ~(pio_hull_fault3_s1_slavearbiterlockenable & pio_hull_fault3_s1_any_continuerequest);

  //pio_hull_fault3_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_hull_fault3_s1_reg_firsttransfer <= 1'b1;
      else if (pio_hull_fault3_s1_begins_xfer)
          pio_hull_fault3_s1_reg_firsttransfer <= pio_hull_fault3_s1_unreg_firsttransfer;
    end


  //pio_hull_fault3_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_hull_fault3_s1_beginbursttransfer_internal = pio_hull_fault3_s1_begins_xfer;

  assign shifted_address_to_pio_hull_fault3_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_hull_fault3_s1_address mux, which is an e_mux
  assign pio_hull_fault3_s1_address = shifted_address_to_pio_hull_fault3_s1_from_cpu_0_data_master >> 2;

  //d1_pio_hull_fault3_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_hull_fault3_s1_end_xfer <= 1;
      else 
        d1_pio_hull_fault3_s1_end_xfer <= pio_hull_fault3_s1_end_xfer;
    end


  //pio_hull_fault3_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_hull_fault3_s1_waits_for_read = pio_hull_fault3_s1_in_a_read_cycle & pio_hull_fault3_s1_begins_xfer;

  //pio_hull_fault3_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_hull_fault3_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_hull_fault3_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_hull_fault3_s1_in_a_read_cycle;

  //pio_hull_fault3_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_hull_fault3_s1_waits_for_write = pio_hull_fault3_s1_in_a_write_cycle & 0;

  //pio_hull_fault3_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_hull_fault3_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_hull_fault3_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_hull_fault3_s1_in_a_write_cycle;

  assign wait_for_pio_hull_fault3_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_hull_fault3/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_hull_fault4_s1_arbitrator (
                                       // inputs:
                                        clk,
                                        cpu_0_data_master_address_to_slave,
                                        cpu_0_data_master_latency_counter,
                                        cpu_0_data_master_read,
                                        cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                        cpu_0_data_master_write,
                                        pio_hull_fault4_s1_readdata,
                                        reset_n,

                                       // outputs:
                                        cpu_0_data_master_granted_pio_hull_fault4_s1,
                                        cpu_0_data_master_qualified_request_pio_hull_fault4_s1,
                                        cpu_0_data_master_read_data_valid_pio_hull_fault4_s1,
                                        cpu_0_data_master_requests_pio_hull_fault4_s1,
                                        d1_pio_hull_fault4_s1_end_xfer,
                                        pio_hull_fault4_s1_address,
                                        pio_hull_fault4_s1_readdata_from_sa,
                                        pio_hull_fault4_s1_reset_n
                                     )
;

  output           cpu_0_data_master_granted_pio_hull_fault4_s1;
  output           cpu_0_data_master_qualified_request_pio_hull_fault4_s1;
  output           cpu_0_data_master_read_data_valid_pio_hull_fault4_s1;
  output           cpu_0_data_master_requests_pio_hull_fault4_s1;
  output           d1_pio_hull_fault4_s1_end_xfer;
  output  [  1: 0] pio_hull_fault4_s1_address;
  output           pio_hull_fault4_s1_readdata_from_sa;
  output           pio_hull_fault4_s1_reset_n;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input            pio_hull_fault4_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_hull_fault4_s1;
  wire             cpu_0_data_master_qualified_request_pio_hull_fault4_s1;
  wire             cpu_0_data_master_read_data_valid_pio_hull_fault4_s1;
  wire             cpu_0_data_master_requests_pio_hull_fault4_s1;
  wire             cpu_0_data_master_saved_grant_pio_hull_fault4_s1;
  reg              d1_pio_hull_fault4_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_hull_fault4_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_hull_fault4_s1_address;
  wire             pio_hull_fault4_s1_allgrants;
  wire             pio_hull_fault4_s1_allow_new_arb_cycle;
  wire             pio_hull_fault4_s1_any_bursting_master_saved_grant;
  wire             pio_hull_fault4_s1_any_continuerequest;
  wire             pio_hull_fault4_s1_arb_counter_enable;
  reg     [  1: 0] pio_hull_fault4_s1_arb_share_counter;
  wire    [  1: 0] pio_hull_fault4_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_hull_fault4_s1_arb_share_set_values;
  wire             pio_hull_fault4_s1_beginbursttransfer_internal;
  wire             pio_hull_fault4_s1_begins_xfer;
  wire             pio_hull_fault4_s1_end_xfer;
  wire             pio_hull_fault4_s1_firsttransfer;
  wire             pio_hull_fault4_s1_grant_vector;
  wire             pio_hull_fault4_s1_in_a_read_cycle;
  wire             pio_hull_fault4_s1_in_a_write_cycle;
  wire             pio_hull_fault4_s1_master_qreq_vector;
  wire             pio_hull_fault4_s1_non_bursting_master_requests;
  wire             pio_hull_fault4_s1_readdata_from_sa;
  reg              pio_hull_fault4_s1_reg_firsttransfer;
  wire             pio_hull_fault4_s1_reset_n;
  reg              pio_hull_fault4_s1_slavearbiterlockenable;
  wire             pio_hull_fault4_s1_slavearbiterlockenable2;
  wire             pio_hull_fault4_s1_unreg_firsttransfer;
  wire             pio_hull_fault4_s1_waits_for_read;
  wire             pio_hull_fault4_s1_waits_for_write;
  wire    [ 24: 0] shifted_address_to_pio_hull_fault4_s1_from_cpu_0_data_master;
  wire             wait_for_pio_hull_fault4_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_hull_fault4_s1_end_xfer;
    end


  assign pio_hull_fault4_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_hull_fault4_s1));
  //assign pio_hull_fault4_s1_readdata_from_sa = pio_hull_fault4_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_hull_fault4_s1_readdata_from_sa = pio_hull_fault4_s1_readdata;

  assign cpu_0_data_master_requests_pio_hull_fault4_s1 = (({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1002240) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //pio_hull_fault4_s1_arb_share_counter set values, which is an e_mux
  assign pio_hull_fault4_s1_arb_share_set_values = 1;

  //pio_hull_fault4_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_hull_fault4_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_hull_fault4_s1;

  //pio_hull_fault4_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_hull_fault4_s1_any_bursting_master_saved_grant = 0;

  //pio_hull_fault4_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_hull_fault4_s1_arb_share_counter_next_value = pio_hull_fault4_s1_firsttransfer ? (pio_hull_fault4_s1_arb_share_set_values - 1) : |pio_hull_fault4_s1_arb_share_counter ? (pio_hull_fault4_s1_arb_share_counter - 1) : 0;

  //pio_hull_fault4_s1_allgrants all slave grants, which is an e_mux
  assign pio_hull_fault4_s1_allgrants = |pio_hull_fault4_s1_grant_vector;

  //pio_hull_fault4_s1_end_xfer assignment, which is an e_assign
  assign pio_hull_fault4_s1_end_xfer = ~(pio_hull_fault4_s1_waits_for_read | pio_hull_fault4_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_hull_fault4_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_hull_fault4_s1 = pio_hull_fault4_s1_end_xfer & (~pio_hull_fault4_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_hull_fault4_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_hull_fault4_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_hull_fault4_s1 & pio_hull_fault4_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_hull_fault4_s1 & ~pio_hull_fault4_s1_non_bursting_master_requests);

  //pio_hull_fault4_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_hull_fault4_s1_arb_share_counter <= 0;
      else if (pio_hull_fault4_s1_arb_counter_enable)
          pio_hull_fault4_s1_arb_share_counter <= pio_hull_fault4_s1_arb_share_counter_next_value;
    end


  //pio_hull_fault4_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_hull_fault4_s1_slavearbiterlockenable <= 0;
      else if ((|pio_hull_fault4_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_hull_fault4_s1) | (end_xfer_arb_share_counter_term_pio_hull_fault4_s1 & ~pio_hull_fault4_s1_non_bursting_master_requests))
          pio_hull_fault4_s1_slavearbiterlockenable <= |pio_hull_fault4_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_hull_fault4/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_hull_fault4_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_hull_fault4_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_hull_fault4_s1_slavearbiterlockenable2 = |pio_hull_fault4_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_hull_fault4/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_hull_fault4_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_hull_fault4_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_hull_fault4_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_hull_fault4_s1 = cpu_0_data_master_requests_pio_hull_fault4_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_hull_fault4_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_hull_fault4_s1 = cpu_0_data_master_granted_pio_hull_fault4_s1 & cpu_0_data_master_read & ~pio_hull_fault4_s1_waits_for_read;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_hull_fault4_s1 = cpu_0_data_master_qualified_request_pio_hull_fault4_s1;

  //cpu_0/data_master saved-grant pio_hull_fault4/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_hull_fault4_s1 = cpu_0_data_master_requests_pio_hull_fault4_s1;

  //allow new arb cycle for pio_hull_fault4/s1, which is an e_assign
  assign pio_hull_fault4_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_hull_fault4_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_hull_fault4_s1_master_qreq_vector = 1;

  //pio_hull_fault4_s1_reset_n assignment, which is an e_assign
  assign pio_hull_fault4_s1_reset_n = reset_n;

  //pio_hull_fault4_s1_firsttransfer first transaction, which is an e_assign
  assign pio_hull_fault4_s1_firsttransfer = pio_hull_fault4_s1_begins_xfer ? pio_hull_fault4_s1_unreg_firsttransfer : pio_hull_fault4_s1_reg_firsttransfer;

  //pio_hull_fault4_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_hull_fault4_s1_unreg_firsttransfer = ~(pio_hull_fault4_s1_slavearbiterlockenable & pio_hull_fault4_s1_any_continuerequest);

  //pio_hull_fault4_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_hull_fault4_s1_reg_firsttransfer <= 1'b1;
      else if (pio_hull_fault4_s1_begins_xfer)
          pio_hull_fault4_s1_reg_firsttransfer <= pio_hull_fault4_s1_unreg_firsttransfer;
    end


  //pio_hull_fault4_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_hull_fault4_s1_beginbursttransfer_internal = pio_hull_fault4_s1_begins_xfer;

  assign shifted_address_to_pio_hull_fault4_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_hull_fault4_s1_address mux, which is an e_mux
  assign pio_hull_fault4_s1_address = shifted_address_to_pio_hull_fault4_s1_from_cpu_0_data_master >> 2;

  //d1_pio_hull_fault4_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_hull_fault4_s1_end_xfer <= 1;
      else 
        d1_pio_hull_fault4_s1_end_xfer <= pio_hull_fault4_s1_end_xfer;
    end


  //pio_hull_fault4_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_hull_fault4_s1_waits_for_read = pio_hull_fault4_s1_in_a_read_cycle & pio_hull_fault4_s1_begins_xfer;

  //pio_hull_fault4_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_hull_fault4_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_hull_fault4_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_hull_fault4_s1_in_a_read_cycle;

  //pio_hull_fault4_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_hull_fault4_s1_waits_for_write = pio_hull_fault4_s1_in_a_write_cycle & 0;

  //pio_hull_fault4_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_hull_fault4_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_hull_fault4_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_hull_fault4_s1_in_a_write_cycle;

  assign wait_for_pio_hull_fault4_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_hull_fault4/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_infra_s1_arbitrator (
                                 // inputs:
                                  clk,
                                  cpu_0_data_master_address_to_slave,
                                  cpu_0_data_master_latency_counter,
                                  cpu_0_data_master_read,
                                  cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                  cpu_0_data_master_write,
                                  cpu_0_data_master_writedata,
                                  pio_infra_s1_irq,
                                  pio_infra_s1_readdata,
                                  reset_n,

                                 // outputs:
                                  cpu_0_data_master_granted_pio_infra_s1,
                                  cpu_0_data_master_qualified_request_pio_infra_s1,
                                  cpu_0_data_master_read_data_valid_pio_infra_s1,
                                  cpu_0_data_master_requests_pio_infra_s1,
                                  d1_pio_infra_s1_end_xfer,
                                  pio_infra_s1_address,
                                  pio_infra_s1_chipselect,
                                  pio_infra_s1_irq_from_sa,
                                  pio_infra_s1_readdata_from_sa,
                                  pio_infra_s1_reset_n,
                                  pio_infra_s1_write_n,
                                  pio_infra_s1_writedata
                               )
;

  output           cpu_0_data_master_granted_pio_infra_s1;
  output           cpu_0_data_master_qualified_request_pio_infra_s1;
  output           cpu_0_data_master_read_data_valid_pio_infra_s1;
  output           cpu_0_data_master_requests_pio_infra_s1;
  output           d1_pio_infra_s1_end_xfer;
  output  [  1: 0] pio_infra_s1_address;
  output           pio_infra_s1_chipselect;
  output           pio_infra_s1_irq_from_sa;
  output           pio_infra_s1_readdata_from_sa;
  output           pio_infra_s1_reset_n;
  output           pio_infra_s1_write_n;
  output           pio_infra_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            pio_infra_s1_irq;
  input            pio_infra_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_infra_s1;
  wire             cpu_0_data_master_qualified_request_pio_infra_s1;
  wire             cpu_0_data_master_read_data_valid_pio_infra_s1;
  wire             cpu_0_data_master_requests_pio_infra_s1;
  wire             cpu_0_data_master_saved_grant_pio_infra_s1;
  reg              d1_pio_infra_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_infra_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_infra_s1_address;
  wire             pio_infra_s1_allgrants;
  wire             pio_infra_s1_allow_new_arb_cycle;
  wire             pio_infra_s1_any_bursting_master_saved_grant;
  wire             pio_infra_s1_any_continuerequest;
  wire             pio_infra_s1_arb_counter_enable;
  reg     [  1: 0] pio_infra_s1_arb_share_counter;
  wire    [  1: 0] pio_infra_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_infra_s1_arb_share_set_values;
  wire             pio_infra_s1_beginbursttransfer_internal;
  wire             pio_infra_s1_begins_xfer;
  wire             pio_infra_s1_chipselect;
  wire             pio_infra_s1_end_xfer;
  wire             pio_infra_s1_firsttransfer;
  wire             pio_infra_s1_grant_vector;
  wire             pio_infra_s1_in_a_read_cycle;
  wire             pio_infra_s1_in_a_write_cycle;
  wire             pio_infra_s1_irq_from_sa;
  wire             pio_infra_s1_master_qreq_vector;
  wire             pio_infra_s1_non_bursting_master_requests;
  wire             pio_infra_s1_readdata_from_sa;
  reg              pio_infra_s1_reg_firsttransfer;
  wire             pio_infra_s1_reset_n;
  reg              pio_infra_s1_slavearbiterlockenable;
  wire             pio_infra_s1_slavearbiterlockenable2;
  wire             pio_infra_s1_unreg_firsttransfer;
  wire             pio_infra_s1_waits_for_read;
  wire             pio_infra_s1_waits_for_write;
  wire             pio_infra_s1_write_n;
  wire             pio_infra_s1_writedata;
  wire    [ 24: 0] shifted_address_to_pio_infra_s1_from_cpu_0_data_master;
  wire             wait_for_pio_infra_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_infra_s1_end_xfer;
    end


  assign pio_infra_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_infra_s1));
  //assign pio_infra_s1_readdata_from_sa = pio_infra_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_infra_s1_readdata_from_sa = pio_infra_s1_readdata;

  assign cpu_0_data_master_requests_pio_infra_s1 = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1002130) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //pio_infra_s1_arb_share_counter set values, which is an e_mux
  assign pio_infra_s1_arb_share_set_values = 1;

  //pio_infra_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_infra_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_infra_s1;

  //pio_infra_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_infra_s1_any_bursting_master_saved_grant = 0;

  //pio_infra_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_infra_s1_arb_share_counter_next_value = pio_infra_s1_firsttransfer ? (pio_infra_s1_arb_share_set_values - 1) : |pio_infra_s1_arb_share_counter ? (pio_infra_s1_arb_share_counter - 1) : 0;

  //pio_infra_s1_allgrants all slave grants, which is an e_mux
  assign pio_infra_s1_allgrants = |pio_infra_s1_grant_vector;

  //pio_infra_s1_end_xfer assignment, which is an e_assign
  assign pio_infra_s1_end_xfer = ~(pio_infra_s1_waits_for_read | pio_infra_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_infra_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_infra_s1 = pio_infra_s1_end_xfer & (~pio_infra_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_infra_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_infra_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_infra_s1 & pio_infra_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_infra_s1 & ~pio_infra_s1_non_bursting_master_requests);

  //pio_infra_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_infra_s1_arb_share_counter <= 0;
      else if (pio_infra_s1_arb_counter_enable)
          pio_infra_s1_arb_share_counter <= pio_infra_s1_arb_share_counter_next_value;
    end


  //pio_infra_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_infra_s1_slavearbiterlockenable <= 0;
      else if ((|pio_infra_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_infra_s1) | (end_xfer_arb_share_counter_term_pio_infra_s1 & ~pio_infra_s1_non_bursting_master_requests))
          pio_infra_s1_slavearbiterlockenable <= |pio_infra_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_infra/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_infra_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_infra_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_infra_s1_slavearbiterlockenable2 = |pio_infra_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_infra/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_infra_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_infra_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_infra_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_infra_s1 = cpu_0_data_master_requests_pio_infra_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_infra_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_infra_s1 = cpu_0_data_master_granted_pio_infra_s1 & cpu_0_data_master_read & ~pio_infra_s1_waits_for_read;

  //pio_infra_s1_writedata mux, which is an e_mux
  assign pio_infra_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_infra_s1 = cpu_0_data_master_qualified_request_pio_infra_s1;

  //cpu_0/data_master saved-grant pio_infra/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_infra_s1 = cpu_0_data_master_requests_pio_infra_s1;

  //allow new arb cycle for pio_infra/s1, which is an e_assign
  assign pio_infra_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_infra_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_infra_s1_master_qreq_vector = 1;

  //pio_infra_s1_reset_n assignment, which is an e_assign
  assign pio_infra_s1_reset_n = reset_n;

  assign pio_infra_s1_chipselect = cpu_0_data_master_granted_pio_infra_s1;
  //pio_infra_s1_firsttransfer first transaction, which is an e_assign
  assign pio_infra_s1_firsttransfer = pio_infra_s1_begins_xfer ? pio_infra_s1_unreg_firsttransfer : pio_infra_s1_reg_firsttransfer;

  //pio_infra_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_infra_s1_unreg_firsttransfer = ~(pio_infra_s1_slavearbiterlockenable & pio_infra_s1_any_continuerequest);

  //pio_infra_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_infra_s1_reg_firsttransfer <= 1'b1;
      else if (pio_infra_s1_begins_xfer)
          pio_infra_s1_reg_firsttransfer <= pio_infra_s1_unreg_firsttransfer;
    end


  //pio_infra_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_infra_s1_beginbursttransfer_internal = pio_infra_s1_begins_xfer;

  //~pio_infra_s1_write_n assignment, which is an e_mux
  assign pio_infra_s1_write_n = ~(cpu_0_data_master_granted_pio_infra_s1 & cpu_0_data_master_write);

  assign shifted_address_to_pio_infra_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_infra_s1_address mux, which is an e_mux
  assign pio_infra_s1_address = shifted_address_to_pio_infra_s1_from_cpu_0_data_master >> 2;

  //d1_pio_infra_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_infra_s1_end_xfer <= 1;
      else 
        d1_pio_infra_s1_end_xfer <= pio_infra_s1_end_xfer;
    end


  //pio_infra_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_infra_s1_waits_for_read = pio_infra_s1_in_a_read_cycle & pio_infra_s1_begins_xfer;

  //pio_infra_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_infra_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_infra_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_infra_s1_in_a_read_cycle;

  //pio_infra_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_infra_s1_waits_for_write = pio_infra_s1_in_a_write_cycle & 0;

  //pio_infra_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_infra_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_infra_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_infra_s1_in_a_write_cycle;

  assign wait_for_pio_infra_s1_counter = 0;
  //assign pio_infra_s1_irq_from_sa = pio_infra_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_infra_s1_irq_from_sa = pio_infra_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_infra/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_led_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_0_data_master_address_to_slave,
                                cpu_0_data_master_latency_counter,
                                cpu_0_data_master_read,
                                cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                cpu_0_data_master_write,
                                cpu_0_data_master_writedata,
                                pio_led_s1_readdata,
                                reset_n,

                               // outputs:
                                cpu_0_data_master_granted_pio_led_s1,
                                cpu_0_data_master_qualified_request_pio_led_s1,
                                cpu_0_data_master_read_data_valid_pio_led_s1,
                                cpu_0_data_master_requests_pio_led_s1,
                                d1_pio_led_s1_end_xfer,
                                pio_led_s1_address,
                                pio_led_s1_chipselect,
                                pio_led_s1_readdata_from_sa,
                                pio_led_s1_reset_n,
                                pio_led_s1_write_n,
                                pio_led_s1_writedata
                             )
;

  output           cpu_0_data_master_granted_pio_led_s1;
  output           cpu_0_data_master_qualified_request_pio_led_s1;
  output           cpu_0_data_master_read_data_valid_pio_led_s1;
  output           cpu_0_data_master_requests_pio_led_s1;
  output           d1_pio_led_s1_end_xfer;
  output  [  1: 0] pio_led_s1_address;
  output           pio_led_s1_chipselect;
  output  [  1: 0] pio_led_s1_readdata_from_sa;
  output           pio_led_s1_reset_n;
  output           pio_led_s1_write_n;
  output  [  1: 0] pio_led_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [  1: 0] pio_led_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_led_s1;
  wire             cpu_0_data_master_qualified_request_pio_led_s1;
  wire             cpu_0_data_master_read_data_valid_pio_led_s1;
  wire             cpu_0_data_master_requests_pio_led_s1;
  wire             cpu_0_data_master_saved_grant_pio_led_s1;
  reg              d1_pio_led_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_led_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_led_s1_address;
  wire             pio_led_s1_allgrants;
  wire             pio_led_s1_allow_new_arb_cycle;
  wire             pio_led_s1_any_bursting_master_saved_grant;
  wire             pio_led_s1_any_continuerequest;
  wire             pio_led_s1_arb_counter_enable;
  reg     [  1: 0] pio_led_s1_arb_share_counter;
  wire    [  1: 0] pio_led_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_led_s1_arb_share_set_values;
  wire             pio_led_s1_beginbursttransfer_internal;
  wire             pio_led_s1_begins_xfer;
  wire             pio_led_s1_chipselect;
  wire             pio_led_s1_end_xfer;
  wire             pio_led_s1_firsttransfer;
  wire             pio_led_s1_grant_vector;
  wire             pio_led_s1_in_a_read_cycle;
  wire             pio_led_s1_in_a_write_cycle;
  wire             pio_led_s1_master_qreq_vector;
  wire             pio_led_s1_non_bursting_master_requests;
  wire    [  1: 0] pio_led_s1_readdata_from_sa;
  reg              pio_led_s1_reg_firsttransfer;
  wire             pio_led_s1_reset_n;
  reg              pio_led_s1_slavearbiterlockenable;
  wire             pio_led_s1_slavearbiterlockenable2;
  wire             pio_led_s1_unreg_firsttransfer;
  wire             pio_led_s1_waits_for_read;
  wire             pio_led_s1_waits_for_write;
  wire             pio_led_s1_write_n;
  wire    [  1: 0] pio_led_s1_writedata;
  wire    [ 24: 0] shifted_address_to_pio_led_s1_from_cpu_0_data_master;
  wire             wait_for_pio_led_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_led_s1_end_xfer;
    end


  assign pio_led_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_led_s1));
  //assign pio_led_s1_readdata_from_sa = pio_led_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_led_s1_readdata_from_sa = pio_led_s1_readdata;

  assign cpu_0_data_master_requests_pio_led_s1 = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1002140) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //pio_led_s1_arb_share_counter set values, which is an e_mux
  assign pio_led_s1_arb_share_set_values = 1;

  //pio_led_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_led_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_led_s1;

  //pio_led_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_led_s1_any_bursting_master_saved_grant = 0;

  //pio_led_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_led_s1_arb_share_counter_next_value = pio_led_s1_firsttransfer ? (pio_led_s1_arb_share_set_values - 1) : |pio_led_s1_arb_share_counter ? (pio_led_s1_arb_share_counter - 1) : 0;

  //pio_led_s1_allgrants all slave grants, which is an e_mux
  assign pio_led_s1_allgrants = |pio_led_s1_grant_vector;

  //pio_led_s1_end_xfer assignment, which is an e_assign
  assign pio_led_s1_end_xfer = ~(pio_led_s1_waits_for_read | pio_led_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_led_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_led_s1 = pio_led_s1_end_xfer & (~pio_led_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_led_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_led_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_led_s1 & pio_led_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_led_s1 & ~pio_led_s1_non_bursting_master_requests);

  //pio_led_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_led_s1_arb_share_counter <= 0;
      else if (pio_led_s1_arb_counter_enable)
          pio_led_s1_arb_share_counter <= pio_led_s1_arb_share_counter_next_value;
    end


  //pio_led_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_led_s1_slavearbiterlockenable <= 0;
      else if ((|pio_led_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_led_s1) | (end_xfer_arb_share_counter_term_pio_led_s1 & ~pio_led_s1_non_bursting_master_requests))
          pio_led_s1_slavearbiterlockenable <= |pio_led_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_led/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_led_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_led_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_led_s1_slavearbiterlockenable2 = |pio_led_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_led/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_led_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_led_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_led_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_led_s1 = cpu_0_data_master_requests_pio_led_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_led_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_led_s1 = cpu_0_data_master_granted_pio_led_s1 & cpu_0_data_master_read & ~pio_led_s1_waits_for_read;

  //pio_led_s1_writedata mux, which is an e_mux
  assign pio_led_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_led_s1 = cpu_0_data_master_qualified_request_pio_led_s1;

  //cpu_0/data_master saved-grant pio_led/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_led_s1 = cpu_0_data_master_requests_pio_led_s1;

  //allow new arb cycle for pio_led/s1, which is an e_assign
  assign pio_led_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_led_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_led_s1_master_qreq_vector = 1;

  //pio_led_s1_reset_n assignment, which is an e_assign
  assign pio_led_s1_reset_n = reset_n;

  assign pio_led_s1_chipselect = cpu_0_data_master_granted_pio_led_s1;
  //pio_led_s1_firsttransfer first transaction, which is an e_assign
  assign pio_led_s1_firsttransfer = pio_led_s1_begins_xfer ? pio_led_s1_unreg_firsttransfer : pio_led_s1_reg_firsttransfer;

  //pio_led_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_led_s1_unreg_firsttransfer = ~(pio_led_s1_slavearbiterlockenable & pio_led_s1_any_continuerequest);

  //pio_led_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_led_s1_reg_firsttransfer <= 1'b1;
      else if (pio_led_s1_begins_xfer)
          pio_led_s1_reg_firsttransfer <= pio_led_s1_unreg_firsttransfer;
    end


  //pio_led_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_led_s1_beginbursttransfer_internal = pio_led_s1_begins_xfer;

  //~pio_led_s1_write_n assignment, which is an e_mux
  assign pio_led_s1_write_n = ~(cpu_0_data_master_granted_pio_led_s1 & cpu_0_data_master_write);

  assign shifted_address_to_pio_led_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_led_s1_address mux, which is an e_mux
  assign pio_led_s1_address = shifted_address_to_pio_led_s1_from_cpu_0_data_master >> 2;

  //d1_pio_led_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_led_s1_end_xfer <= 1;
      else 
        d1_pio_led_s1_end_xfer <= pio_led_s1_end_xfer;
    end


  //pio_led_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_led_s1_waits_for_read = pio_led_s1_in_a_read_cycle & pio_led_s1_begins_xfer;

  //pio_led_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_led_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_led_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_led_s1_in_a_read_cycle;

  //pio_led_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_led_s1_waits_for_write = pio_led_s1_in_a_write_cycle & 0;

  //pio_led_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_led_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_led_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_led_s1_in_a_write_cycle;

  assign wait_for_pio_led_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_led/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_nF2401_in_s1_arbitrator (
                                     // inputs:
                                      clk,
                                      cpu_0_data_master_address_to_slave,
                                      cpu_0_data_master_latency_counter,
                                      cpu_0_data_master_read,
                                      cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                      cpu_0_data_master_write,
                                      cpu_0_data_master_writedata,
                                      pio_nF2401_in_s1_irq,
                                      pio_nF2401_in_s1_readdata,
                                      reset_n,

                                     // outputs:
                                      cpu_0_data_master_granted_pio_nF2401_in_s1,
                                      cpu_0_data_master_qualified_request_pio_nF2401_in_s1,
                                      cpu_0_data_master_read_data_valid_pio_nF2401_in_s1,
                                      cpu_0_data_master_requests_pio_nF2401_in_s1,
                                      d1_pio_nF2401_in_s1_end_xfer,
                                      pio_nF2401_in_s1_address,
                                      pio_nF2401_in_s1_chipselect,
                                      pio_nF2401_in_s1_irq_from_sa,
                                      pio_nF2401_in_s1_readdata_from_sa,
                                      pio_nF2401_in_s1_reset_n,
                                      pio_nF2401_in_s1_write_n,
                                      pio_nF2401_in_s1_writedata
                                   )
;

  output           cpu_0_data_master_granted_pio_nF2401_in_s1;
  output           cpu_0_data_master_qualified_request_pio_nF2401_in_s1;
  output           cpu_0_data_master_read_data_valid_pio_nF2401_in_s1;
  output           cpu_0_data_master_requests_pio_nF2401_in_s1;
  output           d1_pio_nF2401_in_s1_end_xfer;
  output  [  1: 0] pio_nF2401_in_s1_address;
  output           pio_nF2401_in_s1_chipselect;
  output           pio_nF2401_in_s1_irq_from_sa;
  output           pio_nF2401_in_s1_readdata_from_sa;
  output           pio_nF2401_in_s1_reset_n;
  output           pio_nF2401_in_s1_write_n;
  output           pio_nF2401_in_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            pio_nF2401_in_s1_irq;
  input            pio_nF2401_in_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_nF2401_in_s1;
  wire             cpu_0_data_master_qualified_request_pio_nF2401_in_s1;
  wire             cpu_0_data_master_read_data_valid_pio_nF2401_in_s1;
  wire             cpu_0_data_master_requests_pio_nF2401_in_s1;
  wire             cpu_0_data_master_saved_grant_pio_nF2401_in_s1;
  reg              d1_pio_nF2401_in_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_nF2401_in_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_nF2401_in_s1_address;
  wire             pio_nF2401_in_s1_allgrants;
  wire             pio_nF2401_in_s1_allow_new_arb_cycle;
  wire             pio_nF2401_in_s1_any_bursting_master_saved_grant;
  wire             pio_nF2401_in_s1_any_continuerequest;
  wire             pio_nF2401_in_s1_arb_counter_enable;
  reg     [  1: 0] pio_nF2401_in_s1_arb_share_counter;
  wire    [  1: 0] pio_nF2401_in_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_nF2401_in_s1_arb_share_set_values;
  wire             pio_nF2401_in_s1_beginbursttransfer_internal;
  wire             pio_nF2401_in_s1_begins_xfer;
  wire             pio_nF2401_in_s1_chipselect;
  wire             pio_nF2401_in_s1_end_xfer;
  wire             pio_nF2401_in_s1_firsttransfer;
  wire             pio_nF2401_in_s1_grant_vector;
  wire             pio_nF2401_in_s1_in_a_read_cycle;
  wire             pio_nF2401_in_s1_in_a_write_cycle;
  wire             pio_nF2401_in_s1_irq_from_sa;
  wire             pio_nF2401_in_s1_master_qreq_vector;
  wire             pio_nF2401_in_s1_non_bursting_master_requests;
  wire             pio_nF2401_in_s1_readdata_from_sa;
  reg              pio_nF2401_in_s1_reg_firsttransfer;
  wire             pio_nF2401_in_s1_reset_n;
  reg              pio_nF2401_in_s1_slavearbiterlockenable;
  wire             pio_nF2401_in_s1_slavearbiterlockenable2;
  wire             pio_nF2401_in_s1_unreg_firsttransfer;
  wire             pio_nF2401_in_s1_waits_for_read;
  wire             pio_nF2401_in_s1_waits_for_write;
  wire             pio_nF2401_in_s1_write_n;
  wire             pio_nF2401_in_s1_writedata;
  wire    [ 24: 0] shifted_address_to_pio_nF2401_in_s1_from_cpu_0_data_master;
  wire             wait_for_pio_nF2401_in_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_nF2401_in_s1_end_xfer;
    end


  assign pio_nF2401_in_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_nF2401_in_s1));
  //assign pio_nF2401_in_s1_readdata_from_sa = pio_nF2401_in_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_nF2401_in_s1_readdata_from_sa = pio_nF2401_in_s1_readdata;

  assign cpu_0_data_master_requests_pio_nF2401_in_s1 = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1002150) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //pio_nF2401_in_s1_arb_share_counter set values, which is an e_mux
  assign pio_nF2401_in_s1_arb_share_set_values = 1;

  //pio_nF2401_in_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_nF2401_in_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_nF2401_in_s1;

  //pio_nF2401_in_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_nF2401_in_s1_any_bursting_master_saved_grant = 0;

  //pio_nF2401_in_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_nF2401_in_s1_arb_share_counter_next_value = pio_nF2401_in_s1_firsttransfer ? (pio_nF2401_in_s1_arb_share_set_values - 1) : |pio_nF2401_in_s1_arb_share_counter ? (pio_nF2401_in_s1_arb_share_counter - 1) : 0;

  //pio_nF2401_in_s1_allgrants all slave grants, which is an e_mux
  assign pio_nF2401_in_s1_allgrants = |pio_nF2401_in_s1_grant_vector;

  //pio_nF2401_in_s1_end_xfer assignment, which is an e_assign
  assign pio_nF2401_in_s1_end_xfer = ~(pio_nF2401_in_s1_waits_for_read | pio_nF2401_in_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_nF2401_in_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_nF2401_in_s1 = pio_nF2401_in_s1_end_xfer & (~pio_nF2401_in_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_nF2401_in_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_nF2401_in_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_nF2401_in_s1 & pio_nF2401_in_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_nF2401_in_s1 & ~pio_nF2401_in_s1_non_bursting_master_requests);

  //pio_nF2401_in_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_nF2401_in_s1_arb_share_counter <= 0;
      else if (pio_nF2401_in_s1_arb_counter_enable)
          pio_nF2401_in_s1_arb_share_counter <= pio_nF2401_in_s1_arb_share_counter_next_value;
    end


  //pio_nF2401_in_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_nF2401_in_s1_slavearbiterlockenable <= 0;
      else if ((|pio_nF2401_in_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_nF2401_in_s1) | (end_xfer_arb_share_counter_term_pio_nF2401_in_s1 & ~pio_nF2401_in_s1_non_bursting_master_requests))
          pio_nF2401_in_s1_slavearbiterlockenable <= |pio_nF2401_in_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_nF2401_in/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_nF2401_in_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_nF2401_in_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_nF2401_in_s1_slavearbiterlockenable2 = |pio_nF2401_in_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_nF2401_in/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_nF2401_in_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_nF2401_in_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_nF2401_in_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_nF2401_in_s1 = cpu_0_data_master_requests_pio_nF2401_in_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_nF2401_in_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_nF2401_in_s1 = cpu_0_data_master_granted_pio_nF2401_in_s1 & cpu_0_data_master_read & ~pio_nF2401_in_s1_waits_for_read;

  //pio_nF2401_in_s1_writedata mux, which is an e_mux
  assign pio_nF2401_in_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_nF2401_in_s1 = cpu_0_data_master_qualified_request_pio_nF2401_in_s1;

  //cpu_0/data_master saved-grant pio_nF2401_in/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_nF2401_in_s1 = cpu_0_data_master_requests_pio_nF2401_in_s1;

  //allow new arb cycle for pio_nF2401_in/s1, which is an e_assign
  assign pio_nF2401_in_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_nF2401_in_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_nF2401_in_s1_master_qreq_vector = 1;

  //pio_nF2401_in_s1_reset_n assignment, which is an e_assign
  assign pio_nF2401_in_s1_reset_n = reset_n;

  assign pio_nF2401_in_s1_chipselect = cpu_0_data_master_granted_pio_nF2401_in_s1;
  //pio_nF2401_in_s1_firsttransfer first transaction, which is an e_assign
  assign pio_nF2401_in_s1_firsttransfer = pio_nF2401_in_s1_begins_xfer ? pio_nF2401_in_s1_unreg_firsttransfer : pio_nF2401_in_s1_reg_firsttransfer;

  //pio_nF2401_in_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_nF2401_in_s1_unreg_firsttransfer = ~(pio_nF2401_in_s1_slavearbiterlockenable & pio_nF2401_in_s1_any_continuerequest);

  //pio_nF2401_in_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_nF2401_in_s1_reg_firsttransfer <= 1'b1;
      else if (pio_nF2401_in_s1_begins_xfer)
          pio_nF2401_in_s1_reg_firsttransfer <= pio_nF2401_in_s1_unreg_firsttransfer;
    end


  //pio_nF2401_in_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_nF2401_in_s1_beginbursttransfer_internal = pio_nF2401_in_s1_begins_xfer;

  //~pio_nF2401_in_s1_write_n assignment, which is an e_mux
  assign pio_nF2401_in_s1_write_n = ~(cpu_0_data_master_granted_pio_nF2401_in_s1 & cpu_0_data_master_write);

  assign shifted_address_to_pio_nF2401_in_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_nF2401_in_s1_address mux, which is an e_mux
  assign pio_nF2401_in_s1_address = shifted_address_to_pio_nF2401_in_s1_from_cpu_0_data_master >> 2;

  //d1_pio_nF2401_in_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_nF2401_in_s1_end_xfer <= 1;
      else 
        d1_pio_nF2401_in_s1_end_xfer <= pio_nF2401_in_s1_end_xfer;
    end


  //pio_nF2401_in_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_nF2401_in_s1_waits_for_read = pio_nF2401_in_s1_in_a_read_cycle & pio_nF2401_in_s1_begins_xfer;

  //pio_nF2401_in_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_nF2401_in_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_nF2401_in_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_nF2401_in_s1_in_a_read_cycle;

  //pio_nF2401_in_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_nF2401_in_s1_waits_for_write = pio_nF2401_in_s1_in_a_write_cycle & 0;

  //pio_nF2401_in_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_nF2401_in_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_nF2401_in_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_nF2401_in_s1_in_a_write_cycle;

  assign wait_for_pio_nF2401_in_s1_counter = 0;
  //assign pio_nF2401_in_s1_irq_from_sa = pio_nF2401_in_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_nF2401_in_s1_irq_from_sa = pio_nF2401_in_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_nF2401_in/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_nF2401_inout_s1_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_0_data_master_address_to_slave,
                                         cpu_0_data_master_latency_counter,
                                         cpu_0_data_master_read,
                                         cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                         cpu_0_data_master_write,
                                         cpu_0_data_master_writedata,
                                         pio_nF2401_inout_s1_readdata,
                                         reset_n,

                                        // outputs:
                                         cpu_0_data_master_granted_pio_nF2401_inout_s1,
                                         cpu_0_data_master_qualified_request_pio_nF2401_inout_s1,
                                         cpu_0_data_master_read_data_valid_pio_nF2401_inout_s1,
                                         cpu_0_data_master_requests_pio_nF2401_inout_s1,
                                         d1_pio_nF2401_inout_s1_end_xfer,
                                         pio_nF2401_inout_s1_address,
                                         pio_nF2401_inout_s1_chipselect,
                                         pio_nF2401_inout_s1_readdata_from_sa,
                                         pio_nF2401_inout_s1_reset_n,
                                         pio_nF2401_inout_s1_write_n,
                                         pio_nF2401_inout_s1_writedata
                                      )
;

  output           cpu_0_data_master_granted_pio_nF2401_inout_s1;
  output           cpu_0_data_master_qualified_request_pio_nF2401_inout_s1;
  output           cpu_0_data_master_read_data_valid_pio_nF2401_inout_s1;
  output           cpu_0_data_master_requests_pio_nF2401_inout_s1;
  output           d1_pio_nF2401_inout_s1_end_xfer;
  output  [  1: 0] pio_nF2401_inout_s1_address;
  output           pio_nF2401_inout_s1_chipselect;
  output  [  2: 0] pio_nF2401_inout_s1_readdata_from_sa;
  output           pio_nF2401_inout_s1_reset_n;
  output           pio_nF2401_inout_s1_write_n;
  output  [  2: 0] pio_nF2401_inout_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [  2: 0] pio_nF2401_inout_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_nF2401_inout_s1;
  wire             cpu_0_data_master_qualified_request_pio_nF2401_inout_s1;
  wire             cpu_0_data_master_read_data_valid_pio_nF2401_inout_s1;
  wire             cpu_0_data_master_requests_pio_nF2401_inout_s1;
  wire             cpu_0_data_master_saved_grant_pio_nF2401_inout_s1;
  reg              d1_pio_nF2401_inout_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_nF2401_inout_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_nF2401_inout_s1_address;
  wire             pio_nF2401_inout_s1_allgrants;
  wire             pio_nF2401_inout_s1_allow_new_arb_cycle;
  wire             pio_nF2401_inout_s1_any_bursting_master_saved_grant;
  wire             pio_nF2401_inout_s1_any_continuerequest;
  wire             pio_nF2401_inout_s1_arb_counter_enable;
  reg     [  1: 0] pio_nF2401_inout_s1_arb_share_counter;
  wire    [  1: 0] pio_nF2401_inout_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_nF2401_inout_s1_arb_share_set_values;
  wire             pio_nF2401_inout_s1_beginbursttransfer_internal;
  wire             pio_nF2401_inout_s1_begins_xfer;
  wire             pio_nF2401_inout_s1_chipselect;
  wire             pio_nF2401_inout_s1_end_xfer;
  wire             pio_nF2401_inout_s1_firsttransfer;
  wire             pio_nF2401_inout_s1_grant_vector;
  wire             pio_nF2401_inout_s1_in_a_read_cycle;
  wire             pio_nF2401_inout_s1_in_a_write_cycle;
  wire             pio_nF2401_inout_s1_master_qreq_vector;
  wire             pio_nF2401_inout_s1_non_bursting_master_requests;
  wire    [  2: 0] pio_nF2401_inout_s1_readdata_from_sa;
  reg              pio_nF2401_inout_s1_reg_firsttransfer;
  wire             pio_nF2401_inout_s1_reset_n;
  reg              pio_nF2401_inout_s1_slavearbiterlockenable;
  wire             pio_nF2401_inout_s1_slavearbiterlockenable2;
  wire             pio_nF2401_inout_s1_unreg_firsttransfer;
  wire             pio_nF2401_inout_s1_waits_for_read;
  wire             pio_nF2401_inout_s1_waits_for_write;
  wire             pio_nF2401_inout_s1_write_n;
  wire    [  2: 0] pio_nF2401_inout_s1_writedata;
  wire    [ 24: 0] shifted_address_to_pio_nF2401_inout_s1_from_cpu_0_data_master;
  wire             wait_for_pio_nF2401_inout_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_nF2401_inout_s1_end_xfer;
    end


  assign pio_nF2401_inout_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_nF2401_inout_s1));
  //assign pio_nF2401_inout_s1_readdata_from_sa = pio_nF2401_inout_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_nF2401_inout_s1_readdata_from_sa = pio_nF2401_inout_s1_readdata;

  assign cpu_0_data_master_requests_pio_nF2401_inout_s1 = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1002160) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //pio_nF2401_inout_s1_arb_share_counter set values, which is an e_mux
  assign pio_nF2401_inout_s1_arb_share_set_values = 1;

  //pio_nF2401_inout_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_nF2401_inout_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_nF2401_inout_s1;

  //pio_nF2401_inout_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_nF2401_inout_s1_any_bursting_master_saved_grant = 0;

  //pio_nF2401_inout_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_nF2401_inout_s1_arb_share_counter_next_value = pio_nF2401_inout_s1_firsttransfer ? (pio_nF2401_inout_s1_arb_share_set_values - 1) : |pio_nF2401_inout_s1_arb_share_counter ? (pio_nF2401_inout_s1_arb_share_counter - 1) : 0;

  //pio_nF2401_inout_s1_allgrants all slave grants, which is an e_mux
  assign pio_nF2401_inout_s1_allgrants = |pio_nF2401_inout_s1_grant_vector;

  //pio_nF2401_inout_s1_end_xfer assignment, which is an e_assign
  assign pio_nF2401_inout_s1_end_xfer = ~(pio_nF2401_inout_s1_waits_for_read | pio_nF2401_inout_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_nF2401_inout_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_nF2401_inout_s1 = pio_nF2401_inout_s1_end_xfer & (~pio_nF2401_inout_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_nF2401_inout_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_nF2401_inout_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_nF2401_inout_s1 & pio_nF2401_inout_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_nF2401_inout_s1 & ~pio_nF2401_inout_s1_non_bursting_master_requests);

  //pio_nF2401_inout_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_nF2401_inout_s1_arb_share_counter <= 0;
      else if (pio_nF2401_inout_s1_arb_counter_enable)
          pio_nF2401_inout_s1_arb_share_counter <= pio_nF2401_inout_s1_arb_share_counter_next_value;
    end


  //pio_nF2401_inout_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_nF2401_inout_s1_slavearbiterlockenable <= 0;
      else if ((|pio_nF2401_inout_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_nF2401_inout_s1) | (end_xfer_arb_share_counter_term_pio_nF2401_inout_s1 & ~pio_nF2401_inout_s1_non_bursting_master_requests))
          pio_nF2401_inout_s1_slavearbiterlockenable <= |pio_nF2401_inout_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_nF2401_inout/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_nF2401_inout_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_nF2401_inout_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_nF2401_inout_s1_slavearbiterlockenable2 = |pio_nF2401_inout_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_nF2401_inout/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_nF2401_inout_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_nF2401_inout_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_nF2401_inout_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_nF2401_inout_s1 = cpu_0_data_master_requests_pio_nF2401_inout_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_nF2401_inout_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_nF2401_inout_s1 = cpu_0_data_master_granted_pio_nF2401_inout_s1 & cpu_0_data_master_read & ~pio_nF2401_inout_s1_waits_for_read;

  //pio_nF2401_inout_s1_writedata mux, which is an e_mux
  assign pio_nF2401_inout_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_nF2401_inout_s1 = cpu_0_data_master_qualified_request_pio_nF2401_inout_s1;

  //cpu_0/data_master saved-grant pio_nF2401_inout/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_nF2401_inout_s1 = cpu_0_data_master_requests_pio_nF2401_inout_s1;

  //allow new arb cycle for pio_nF2401_inout/s1, which is an e_assign
  assign pio_nF2401_inout_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_nF2401_inout_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_nF2401_inout_s1_master_qreq_vector = 1;

  //pio_nF2401_inout_s1_reset_n assignment, which is an e_assign
  assign pio_nF2401_inout_s1_reset_n = reset_n;

  assign pio_nF2401_inout_s1_chipselect = cpu_0_data_master_granted_pio_nF2401_inout_s1;
  //pio_nF2401_inout_s1_firsttransfer first transaction, which is an e_assign
  assign pio_nF2401_inout_s1_firsttransfer = pio_nF2401_inout_s1_begins_xfer ? pio_nF2401_inout_s1_unreg_firsttransfer : pio_nF2401_inout_s1_reg_firsttransfer;

  //pio_nF2401_inout_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_nF2401_inout_s1_unreg_firsttransfer = ~(pio_nF2401_inout_s1_slavearbiterlockenable & pio_nF2401_inout_s1_any_continuerequest);

  //pio_nF2401_inout_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_nF2401_inout_s1_reg_firsttransfer <= 1'b1;
      else if (pio_nF2401_inout_s1_begins_xfer)
          pio_nF2401_inout_s1_reg_firsttransfer <= pio_nF2401_inout_s1_unreg_firsttransfer;
    end


  //pio_nF2401_inout_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_nF2401_inout_s1_beginbursttransfer_internal = pio_nF2401_inout_s1_begins_xfer;

  //~pio_nF2401_inout_s1_write_n assignment, which is an e_mux
  assign pio_nF2401_inout_s1_write_n = ~(cpu_0_data_master_granted_pio_nF2401_inout_s1 & cpu_0_data_master_write);

  assign shifted_address_to_pio_nF2401_inout_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_nF2401_inout_s1_address mux, which is an e_mux
  assign pio_nF2401_inout_s1_address = shifted_address_to_pio_nF2401_inout_s1_from_cpu_0_data_master >> 2;

  //d1_pio_nF2401_inout_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_nF2401_inout_s1_end_xfer <= 1;
      else 
        d1_pio_nF2401_inout_s1_end_xfer <= pio_nF2401_inout_s1_end_xfer;
    end


  //pio_nF2401_inout_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_nF2401_inout_s1_waits_for_read = pio_nF2401_inout_s1_in_a_read_cycle & pio_nF2401_inout_s1_begins_xfer;

  //pio_nF2401_inout_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_nF2401_inout_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_nF2401_inout_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_nF2401_inout_s1_in_a_read_cycle;

  //pio_nF2401_inout_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_nF2401_inout_s1_waits_for_write = pio_nF2401_inout_s1_in_a_write_cycle & 0;

  //pio_nF2401_inout_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_nF2401_inout_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_nF2401_inout_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_nF2401_inout_s1_in_a_write_cycle;

  assign wait_for_pio_nF2401_inout_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_nF2401_inout/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_nF2401_out_s1_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_latency_counter,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                       cpu_0_data_master_write,
                                       cpu_0_data_master_writedata,
                                       pio_nF2401_out_s1_readdata,
                                       reset_n,

                                      // outputs:
                                       cpu_0_data_master_granted_pio_nF2401_out_s1,
                                       cpu_0_data_master_qualified_request_pio_nF2401_out_s1,
                                       cpu_0_data_master_read_data_valid_pio_nF2401_out_s1,
                                       cpu_0_data_master_requests_pio_nF2401_out_s1,
                                       d1_pio_nF2401_out_s1_end_xfer,
                                       pio_nF2401_out_s1_address,
                                       pio_nF2401_out_s1_chipselect,
                                       pio_nF2401_out_s1_readdata_from_sa,
                                       pio_nF2401_out_s1_reset_n,
                                       pio_nF2401_out_s1_write_n,
                                       pio_nF2401_out_s1_writedata
                                    )
;

  output           cpu_0_data_master_granted_pio_nF2401_out_s1;
  output           cpu_0_data_master_qualified_request_pio_nF2401_out_s1;
  output           cpu_0_data_master_read_data_valid_pio_nF2401_out_s1;
  output           cpu_0_data_master_requests_pio_nF2401_out_s1;
  output           d1_pio_nF2401_out_s1_end_xfer;
  output  [  1: 0] pio_nF2401_out_s1_address;
  output           pio_nF2401_out_s1_chipselect;
  output  [  2: 0] pio_nF2401_out_s1_readdata_from_sa;
  output           pio_nF2401_out_s1_reset_n;
  output           pio_nF2401_out_s1_write_n;
  output  [  2: 0] pio_nF2401_out_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [  2: 0] pio_nF2401_out_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_nF2401_out_s1;
  wire             cpu_0_data_master_qualified_request_pio_nF2401_out_s1;
  wire             cpu_0_data_master_read_data_valid_pio_nF2401_out_s1;
  wire             cpu_0_data_master_requests_pio_nF2401_out_s1;
  wire             cpu_0_data_master_saved_grant_pio_nF2401_out_s1;
  reg              d1_pio_nF2401_out_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_nF2401_out_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_nF2401_out_s1_address;
  wire             pio_nF2401_out_s1_allgrants;
  wire             pio_nF2401_out_s1_allow_new_arb_cycle;
  wire             pio_nF2401_out_s1_any_bursting_master_saved_grant;
  wire             pio_nF2401_out_s1_any_continuerequest;
  wire             pio_nF2401_out_s1_arb_counter_enable;
  reg     [  1: 0] pio_nF2401_out_s1_arb_share_counter;
  wire    [  1: 0] pio_nF2401_out_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_nF2401_out_s1_arb_share_set_values;
  wire             pio_nF2401_out_s1_beginbursttransfer_internal;
  wire             pio_nF2401_out_s1_begins_xfer;
  wire             pio_nF2401_out_s1_chipselect;
  wire             pio_nF2401_out_s1_end_xfer;
  wire             pio_nF2401_out_s1_firsttransfer;
  wire             pio_nF2401_out_s1_grant_vector;
  wire             pio_nF2401_out_s1_in_a_read_cycle;
  wire             pio_nF2401_out_s1_in_a_write_cycle;
  wire             pio_nF2401_out_s1_master_qreq_vector;
  wire             pio_nF2401_out_s1_non_bursting_master_requests;
  wire    [  2: 0] pio_nF2401_out_s1_readdata_from_sa;
  reg              pio_nF2401_out_s1_reg_firsttransfer;
  wire             pio_nF2401_out_s1_reset_n;
  reg              pio_nF2401_out_s1_slavearbiterlockenable;
  wire             pio_nF2401_out_s1_slavearbiterlockenable2;
  wire             pio_nF2401_out_s1_unreg_firsttransfer;
  wire             pio_nF2401_out_s1_waits_for_read;
  wire             pio_nF2401_out_s1_waits_for_write;
  wire             pio_nF2401_out_s1_write_n;
  wire    [  2: 0] pio_nF2401_out_s1_writedata;
  wire    [ 24: 0] shifted_address_to_pio_nF2401_out_s1_from_cpu_0_data_master;
  wire             wait_for_pio_nF2401_out_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_nF2401_out_s1_end_xfer;
    end


  assign pio_nF2401_out_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_nF2401_out_s1));
  //assign pio_nF2401_out_s1_readdata_from_sa = pio_nF2401_out_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_nF2401_out_s1_readdata_from_sa = pio_nF2401_out_s1_readdata;

  assign cpu_0_data_master_requests_pio_nF2401_out_s1 = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1002170) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //pio_nF2401_out_s1_arb_share_counter set values, which is an e_mux
  assign pio_nF2401_out_s1_arb_share_set_values = 1;

  //pio_nF2401_out_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_nF2401_out_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_nF2401_out_s1;

  //pio_nF2401_out_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_nF2401_out_s1_any_bursting_master_saved_grant = 0;

  //pio_nF2401_out_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_nF2401_out_s1_arb_share_counter_next_value = pio_nF2401_out_s1_firsttransfer ? (pio_nF2401_out_s1_arb_share_set_values - 1) : |pio_nF2401_out_s1_arb_share_counter ? (pio_nF2401_out_s1_arb_share_counter - 1) : 0;

  //pio_nF2401_out_s1_allgrants all slave grants, which is an e_mux
  assign pio_nF2401_out_s1_allgrants = |pio_nF2401_out_s1_grant_vector;

  //pio_nF2401_out_s1_end_xfer assignment, which is an e_assign
  assign pio_nF2401_out_s1_end_xfer = ~(pio_nF2401_out_s1_waits_for_read | pio_nF2401_out_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_nF2401_out_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_nF2401_out_s1 = pio_nF2401_out_s1_end_xfer & (~pio_nF2401_out_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_nF2401_out_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_nF2401_out_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_nF2401_out_s1 & pio_nF2401_out_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_nF2401_out_s1 & ~pio_nF2401_out_s1_non_bursting_master_requests);

  //pio_nF2401_out_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_nF2401_out_s1_arb_share_counter <= 0;
      else if (pio_nF2401_out_s1_arb_counter_enable)
          pio_nF2401_out_s1_arb_share_counter <= pio_nF2401_out_s1_arb_share_counter_next_value;
    end


  //pio_nF2401_out_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_nF2401_out_s1_slavearbiterlockenable <= 0;
      else if ((|pio_nF2401_out_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_nF2401_out_s1) | (end_xfer_arb_share_counter_term_pio_nF2401_out_s1 & ~pio_nF2401_out_s1_non_bursting_master_requests))
          pio_nF2401_out_s1_slavearbiterlockenable <= |pio_nF2401_out_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_nF2401_out/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_nF2401_out_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_nF2401_out_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_nF2401_out_s1_slavearbiterlockenable2 = |pio_nF2401_out_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_nF2401_out/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_nF2401_out_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_nF2401_out_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_nF2401_out_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_nF2401_out_s1 = cpu_0_data_master_requests_pio_nF2401_out_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_nF2401_out_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_nF2401_out_s1 = cpu_0_data_master_granted_pio_nF2401_out_s1 & cpu_0_data_master_read & ~pio_nF2401_out_s1_waits_for_read;

  //pio_nF2401_out_s1_writedata mux, which is an e_mux
  assign pio_nF2401_out_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_nF2401_out_s1 = cpu_0_data_master_qualified_request_pio_nF2401_out_s1;

  //cpu_0/data_master saved-grant pio_nF2401_out/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_nF2401_out_s1 = cpu_0_data_master_requests_pio_nF2401_out_s1;

  //allow new arb cycle for pio_nF2401_out/s1, which is an e_assign
  assign pio_nF2401_out_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_nF2401_out_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_nF2401_out_s1_master_qreq_vector = 1;

  //pio_nF2401_out_s1_reset_n assignment, which is an e_assign
  assign pio_nF2401_out_s1_reset_n = reset_n;

  assign pio_nF2401_out_s1_chipselect = cpu_0_data_master_granted_pio_nF2401_out_s1;
  //pio_nF2401_out_s1_firsttransfer first transaction, which is an e_assign
  assign pio_nF2401_out_s1_firsttransfer = pio_nF2401_out_s1_begins_xfer ? pio_nF2401_out_s1_unreg_firsttransfer : pio_nF2401_out_s1_reg_firsttransfer;

  //pio_nF2401_out_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_nF2401_out_s1_unreg_firsttransfer = ~(pio_nF2401_out_s1_slavearbiterlockenable & pio_nF2401_out_s1_any_continuerequest);

  //pio_nF2401_out_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_nF2401_out_s1_reg_firsttransfer <= 1'b1;
      else if (pio_nF2401_out_s1_begins_xfer)
          pio_nF2401_out_s1_reg_firsttransfer <= pio_nF2401_out_s1_unreg_firsttransfer;
    end


  //pio_nF2401_out_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_nF2401_out_s1_beginbursttransfer_internal = pio_nF2401_out_s1_begins_xfer;

  //~pio_nF2401_out_s1_write_n assignment, which is an e_mux
  assign pio_nF2401_out_s1_write_n = ~(cpu_0_data_master_granted_pio_nF2401_out_s1 & cpu_0_data_master_write);

  assign shifted_address_to_pio_nF2401_out_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_nF2401_out_s1_address mux, which is an e_mux
  assign pio_nF2401_out_s1_address = shifted_address_to_pio_nF2401_out_s1_from_cpu_0_data_master >> 2;

  //d1_pio_nF2401_out_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_nF2401_out_s1_end_xfer <= 1;
      else 
        d1_pio_nF2401_out_s1_end_xfer <= pio_nF2401_out_s1_end_xfer;
    end


  //pio_nF2401_out_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_nF2401_out_s1_waits_for_read = pio_nF2401_out_s1_in_a_read_cycle & pio_nF2401_out_s1_begins_xfer;

  //pio_nF2401_out_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_nF2401_out_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_nF2401_out_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_nF2401_out_s1_in_a_read_cycle;

  //pio_nF2401_out_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_nF2401_out_s1_waits_for_write = pio_nF2401_out_s1_in_a_write_cycle & 0;

  //pio_nF2401_out_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_nF2401_out_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_nF2401_out_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_nF2401_out_s1_in_a_write_cycle;

  assign wait_for_pio_nF2401_out_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_nF2401_out/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_reset_9557_s1_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_latency_counter,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                       cpu_0_data_master_write,
                                       cpu_0_data_master_writedata,
                                       pio_reset_9557_s1_readdata,
                                       reset_n,

                                      // outputs:
                                       cpu_0_data_master_granted_pio_reset_9557_s1,
                                       cpu_0_data_master_qualified_request_pio_reset_9557_s1,
                                       cpu_0_data_master_read_data_valid_pio_reset_9557_s1,
                                       cpu_0_data_master_requests_pio_reset_9557_s1,
                                       d1_pio_reset_9557_s1_end_xfer,
                                       pio_reset_9557_s1_address,
                                       pio_reset_9557_s1_chipselect,
                                       pio_reset_9557_s1_readdata_from_sa,
                                       pio_reset_9557_s1_reset_n,
                                       pio_reset_9557_s1_write_n,
                                       pio_reset_9557_s1_writedata
                                    )
;

  output           cpu_0_data_master_granted_pio_reset_9557_s1;
  output           cpu_0_data_master_qualified_request_pio_reset_9557_s1;
  output           cpu_0_data_master_read_data_valid_pio_reset_9557_s1;
  output           cpu_0_data_master_requests_pio_reset_9557_s1;
  output           d1_pio_reset_9557_s1_end_xfer;
  output  [  1: 0] pio_reset_9557_s1_address;
  output           pio_reset_9557_s1_chipselect;
  output           pio_reset_9557_s1_readdata_from_sa;
  output           pio_reset_9557_s1_reset_n;
  output           pio_reset_9557_s1_write_n;
  output           pio_reset_9557_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            pio_reset_9557_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_reset_9557_s1;
  wire             cpu_0_data_master_qualified_request_pio_reset_9557_s1;
  wire             cpu_0_data_master_read_data_valid_pio_reset_9557_s1;
  wire             cpu_0_data_master_requests_pio_reset_9557_s1;
  wire             cpu_0_data_master_saved_grant_pio_reset_9557_s1;
  reg              d1_pio_reset_9557_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_reset_9557_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_reset_9557_s1_address;
  wire             pio_reset_9557_s1_allgrants;
  wire             pio_reset_9557_s1_allow_new_arb_cycle;
  wire             pio_reset_9557_s1_any_bursting_master_saved_grant;
  wire             pio_reset_9557_s1_any_continuerequest;
  wire             pio_reset_9557_s1_arb_counter_enable;
  reg     [  1: 0] pio_reset_9557_s1_arb_share_counter;
  wire    [  1: 0] pio_reset_9557_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_reset_9557_s1_arb_share_set_values;
  wire             pio_reset_9557_s1_beginbursttransfer_internal;
  wire             pio_reset_9557_s1_begins_xfer;
  wire             pio_reset_9557_s1_chipselect;
  wire             pio_reset_9557_s1_end_xfer;
  wire             pio_reset_9557_s1_firsttransfer;
  wire             pio_reset_9557_s1_grant_vector;
  wire             pio_reset_9557_s1_in_a_read_cycle;
  wire             pio_reset_9557_s1_in_a_write_cycle;
  wire             pio_reset_9557_s1_master_qreq_vector;
  wire             pio_reset_9557_s1_non_bursting_master_requests;
  wire             pio_reset_9557_s1_readdata_from_sa;
  reg              pio_reset_9557_s1_reg_firsttransfer;
  wire             pio_reset_9557_s1_reset_n;
  reg              pio_reset_9557_s1_slavearbiterlockenable;
  wire             pio_reset_9557_s1_slavearbiterlockenable2;
  wire             pio_reset_9557_s1_unreg_firsttransfer;
  wire             pio_reset_9557_s1_waits_for_read;
  wire             pio_reset_9557_s1_waits_for_write;
  wire             pio_reset_9557_s1_write_n;
  wire             pio_reset_9557_s1_writedata;
  wire    [ 24: 0] shifted_address_to_pio_reset_9557_s1_from_cpu_0_data_master;
  wire             wait_for_pio_reset_9557_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_reset_9557_s1_end_xfer;
    end


  assign pio_reset_9557_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_reset_9557_s1));
  //assign pio_reset_9557_s1_readdata_from_sa = pio_reset_9557_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_reset_9557_s1_readdata_from_sa = pio_reset_9557_s1_readdata;

  assign cpu_0_data_master_requests_pio_reset_9557_s1 = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h10021d0) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //pio_reset_9557_s1_arb_share_counter set values, which is an e_mux
  assign pio_reset_9557_s1_arb_share_set_values = 1;

  //pio_reset_9557_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_reset_9557_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_reset_9557_s1;

  //pio_reset_9557_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_reset_9557_s1_any_bursting_master_saved_grant = 0;

  //pio_reset_9557_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_reset_9557_s1_arb_share_counter_next_value = pio_reset_9557_s1_firsttransfer ? (pio_reset_9557_s1_arb_share_set_values - 1) : |pio_reset_9557_s1_arb_share_counter ? (pio_reset_9557_s1_arb_share_counter - 1) : 0;

  //pio_reset_9557_s1_allgrants all slave grants, which is an e_mux
  assign pio_reset_9557_s1_allgrants = |pio_reset_9557_s1_grant_vector;

  //pio_reset_9557_s1_end_xfer assignment, which is an e_assign
  assign pio_reset_9557_s1_end_xfer = ~(pio_reset_9557_s1_waits_for_read | pio_reset_9557_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_reset_9557_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_reset_9557_s1 = pio_reset_9557_s1_end_xfer & (~pio_reset_9557_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_reset_9557_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_reset_9557_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_reset_9557_s1 & pio_reset_9557_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_reset_9557_s1 & ~pio_reset_9557_s1_non_bursting_master_requests);

  //pio_reset_9557_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_reset_9557_s1_arb_share_counter <= 0;
      else if (pio_reset_9557_s1_arb_counter_enable)
          pio_reset_9557_s1_arb_share_counter <= pio_reset_9557_s1_arb_share_counter_next_value;
    end


  //pio_reset_9557_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_reset_9557_s1_slavearbiterlockenable <= 0;
      else if ((|pio_reset_9557_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_reset_9557_s1) | (end_xfer_arb_share_counter_term_pio_reset_9557_s1 & ~pio_reset_9557_s1_non_bursting_master_requests))
          pio_reset_9557_s1_slavearbiterlockenable <= |pio_reset_9557_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_reset_9557/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_reset_9557_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_reset_9557_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_reset_9557_s1_slavearbiterlockenable2 = |pio_reset_9557_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_reset_9557/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_reset_9557_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_reset_9557_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_reset_9557_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_reset_9557_s1 = cpu_0_data_master_requests_pio_reset_9557_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_reset_9557_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_reset_9557_s1 = cpu_0_data_master_granted_pio_reset_9557_s1 & cpu_0_data_master_read & ~pio_reset_9557_s1_waits_for_read;

  //pio_reset_9557_s1_writedata mux, which is an e_mux
  assign pio_reset_9557_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_reset_9557_s1 = cpu_0_data_master_qualified_request_pio_reset_9557_s1;

  //cpu_0/data_master saved-grant pio_reset_9557/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_reset_9557_s1 = cpu_0_data_master_requests_pio_reset_9557_s1;

  //allow new arb cycle for pio_reset_9557/s1, which is an e_assign
  assign pio_reset_9557_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_reset_9557_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_reset_9557_s1_master_qreq_vector = 1;

  //pio_reset_9557_s1_reset_n assignment, which is an e_assign
  assign pio_reset_9557_s1_reset_n = reset_n;

  assign pio_reset_9557_s1_chipselect = cpu_0_data_master_granted_pio_reset_9557_s1;
  //pio_reset_9557_s1_firsttransfer first transaction, which is an e_assign
  assign pio_reset_9557_s1_firsttransfer = pio_reset_9557_s1_begins_xfer ? pio_reset_9557_s1_unreg_firsttransfer : pio_reset_9557_s1_reg_firsttransfer;

  //pio_reset_9557_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_reset_9557_s1_unreg_firsttransfer = ~(pio_reset_9557_s1_slavearbiterlockenable & pio_reset_9557_s1_any_continuerequest);

  //pio_reset_9557_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_reset_9557_s1_reg_firsttransfer <= 1'b1;
      else if (pio_reset_9557_s1_begins_xfer)
          pio_reset_9557_s1_reg_firsttransfer <= pio_reset_9557_s1_unreg_firsttransfer;
    end


  //pio_reset_9557_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_reset_9557_s1_beginbursttransfer_internal = pio_reset_9557_s1_begins_xfer;

  //~pio_reset_9557_s1_write_n assignment, which is an e_mux
  assign pio_reset_9557_s1_write_n = ~(cpu_0_data_master_granted_pio_reset_9557_s1 & cpu_0_data_master_write);

  assign shifted_address_to_pio_reset_9557_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_reset_9557_s1_address mux, which is an e_mux
  assign pio_reset_9557_s1_address = shifted_address_to_pio_reset_9557_s1_from_cpu_0_data_master >> 2;

  //d1_pio_reset_9557_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_reset_9557_s1_end_xfer <= 1;
      else 
        d1_pio_reset_9557_s1_end_xfer <= pio_reset_9557_s1_end_xfer;
    end


  //pio_reset_9557_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_reset_9557_s1_waits_for_read = pio_reset_9557_s1_in_a_read_cycle & pio_reset_9557_s1_begins_xfer;

  //pio_reset_9557_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_reset_9557_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_reset_9557_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_reset_9557_s1_in_a_read_cycle;

  //pio_reset_9557_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_reset_9557_s1_waits_for_write = pio_reset_9557_s1_in_a_write_cycle & 0;

  //pio_reset_9557_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_reset_9557_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_reset_9557_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_reset_9557_s1_in_a_write_cycle;

  assign wait_for_pio_reset_9557_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_reset_9557/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_scl_24_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_0_data_master_address_to_slave,
                                   cpu_0_data_master_latency_counter,
                                   cpu_0_data_master_read,
                                   cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                   cpu_0_data_master_write,
                                   cpu_0_data_master_writedata,
                                   pio_scl_24_s1_readdata,
                                   reset_n,

                                  // outputs:
                                   cpu_0_data_master_granted_pio_scl_24_s1,
                                   cpu_0_data_master_qualified_request_pio_scl_24_s1,
                                   cpu_0_data_master_read_data_valid_pio_scl_24_s1,
                                   cpu_0_data_master_requests_pio_scl_24_s1,
                                   d1_pio_scl_24_s1_end_xfer,
                                   pio_scl_24_s1_address,
                                   pio_scl_24_s1_chipselect,
                                   pio_scl_24_s1_readdata_from_sa,
                                   pio_scl_24_s1_reset_n,
                                   pio_scl_24_s1_write_n,
                                   pio_scl_24_s1_writedata
                                )
;

  output           cpu_0_data_master_granted_pio_scl_24_s1;
  output           cpu_0_data_master_qualified_request_pio_scl_24_s1;
  output           cpu_0_data_master_read_data_valid_pio_scl_24_s1;
  output           cpu_0_data_master_requests_pio_scl_24_s1;
  output           d1_pio_scl_24_s1_end_xfer;
  output  [  1: 0] pio_scl_24_s1_address;
  output           pio_scl_24_s1_chipselect;
  output           pio_scl_24_s1_readdata_from_sa;
  output           pio_scl_24_s1_reset_n;
  output           pio_scl_24_s1_write_n;
  output           pio_scl_24_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            pio_scl_24_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_scl_24_s1;
  wire             cpu_0_data_master_qualified_request_pio_scl_24_s1;
  wire             cpu_0_data_master_read_data_valid_pio_scl_24_s1;
  wire             cpu_0_data_master_requests_pio_scl_24_s1;
  wire             cpu_0_data_master_saved_grant_pio_scl_24_s1;
  reg              d1_pio_scl_24_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_scl_24_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_scl_24_s1_address;
  wire             pio_scl_24_s1_allgrants;
  wire             pio_scl_24_s1_allow_new_arb_cycle;
  wire             pio_scl_24_s1_any_bursting_master_saved_grant;
  wire             pio_scl_24_s1_any_continuerequest;
  wire             pio_scl_24_s1_arb_counter_enable;
  reg     [  1: 0] pio_scl_24_s1_arb_share_counter;
  wire    [  1: 0] pio_scl_24_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_scl_24_s1_arb_share_set_values;
  wire             pio_scl_24_s1_beginbursttransfer_internal;
  wire             pio_scl_24_s1_begins_xfer;
  wire             pio_scl_24_s1_chipselect;
  wire             pio_scl_24_s1_end_xfer;
  wire             pio_scl_24_s1_firsttransfer;
  wire             pio_scl_24_s1_grant_vector;
  wire             pio_scl_24_s1_in_a_read_cycle;
  wire             pio_scl_24_s1_in_a_write_cycle;
  wire             pio_scl_24_s1_master_qreq_vector;
  wire             pio_scl_24_s1_non_bursting_master_requests;
  wire             pio_scl_24_s1_readdata_from_sa;
  reg              pio_scl_24_s1_reg_firsttransfer;
  wire             pio_scl_24_s1_reset_n;
  reg              pio_scl_24_s1_slavearbiterlockenable;
  wire             pio_scl_24_s1_slavearbiterlockenable2;
  wire             pio_scl_24_s1_unreg_firsttransfer;
  wire             pio_scl_24_s1_waits_for_read;
  wire             pio_scl_24_s1_waits_for_write;
  wire             pio_scl_24_s1_write_n;
  wire             pio_scl_24_s1_writedata;
  wire    [ 24: 0] shifted_address_to_pio_scl_24_s1_from_cpu_0_data_master;
  wire             wait_for_pio_scl_24_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_scl_24_s1_end_xfer;
    end


  assign pio_scl_24_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_scl_24_s1));
  //assign pio_scl_24_s1_readdata_from_sa = pio_scl_24_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_scl_24_s1_readdata_from_sa = pio_scl_24_s1_readdata;

  assign cpu_0_data_master_requests_pio_scl_24_s1 = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1002180) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //pio_scl_24_s1_arb_share_counter set values, which is an e_mux
  assign pio_scl_24_s1_arb_share_set_values = 1;

  //pio_scl_24_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_scl_24_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_scl_24_s1;

  //pio_scl_24_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_scl_24_s1_any_bursting_master_saved_grant = 0;

  //pio_scl_24_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_scl_24_s1_arb_share_counter_next_value = pio_scl_24_s1_firsttransfer ? (pio_scl_24_s1_arb_share_set_values - 1) : |pio_scl_24_s1_arb_share_counter ? (pio_scl_24_s1_arb_share_counter - 1) : 0;

  //pio_scl_24_s1_allgrants all slave grants, which is an e_mux
  assign pio_scl_24_s1_allgrants = |pio_scl_24_s1_grant_vector;

  //pio_scl_24_s1_end_xfer assignment, which is an e_assign
  assign pio_scl_24_s1_end_xfer = ~(pio_scl_24_s1_waits_for_read | pio_scl_24_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_scl_24_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_scl_24_s1 = pio_scl_24_s1_end_xfer & (~pio_scl_24_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_scl_24_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_scl_24_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_scl_24_s1 & pio_scl_24_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_scl_24_s1 & ~pio_scl_24_s1_non_bursting_master_requests);

  //pio_scl_24_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_scl_24_s1_arb_share_counter <= 0;
      else if (pio_scl_24_s1_arb_counter_enable)
          pio_scl_24_s1_arb_share_counter <= pio_scl_24_s1_arb_share_counter_next_value;
    end


  //pio_scl_24_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_scl_24_s1_slavearbiterlockenable <= 0;
      else if ((|pio_scl_24_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_scl_24_s1) | (end_xfer_arb_share_counter_term_pio_scl_24_s1 & ~pio_scl_24_s1_non_bursting_master_requests))
          pio_scl_24_s1_slavearbiterlockenable <= |pio_scl_24_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_scl_24/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_scl_24_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_scl_24_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_scl_24_s1_slavearbiterlockenable2 = |pio_scl_24_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_scl_24/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_scl_24_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_scl_24_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_scl_24_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_scl_24_s1 = cpu_0_data_master_requests_pio_scl_24_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_scl_24_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_scl_24_s1 = cpu_0_data_master_granted_pio_scl_24_s1 & cpu_0_data_master_read & ~pio_scl_24_s1_waits_for_read;

  //pio_scl_24_s1_writedata mux, which is an e_mux
  assign pio_scl_24_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_scl_24_s1 = cpu_0_data_master_qualified_request_pio_scl_24_s1;

  //cpu_0/data_master saved-grant pio_scl_24/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_scl_24_s1 = cpu_0_data_master_requests_pio_scl_24_s1;

  //allow new arb cycle for pio_scl_24/s1, which is an e_assign
  assign pio_scl_24_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_scl_24_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_scl_24_s1_master_qreq_vector = 1;

  //pio_scl_24_s1_reset_n assignment, which is an e_assign
  assign pio_scl_24_s1_reset_n = reset_n;

  assign pio_scl_24_s1_chipselect = cpu_0_data_master_granted_pio_scl_24_s1;
  //pio_scl_24_s1_firsttransfer first transaction, which is an e_assign
  assign pio_scl_24_s1_firsttransfer = pio_scl_24_s1_begins_xfer ? pio_scl_24_s1_unreg_firsttransfer : pio_scl_24_s1_reg_firsttransfer;

  //pio_scl_24_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_scl_24_s1_unreg_firsttransfer = ~(pio_scl_24_s1_slavearbiterlockenable & pio_scl_24_s1_any_continuerequest);

  //pio_scl_24_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_scl_24_s1_reg_firsttransfer <= 1'b1;
      else if (pio_scl_24_s1_begins_xfer)
          pio_scl_24_s1_reg_firsttransfer <= pio_scl_24_s1_unreg_firsttransfer;
    end


  //pio_scl_24_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_scl_24_s1_beginbursttransfer_internal = pio_scl_24_s1_begins_xfer;

  //~pio_scl_24_s1_write_n assignment, which is an e_mux
  assign pio_scl_24_s1_write_n = ~(cpu_0_data_master_granted_pio_scl_24_s1 & cpu_0_data_master_write);

  assign shifted_address_to_pio_scl_24_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_scl_24_s1_address mux, which is an e_mux
  assign pio_scl_24_s1_address = shifted_address_to_pio_scl_24_s1_from_cpu_0_data_master >> 2;

  //d1_pio_scl_24_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_scl_24_s1_end_xfer <= 1;
      else 
        d1_pio_scl_24_s1_end_xfer <= pio_scl_24_s1_end_xfer;
    end


  //pio_scl_24_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_scl_24_s1_waits_for_read = pio_scl_24_s1_in_a_read_cycle & pio_scl_24_s1_begins_xfer;

  //pio_scl_24_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_scl_24_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_scl_24_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_scl_24_s1_in_a_read_cycle;

  //pio_scl_24_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_scl_24_s1_waits_for_write = pio_scl_24_s1_in_a_write_cycle & 0;

  //pio_scl_24_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_scl_24_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_scl_24_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_scl_24_s1_in_a_write_cycle;

  assign wait_for_pio_scl_24_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_scl_24/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_scl_9557_s1_arbitrator (
                                    // inputs:
                                     clk,
                                     cpu_0_data_master_address_to_slave,
                                     cpu_0_data_master_latency_counter,
                                     cpu_0_data_master_read,
                                     cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                     cpu_0_data_master_write,
                                     cpu_0_data_master_writedata,
                                     pio_scl_9557_s1_readdata,
                                     reset_n,

                                    // outputs:
                                     cpu_0_data_master_granted_pio_scl_9557_s1,
                                     cpu_0_data_master_qualified_request_pio_scl_9557_s1,
                                     cpu_0_data_master_read_data_valid_pio_scl_9557_s1,
                                     cpu_0_data_master_requests_pio_scl_9557_s1,
                                     d1_pio_scl_9557_s1_end_xfer,
                                     pio_scl_9557_s1_address,
                                     pio_scl_9557_s1_chipselect,
                                     pio_scl_9557_s1_readdata_from_sa,
                                     pio_scl_9557_s1_reset_n,
                                     pio_scl_9557_s1_write_n,
                                     pio_scl_9557_s1_writedata
                                  )
;

  output           cpu_0_data_master_granted_pio_scl_9557_s1;
  output           cpu_0_data_master_qualified_request_pio_scl_9557_s1;
  output           cpu_0_data_master_read_data_valid_pio_scl_9557_s1;
  output           cpu_0_data_master_requests_pio_scl_9557_s1;
  output           d1_pio_scl_9557_s1_end_xfer;
  output  [  1: 0] pio_scl_9557_s1_address;
  output           pio_scl_9557_s1_chipselect;
  output           pio_scl_9557_s1_readdata_from_sa;
  output           pio_scl_9557_s1_reset_n;
  output           pio_scl_9557_s1_write_n;
  output           pio_scl_9557_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            pio_scl_9557_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_scl_9557_s1;
  wire             cpu_0_data_master_qualified_request_pio_scl_9557_s1;
  wire             cpu_0_data_master_read_data_valid_pio_scl_9557_s1;
  wire             cpu_0_data_master_requests_pio_scl_9557_s1;
  wire             cpu_0_data_master_saved_grant_pio_scl_9557_s1;
  reg              d1_pio_scl_9557_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_scl_9557_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_scl_9557_s1_address;
  wire             pio_scl_9557_s1_allgrants;
  wire             pio_scl_9557_s1_allow_new_arb_cycle;
  wire             pio_scl_9557_s1_any_bursting_master_saved_grant;
  wire             pio_scl_9557_s1_any_continuerequest;
  wire             pio_scl_9557_s1_arb_counter_enable;
  reg     [  1: 0] pio_scl_9557_s1_arb_share_counter;
  wire    [  1: 0] pio_scl_9557_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_scl_9557_s1_arb_share_set_values;
  wire             pio_scl_9557_s1_beginbursttransfer_internal;
  wire             pio_scl_9557_s1_begins_xfer;
  wire             pio_scl_9557_s1_chipselect;
  wire             pio_scl_9557_s1_end_xfer;
  wire             pio_scl_9557_s1_firsttransfer;
  wire             pio_scl_9557_s1_grant_vector;
  wire             pio_scl_9557_s1_in_a_read_cycle;
  wire             pio_scl_9557_s1_in_a_write_cycle;
  wire             pio_scl_9557_s1_master_qreq_vector;
  wire             pio_scl_9557_s1_non_bursting_master_requests;
  wire             pio_scl_9557_s1_readdata_from_sa;
  reg              pio_scl_9557_s1_reg_firsttransfer;
  wire             pio_scl_9557_s1_reset_n;
  reg              pio_scl_9557_s1_slavearbiterlockenable;
  wire             pio_scl_9557_s1_slavearbiterlockenable2;
  wire             pio_scl_9557_s1_unreg_firsttransfer;
  wire             pio_scl_9557_s1_waits_for_read;
  wire             pio_scl_9557_s1_waits_for_write;
  wire             pio_scl_9557_s1_write_n;
  wire             pio_scl_9557_s1_writedata;
  wire    [ 24: 0] shifted_address_to_pio_scl_9557_s1_from_cpu_0_data_master;
  wire             wait_for_pio_scl_9557_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_scl_9557_s1_end_xfer;
    end


  assign pio_scl_9557_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_scl_9557_s1));
  //assign pio_scl_9557_s1_readdata_from_sa = pio_scl_9557_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_scl_9557_s1_readdata_from_sa = pio_scl_9557_s1_readdata;

  assign cpu_0_data_master_requests_pio_scl_9557_s1 = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h10021b0) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //pio_scl_9557_s1_arb_share_counter set values, which is an e_mux
  assign pio_scl_9557_s1_arb_share_set_values = 1;

  //pio_scl_9557_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_scl_9557_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_scl_9557_s1;

  //pio_scl_9557_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_scl_9557_s1_any_bursting_master_saved_grant = 0;

  //pio_scl_9557_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_scl_9557_s1_arb_share_counter_next_value = pio_scl_9557_s1_firsttransfer ? (pio_scl_9557_s1_arb_share_set_values - 1) : |pio_scl_9557_s1_arb_share_counter ? (pio_scl_9557_s1_arb_share_counter - 1) : 0;

  //pio_scl_9557_s1_allgrants all slave grants, which is an e_mux
  assign pio_scl_9557_s1_allgrants = |pio_scl_9557_s1_grant_vector;

  //pio_scl_9557_s1_end_xfer assignment, which is an e_assign
  assign pio_scl_9557_s1_end_xfer = ~(pio_scl_9557_s1_waits_for_read | pio_scl_9557_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_scl_9557_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_scl_9557_s1 = pio_scl_9557_s1_end_xfer & (~pio_scl_9557_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_scl_9557_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_scl_9557_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_scl_9557_s1 & pio_scl_9557_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_scl_9557_s1 & ~pio_scl_9557_s1_non_bursting_master_requests);

  //pio_scl_9557_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_scl_9557_s1_arb_share_counter <= 0;
      else if (pio_scl_9557_s1_arb_counter_enable)
          pio_scl_9557_s1_arb_share_counter <= pio_scl_9557_s1_arb_share_counter_next_value;
    end


  //pio_scl_9557_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_scl_9557_s1_slavearbiterlockenable <= 0;
      else if ((|pio_scl_9557_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_scl_9557_s1) | (end_xfer_arb_share_counter_term_pio_scl_9557_s1 & ~pio_scl_9557_s1_non_bursting_master_requests))
          pio_scl_9557_s1_slavearbiterlockenable <= |pio_scl_9557_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_scl_9557/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_scl_9557_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_scl_9557_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_scl_9557_s1_slavearbiterlockenable2 = |pio_scl_9557_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_scl_9557/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_scl_9557_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_scl_9557_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_scl_9557_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_scl_9557_s1 = cpu_0_data_master_requests_pio_scl_9557_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_scl_9557_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_scl_9557_s1 = cpu_0_data_master_granted_pio_scl_9557_s1 & cpu_0_data_master_read & ~pio_scl_9557_s1_waits_for_read;

  //pio_scl_9557_s1_writedata mux, which is an e_mux
  assign pio_scl_9557_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_scl_9557_s1 = cpu_0_data_master_qualified_request_pio_scl_9557_s1;

  //cpu_0/data_master saved-grant pio_scl_9557/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_scl_9557_s1 = cpu_0_data_master_requests_pio_scl_9557_s1;

  //allow new arb cycle for pio_scl_9557/s1, which is an e_assign
  assign pio_scl_9557_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_scl_9557_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_scl_9557_s1_master_qreq_vector = 1;

  //pio_scl_9557_s1_reset_n assignment, which is an e_assign
  assign pio_scl_9557_s1_reset_n = reset_n;

  assign pio_scl_9557_s1_chipselect = cpu_0_data_master_granted_pio_scl_9557_s1;
  //pio_scl_9557_s1_firsttransfer first transaction, which is an e_assign
  assign pio_scl_9557_s1_firsttransfer = pio_scl_9557_s1_begins_xfer ? pio_scl_9557_s1_unreg_firsttransfer : pio_scl_9557_s1_reg_firsttransfer;

  //pio_scl_9557_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_scl_9557_s1_unreg_firsttransfer = ~(pio_scl_9557_s1_slavearbiterlockenable & pio_scl_9557_s1_any_continuerequest);

  //pio_scl_9557_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_scl_9557_s1_reg_firsttransfer <= 1'b1;
      else if (pio_scl_9557_s1_begins_xfer)
          pio_scl_9557_s1_reg_firsttransfer <= pio_scl_9557_s1_unreg_firsttransfer;
    end


  //pio_scl_9557_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_scl_9557_s1_beginbursttransfer_internal = pio_scl_9557_s1_begins_xfer;

  //~pio_scl_9557_s1_write_n assignment, which is an e_mux
  assign pio_scl_9557_s1_write_n = ~(cpu_0_data_master_granted_pio_scl_9557_s1 & cpu_0_data_master_write);

  assign shifted_address_to_pio_scl_9557_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_scl_9557_s1_address mux, which is an e_mux
  assign pio_scl_9557_s1_address = shifted_address_to_pio_scl_9557_s1_from_cpu_0_data_master >> 2;

  //d1_pio_scl_9557_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_scl_9557_s1_end_xfer <= 1;
      else 
        d1_pio_scl_9557_s1_end_xfer <= pio_scl_9557_s1_end_xfer;
    end


  //pio_scl_9557_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_scl_9557_s1_waits_for_read = pio_scl_9557_s1_in_a_read_cycle & pio_scl_9557_s1_begins_xfer;

  //pio_scl_9557_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_scl_9557_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_scl_9557_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_scl_9557_s1_in_a_read_cycle;

  //pio_scl_9557_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_scl_9557_s1_waits_for_write = pio_scl_9557_s1_in_a_write_cycle & 0;

  //pio_scl_9557_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_scl_9557_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_scl_9557_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_scl_9557_s1_in_a_write_cycle;

  assign wait_for_pio_scl_9557_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_scl_9557/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_sda_24_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_0_data_master_address_to_slave,
                                   cpu_0_data_master_latency_counter,
                                   cpu_0_data_master_read,
                                   cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                   cpu_0_data_master_write,
                                   cpu_0_data_master_writedata,
                                   pio_sda_24_s1_readdata,
                                   reset_n,

                                  // outputs:
                                   cpu_0_data_master_granted_pio_sda_24_s1,
                                   cpu_0_data_master_qualified_request_pio_sda_24_s1,
                                   cpu_0_data_master_read_data_valid_pio_sda_24_s1,
                                   cpu_0_data_master_requests_pio_sda_24_s1,
                                   d1_pio_sda_24_s1_end_xfer,
                                   pio_sda_24_s1_address,
                                   pio_sda_24_s1_chipselect,
                                   pio_sda_24_s1_readdata_from_sa,
                                   pio_sda_24_s1_reset_n,
                                   pio_sda_24_s1_write_n,
                                   pio_sda_24_s1_writedata
                                )
;

  output           cpu_0_data_master_granted_pio_sda_24_s1;
  output           cpu_0_data_master_qualified_request_pio_sda_24_s1;
  output           cpu_0_data_master_read_data_valid_pio_sda_24_s1;
  output           cpu_0_data_master_requests_pio_sda_24_s1;
  output           d1_pio_sda_24_s1_end_xfer;
  output  [  1: 0] pio_sda_24_s1_address;
  output           pio_sda_24_s1_chipselect;
  output           pio_sda_24_s1_readdata_from_sa;
  output           pio_sda_24_s1_reset_n;
  output           pio_sda_24_s1_write_n;
  output           pio_sda_24_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            pio_sda_24_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_sda_24_s1;
  wire             cpu_0_data_master_qualified_request_pio_sda_24_s1;
  wire             cpu_0_data_master_read_data_valid_pio_sda_24_s1;
  wire             cpu_0_data_master_requests_pio_sda_24_s1;
  wire             cpu_0_data_master_saved_grant_pio_sda_24_s1;
  reg              d1_pio_sda_24_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_sda_24_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_sda_24_s1_address;
  wire             pio_sda_24_s1_allgrants;
  wire             pio_sda_24_s1_allow_new_arb_cycle;
  wire             pio_sda_24_s1_any_bursting_master_saved_grant;
  wire             pio_sda_24_s1_any_continuerequest;
  wire             pio_sda_24_s1_arb_counter_enable;
  reg     [  1: 0] pio_sda_24_s1_arb_share_counter;
  wire    [  1: 0] pio_sda_24_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_sda_24_s1_arb_share_set_values;
  wire             pio_sda_24_s1_beginbursttransfer_internal;
  wire             pio_sda_24_s1_begins_xfer;
  wire             pio_sda_24_s1_chipselect;
  wire             pio_sda_24_s1_end_xfer;
  wire             pio_sda_24_s1_firsttransfer;
  wire             pio_sda_24_s1_grant_vector;
  wire             pio_sda_24_s1_in_a_read_cycle;
  wire             pio_sda_24_s1_in_a_write_cycle;
  wire             pio_sda_24_s1_master_qreq_vector;
  wire             pio_sda_24_s1_non_bursting_master_requests;
  wire             pio_sda_24_s1_readdata_from_sa;
  reg              pio_sda_24_s1_reg_firsttransfer;
  wire             pio_sda_24_s1_reset_n;
  reg              pio_sda_24_s1_slavearbiterlockenable;
  wire             pio_sda_24_s1_slavearbiterlockenable2;
  wire             pio_sda_24_s1_unreg_firsttransfer;
  wire             pio_sda_24_s1_waits_for_read;
  wire             pio_sda_24_s1_waits_for_write;
  wire             pio_sda_24_s1_write_n;
  wire             pio_sda_24_s1_writedata;
  wire    [ 24: 0] shifted_address_to_pio_sda_24_s1_from_cpu_0_data_master;
  wire             wait_for_pio_sda_24_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_sda_24_s1_end_xfer;
    end


  assign pio_sda_24_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_sda_24_s1));
  //assign pio_sda_24_s1_readdata_from_sa = pio_sda_24_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_sda_24_s1_readdata_from_sa = pio_sda_24_s1_readdata;

  assign cpu_0_data_master_requests_pio_sda_24_s1 = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1002190) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //pio_sda_24_s1_arb_share_counter set values, which is an e_mux
  assign pio_sda_24_s1_arb_share_set_values = 1;

  //pio_sda_24_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_sda_24_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_sda_24_s1;

  //pio_sda_24_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_sda_24_s1_any_bursting_master_saved_grant = 0;

  //pio_sda_24_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_sda_24_s1_arb_share_counter_next_value = pio_sda_24_s1_firsttransfer ? (pio_sda_24_s1_arb_share_set_values - 1) : |pio_sda_24_s1_arb_share_counter ? (pio_sda_24_s1_arb_share_counter - 1) : 0;

  //pio_sda_24_s1_allgrants all slave grants, which is an e_mux
  assign pio_sda_24_s1_allgrants = |pio_sda_24_s1_grant_vector;

  //pio_sda_24_s1_end_xfer assignment, which is an e_assign
  assign pio_sda_24_s1_end_xfer = ~(pio_sda_24_s1_waits_for_read | pio_sda_24_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_sda_24_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_sda_24_s1 = pio_sda_24_s1_end_xfer & (~pio_sda_24_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_sda_24_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_sda_24_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_sda_24_s1 & pio_sda_24_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_sda_24_s1 & ~pio_sda_24_s1_non_bursting_master_requests);

  //pio_sda_24_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_sda_24_s1_arb_share_counter <= 0;
      else if (pio_sda_24_s1_arb_counter_enable)
          pio_sda_24_s1_arb_share_counter <= pio_sda_24_s1_arb_share_counter_next_value;
    end


  //pio_sda_24_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_sda_24_s1_slavearbiterlockenable <= 0;
      else if ((|pio_sda_24_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_sda_24_s1) | (end_xfer_arb_share_counter_term_pio_sda_24_s1 & ~pio_sda_24_s1_non_bursting_master_requests))
          pio_sda_24_s1_slavearbiterlockenable <= |pio_sda_24_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_sda_24/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_sda_24_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_sda_24_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_sda_24_s1_slavearbiterlockenable2 = |pio_sda_24_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_sda_24/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_sda_24_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_sda_24_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_sda_24_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_sda_24_s1 = cpu_0_data_master_requests_pio_sda_24_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_sda_24_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_sda_24_s1 = cpu_0_data_master_granted_pio_sda_24_s1 & cpu_0_data_master_read & ~pio_sda_24_s1_waits_for_read;

  //pio_sda_24_s1_writedata mux, which is an e_mux
  assign pio_sda_24_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_sda_24_s1 = cpu_0_data_master_qualified_request_pio_sda_24_s1;

  //cpu_0/data_master saved-grant pio_sda_24/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_sda_24_s1 = cpu_0_data_master_requests_pio_sda_24_s1;

  //allow new arb cycle for pio_sda_24/s1, which is an e_assign
  assign pio_sda_24_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_sda_24_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_sda_24_s1_master_qreq_vector = 1;

  //pio_sda_24_s1_reset_n assignment, which is an e_assign
  assign pio_sda_24_s1_reset_n = reset_n;

  assign pio_sda_24_s1_chipselect = cpu_0_data_master_granted_pio_sda_24_s1;
  //pio_sda_24_s1_firsttransfer first transaction, which is an e_assign
  assign pio_sda_24_s1_firsttransfer = pio_sda_24_s1_begins_xfer ? pio_sda_24_s1_unreg_firsttransfer : pio_sda_24_s1_reg_firsttransfer;

  //pio_sda_24_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_sda_24_s1_unreg_firsttransfer = ~(pio_sda_24_s1_slavearbiterlockenable & pio_sda_24_s1_any_continuerequest);

  //pio_sda_24_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_sda_24_s1_reg_firsttransfer <= 1'b1;
      else if (pio_sda_24_s1_begins_xfer)
          pio_sda_24_s1_reg_firsttransfer <= pio_sda_24_s1_unreg_firsttransfer;
    end


  //pio_sda_24_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_sda_24_s1_beginbursttransfer_internal = pio_sda_24_s1_begins_xfer;

  //~pio_sda_24_s1_write_n assignment, which is an e_mux
  assign pio_sda_24_s1_write_n = ~(cpu_0_data_master_granted_pio_sda_24_s1 & cpu_0_data_master_write);

  assign shifted_address_to_pio_sda_24_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_sda_24_s1_address mux, which is an e_mux
  assign pio_sda_24_s1_address = shifted_address_to_pio_sda_24_s1_from_cpu_0_data_master >> 2;

  //d1_pio_sda_24_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_sda_24_s1_end_xfer <= 1;
      else 
        d1_pio_sda_24_s1_end_xfer <= pio_sda_24_s1_end_xfer;
    end


  //pio_sda_24_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_sda_24_s1_waits_for_read = pio_sda_24_s1_in_a_read_cycle & pio_sda_24_s1_begins_xfer;

  //pio_sda_24_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_sda_24_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_sda_24_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_sda_24_s1_in_a_read_cycle;

  //pio_sda_24_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_sda_24_s1_waits_for_write = pio_sda_24_s1_in_a_write_cycle & 0;

  //pio_sda_24_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_sda_24_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_sda_24_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_sda_24_s1_in_a_write_cycle;

  assign wait_for_pio_sda_24_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_sda_24/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_sda_9557_s1_arbitrator (
                                    // inputs:
                                     clk,
                                     cpu_0_data_master_address_to_slave,
                                     cpu_0_data_master_latency_counter,
                                     cpu_0_data_master_read,
                                     cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                     cpu_0_data_master_write,
                                     cpu_0_data_master_writedata,
                                     pio_sda_9557_s1_readdata,
                                     reset_n,

                                    // outputs:
                                     cpu_0_data_master_granted_pio_sda_9557_s1,
                                     cpu_0_data_master_qualified_request_pio_sda_9557_s1,
                                     cpu_0_data_master_read_data_valid_pio_sda_9557_s1,
                                     cpu_0_data_master_requests_pio_sda_9557_s1,
                                     d1_pio_sda_9557_s1_end_xfer,
                                     pio_sda_9557_s1_address,
                                     pio_sda_9557_s1_chipselect,
                                     pio_sda_9557_s1_readdata_from_sa,
                                     pio_sda_9557_s1_reset_n,
                                     pio_sda_9557_s1_write_n,
                                     pio_sda_9557_s1_writedata
                                  )
;

  output           cpu_0_data_master_granted_pio_sda_9557_s1;
  output           cpu_0_data_master_qualified_request_pio_sda_9557_s1;
  output           cpu_0_data_master_read_data_valid_pio_sda_9557_s1;
  output           cpu_0_data_master_requests_pio_sda_9557_s1;
  output           d1_pio_sda_9557_s1_end_xfer;
  output  [  1: 0] pio_sda_9557_s1_address;
  output           pio_sda_9557_s1_chipselect;
  output           pio_sda_9557_s1_readdata_from_sa;
  output           pio_sda_9557_s1_reset_n;
  output           pio_sda_9557_s1_write_n;
  output           pio_sda_9557_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            pio_sda_9557_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_sda_9557_s1;
  wire             cpu_0_data_master_qualified_request_pio_sda_9557_s1;
  wire             cpu_0_data_master_read_data_valid_pio_sda_9557_s1;
  wire             cpu_0_data_master_requests_pio_sda_9557_s1;
  wire             cpu_0_data_master_saved_grant_pio_sda_9557_s1;
  reg              d1_pio_sda_9557_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_sda_9557_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_sda_9557_s1_address;
  wire             pio_sda_9557_s1_allgrants;
  wire             pio_sda_9557_s1_allow_new_arb_cycle;
  wire             pio_sda_9557_s1_any_bursting_master_saved_grant;
  wire             pio_sda_9557_s1_any_continuerequest;
  wire             pio_sda_9557_s1_arb_counter_enable;
  reg     [  1: 0] pio_sda_9557_s1_arb_share_counter;
  wire    [  1: 0] pio_sda_9557_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_sda_9557_s1_arb_share_set_values;
  wire             pio_sda_9557_s1_beginbursttransfer_internal;
  wire             pio_sda_9557_s1_begins_xfer;
  wire             pio_sda_9557_s1_chipselect;
  wire             pio_sda_9557_s1_end_xfer;
  wire             pio_sda_9557_s1_firsttransfer;
  wire             pio_sda_9557_s1_grant_vector;
  wire             pio_sda_9557_s1_in_a_read_cycle;
  wire             pio_sda_9557_s1_in_a_write_cycle;
  wire             pio_sda_9557_s1_master_qreq_vector;
  wire             pio_sda_9557_s1_non_bursting_master_requests;
  wire             pio_sda_9557_s1_readdata_from_sa;
  reg              pio_sda_9557_s1_reg_firsttransfer;
  wire             pio_sda_9557_s1_reset_n;
  reg              pio_sda_9557_s1_slavearbiterlockenable;
  wire             pio_sda_9557_s1_slavearbiterlockenable2;
  wire             pio_sda_9557_s1_unreg_firsttransfer;
  wire             pio_sda_9557_s1_waits_for_read;
  wire             pio_sda_9557_s1_waits_for_write;
  wire             pio_sda_9557_s1_write_n;
  wire             pio_sda_9557_s1_writedata;
  wire    [ 24: 0] shifted_address_to_pio_sda_9557_s1_from_cpu_0_data_master;
  wire             wait_for_pio_sda_9557_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_sda_9557_s1_end_xfer;
    end


  assign pio_sda_9557_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_sda_9557_s1));
  //assign pio_sda_9557_s1_readdata_from_sa = pio_sda_9557_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_sda_9557_s1_readdata_from_sa = pio_sda_9557_s1_readdata;

  assign cpu_0_data_master_requests_pio_sda_9557_s1 = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h10021c0) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //pio_sda_9557_s1_arb_share_counter set values, which is an e_mux
  assign pio_sda_9557_s1_arb_share_set_values = 1;

  //pio_sda_9557_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_sda_9557_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_sda_9557_s1;

  //pio_sda_9557_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_sda_9557_s1_any_bursting_master_saved_grant = 0;

  //pio_sda_9557_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_sda_9557_s1_arb_share_counter_next_value = pio_sda_9557_s1_firsttransfer ? (pio_sda_9557_s1_arb_share_set_values - 1) : |pio_sda_9557_s1_arb_share_counter ? (pio_sda_9557_s1_arb_share_counter - 1) : 0;

  //pio_sda_9557_s1_allgrants all slave grants, which is an e_mux
  assign pio_sda_9557_s1_allgrants = |pio_sda_9557_s1_grant_vector;

  //pio_sda_9557_s1_end_xfer assignment, which is an e_assign
  assign pio_sda_9557_s1_end_xfer = ~(pio_sda_9557_s1_waits_for_read | pio_sda_9557_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_sda_9557_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_sda_9557_s1 = pio_sda_9557_s1_end_xfer & (~pio_sda_9557_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_sda_9557_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_sda_9557_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_sda_9557_s1 & pio_sda_9557_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_sda_9557_s1 & ~pio_sda_9557_s1_non_bursting_master_requests);

  //pio_sda_9557_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_sda_9557_s1_arb_share_counter <= 0;
      else if (pio_sda_9557_s1_arb_counter_enable)
          pio_sda_9557_s1_arb_share_counter <= pio_sda_9557_s1_arb_share_counter_next_value;
    end


  //pio_sda_9557_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_sda_9557_s1_slavearbiterlockenable <= 0;
      else if ((|pio_sda_9557_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_sda_9557_s1) | (end_xfer_arb_share_counter_term_pio_sda_9557_s1 & ~pio_sda_9557_s1_non_bursting_master_requests))
          pio_sda_9557_s1_slavearbiterlockenable <= |pio_sda_9557_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_sda_9557/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_sda_9557_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_sda_9557_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_sda_9557_s1_slavearbiterlockenable2 = |pio_sda_9557_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_sda_9557/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_sda_9557_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_sda_9557_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_sda_9557_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_sda_9557_s1 = cpu_0_data_master_requests_pio_sda_9557_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_sda_9557_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_sda_9557_s1 = cpu_0_data_master_granted_pio_sda_9557_s1 & cpu_0_data_master_read & ~pio_sda_9557_s1_waits_for_read;

  //pio_sda_9557_s1_writedata mux, which is an e_mux
  assign pio_sda_9557_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_sda_9557_s1 = cpu_0_data_master_qualified_request_pio_sda_9557_s1;

  //cpu_0/data_master saved-grant pio_sda_9557/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_sda_9557_s1 = cpu_0_data_master_requests_pio_sda_9557_s1;

  //allow new arb cycle for pio_sda_9557/s1, which is an e_assign
  assign pio_sda_9557_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_sda_9557_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_sda_9557_s1_master_qreq_vector = 1;

  //pio_sda_9557_s1_reset_n assignment, which is an e_assign
  assign pio_sda_9557_s1_reset_n = reset_n;

  assign pio_sda_9557_s1_chipselect = cpu_0_data_master_granted_pio_sda_9557_s1;
  //pio_sda_9557_s1_firsttransfer first transaction, which is an e_assign
  assign pio_sda_9557_s1_firsttransfer = pio_sda_9557_s1_begins_xfer ? pio_sda_9557_s1_unreg_firsttransfer : pio_sda_9557_s1_reg_firsttransfer;

  //pio_sda_9557_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_sda_9557_s1_unreg_firsttransfer = ~(pio_sda_9557_s1_slavearbiterlockenable & pio_sda_9557_s1_any_continuerequest);

  //pio_sda_9557_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_sda_9557_s1_reg_firsttransfer <= 1'b1;
      else if (pio_sda_9557_s1_begins_xfer)
          pio_sda_9557_s1_reg_firsttransfer <= pio_sda_9557_s1_unreg_firsttransfer;
    end


  //pio_sda_9557_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_sda_9557_s1_beginbursttransfer_internal = pio_sda_9557_s1_begins_xfer;

  //~pio_sda_9557_s1_write_n assignment, which is an e_mux
  assign pio_sda_9557_s1_write_n = ~(cpu_0_data_master_granted_pio_sda_9557_s1 & cpu_0_data_master_write);

  assign shifted_address_to_pio_sda_9557_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_sda_9557_s1_address mux, which is an e_mux
  assign pio_sda_9557_s1_address = shifted_address_to_pio_sda_9557_s1_from_cpu_0_data_master >> 2;

  //d1_pio_sda_9557_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_sda_9557_s1_end_xfer <= 1;
      else 
        d1_pio_sda_9557_s1_end_xfer <= pio_sda_9557_s1_end_xfer;
    end


  //pio_sda_9557_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_sda_9557_s1_waits_for_read = pio_sda_9557_s1_in_a_read_cycle & pio_sda_9557_s1_begins_xfer;

  //pio_sda_9557_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_sda_9557_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_sda_9557_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_sda_9557_s1_in_a_read_cycle;

  //pio_sda_9557_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_sda_9557_s1_waits_for_write = pio_sda_9557_s1_in_a_write_cycle & 0;

  //pio_sda_9557_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_sda_9557_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_sda_9557_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_sda_9557_s1_in_a_write_cycle;

  assign wait_for_pio_sda_9557_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_sda_9557/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_shoot_off_s1_arbitrator (
                                     // inputs:
                                      clk,
                                      cpu_0_data_master_address_to_slave,
                                      cpu_0_data_master_latency_counter,
                                      cpu_0_data_master_read,
                                      cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                      cpu_0_data_master_write,
                                      pio_shoot_off_s1_readdata,
                                      reset_n,

                                     // outputs:
                                      cpu_0_data_master_granted_pio_shoot_off_s1,
                                      cpu_0_data_master_qualified_request_pio_shoot_off_s1,
                                      cpu_0_data_master_read_data_valid_pio_shoot_off_s1,
                                      cpu_0_data_master_requests_pio_shoot_off_s1,
                                      d1_pio_shoot_off_s1_end_xfer,
                                      pio_shoot_off_s1_address,
                                      pio_shoot_off_s1_readdata_from_sa,
                                      pio_shoot_off_s1_reset_n
                                   )
;

  output           cpu_0_data_master_granted_pio_shoot_off_s1;
  output           cpu_0_data_master_qualified_request_pio_shoot_off_s1;
  output           cpu_0_data_master_read_data_valid_pio_shoot_off_s1;
  output           cpu_0_data_master_requests_pio_shoot_off_s1;
  output           d1_pio_shoot_off_s1_end_xfer;
  output  [  1: 0] pio_shoot_off_s1_address;
  output           pio_shoot_off_s1_readdata_from_sa;
  output           pio_shoot_off_s1_reset_n;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input            pio_shoot_off_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_shoot_off_s1;
  wire             cpu_0_data_master_qualified_request_pio_shoot_off_s1;
  wire             cpu_0_data_master_read_data_valid_pio_shoot_off_s1;
  wire             cpu_0_data_master_requests_pio_shoot_off_s1;
  wire             cpu_0_data_master_saved_grant_pio_shoot_off_s1;
  reg              d1_pio_shoot_off_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_shoot_off_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_shoot_off_s1_address;
  wire             pio_shoot_off_s1_allgrants;
  wire             pio_shoot_off_s1_allow_new_arb_cycle;
  wire             pio_shoot_off_s1_any_bursting_master_saved_grant;
  wire             pio_shoot_off_s1_any_continuerequest;
  wire             pio_shoot_off_s1_arb_counter_enable;
  reg     [  1: 0] pio_shoot_off_s1_arb_share_counter;
  wire    [  1: 0] pio_shoot_off_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_shoot_off_s1_arb_share_set_values;
  wire             pio_shoot_off_s1_beginbursttransfer_internal;
  wire             pio_shoot_off_s1_begins_xfer;
  wire             pio_shoot_off_s1_end_xfer;
  wire             pio_shoot_off_s1_firsttransfer;
  wire             pio_shoot_off_s1_grant_vector;
  wire             pio_shoot_off_s1_in_a_read_cycle;
  wire             pio_shoot_off_s1_in_a_write_cycle;
  wire             pio_shoot_off_s1_master_qreq_vector;
  wire             pio_shoot_off_s1_non_bursting_master_requests;
  wire             pio_shoot_off_s1_readdata_from_sa;
  reg              pio_shoot_off_s1_reg_firsttransfer;
  wire             pio_shoot_off_s1_reset_n;
  reg              pio_shoot_off_s1_slavearbiterlockenable;
  wire             pio_shoot_off_s1_slavearbiterlockenable2;
  wire             pio_shoot_off_s1_unreg_firsttransfer;
  wire             pio_shoot_off_s1_waits_for_read;
  wire             pio_shoot_off_s1_waits_for_write;
  wire    [ 24: 0] shifted_address_to_pio_shoot_off_s1_from_cpu_0_data_master;
  wire             wait_for_pio_shoot_off_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_shoot_off_s1_end_xfer;
    end


  assign pio_shoot_off_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_shoot_off_s1));
  //assign pio_shoot_off_s1_readdata_from_sa = pio_shoot_off_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_shoot_off_s1_readdata_from_sa = pio_shoot_off_s1_readdata;

  assign cpu_0_data_master_requests_pio_shoot_off_s1 = (({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h10021e0) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //pio_shoot_off_s1_arb_share_counter set values, which is an e_mux
  assign pio_shoot_off_s1_arb_share_set_values = 1;

  //pio_shoot_off_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_shoot_off_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_shoot_off_s1;

  //pio_shoot_off_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_shoot_off_s1_any_bursting_master_saved_grant = 0;

  //pio_shoot_off_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_shoot_off_s1_arb_share_counter_next_value = pio_shoot_off_s1_firsttransfer ? (pio_shoot_off_s1_arb_share_set_values - 1) : |pio_shoot_off_s1_arb_share_counter ? (pio_shoot_off_s1_arb_share_counter - 1) : 0;

  //pio_shoot_off_s1_allgrants all slave grants, which is an e_mux
  assign pio_shoot_off_s1_allgrants = |pio_shoot_off_s1_grant_vector;

  //pio_shoot_off_s1_end_xfer assignment, which is an e_assign
  assign pio_shoot_off_s1_end_xfer = ~(pio_shoot_off_s1_waits_for_read | pio_shoot_off_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_shoot_off_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_shoot_off_s1 = pio_shoot_off_s1_end_xfer & (~pio_shoot_off_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_shoot_off_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_shoot_off_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_shoot_off_s1 & pio_shoot_off_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_shoot_off_s1 & ~pio_shoot_off_s1_non_bursting_master_requests);

  //pio_shoot_off_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_shoot_off_s1_arb_share_counter <= 0;
      else if (pio_shoot_off_s1_arb_counter_enable)
          pio_shoot_off_s1_arb_share_counter <= pio_shoot_off_s1_arb_share_counter_next_value;
    end


  //pio_shoot_off_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_shoot_off_s1_slavearbiterlockenable <= 0;
      else if ((|pio_shoot_off_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_shoot_off_s1) | (end_xfer_arb_share_counter_term_pio_shoot_off_s1 & ~pio_shoot_off_s1_non_bursting_master_requests))
          pio_shoot_off_s1_slavearbiterlockenable <= |pio_shoot_off_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_shoot_off/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_shoot_off_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_shoot_off_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_shoot_off_s1_slavearbiterlockenable2 = |pio_shoot_off_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_shoot_off/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_shoot_off_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_shoot_off_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_shoot_off_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_shoot_off_s1 = cpu_0_data_master_requests_pio_shoot_off_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_shoot_off_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_shoot_off_s1 = cpu_0_data_master_granted_pio_shoot_off_s1 & cpu_0_data_master_read & ~pio_shoot_off_s1_waits_for_read;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_shoot_off_s1 = cpu_0_data_master_qualified_request_pio_shoot_off_s1;

  //cpu_0/data_master saved-grant pio_shoot_off/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_shoot_off_s1 = cpu_0_data_master_requests_pio_shoot_off_s1;

  //allow new arb cycle for pio_shoot_off/s1, which is an e_assign
  assign pio_shoot_off_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_shoot_off_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_shoot_off_s1_master_qreq_vector = 1;

  //pio_shoot_off_s1_reset_n assignment, which is an e_assign
  assign pio_shoot_off_s1_reset_n = reset_n;

  //pio_shoot_off_s1_firsttransfer first transaction, which is an e_assign
  assign pio_shoot_off_s1_firsttransfer = pio_shoot_off_s1_begins_xfer ? pio_shoot_off_s1_unreg_firsttransfer : pio_shoot_off_s1_reg_firsttransfer;

  //pio_shoot_off_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_shoot_off_s1_unreg_firsttransfer = ~(pio_shoot_off_s1_slavearbiterlockenable & pio_shoot_off_s1_any_continuerequest);

  //pio_shoot_off_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_shoot_off_s1_reg_firsttransfer <= 1'b1;
      else if (pio_shoot_off_s1_begins_xfer)
          pio_shoot_off_s1_reg_firsttransfer <= pio_shoot_off_s1_unreg_firsttransfer;
    end


  //pio_shoot_off_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_shoot_off_s1_beginbursttransfer_internal = pio_shoot_off_s1_begins_xfer;

  assign shifted_address_to_pio_shoot_off_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_shoot_off_s1_address mux, which is an e_mux
  assign pio_shoot_off_s1_address = shifted_address_to_pio_shoot_off_s1_from_cpu_0_data_master >> 2;

  //d1_pio_shoot_off_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_shoot_off_s1_end_xfer <= 1;
      else 
        d1_pio_shoot_off_s1_end_xfer <= pio_shoot_off_s1_end_xfer;
    end


  //pio_shoot_off_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_shoot_off_s1_waits_for_read = pio_shoot_off_s1_in_a_read_cycle & pio_shoot_off_s1_begins_xfer;

  //pio_shoot_off_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_shoot_off_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_shoot_off_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_shoot_off_s1_in_a_read_cycle;

  //pio_shoot_off_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_shoot_off_s1_waits_for_write = pio_shoot_off_s1_in_a_write_cycle & 0;

  //pio_shoot_off_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_shoot_off_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_shoot_off_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_shoot_off_s1_in_a_write_cycle;

  assign wait_for_pio_shoot_off_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_shoot_off/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_0_data_master_to_sdram_0_s1_module (
                                                             // inputs:
                                                              clear_fifo,
                                                              clk,
                                                              data_in,
                                                              read,
                                                              reset_n,
                                                              sync_reset,
                                                              write,

                                                             // outputs:
                                                              data_out,
                                                              empty,
                                                              fifo_contains_ones_n,
                                                              full
                                                           )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_0_instruction_master_to_sdram_0_s1_module (
                                                                    // inputs:
                                                                     clear_fifo,
                                                                     clk,
                                                                     data_in,
                                                                     read,
                                                                     reset_n,
                                                                     sync_reset,
                                                                     write,

                                                                    // outputs:
                                                                     data_out,
                                                                     empty,
                                                                     fifo_contains_ones_n,
                                                                     full
                                                                  )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sdram_0_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_0_data_master_address_to_slave,
                                cpu_0_data_master_byteenable,
                                cpu_0_data_master_dbs_address,
                                cpu_0_data_master_dbs_write_16,
                                cpu_0_data_master_latency_counter,
                                cpu_0_data_master_read,
                                cpu_0_data_master_write,
                                cpu_0_instruction_master_address_to_slave,
                                cpu_0_instruction_master_dbs_address,
                                cpu_0_instruction_master_latency_counter,
                                cpu_0_instruction_master_read,
                                reset_n,
                                sdram_0_s1_readdata,
                                sdram_0_s1_readdatavalid,
                                sdram_0_s1_waitrequest,

                               // outputs:
                                cpu_0_data_master_byteenable_sdram_0_s1,
                                cpu_0_data_master_granted_sdram_0_s1,
                                cpu_0_data_master_qualified_request_sdram_0_s1,
                                cpu_0_data_master_read_data_valid_sdram_0_s1,
                                cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                cpu_0_data_master_requests_sdram_0_s1,
                                cpu_0_instruction_master_granted_sdram_0_s1,
                                cpu_0_instruction_master_qualified_request_sdram_0_s1,
                                cpu_0_instruction_master_read_data_valid_sdram_0_s1,
                                cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register,
                                cpu_0_instruction_master_requests_sdram_0_s1,
                                d1_sdram_0_s1_end_xfer,
                                sdram_0_s1_address,
                                sdram_0_s1_byteenable_n,
                                sdram_0_s1_chipselect,
                                sdram_0_s1_read_n,
                                sdram_0_s1_readdata_from_sa,
                                sdram_0_s1_reset_n,
                                sdram_0_s1_waitrequest_from_sa,
                                sdram_0_s1_write_n,
                                sdram_0_s1_writedata
                             )
;

  output  [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1;
  output           cpu_0_data_master_granted_sdram_0_s1;
  output           cpu_0_data_master_qualified_request_sdram_0_s1;
  output           cpu_0_data_master_read_data_valid_sdram_0_s1;
  output           cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  output           cpu_0_data_master_requests_sdram_0_s1;
  output           cpu_0_instruction_master_granted_sdram_0_s1;
  output           cpu_0_instruction_master_qualified_request_sdram_0_s1;
  output           cpu_0_instruction_master_read_data_valid_sdram_0_s1;
  output           cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  output           cpu_0_instruction_master_requests_sdram_0_s1;
  output           d1_sdram_0_s1_end_xfer;
  output  [ 21: 0] sdram_0_s1_address;
  output  [  1: 0] sdram_0_s1_byteenable_n;
  output           sdram_0_s1_chipselect;
  output           sdram_0_s1_read_n;
  output  [ 15: 0] sdram_0_s1_readdata_from_sa;
  output           sdram_0_s1_reset_n;
  output           sdram_0_s1_waitrequest_from_sa;
  output           sdram_0_s1_write_n;
  output  [ 15: 0] sdram_0_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input   [ 15: 0] cpu_0_data_master_dbs_write_16;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input   [  1: 0] cpu_0_instruction_master_dbs_address;
  input            cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input            reset_n;
  input   [ 15: 0] sdram_0_s1_readdata;
  input            sdram_0_s1_readdatavalid;
  input            sdram_0_s1_waitrequest;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire    [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1;
  wire    [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1_segment_0;
  wire    [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1_segment_1;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_sdram_0_s1;
  wire             cpu_0_data_master_qualified_request_sdram_0_s1;
  wire             cpu_0_data_master_rdv_fifo_empty_sdram_0_s1;
  wire             cpu_0_data_master_rdv_fifo_output_from_sdram_0_s1;
  wire             cpu_0_data_master_read_data_valid_sdram_0_s1;
  wire             cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  wire             cpu_0_data_master_requests_sdram_0_s1;
  wire             cpu_0_data_master_saved_grant_sdram_0_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_sdram_0_s1;
  wire             cpu_0_instruction_master_qualified_request_sdram_0_s1;
  wire             cpu_0_instruction_master_rdv_fifo_empty_sdram_0_s1;
  wire             cpu_0_instruction_master_rdv_fifo_output_from_sdram_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_sdram_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  wire             cpu_0_instruction_master_requests_sdram_0_s1;
  wire             cpu_0_instruction_master_saved_grant_sdram_0_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sdram_0_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sdram_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1;
  wire    [ 21: 0] sdram_0_s1_address;
  wire             sdram_0_s1_allgrants;
  wire             sdram_0_s1_allow_new_arb_cycle;
  wire             sdram_0_s1_any_bursting_master_saved_grant;
  wire             sdram_0_s1_any_continuerequest;
  reg     [  1: 0] sdram_0_s1_arb_addend;
  wire             sdram_0_s1_arb_counter_enable;
  reg     [  1: 0] sdram_0_s1_arb_share_counter;
  wire    [  1: 0] sdram_0_s1_arb_share_counter_next_value;
  wire    [  1: 0] sdram_0_s1_arb_share_set_values;
  wire    [  1: 0] sdram_0_s1_arb_winner;
  wire             sdram_0_s1_arbitration_holdoff_internal;
  wire             sdram_0_s1_beginbursttransfer_internal;
  wire             sdram_0_s1_begins_xfer;
  wire    [  1: 0] sdram_0_s1_byteenable_n;
  wire             sdram_0_s1_chipselect;
  wire    [  3: 0] sdram_0_s1_chosen_master_double_vector;
  wire    [  1: 0] sdram_0_s1_chosen_master_rot_left;
  wire             sdram_0_s1_end_xfer;
  wire             sdram_0_s1_firsttransfer;
  wire    [  1: 0] sdram_0_s1_grant_vector;
  wire             sdram_0_s1_in_a_read_cycle;
  wire             sdram_0_s1_in_a_write_cycle;
  wire    [  1: 0] sdram_0_s1_master_qreq_vector;
  wire             sdram_0_s1_move_on_to_next_transaction;
  wire             sdram_0_s1_non_bursting_master_requests;
  wire             sdram_0_s1_read_n;
  wire    [ 15: 0] sdram_0_s1_readdata_from_sa;
  wire             sdram_0_s1_readdatavalid_from_sa;
  reg              sdram_0_s1_reg_firsttransfer;
  wire             sdram_0_s1_reset_n;
  reg     [  1: 0] sdram_0_s1_saved_chosen_master_vector;
  reg              sdram_0_s1_slavearbiterlockenable;
  wire             sdram_0_s1_slavearbiterlockenable2;
  wire             sdram_0_s1_unreg_firsttransfer;
  wire             sdram_0_s1_waitrequest_from_sa;
  wire             sdram_0_s1_waits_for_read;
  wire             sdram_0_s1_waits_for_write;
  wire             sdram_0_s1_write_n;
  wire    [ 15: 0] sdram_0_s1_writedata;
  wire    [ 24: 0] shifted_address_to_sdram_0_s1_from_cpu_0_data_master;
  wire    [ 24: 0] shifted_address_to_sdram_0_s1_from_cpu_0_instruction_master;
  wire             wait_for_sdram_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sdram_0_s1_end_xfer;
    end


  assign sdram_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_sdram_0_s1 | cpu_0_instruction_master_qualified_request_sdram_0_s1));
  //assign sdram_0_s1_readdatavalid_from_sa = sdram_0_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_0_s1_readdatavalid_from_sa = sdram_0_s1_readdatavalid;

  //assign sdram_0_s1_readdata_from_sa = sdram_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_0_s1_readdata_from_sa = sdram_0_s1_readdata;

  assign cpu_0_data_master_requests_sdram_0_s1 = ({cpu_0_data_master_address_to_slave[24 : 23] , 23'b0} == 25'h800000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign sdram_0_s1_waitrequest_from_sa = sdram_0_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_0_s1_waitrequest_from_sa = sdram_0_s1_waitrequest;

  //sdram_0_s1_arb_share_counter set values, which is an e_mux
  assign sdram_0_s1_arb_share_set_values = (cpu_0_data_master_granted_sdram_0_s1)? 2 :
    (cpu_0_instruction_master_granted_sdram_0_s1)? 2 :
    (cpu_0_data_master_granted_sdram_0_s1)? 2 :
    (cpu_0_instruction_master_granted_sdram_0_s1)? 2 :
    1;

  //sdram_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign sdram_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_sdram_0_s1 |
    cpu_0_instruction_master_requests_sdram_0_s1 |
    cpu_0_data_master_requests_sdram_0_s1 |
    cpu_0_instruction_master_requests_sdram_0_s1;

  //sdram_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sdram_0_s1_any_bursting_master_saved_grant = 0;

  //sdram_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sdram_0_s1_arb_share_counter_next_value = sdram_0_s1_firsttransfer ? (sdram_0_s1_arb_share_set_values - 1) : |sdram_0_s1_arb_share_counter ? (sdram_0_s1_arb_share_counter - 1) : 0;

  //sdram_0_s1_allgrants all slave grants, which is an e_mux
  assign sdram_0_s1_allgrants = (|sdram_0_s1_grant_vector) |
    (|sdram_0_s1_grant_vector) |
    (|sdram_0_s1_grant_vector) |
    (|sdram_0_s1_grant_vector);

  //sdram_0_s1_end_xfer assignment, which is an e_assign
  assign sdram_0_s1_end_xfer = ~(sdram_0_s1_waits_for_read | sdram_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sdram_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sdram_0_s1 = sdram_0_s1_end_xfer & (~sdram_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sdram_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sdram_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sdram_0_s1 & sdram_0_s1_allgrants) | (end_xfer_arb_share_counter_term_sdram_0_s1 & ~sdram_0_s1_non_bursting_master_requests);

  //sdram_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_arb_share_counter <= 0;
      else if (sdram_0_s1_arb_counter_enable)
          sdram_0_s1_arb_share_counter <= sdram_0_s1_arb_share_counter_next_value;
    end


  //sdram_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_slavearbiterlockenable <= 0;
      else if ((|sdram_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sdram_0_s1) | (end_xfer_arb_share_counter_term_sdram_0_s1 & ~sdram_0_s1_non_bursting_master_requests))
          sdram_0_s1_slavearbiterlockenable <= |sdram_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master sdram_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = sdram_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //sdram_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sdram_0_s1_slavearbiterlockenable2 = |sdram_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master sdram_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = sdram_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master sdram_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = sdram_0_s1_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master sdram_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = sdram_0_s1_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted sdram_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1 <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1 <= cpu_0_instruction_master_saved_grant_sdram_0_s1 ? 1 : (sdram_0_s1_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_sdram_0_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1 & cpu_0_instruction_master_requests_sdram_0_s1;

  //sdram_0_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sdram_0_s1_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_sdram_0_s1 = cpu_0_data_master_requests_sdram_0_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (1 < cpu_0_data_master_latency_counter))) | ((!cpu_0_data_master_byteenable_sdram_0_s1) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //unique name for sdram_0_s1_move_on_to_next_transaction, which is an e_assign
  assign sdram_0_s1_move_on_to_next_transaction = sdram_0_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_0_data_master_to_sdram_0_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_0_data_master_to_sdram_0_s1_module rdv_fifo_for_cpu_0_data_master_to_sdram_0_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_0_data_master_granted_sdram_0_s1),
      .data_out             (cpu_0_data_master_rdv_fifo_output_from_sdram_0_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_0_data_master_rdv_fifo_empty_sdram_0_s1),
      .full                 (),
      .read                 (sdram_0_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_0_s1_waits_for_read)
    );

  assign cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register = ~cpu_0_data_master_rdv_fifo_empty_sdram_0_s1;
  //local readdatavalid cpu_0_data_master_read_data_valid_sdram_0_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_sdram_0_s1 = (sdram_0_s1_readdatavalid_from_sa & cpu_0_data_master_rdv_fifo_output_from_sdram_0_s1) & ~ cpu_0_data_master_rdv_fifo_empty_sdram_0_s1;

  //sdram_0_s1_writedata mux, which is an e_mux
  assign sdram_0_s1_writedata = cpu_0_data_master_dbs_write_16;

  assign cpu_0_instruction_master_requests_sdram_0_s1 = (({cpu_0_instruction_master_address_to_slave[24 : 23] , 23'b0} == 25'h800000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted sdram_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1 <= cpu_0_data_master_saved_grant_sdram_0_s1 ? 1 : (sdram_0_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_sdram_0_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1 & cpu_0_data_master_requests_sdram_0_s1;

  assign cpu_0_instruction_master_qualified_request_sdram_0_s1 = cpu_0_instruction_master_requests_sdram_0_s1 & ~((cpu_0_instruction_master_read & ((cpu_0_instruction_master_latency_counter != 0) | (1 < cpu_0_instruction_master_latency_counter))) | cpu_0_data_master_arbiterlock);
  //rdv_fifo_for_cpu_0_instruction_master_to_sdram_0_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_0_instruction_master_to_sdram_0_s1_module rdv_fifo_for_cpu_0_instruction_master_to_sdram_0_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_0_instruction_master_granted_sdram_0_s1),
      .data_out             (cpu_0_instruction_master_rdv_fifo_output_from_sdram_0_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_0_instruction_master_rdv_fifo_empty_sdram_0_s1),
      .full                 (),
      .read                 (sdram_0_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_0_s1_waits_for_read)
    );

  assign cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register = ~cpu_0_instruction_master_rdv_fifo_empty_sdram_0_s1;
  //local readdatavalid cpu_0_instruction_master_read_data_valid_sdram_0_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_sdram_0_s1 = (sdram_0_s1_readdatavalid_from_sa & cpu_0_instruction_master_rdv_fifo_output_from_sdram_0_s1) & ~ cpu_0_instruction_master_rdv_fifo_empty_sdram_0_s1;

  //allow new arb cycle for sdram_0/s1, which is an e_assign
  assign sdram_0_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for sdram_0/s1, which is an e_assign
  assign sdram_0_s1_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_sdram_0_s1;

  //cpu_0/instruction_master grant sdram_0/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_sdram_0_s1 = sdram_0_s1_grant_vector[0];

  //cpu_0/instruction_master saved-grant sdram_0/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_sdram_0_s1 = sdram_0_s1_arb_winner[0] && cpu_0_instruction_master_requests_sdram_0_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for sdram_0/s1, which is an e_assign
  assign sdram_0_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_sdram_0_s1;

  //cpu_0/data_master grant sdram_0/s1, which is an e_assign
  assign cpu_0_data_master_granted_sdram_0_s1 = sdram_0_s1_grant_vector[1];

  //cpu_0/data_master saved-grant sdram_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_sdram_0_s1 = sdram_0_s1_arb_winner[1] && cpu_0_data_master_requests_sdram_0_s1;

  //sdram_0/s1 chosen-master double-vector, which is an e_assign
  assign sdram_0_s1_chosen_master_double_vector = {sdram_0_s1_master_qreq_vector, sdram_0_s1_master_qreq_vector} & ({~sdram_0_s1_master_qreq_vector, ~sdram_0_s1_master_qreq_vector} + sdram_0_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign sdram_0_s1_arb_winner = (sdram_0_s1_allow_new_arb_cycle & | sdram_0_s1_grant_vector) ? sdram_0_s1_grant_vector : sdram_0_s1_saved_chosen_master_vector;

  //saved sdram_0_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_saved_chosen_master_vector <= 0;
      else if (sdram_0_s1_allow_new_arb_cycle)
          sdram_0_s1_saved_chosen_master_vector <= |sdram_0_s1_grant_vector ? sdram_0_s1_grant_vector : sdram_0_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sdram_0_s1_grant_vector = {(sdram_0_s1_chosen_master_double_vector[1] | sdram_0_s1_chosen_master_double_vector[3]),
    (sdram_0_s1_chosen_master_double_vector[0] | sdram_0_s1_chosen_master_double_vector[2])};

  //sdram_0/s1 chosen master rotated left, which is an e_assign
  assign sdram_0_s1_chosen_master_rot_left = (sdram_0_s1_arb_winner << 1) ? (sdram_0_s1_arb_winner << 1) : 1;

  //sdram_0/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_arb_addend <= 1;
      else if (|sdram_0_s1_grant_vector)
          sdram_0_s1_arb_addend <= sdram_0_s1_end_xfer? sdram_0_s1_chosen_master_rot_left : sdram_0_s1_grant_vector;
    end


  //sdram_0_s1_reset_n assignment, which is an e_assign
  assign sdram_0_s1_reset_n = reset_n;

  assign sdram_0_s1_chipselect = cpu_0_data_master_granted_sdram_0_s1 | cpu_0_instruction_master_granted_sdram_0_s1;
  //sdram_0_s1_firsttransfer first transaction, which is an e_assign
  assign sdram_0_s1_firsttransfer = sdram_0_s1_begins_xfer ? sdram_0_s1_unreg_firsttransfer : sdram_0_s1_reg_firsttransfer;

  //sdram_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sdram_0_s1_unreg_firsttransfer = ~(sdram_0_s1_slavearbiterlockenable & sdram_0_s1_any_continuerequest);

  //sdram_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_reg_firsttransfer <= 1'b1;
      else if (sdram_0_s1_begins_xfer)
          sdram_0_s1_reg_firsttransfer <= sdram_0_s1_unreg_firsttransfer;
    end


  //sdram_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sdram_0_s1_beginbursttransfer_internal = sdram_0_s1_begins_xfer;

  //sdram_0_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sdram_0_s1_arbitration_holdoff_internal = sdram_0_s1_begins_xfer & sdram_0_s1_firsttransfer;

  //~sdram_0_s1_read_n assignment, which is an e_mux
  assign sdram_0_s1_read_n = ~((cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_sdram_0_s1 & cpu_0_instruction_master_read));

  //~sdram_0_s1_write_n assignment, which is an e_mux
  assign sdram_0_s1_write_n = ~(cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_write);

  assign shifted_address_to_sdram_0_s1_from_cpu_0_data_master = {cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1],
    {1 {1'b0}}};

  //sdram_0_s1_address mux, which is an e_mux
  assign sdram_0_s1_address = (cpu_0_data_master_granted_sdram_0_s1)? (shifted_address_to_sdram_0_s1_from_cpu_0_data_master >> 1) :
    (shifted_address_to_sdram_0_s1_from_cpu_0_instruction_master >> 1);

  assign shifted_address_to_sdram_0_s1_from_cpu_0_instruction_master = {cpu_0_instruction_master_address_to_slave >> 2,
    cpu_0_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_sdram_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sdram_0_s1_end_xfer <= 1;
      else 
        d1_sdram_0_s1_end_xfer <= sdram_0_s1_end_xfer;
    end


  //sdram_0_s1_waits_for_read in a cycle, which is an e_mux
  assign sdram_0_s1_waits_for_read = sdram_0_s1_in_a_read_cycle & sdram_0_s1_waitrequest_from_sa;

  //sdram_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign sdram_0_s1_in_a_read_cycle = (cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_sdram_0_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sdram_0_s1_in_a_read_cycle;

  //sdram_0_s1_waits_for_write in a cycle, which is an e_mux
  assign sdram_0_s1_waits_for_write = sdram_0_s1_in_a_write_cycle & sdram_0_s1_waitrequest_from_sa;

  //sdram_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign sdram_0_s1_in_a_write_cycle = cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sdram_0_s1_in_a_write_cycle;

  assign wait_for_sdram_0_s1_counter = 0;
  //~sdram_0_s1_byteenable_n byte enable port mux, which is an e_mux
  assign sdram_0_s1_byteenable_n = ~((cpu_0_data_master_granted_sdram_0_s1)? cpu_0_data_master_byteenable_sdram_0_s1 :
    -1);

  assign {cpu_0_data_master_byteenable_sdram_0_s1_segment_1,
cpu_0_data_master_byteenable_sdram_0_s1_segment_0} = cpu_0_data_master_byteenable;
  assign cpu_0_data_master_byteenable_sdram_0_s1 = ((cpu_0_data_master_dbs_address[1] == 0))? cpu_0_data_master_byteenable_sdram_0_s1_segment_0 :
    cpu_0_data_master_byteenable_sdram_0_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sdram_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_sdram_0_s1 + cpu_0_instruction_master_granted_sdram_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_sdram_0_s1 + cpu_0_instruction_master_saved_grant_sdram_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module shoot_timer_chip_avalon_slave_0_arbitrator (
                                                    // inputs:
                                                     clk,
                                                     cpu_0_data_master_address_to_slave,
                                                     cpu_0_data_master_latency_counter,
                                                     cpu_0_data_master_read,
                                                     cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                                     cpu_0_data_master_write,
                                                     cpu_0_data_master_writedata,
                                                     reset_n,
                                                     shoot_timer_chip_avalon_slave_0_readdata,

                                                    // outputs:
                                                     cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0,
                                                     cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0,
                                                     cpu_0_data_master_read_data_valid_shoot_timer_chip_avalon_slave_0,
                                                     cpu_0_data_master_requests_shoot_timer_chip_avalon_slave_0,
                                                     d1_shoot_timer_chip_avalon_slave_0_end_xfer,
                                                     shoot_timer_chip_avalon_slave_0_read_n,
                                                     shoot_timer_chip_avalon_slave_0_readdata_from_sa,
                                                     shoot_timer_chip_avalon_slave_0_reset_n,
                                                     shoot_timer_chip_avalon_slave_0_write_n,
                                                     shoot_timer_chip_avalon_slave_0_writedata
                                                  )
;

  output           cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0;
  output           cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0;
  output           cpu_0_data_master_read_data_valid_shoot_timer_chip_avalon_slave_0;
  output           cpu_0_data_master_requests_shoot_timer_chip_avalon_slave_0;
  output           d1_shoot_timer_chip_avalon_slave_0_end_xfer;
  output           shoot_timer_chip_avalon_slave_0_read_n;
  output  [ 31: 0] shoot_timer_chip_avalon_slave_0_readdata_from_sa;
  output           shoot_timer_chip_avalon_slave_0_reset_n;
  output           shoot_timer_chip_avalon_slave_0_write_n;
  output  [ 31: 0] shoot_timer_chip_avalon_slave_0_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;
  input   [ 31: 0] shoot_timer_chip_avalon_slave_0_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_shoot_timer_chip_avalon_slave_0;
  wire             cpu_0_data_master_requests_shoot_timer_chip_avalon_slave_0;
  wire             cpu_0_data_master_saved_grant_shoot_timer_chip_avalon_slave_0;
  reg              d1_reasons_to_wait;
  reg              d1_shoot_timer_chip_avalon_slave_0_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_shoot_timer_chip_avalon_slave_0;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_shoot_timer_chip_avalon_slave_0_from_cpu_0_data_master;
  wire             shoot_timer_chip_avalon_slave_0_allgrants;
  wire             shoot_timer_chip_avalon_slave_0_allow_new_arb_cycle;
  wire             shoot_timer_chip_avalon_slave_0_any_bursting_master_saved_grant;
  wire             shoot_timer_chip_avalon_slave_0_any_continuerequest;
  wire             shoot_timer_chip_avalon_slave_0_arb_counter_enable;
  reg     [  1: 0] shoot_timer_chip_avalon_slave_0_arb_share_counter;
  wire    [  1: 0] shoot_timer_chip_avalon_slave_0_arb_share_counter_next_value;
  wire    [  1: 0] shoot_timer_chip_avalon_slave_0_arb_share_set_values;
  wire             shoot_timer_chip_avalon_slave_0_beginbursttransfer_internal;
  wire             shoot_timer_chip_avalon_slave_0_begins_xfer;
  wire             shoot_timer_chip_avalon_slave_0_end_xfer;
  wire             shoot_timer_chip_avalon_slave_0_firsttransfer;
  wire             shoot_timer_chip_avalon_slave_0_grant_vector;
  wire             shoot_timer_chip_avalon_slave_0_in_a_read_cycle;
  wire             shoot_timer_chip_avalon_slave_0_in_a_write_cycle;
  wire             shoot_timer_chip_avalon_slave_0_master_qreq_vector;
  wire             shoot_timer_chip_avalon_slave_0_non_bursting_master_requests;
  wire             shoot_timer_chip_avalon_slave_0_read_n;
  wire    [ 31: 0] shoot_timer_chip_avalon_slave_0_readdata_from_sa;
  reg              shoot_timer_chip_avalon_slave_0_reg_firsttransfer;
  wire             shoot_timer_chip_avalon_slave_0_reset_n;
  reg              shoot_timer_chip_avalon_slave_0_slavearbiterlockenable;
  wire             shoot_timer_chip_avalon_slave_0_slavearbiterlockenable2;
  wire             shoot_timer_chip_avalon_slave_0_unreg_firsttransfer;
  wire             shoot_timer_chip_avalon_slave_0_waits_for_read;
  wire             shoot_timer_chip_avalon_slave_0_waits_for_write;
  wire             shoot_timer_chip_avalon_slave_0_write_n;
  wire    [ 31: 0] shoot_timer_chip_avalon_slave_0_writedata;
  wire             wait_for_shoot_timer_chip_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~shoot_timer_chip_avalon_slave_0_end_xfer;
    end


  assign shoot_timer_chip_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0));
  //assign shoot_timer_chip_avalon_slave_0_readdata_from_sa = shoot_timer_chip_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign shoot_timer_chip_avalon_slave_0_readdata_from_sa = shoot_timer_chip_avalon_slave_0_readdata;

  assign cpu_0_data_master_requests_shoot_timer_chip_avalon_slave_0 = ({cpu_0_data_master_address_to_slave[24 : 2] , 2'b0} == 25'h100229c) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //shoot_timer_chip_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign shoot_timer_chip_avalon_slave_0_arb_share_set_values = 1;

  //shoot_timer_chip_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign shoot_timer_chip_avalon_slave_0_non_bursting_master_requests = cpu_0_data_master_requests_shoot_timer_chip_avalon_slave_0;

  //shoot_timer_chip_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign shoot_timer_chip_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //shoot_timer_chip_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign shoot_timer_chip_avalon_slave_0_arb_share_counter_next_value = shoot_timer_chip_avalon_slave_0_firsttransfer ? (shoot_timer_chip_avalon_slave_0_arb_share_set_values - 1) : |shoot_timer_chip_avalon_slave_0_arb_share_counter ? (shoot_timer_chip_avalon_slave_0_arb_share_counter - 1) : 0;

  //shoot_timer_chip_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign shoot_timer_chip_avalon_slave_0_allgrants = |shoot_timer_chip_avalon_slave_0_grant_vector;

  //shoot_timer_chip_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign shoot_timer_chip_avalon_slave_0_end_xfer = ~(shoot_timer_chip_avalon_slave_0_waits_for_read | shoot_timer_chip_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_shoot_timer_chip_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_shoot_timer_chip_avalon_slave_0 = shoot_timer_chip_avalon_slave_0_end_xfer & (~shoot_timer_chip_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //shoot_timer_chip_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign shoot_timer_chip_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_shoot_timer_chip_avalon_slave_0 & shoot_timer_chip_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_shoot_timer_chip_avalon_slave_0 & ~shoot_timer_chip_avalon_slave_0_non_bursting_master_requests);

  //shoot_timer_chip_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          shoot_timer_chip_avalon_slave_0_arb_share_counter <= 0;
      else if (shoot_timer_chip_avalon_slave_0_arb_counter_enable)
          shoot_timer_chip_avalon_slave_0_arb_share_counter <= shoot_timer_chip_avalon_slave_0_arb_share_counter_next_value;
    end


  //shoot_timer_chip_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          shoot_timer_chip_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|shoot_timer_chip_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_shoot_timer_chip_avalon_slave_0) | (end_xfer_arb_share_counter_term_shoot_timer_chip_avalon_slave_0 & ~shoot_timer_chip_avalon_slave_0_non_bursting_master_requests))
          shoot_timer_chip_avalon_slave_0_slavearbiterlockenable <= |shoot_timer_chip_avalon_slave_0_arb_share_counter_next_value;
    end


  //cpu_0/data_master shoot_timer_chip/avalon_slave_0 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = shoot_timer_chip_avalon_slave_0_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //shoot_timer_chip_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign shoot_timer_chip_avalon_slave_0_slavearbiterlockenable2 = |shoot_timer_chip_avalon_slave_0_arb_share_counter_next_value;

  //cpu_0/data_master shoot_timer_chip/avalon_slave_0 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = shoot_timer_chip_avalon_slave_0_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //shoot_timer_chip_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  assign shoot_timer_chip_avalon_slave_0_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0 = cpu_0_data_master_requests_shoot_timer_chip_avalon_slave_0 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_shoot_timer_chip_avalon_slave_0, which is an e_mux
  assign cpu_0_data_master_read_data_valid_shoot_timer_chip_avalon_slave_0 = cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0 & cpu_0_data_master_read & ~shoot_timer_chip_avalon_slave_0_waits_for_read;

  //shoot_timer_chip_avalon_slave_0_writedata mux, which is an e_mux
  assign shoot_timer_chip_avalon_slave_0_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0 = cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0;

  //cpu_0/data_master saved-grant shoot_timer_chip/avalon_slave_0, which is an e_assign
  assign cpu_0_data_master_saved_grant_shoot_timer_chip_avalon_slave_0 = cpu_0_data_master_requests_shoot_timer_chip_avalon_slave_0;

  //allow new arb cycle for shoot_timer_chip/avalon_slave_0, which is an e_assign
  assign shoot_timer_chip_avalon_slave_0_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign shoot_timer_chip_avalon_slave_0_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign shoot_timer_chip_avalon_slave_0_master_qreq_vector = 1;

  //shoot_timer_chip_avalon_slave_0_reset_n assignment, which is an e_assign
  assign shoot_timer_chip_avalon_slave_0_reset_n = reset_n;

  //shoot_timer_chip_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign shoot_timer_chip_avalon_slave_0_firsttransfer = shoot_timer_chip_avalon_slave_0_begins_xfer ? shoot_timer_chip_avalon_slave_0_unreg_firsttransfer : shoot_timer_chip_avalon_slave_0_reg_firsttransfer;

  //shoot_timer_chip_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  assign shoot_timer_chip_avalon_slave_0_unreg_firsttransfer = ~(shoot_timer_chip_avalon_slave_0_slavearbiterlockenable & shoot_timer_chip_avalon_slave_0_any_continuerequest);

  //shoot_timer_chip_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          shoot_timer_chip_avalon_slave_0_reg_firsttransfer <= 1'b1;
      else if (shoot_timer_chip_avalon_slave_0_begins_xfer)
          shoot_timer_chip_avalon_slave_0_reg_firsttransfer <= shoot_timer_chip_avalon_slave_0_unreg_firsttransfer;
    end


  //shoot_timer_chip_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign shoot_timer_chip_avalon_slave_0_beginbursttransfer_internal = shoot_timer_chip_avalon_slave_0_begins_xfer;

  //~shoot_timer_chip_avalon_slave_0_read_n assignment, which is an e_mux
  assign shoot_timer_chip_avalon_slave_0_read_n = ~(cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0 & cpu_0_data_master_read);

  //~shoot_timer_chip_avalon_slave_0_write_n assignment, which is an e_mux
  assign shoot_timer_chip_avalon_slave_0_write_n = ~(cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0 & cpu_0_data_master_write);

  assign shifted_address_to_shoot_timer_chip_avalon_slave_0_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //d1_shoot_timer_chip_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_shoot_timer_chip_avalon_slave_0_end_xfer <= 1;
      else 
        d1_shoot_timer_chip_avalon_slave_0_end_xfer <= shoot_timer_chip_avalon_slave_0_end_xfer;
    end


  //shoot_timer_chip_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign shoot_timer_chip_avalon_slave_0_waits_for_read = shoot_timer_chip_avalon_slave_0_in_a_read_cycle & shoot_timer_chip_avalon_slave_0_begins_xfer;

  //shoot_timer_chip_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign shoot_timer_chip_avalon_slave_0_in_a_read_cycle = cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = shoot_timer_chip_avalon_slave_0_in_a_read_cycle;

  //shoot_timer_chip_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign shoot_timer_chip_avalon_slave_0_waits_for_write = shoot_timer_chip_avalon_slave_0_in_a_write_cycle & 0;

  //shoot_timer_chip_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign shoot_timer_chip_avalon_slave_0_in_a_write_cycle = cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = shoot_timer_chip_avalon_slave_0_in_a_write_cycle;

  assign wait_for_shoot_timer_chip_avalon_slave_0_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //shoot_timer_chip/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module shoot_timer_shoot_avalon_slave_0_arbitrator (
                                                     // inputs:
                                                      clk,
                                                      cpu_0_data_master_address_to_slave,
                                                      cpu_0_data_master_latency_counter,
                                                      cpu_0_data_master_read,
                                                      cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                                      cpu_0_data_master_write,
                                                      cpu_0_data_master_writedata,
                                                      reset_n,
                                                      shoot_timer_shoot_avalon_slave_0_readdata,

                                                     // outputs:
                                                      cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0,
                                                      cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0,
                                                      cpu_0_data_master_read_data_valid_shoot_timer_shoot_avalon_slave_0,
                                                      cpu_0_data_master_requests_shoot_timer_shoot_avalon_slave_0,
                                                      d1_shoot_timer_shoot_avalon_slave_0_end_xfer,
                                                      shoot_timer_shoot_avalon_slave_0_read_n,
                                                      shoot_timer_shoot_avalon_slave_0_readdata_from_sa,
                                                      shoot_timer_shoot_avalon_slave_0_reset_n,
                                                      shoot_timer_shoot_avalon_slave_0_write_n,
                                                      shoot_timer_shoot_avalon_slave_0_writedata
                                                   )
;

  output           cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0;
  output           cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0;
  output           cpu_0_data_master_read_data_valid_shoot_timer_shoot_avalon_slave_0;
  output           cpu_0_data_master_requests_shoot_timer_shoot_avalon_slave_0;
  output           d1_shoot_timer_shoot_avalon_slave_0_end_xfer;
  output           shoot_timer_shoot_avalon_slave_0_read_n;
  output  [ 31: 0] shoot_timer_shoot_avalon_slave_0_readdata_from_sa;
  output           shoot_timer_shoot_avalon_slave_0_reset_n;
  output           shoot_timer_shoot_avalon_slave_0_write_n;
  output  [ 31: 0] shoot_timer_shoot_avalon_slave_0_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;
  input   [ 31: 0] shoot_timer_shoot_avalon_slave_0_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_shoot_timer_shoot_avalon_slave_0;
  wire             cpu_0_data_master_requests_shoot_timer_shoot_avalon_slave_0;
  wire             cpu_0_data_master_saved_grant_shoot_timer_shoot_avalon_slave_0;
  reg              d1_reasons_to_wait;
  reg              d1_shoot_timer_shoot_avalon_slave_0_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_shoot_timer_shoot_avalon_slave_0;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_shoot_timer_shoot_avalon_slave_0_from_cpu_0_data_master;
  wire             shoot_timer_shoot_avalon_slave_0_allgrants;
  wire             shoot_timer_shoot_avalon_slave_0_allow_new_arb_cycle;
  wire             shoot_timer_shoot_avalon_slave_0_any_bursting_master_saved_grant;
  wire             shoot_timer_shoot_avalon_slave_0_any_continuerequest;
  wire             shoot_timer_shoot_avalon_slave_0_arb_counter_enable;
  reg     [  1: 0] shoot_timer_shoot_avalon_slave_0_arb_share_counter;
  wire    [  1: 0] shoot_timer_shoot_avalon_slave_0_arb_share_counter_next_value;
  wire    [  1: 0] shoot_timer_shoot_avalon_slave_0_arb_share_set_values;
  wire             shoot_timer_shoot_avalon_slave_0_beginbursttransfer_internal;
  wire             shoot_timer_shoot_avalon_slave_0_begins_xfer;
  wire             shoot_timer_shoot_avalon_slave_0_end_xfer;
  wire             shoot_timer_shoot_avalon_slave_0_firsttransfer;
  wire             shoot_timer_shoot_avalon_slave_0_grant_vector;
  wire             shoot_timer_shoot_avalon_slave_0_in_a_read_cycle;
  wire             shoot_timer_shoot_avalon_slave_0_in_a_write_cycle;
  wire             shoot_timer_shoot_avalon_slave_0_master_qreq_vector;
  wire             shoot_timer_shoot_avalon_slave_0_non_bursting_master_requests;
  wire             shoot_timer_shoot_avalon_slave_0_read_n;
  wire    [ 31: 0] shoot_timer_shoot_avalon_slave_0_readdata_from_sa;
  reg              shoot_timer_shoot_avalon_slave_0_reg_firsttransfer;
  wire             shoot_timer_shoot_avalon_slave_0_reset_n;
  reg              shoot_timer_shoot_avalon_slave_0_slavearbiterlockenable;
  wire             shoot_timer_shoot_avalon_slave_0_slavearbiterlockenable2;
  wire             shoot_timer_shoot_avalon_slave_0_unreg_firsttransfer;
  wire             shoot_timer_shoot_avalon_slave_0_waits_for_read;
  wire             shoot_timer_shoot_avalon_slave_0_waits_for_write;
  wire             shoot_timer_shoot_avalon_slave_0_write_n;
  wire    [ 31: 0] shoot_timer_shoot_avalon_slave_0_writedata;
  wire             wait_for_shoot_timer_shoot_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~shoot_timer_shoot_avalon_slave_0_end_xfer;
    end


  assign shoot_timer_shoot_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0));
  //assign shoot_timer_shoot_avalon_slave_0_readdata_from_sa = shoot_timer_shoot_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign shoot_timer_shoot_avalon_slave_0_readdata_from_sa = shoot_timer_shoot_avalon_slave_0_readdata;

  assign cpu_0_data_master_requests_shoot_timer_shoot_avalon_slave_0 = ({cpu_0_data_master_address_to_slave[24 : 2] , 2'b0} == 25'h1002298) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //shoot_timer_shoot_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign shoot_timer_shoot_avalon_slave_0_arb_share_set_values = 1;

  //shoot_timer_shoot_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign shoot_timer_shoot_avalon_slave_0_non_bursting_master_requests = cpu_0_data_master_requests_shoot_timer_shoot_avalon_slave_0;

  //shoot_timer_shoot_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign shoot_timer_shoot_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //shoot_timer_shoot_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign shoot_timer_shoot_avalon_slave_0_arb_share_counter_next_value = shoot_timer_shoot_avalon_slave_0_firsttransfer ? (shoot_timer_shoot_avalon_slave_0_arb_share_set_values - 1) : |shoot_timer_shoot_avalon_slave_0_arb_share_counter ? (shoot_timer_shoot_avalon_slave_0_arb_share_counter - 1) : 0;

  //shoot_timer_shoot_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign shoot_timer_shoot_avalon_slave_0_allgrants = |shoot_timer_shoot_avalon_slave_0_grant_vector;

  //shoot_timer_shoot_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign shoot_timer_shoot_avalon_slave_0_end_xfer = ~(shoot_timer_shoot_avalon_slave_0_waits_for_read | shoot_timer_shoot_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_shoot_timer_shoot_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_shoot_timer_shoot_avalon_slave_0 = shoot_timer_shoot_avalon_slave_0_end_xfer & (~shoot_timer_shoot_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //shoot_timer_shoot_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign shoot_timer_shoot_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_shoot_timer_shoot_avalon_slave_0 & shoot_timer_shoot_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_shoot_timer_shoot_avalon_slave_0 & ~shoot_timer_shoot_avalon_slave_0_non_bursting_master_requests);

  //shoot_timer_shoot_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          shoot_timer_shoot_avalon_slave_0_arb_share_counter <= 0;
      else if (shoot_timer_shoot_avalon_slave_0_arb_counter_enable)
          shoot_timer_shoot_avalon_slave_0_arb_share_counter <= shoot_timer_shoot_avalon_slave_0_arb_share_counter_next_value;
    end


  //shoot_timer_shoot_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          shoot_timer_shoot_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|shoot_timer_shoot_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_shoot_timer_shoot_avalon_slave_0) | (end_xfer_arb_share_counter_term_shoot_timer_shoot_avalon_slave_0 & ~shoot_timer_shoot_avalon_slave_0_non_bursting_master_requests))
          shoot_timer_shoot_avalon_slave_0_slavearbiterlockenable <= |shoot_timer_shoot_avalon_slave_0_arb_share_counter_next_value;
    end


  //cpu_0/data_master shoot_timer_shoot/avalon_slave_0 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = shoot_timer_shoot_avalon_slave_0_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //shoot_timer_shoot_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign shoot_timer_shoot_avalon_slave_0_slavearbiterlockenable2 = |shoot_timer_shoot_avalon_slave_0_arb_share_counter_next_value;

  //cpu_0/data_master shoot_timer_shoot/avalon_slave_0 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = shoot_timer_shoot_avalon_slave_0_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //shoot_timer_shoot_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  assign shoot_timer_shoot_avalon_slave_0_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0 = cpu_0_data_master_requests_shoot_timer_shoot_avalon_slave_0 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_shoot_timer_shoot_avalon_slave_0, which is an e_mux
  assign cpu_0_data_master_read_data_valid_shoot_timer_shoot_avalon_slave_0 = cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0 & cpu_0_data_master_read & ~shoot_timer_shoot_avalon_slave_0_waits_for_read;

  //shoot_timer_shoot_avalon_slave_0_writedata mux, which is an e_mux
  assign shoot_timer_shoot_avalon_slave_0_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0 = cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0;

  //cpu_0/data_master saved-grant shoot_timer_shoot/avalon_slave_0, which is an e_assign
  assign cpu_0_data_master_saved_grant_shoot_timer_shoot_avalon_slave_0 = cpu_0_data_master_requests_shoot_timer_shoot_avalon_slave_0;

  //allow new arb cycle for shoot_timer_shoot/avalon_slave_0, which is an e_assign
  assign shoot_timer_shoot_avalon_slave_0_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign shoot_timer_shoot_avalon_slave_0_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign shoot_timer_shoot_avalon_slave_0_master_qreq_vector = 1;

  //shoot_timer_shoot_avalon_slave_0_reset_n assignment, which is an e_assign
  assign shoot_timer_shoot_avalon_slave_0_reset_n = reset_n;

  //shoot_timer_shoot_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign shoot_timer_shoot_avalon_slave_0_firsttransfer = shoot_timer_shoot_avalon_slave_0_begins_xfer ? shoot_timer_shoot_avalon_slave_0_unreg_firsttransfer : shoot_timer_shoot_avalon_slave_0_reg_firsttransfer;

  //shoot_timer_shoot_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  assign shoot_timer_shoot_avalon_slave_0_unreg_firsttransfer = ~(shoot_timer_shoot_avalon_slave_0_slavearbiterlockenable & shoot_timer_shoot_avalon_slave_0_any_continuerequest);

  //shoot_timer_shoot_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          shoot_timer_shoot_avalon_slave_0_reg_firsttransfer <= 1'b1;
      else if (shoot_timer_shoot_avalon_slave_0_begins_xfer)
          shoot_timer_shoot_avalon_slave_0_reg_firsttransfer <= shoot_timer_shoot_avalon_slave_0_unreg_firsttransfer;
    end


  //shoot_timer_shoot_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign shoot_timer_shoot_avalon_slave_0_beginbursttransfer_internal = shoot_timer_shoot_avalon_slave_0_begins_xfer;

  //~shoot_timer_shoot_avalon_slave_0_read_n assignment, which is an e_mux
  assign shoot_timer_shoot_avalon_slave_0_read_n = ~(cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0 & cpu_0_data_master_read);

  //~shoot_timer_shoot_avalon_slave_0_write_n assignment, which is an e_mux
  assign shoot_timer_shoot_avalon_slave_0_write_n = ~(cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0 & cpu_0_data_master_write);

  assign shifted_address_to_shoot_timer_shoot_avalon_slave_0_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //d1_shoot_timer_shoot_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_shoot_timer_shoot_avalon_slave_0_end_xfer <= 1;
      else 
        d1_shoot_timer_shoot_avalon_slave_0_end_xfer <= shoot_timer_shoot_avalon_slave_0_end_xfer;
    end


  //shoot_timer_shoot_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign shoot_timer_shoot_avalon_slave_0_waits_for_read = shoot_timer_shoot_avalon_slave_0_in_a_read_cycle & shoot_timer_shoot_avalon_slave_0_begins_xfer;

  //shoot_timer_shoot_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign shoot_timer_shoot_avalon_slave_0_in_a_read_cycle = cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = shoot_timer_shoot_avalon_slave_0_in_a_read_cycle;

  //shoot_timer_shoot_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign shoot_timer_shoot_avalon_slave_0_waits_for_write = shoot_timer_shoot_avalon_slave_0_in_a_write_cycle & 0;

  //shoot_timer_shoot_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign shoot_timer_shoot_avalon_slave_0_in_a_write_cycle = cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = shoot_timer_shoot_avalon_slave_0_in_a_write_cycle;

  assign wait_for_shoot_timer_shoot_avalon_slave_0_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //shoot_timer_shoot/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_0_data_master_address_to_slave,
                                         cpu_0_data_master_latency_counter,
                                         cpu_0_data_master_read,
                                         cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                         cpu_0_data_master_write,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         cpu_0_data_master_granted_sysid_control_slave,
                                         cpu_0_data_master_qualified_request_sysid_control_slave,
                                         cpu_0_data_master_read_data_valid_sysid_control_slave,
                                         cpu_0_data_master_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa
                                      )
;

  output           cpu_0_data_master_granted_sysid_control_slave;
  output           cpu_0_data_master_qualified_request_sysid_control_slave;
  output           cpu_0_data_master_read_data_valid_sysid_control_slave;
  output           cpu_0_data_master_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_sysid_control_slave;
  wire             cpu_0_data_master_qualified_request_sysid_control_slave;
  wire             cpu_0_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_0_data_master_requests_sysid_control_slave;
  wire             cpu_0_data_master_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_sysid_control_slave_from_cpu_0_data_master;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg     [  1: 0] sysid_control_slave_arb_share_counter;
  wire    [  1: 0] sysid_control_slave_arb_share_counter_next_value;
  wire    [  1: 0] sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign cpu_0_data_master_requests_sysid_control_slave = (({cpu_0_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h1002288) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = cpu_0_data_master_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master sysid/control_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = sysid_control_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //cpu_0/data_master sysid/control_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_sysid_control_slave = cpu_0_data_master_requests_sysid_control_slave & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_sysid_control_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_sysid_control_slave = cpu_0_data_master_granted_sysid_control_slave & cpu_0_data_master_read & ~sysid_control_slave_waits_for_read;

  //master is always granted when requested
  assign cpu_0_data_master_granted_sysid_control_slave = cpu_0_data_master_qualified_request_sysid_control_slave;

  //cpu_0/data_master saved-grant sysid/control_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_sysid_control_slave = cpu_0_data_master_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  assign shifted_address_to_sysid_control_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = shifted_address_to_sysid_control_slave_from_cpu_0_data_master >> 2;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = cpu_0_data_master_granted_sysid_control_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = cpu_0_data_master_granted_sysid_control_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_0_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_0_data_master_address_to_slave,
                                cpu_0_data_master_latency_counter,
                                cpu_0_data_master_read,
                                cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                cpu_0_data_master_write,
                                cpu_0_data_master_writedata,
                                reset_n,
                                timer_0_s1_irq,
                                timer_0_s1_readdata,

                               // outputs:
                                cpu_0_data_master_granted_timer_0_s1,
                                cpu_0_data_master_qualified_request_timer_0_s1,
                                cpu_0_data_master_read_data_valid_timer_0_s1,
                                cpu_0_data_master_requests_timer_0_s1,
                                d1_timer_0_s1_end_xfer,
                                timer_0_s1_address,
                                timer_0_s1_chipselect,
                                timer_0_s1_irq_from_sa,
                                timer_0_s1_readdata_from_sa,
                                timer_0_s1_reset_n,
                                timer_0_s1_write_n,
                                timer_0_s1_writedata
                             )
;

  output           cpu_0_data_master_granted_timer_0_s1;
  output           cpu_0_data_master_qualified_request_timer_0_s1;
  output           cpu_0_data_master_read_data_valid_timer_0_s1;
  output           cpu_0_data_master_requests_timer_0_s1;
  output           d1_timer_0_s1_end_xfer;
  output  [  2: 0] timer_0_s1_address;
  output           timer_0_s1_chipselect;
  output           timer_0_s1_irq_from_sa;
  output  [ 15: 0] timer_0_s1_readdata_from_sa;
  output           timer_0_s1_reset_n;
  output           timer_0_s1_write_n;
  output  [ 15: 0] timer_0_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;
  input            timer_0_s1_irq;
  input   [ 15: 0] timer_0_s1_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_timer_0_s1;
  wire             cpu_0_data_master_qualified_request_timer_0_s1;
  wire             cpu_0_data_master_read_data_valid_timer_0_s1;
  wire             cpu_0_data_master_requests_timer_0_s1;
  wire             cpu_0_data_master_saved_grant_timer_0_s1;
  reg              d1_reasons_to_wait;
  reg              d1_timer_0_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_timer_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_timer_0_s1_from_cpu_0_data_master;
  wire    [  2: 0] timer_0_s1_address;
  wire             timer_0_s1_allgrants;
  wire             timer_0_s1_allow_new_arb_cycle;
  wire             timer_0_s1_any_bursting_master_saved_grant;
  wire             timer_0_s1_any_continuerequest;
  wire             timer_0_s1_arb_counter_enable;
  reg     [  1: 0] timer_0_s1_arb_share_counter;
  wire    [  1: 0] timer_0_s1_arb_share_counter_next_value;
  wire    [  1: 0] timer_0_s1_arb_share_set_values;
  wire             timer_0_s1_beginbursttransfer_internal;
  wire             timer_0_s1_begins_xfer;
  wire             timer_0_s1_chipselect;
  wire             timer_0_s1_end_xfer;
  wire             timer_0_s1_firsttransfer;
  wire             timer_0_s1_grant_vector;
  wire             timer_0_s1_in_a_read_cycle;
  wire             timer_0_s1_in_a_write_cycle;
  wire             timer_0_s1_irq_from_sa;
  wire             timer_0_s1_master_qreq_vector;
  wire             timer_0_s1_non_bursting_master_requests;
  wire    [ 15: 0] timer_0_s1_readdata_from_sa;
  reg              timer_0_s1_reg_firsttransfer;
  wire             timer_0_s1_reset_n;
  reg              timer_0_s1_slavearbiterlockenable;
  wire             timer_0_s1_slavearbiterlockenable2;
  wire             timer_0_s1_unreg_firsttransfer;
  wire             timer_0_s1_waits_for_read;
  wire             timer_0_s1_waits_for_write;
  wire             timer_0_s1_write_n;
  wire    [ 15: 0] timer_0_s1_writedata;
  wire             wait_for_timer_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~timer_0_s1_end_xfer;
    end


  assign timer_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_timer_0_s1));
  //assign timer_0_s1_readdata_from_sa = timer_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_0_s1_readdata_from_sa = timer_0_s1_readdata;

  assign cpu_0_data_master_requests_timer_0_s1 = ({cpu_0_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1002000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //timer_0_s1_arb_share_counter set values, which is an e_mux
  assign timer_0_s1_arb_share_set_values = 1;

  //timer_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign timer_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_timer_0_s1;

  //timer_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign timer_0_s1_any_bursting_master_saved_grant = 0;

  //timer_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign timer_0_s1_arb_share_counter_next_value = timer_0_s1_firsttransfer ? (timer_0_s1_arb_share_set_values - 1) : |timer_0_s1_arb_share_counter ? (timer_0_s1_arb_share_counter - 1) : 0;

  //timer_0_s1_allgrants all slave grants, which is an e_mux
  assign timer_0_s1_allgrants = |timer_0_s1_grant_vector;

  //timer_0_s1_end_xfer assignment, which is an e_assign
  assign timer_0_s1_end_xfer = ~(timer_0_s1_waits_for_read | timer_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_timer_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_timer_0_s1 = timer_0_s1_end_xfer & (~timer_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //timer_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign timer_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_timer_0_s1 & timer_0_s1_allgrants) | (end_xfer_arb_share_counter_term_timer_0_s1 & ~timer_0_s1_non_bursting_master_requests);

  //timer_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_arb_share_counter <= 0;
      else if (timer_0_s1_arb_counter_enable)
          timer_0_s1_arb_share_counter <= timer_0_s1_arb_share_counter_next_value;
    end


  //timer_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_slavearbiterlockenable <= 0;
      else if ((|timer_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_timer_0_s1) | (end_xfer_arb_share_counter_term_timer_0_s1 & ~timer_0_s1_non_bursting_master_requests))
          timer_0_s1_slavearbiterlockenable <= |timer_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master timer_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = timer_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //timer_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign timer_0_s1_slavearbiterlockenable2 = |timer_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master timer_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = timer_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //timer_0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign timer_0_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_timer_0_s1 = cpu_0_data_master_requests_timer_0_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_timer_0_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_timer_0_s1 = cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_read & ~timer_0_s1_waits_for_read;

  //timer_0_s1_writedata mux, which is an e_mux
  assign timer_0_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_timer_0_s1 = cpu_0_data_master_qualified_request_timer_0_s1;

  //cpu_0/data_master saved-grant timer_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_timer_0_s1 = cpu_0_data_master_requests_timer_0_s1;

  //allow new arb cycle for timer_0/s1, which is an e_assign
  assign timer_0_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign timer_0_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign timer_0_s1_master_qreq_vector = 1;

  //timer_0_s1_reset_n assignment, which is an e_assign
  assign timer_0_s1_reset_n = reset_n;

  assign timer_0_s1_chipselect = cpu_0_data_master_granted_timer_0_s1;
  //timer_0_s1_firsttransfer first transaction, which is an e_assign
  assign timer_0_s1_firsttransfer = timer_0_s1_begins_xfer ? timer_0_s1_unreg_firsttransfer : timer_0_s1_reg_firsttransfer;

  //timer_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign timer_0_s1_unreg_firsttransfer = ~(timer_0_s1_slavearbiterlockenable & timer_0_s1_any_continuerequest);

  //timer_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_reg_firsttransfer <= 1'b1;
      else if (timer_0_s1_begins_xfer)
          timer_0_s1_reg_firsttransfer <= timer_0_s1_unreg_firsttransfer;
    end


  //timer_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign timer_0_s1_beginbursttransfer_internal = timer_0_s1_begins_xfer;

  //~timer_0_s1_write_n assignment, which is an e_mux
  assign timer_0_s1_write_n = ~(cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_write);

  assign shifted_address_to_timer_0_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //timer_0_s1_address mux, which is an e_mux
  assign timer_0_s1_address = shifted_address_to_timer_0_s1_from_cpu_0_data_master >> 2;

  //d1_timer_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_timer_0_s1_end_xfer <= 1;
      else 
        d1_timer_0_s1_end_xfer <= timer_0_s1_end_xfer;
    end


  //timer_0_s1_waits_for_read in a cycle, which is an e_mux
  assign timer_0_s1_waits_for_read = timer_0_s1_in_a_read_cycle & timer_0_s1_begins_xfer;

  //timer_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign timer_0_s1_in_a_read_cycle = cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = timer_0_s1_in_a_read_cycle;

  //timer_0_s1_waits_for_write in a cycle, which is an e_mux
  assign timer_0_s1_waits_for_write = timer_0_s1_in_a_write_cycle & 0;

  //timer_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign timer_0_s1_in_a_write_cycle = cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = timer_0_s1_in_a_write_cycle;

  assign wait_for_timer_0_s1_counter = 0;
  //assign timer_0_s1_irq_from_sa = timer_0_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_0_s1_irq_from_sa = timer_0_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //timer_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_watchdog_s1_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_latency_counter,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                       cpu_0_data_master_write,
                                       cpu_0_data_master_writedata,
                                       reset_n,
                                       timer_watchdog_s1_irq,
                                       timer_watchdog_s1_readdata,
                                       timer_watchdog_s1_resetrequest,

                                      // outputs:
                                       cpu_0_data_master_granted_timer_watchdog_s1,
                                       cpu_0_data_master_qualified_request_timer_watchdog_s1,
                                       cpu_0_data_master_read_data_valid_timer_watchdog_s1,
                                       cpu_0_data_master_requests_timer_watchdog_s1,
                                       d1_timer_watchdog_s1_end_xfer,
                                       timer_watchdog_s1_address,
                                       timer_watchdog_s1_chipselect,
                                       timer_watchdog_s1_irq_from_sa,
                                       timer_watchdog_s1_readdata_from_sa,
                                       timer_watchdog_s1_reset_n,
                                       timer_watchdog_s1_resetrequest_from_sa,
                                       timer_watchdog_s1_write_n,
                                       timer_watchdog_s1_writedata
                                    )
;

  output           cpu_0_data_master_granted_timer_watchdog_s1;
  output           cpu_0_data_master_qualified_request_timer_watchdog_s1;
  output           cpu_0_data_master_read_data_valid_timer_watchdog_s1;
  output           cpu_0_data_master_requests_timer_watchdog_s1;
  output           d1_timer_watchdog_s1_end_xfer;
  output  [  2: 0] timer_watchdog_s1_address;
  output           timer_watchdog_s1_chipselect;
  output           timer_watchdog_s1_irq_from_sa;
  output  [ 15: 0] timer_watchdog_s1_readdata_from_sa;
  output           timer_watchdog_s1_reset_n;
  output           timer_watchdog_s1_resetrequest_from_sa;
  output           timer_watchdog_s1_write_n;
  output  [ 15: 0] timer_watchdog_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;
  input            timer_watchdog_s1_irq;
  input   [ 15: 0] timer_watchdog_s1_readdata;
  input            timer_watchdog_s1_resetrequest;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_timer_watchdog_s1;
  wire             cpu_0_data_master_qualified_request_timer_watchdog_s1;
  wire             cpu_0_data_master_read_data_valid_timer_watchdog_s1;
  wire             cpu_0_data_master_requests_timer_watchdog_s1;
  wire             cpu_0_data_master_saved_grant_timer_watchdog_s1;
  reg              d1_reasons_to_wait;
  reg              d1_timer_watchdog_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_timer_watchdog_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_timer_watchdog_s1_from_cpu_0_data_master;
  wire    [  2: 0] timer_watchdog_s1_address;
  wire             timer_watchdog_s1_allgrants;
  wire             timer_watchdog_s1_allow_new_arb_cycle;
  wire             timer_watchdog_s1_any_bursting_master_saved_grant;
  wire             timer_watchdog_s1_any_continuerequest;
  wire             timer_watchdog_s1_arb_counter_enable;
  reg     [  1: 0] timer_watchdog_s1_arb_share_counter;
  wire    [  1: 0] timer_watchdog_s1_arb_share_counter_next_value;
  wire    [  1: 0] timer_watchdog_s1_arb_share_set_values;
  wire             timer_watchdog_s1_beginbursttransfer_internal;
  wire             timer_watchdog_s1_begins_xfer;
  wire             timer_watchdog_s1_chipselect;
  wire             timer_watchdog_s1_end_xfer;
  wire             timer_watchdog_s1_firsttransfer;
  wire             timer_watchdog_s1_grant_vector;
  wire             timer_watchdog_s1_in_a_read_cycle;
  wire             timer_watchdog_s1_in_a_write_cycle;
  wire             timer_watchdog_s1_irq_from_sa;
  wire             timer_watchdog_s1_master_qreq_vector;
  wire             timer_watchdog_s1_non_bursting_master_requests;
  wire    [ 15: 0] timer_watchdog_s1_readdata_from_sa;
  reg              timer_watchdog_s1_reg_firsttransfer;
  wire             timer_watchdog_s1_reset_n;
  wire             timer_watchdog_s1_resetrequest_from_sa;
  reg              timer_watchdog_s1_slavearbiterlockenable;
  wire             timer_watchdog_s1_slavearbiterlockenable2;
  wire             timer_watchdog_s1_unreg_firsttransfer;
  wire             timer_watchdog_s1_waits_for_read;
  wire             timer_watchdog_s1_waits_for_write;
  wire             timer_watchdog_s1_write_n;
  wire    [ 15: 0] timer_watchdog_s1_writedata;
  wire             wait_for_timer_watchdog_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~timer_watchdog_s1_end_xfer;
    end


  assign timer_watchdog_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_timer_watchdog_s1));
  //assign timer_watchdog_s1_readdata_from_sa = timer_watchdog_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_watchdog_s1_readdata_from_sa = timer_watchdog_s1_readdata;

  assign cpu_0_data_master_requests_timer_watchdog_s1 = ({cpu_0_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1002020) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //timer_watchdog_s1_arb_share_counter set values, which is an e_mux
  assign timer_watchdog_s1_arb_share_set_values = 1;

  //timer_watchdog_s1_non_bursting_master_requests mux, which is an e_mux
  assign timer_watchdog_s1_non_bursting_master_requests = cpu_0_data_master_requests_timer_watchdog_s1;

  //timer_watchdog_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign timer_watchdog_s1_any_bursting_master_saved_grant = 0;

  //timer_watchdog_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign timer_watchdog_s1_arb_share_counter_next_value = timer_watchdog_s1_firsttransfer ? (timer_watchdog_s1_arb_share_set_values - 1) : |timer_watchdog_s1_arb_share_counter ? (timer_watchdog_s1_arb_share_counter - 1) : 0;

  //timer_watchdog_s1_allgrants all slave grants, which is an e_mux
  assign timer_watchdog_s1_allgrants = |timer_watchdog_s1_grant_vector;

  //timer_watchdog_s1_end_xfer assignment, which is an e_assign
  assign timer_watchdog_s1_end_xfer = ~(timer_watchdog_s1_waits_for_read | timer_watchdog_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_timer_watchdog_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_timer_watchdog_s1 = timer_watchdog_s1_end_xfer & (~timer_watchdog_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //timer_watchdog_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign timer_watchdog_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_timer_watchdog_s1 & timer_watchdog_s1_allgrants) | (end_xfer_arb_share_counter_term_timer_watchdog_s1 & ~timer_watchdog_s1_non_bursting_master_requests);

  //timer_watchdog_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_watchdog_s1_arb_share_counter <= 0;
      else if (timer_watchdog_s1_arb_counter_enable)
          timer_watchdog_s1_arb_share_counter <= timer_watchdog_s1_arb_share_counter_next_value;
    end


  //timer_watchdog_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_watchdog_s1_slavearbiterlockenable <= 0;
      else if ((|timer_watchdog_s1_master_qreq_vector & end_xfer_arb_share_counter_term_timer_watchdog_s1) | (end_xfer_arb_share_counter_term_timer_watchdog_s1 & ~timer_watchdog_s1_non_bursting_master_requests))
          timer_watchdog_s1_slavearbiterlockenable <= |timer_watchdog_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master timer_watchdog/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = timer_watchdog_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //timer_watchdog_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign timer_watchdog_s1_slavearbiterlockenable2 = |timer_watchdog_s1_arb_share_counter_next_value;

  //cpu_0/data_master timer_watchdog/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = timer_watchdog_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //timer_watchdog_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign timer_watchdog_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_timer_watchdog_s1 = cpu_0_data_master_requests_timer_watchdog_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_timer_watchdog_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_timer_watchdog_s1 = cpu_0_data_master_granted_timer_watchdog_s1 & cpu_0_data_master_read & ~timer_watchdog_s1_waits_for_read;

  //timer_watchdog_s1_writedata mux, which is an e_mux
  assign timer_watchdog_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_timer_watchdog_s1 = cpu_0_data_master_qualified_request_timer_watchdog_s1;

  //cpu_0/data_master saved-grant timer_watchdog/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_timer_watchdog_s1 = cpu_0_data_master_requests_timer_watchdog_s1;

  //allow new arb cycle for timer_watchdog/s1, which is an e_assign
  assign timer_watchdog_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign timer_watchdog_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign timer_watchdog_s1_master_qreq_vector = 1;

  //timer_watchdog_s1_reset_n assignment, which is an e_assign
  assign timer_watchdog_s1_reset_n = reset_n;

  //assign timer_watchdog_s1_resetrequest_from_sa = timer_watchdog_s1_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_watchdog_s1_resetrequest_from_sa = timer_watchdog_s1_resetrequest;

  assign timer_watchdog_s1_chipselect = cpu_0_data_master_granted_timer_watchdog_s1;
  //timer_watchdog_s1_firsttransfer first transaction, which is an e_assign
  assign timer_watchdog_s1_firsttransfer = timer_watchdog_s1_begins_xfer ? timer_watchdog_s1_unreg_firsttransfer : timer_watchdog_s1_reg_firsttransfer;

  //timer_watchdog_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign timer_watchdog_s1_unreg_firsttransfer = ~(timer_watchdog_s1_slavearbiterlockenable & timer_watchdog_s1_any_continuerequest);

  //timer_watchdog_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_watchdog_s1_reg_firsttransfer <= 1'b1;
      else if (timer_watchdog_s1_begins_xfer)
          timer_watchdog_s1_reg_firsttransfer <= timer_watchdog_s1_unreg_firsttransfer;
    end


  //timer_watchdog_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign timer_watchdog_s1_beginbursttransfer_internal = timer_watchdog_s1_begins_xfer;

  //~timer_watchdog_s1_write_n assignment, which is an e_mux
  assign timer_watchdog_s1_write_n = ~(cpu_0_data_master_granted_timer_watchdog_s1 & cpu_0_data_master_write);

  assign shifted_address_to_timer_watchdog_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //timer_watchdog_s1_address mux, which is an e_mux
  assign timer_watchdog_s1_address = shifted_address_to_timer_watchdog_s1_from_cpu_0_data_master >> 2;

  //d1_timer_watchdog_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_timer_watchdog_s1_end_xfer <= 1;
      else 
        d1_timer_watchdog_s1_end_xfer <= timer_watchdog_s1_end_xfer;
    end


  //timer_watchdog_s1_waits_for_read in a cycle, which is an e_mux
  assign timer_watchdog_s1_waits_for_read = timer_watchdog_s1_in_a_read_cycle & timer_watchdog_s1_begins_xfer;

  //timer_watchdog_s1_in_a_read_cycle assignment, which is an e_assign
  assign timer_watchdog_s1_in_a_read_cycle = cpu_0_data_master_granted_timer_watchdog_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = timer_watchdog_s1_in_a_read_cycle;

  //timer_watchdog_s1_waits_for_write in a cycle, which is an e_mux
  assign timer_watchdog_s1_waits_for_write = timer_watchdog_s1_in_a_write_cycle & 0;

  //timer_watchdog_s1_in_a_write_cycle assignment, which is an e_assign
  assign timer_watchdog_s1_in_a_write_cycle = cpu_0_data_master_granted_timer_watchdog_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = timer_watchdog_s1_in_a_write_cycle;

  assign wait_for_timer_watchdog_s1_counter = 0;
  //assign timer_watchdog_s1_irq_from_sa = timer_watchdog_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_watchdog_s1_irq_from_sa = timer_watchdog_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //timer_watchdog/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SMALL14_CPU_reset_clk_0_domain_synch_module (
                                                     // inputs:
                                                      clk,
                                                      data_in,
                                                      reset_n,

                                                     // outputs:
                                                      data_out
                                                   )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SMALL14_CPU (
                     // 1) global signals:
                      clk_0,
                      reset_n,

                     // the_PWM_2_infra_pwm
                      dir_out_from_the_PWM_2_infra_pwm,
                      pwm_from_the_PWM_2_infra_pwm,

                     // the_adgetnew2_0
                      clk_out_from_the_adgetnew2_0,
                      cs_from_the_adgetnew2_0,
                      din_from_the_adgetnew2_0,
                      dout_to_the_adgetnew2_0,
                      sars_to_the_adgetnew2_0,

                     // the_epcs_flash_controller_0
                      data0_to_the_epcs_flash_controller_0,
                      dclk_from_the_epcs_flash_controller_0,
                      sce_from_the_epcs_flash_controller_0,
                      sdo_from_the_epcs_flash_controller_0,

                     // the_motor_0
                      A_from_the_motor_0,
                      B_from_the_motor_0,
                      Z_Brushless_from_the_motor_0,
                      Z_OpenLoop_from_the_motor_0,
                      code0_to_the_motor_0,
                      code1_to_the_motor_0,
                      code2_to_the_motor_0,
                      code3_to_the_motor_0,
                      set_from_the_motor_0,

                     // the_motor_1
                      A_from_the_motor_1,
                      B_from_the_motor_1,
                      Z_Brushless_from_the_motor_1,
                      Z_OpenLoop_from_the_motor_1,
                      code0_to_the_motor_1,
                      code1_to_the_motor_1,
                      code2_to_the_motor_1,
                      code3_to_the_motor_1,
                      set_from_the_motor_1,

                     // the_motor_2
                      A_from_the_motor_2,
                      B_from_the_motor_2,
                      Z_Brushless_from_the_motor_2,
                      Z_OpenLoop_from_the_motor_2,
                      code0_to_the_motor_2,
                      code1_to_the_motor_2,
                      code2_to_the_motor_2,
                      code3_to_the_motor_2,
                      set_from_the_motor_2,

                     // the_motor_3
                      A_from_the_motor_3,
                      B_from_the_motor_3,
                      Z_Brushless_from_the_motor_3,
                      Z_OpenLoop_from_the_motor_3,
                      code0_to_the_motor_3,
                      code1_to_the_motor_3,
                      code2_to_the_motor_3,
                      code3_to_the_motor_3,
                      set_from_the_motor_3,

                     // the_motor_4
                      A_from_the_motor_4,
                      B_from_the_motor_4,
                      Z_Brushless_from_the_motor_4,
                      Z_OpenLoop_from_the_motor_4,
                      code0_to_the_motor_4,
                      code1_to_the_motor_4,
                      code2_to_the_motor_4,
                      code3_to_the_motor_4,
                      set_from_the_motor_4,

                     // the_pio_buzzer
                      out_port_from_the_pio_buzzer,

                     // the_pio_hull_fault1
                      in_port_to_the_pio_hull_fault1,

                     // the_pio_hull_fault2
                      in_port_to_the_pio_hull_fault2,

                     // the_pio_hull_fault3
                      in_port_to_the_pio_hull_fault3,

                     // the_pio_hull_fault4
                      in_port_to_the_pio_hull_fault4,

                     // the_pio_infra
                      in_port_to_the_pio_infra,

                     // the_pio_led
                      out_port_from_the_pio_led,

                     // the_pio_nF2401_in
                      in_port_to_the_pio_nF2401_in,

                     // the_pio_nF2401_inout
                      bidir_port_to_and_from_the_pio_nF2401_inout,

                     // the_pio_nF2401_out
                      out_port_from_the_pio_nF2401_out,

                     // the_pio_reset_9557
                      out_port_from_the_pio_reset_9557,

                     // the_pio_scl_24
                      out_port_from_the_pio_scl_24,

                     // the_pio_scl_9557
                      out_port_from_the_pio_scl_9557,

                     // the_pio_sda_24
                      bidir_port_to_and_from_the_pio_sda_24,

                     // the_pio_sda_9557
                      bidir_port_to_and_from_the_pio_sda_9557,

                     // the_pio_shoot_off
                      in_port_to_the_pio_shoot_off,

                     // the_sdram_0
                      zs_addr_from_the_sdram_0,
                      zs_ba_from_the_sdram_0,
                      zs_cas_n_from_the_sdram_0,
                      zs_cke_from_the_sdram_0,
                      zs_cs_n_from_the_sdram_0,
                      zs_dq_to_and_from_the_sdram_0,
                      zs_dqm_from_the_sdram_0,
                      zs_ras_n_from_the_sdram_0,
                      zs_we_n_from_the_sdram_0,

                     // the_shoot_timer_chip
                      Dout_from_the_shoot_timer_chip,

                     // the_shoot_timer_shoot
                      Dout_from_the_shoot_timer_shoot
                   )
;

  output  [ 31: 0] A_from_the_motor_0;
  output  [ 31: 0] A_from_the_motor_1;
  output  [ 31: 0] A_from_the_motor_2;
  output  [ 31: 0] A_from_the_motor_3;
  output  [ 31: 0] A_from_the_motor_4;
  output  [ 31: 0] B_from_the_motor_0;
  output  [ 31: 0] B_from_the_motor_1;
  output  [ 31: 0] B_from_the_motor_2;
  output  [ 31: 0] B_from_the_motor_3;
  output  [ 31: 0] B_from_the_motor_4;
  output           Dout_from_the_shoot_timer_chip;
  output           Dout_from_the_shoot_timer_shoot;
  output           Z_Brushless_from_the_motor_0;
  output           Z_Brushless_from_the_motor_1;
  output           Z_Brushless_from_the_motor_2;
  output           Z_Brushless_from_the_motor_3;
  output           Z_Brushless_from_the_motor_4;
  output           Z_OpenLoop_from_the_motor_0;
  output           Z_OpenLoop_from_the_motor_1;
  output           Z_OpenLoop_from_the_motor_2;
  output           Z_OpenLoop_from_the_motor_3;
  output           Z_OpenLoop_from_the_motor_4;
  inout   [  2: 0] bidir_port_to_and_from_the_pio_nF2401_inout;
  inout            bidir_port_to_and_from_the_pio_sda_24;
  inout            bidir_port_to_and_from_the_pio_sda_9557;
  output           clk_out_from_the_adgetnew2_0;
  output           cs_from_the_adgetnew2_0;
  output           dclk_from_the_epcs_flash_controller_0;
  output           din_from_the_adgetnew2_0;
  output           dir_out_from_the_PWM_2_infra_pwm;
  output           out_port_from_the_pio_buzzer;
  output  [  1: 0] out_port_from_the_pio_led;
  output  [  2: 0] out_port_from_the_pio_nF2401_out;
  output           out_port_from_the_pio_reset_9557;
  output           out_port_from_the_pio_scl_24;
  output           out_port_from_the_pio_scl_9557;
  output           pwm_from_the_PWM_2_infra_pwm;
  output           sce_from_the_epcs_flash_controller_0;
  output           sdo_from_the_epcs_flash_controller_0;
  output  [ 31: 0] set_from_the_motor_0;
  output  [ 31: 0] set_from_the_motor_1;
  output  [ 31: 0] set_from_the_motor_2;
  output  [ 31: 0] set_from_the_motor_3;
  output  [ 31: 0] set_from_the_motor_4;
  output  [ 11: 0] zs_addr_from_the_sdram_0;
  output  [  1: 0] zs_ba_from_the_sdram_0;
  output           zs_cas_n_from_the_sdram_0;
  output           zs_cke_from_the_sdram_0;
  output           zs_cs_n_from_the_sdram_0;
  inout   [ 15: 0] zs_dq_to_and_from_the_sdram_0;
  output  [  1: 0] zs_dqm_from_the_sdram_0;
  output           zs_ras_n_from_the_sdram_0;
  output           zs_we_n_from_the_sdram_0;
  input            clk_0;
  input   [ 31: 0] code0_to_the_motor_0;
  input   [ 31: 0] code0_to_the_motor_1;
  input   [ 31: 0] code0_to_the_motor_2;
  input   [ 31: 0] code0_to_the_motor_3;
  input   [ 31: 0] code0_to_the_motor_4;
  input   [ 31: 0] code1_to_the_motor_0;
  input   [ 31: 0] code1_to_the_motor_1;
  input   [ 31: 0] code1_to_the_motor_2;
  input   [ 31: 0] code1_to_the_motor_3;
  input   [ 31: 0] code1_to_the_motor_4;
  input   [ 31: 0] code2_to_the_motor_0;
  input   [ 31: 0] code2_to_the_motor_1;
  input   [ 31: 0] code2_to_the_motor_2;
  input   [ 31: 0] code2_to_the_motor_3;
  input   [ 31: 0] code2_to_the_motor_4;
  input   [ 31: 0] code3_to_the_motor_0;
  input   [ 31: 0] code3_to_the_motor_1;
  input   [ 31: 0] code3_to_the_motor_2;
  input   [ 31: 0] code3_to_the_motor_3;
  input   [ 31: 0] code3_to_the_motor_4;
  input            data0_to_the_epcs_flash_controller_0;
  input            dout_to_the_adgetnew2_0;
  input            in_port_to_the_pio_hull_fault1;
  input            in_port_to_the_pio_hull_fault2;
  input            in_port_to_the_pio_hull_fault3;
  input            in_port_to_the_pio_hull_fault4;
  input            in_port_to_the_pio_infra;
  input            in_port_to_the_pio_nF2401_in;
  input            in_port_to_the_pio_shoot_off;
  input            reset_n;
  input            sars_to_the_adgetnew2_0;

  wire    [ 31: 0] A_from_the_motor_0;
  wire    [ 31: 0] A_from_the_motor_1;
  wire    [ 31: 0] A_from_the_motor_2;
  wire    [ 31: 0] A_from_the_motor_3;
  wire    [ 31: 0] A_from_the_motor_4;
  wire    [ 31: 0] B_from_the_motor_0;
  wire    [ 31: 0] B_from_the_motor_1;
  wire    [ 31: 0] B_from_the_motor_2;
  wire    [ 31: 0] B_from_the_motor_3;
  wire    [ 31: 0] B_from_the_motor_4;
  wire             Dout_from_the_shoot_timer_chip;
  wire             Dout_from_the_shoot_timer_shoot;
  wire    [  1: 0] PWM_2_infra_pwm_avalon_slave_0_address;
  wire             PWM_2_infra_pwm_avalon_slave_0_reset_n;
  wire             PWM_2_infra_pwm_avalon_slave_0_write_n;
  wire    [ 31: 0] PWM_2_infra_pwm_avalon_slave_0_writedata;
  wire             Z_Brushless_from_the_motor_0;
  wire             Z_Brushless_from_the_motor_1;
  wire             Z_Brushless_from_the_motor_2;
  wire             Z_Brushless_from_the_motor_3;
  wire             Z_Brushless_from_the_motor_4;
  wire             Z_OpenLoop_from_the_motor_0;
  wire             Z_OpenLoop_from_the_motor_1;
  wire             Z_OpenLoop_from_the_motor_2;
  wire             Z_OpenLoop_from_the_motor_3;
  wire             Z_OpenLoop_from_the_motor_4;
  wire    [  1: 0] adgetnew2_0_avalon_slave_0_address;
  wire             adgetnew2_0_avalon_slave_0_chipselect_n;
  wire             adgetnew2_0_avalon_slave_0_read_n;
  wire    [ 15: 0] adgetnew2_0_avalon_slave_0_readdata;
  wire    [ 15: 0] adgetnew2_0_avalon_slave_0_readdata_from_sa;
  wire             adgetnew2_0_avalon_slave_0_reset_n;
  wire    [  2: 0] bidir_port_to_and_from_the_pio_nF2401_inout;
  wire             bidir_port_to_and_from_the_pio_sda_24;
  wire             bidir_port_to_and_from_the_pio_sda_9557;
  wire             clk_0_reset_n;
  wire             clk_out_from_the_adgetnew2_0;
  wire    [ 24: 0] cpu_0_data_master_address;
  wire    [ 24: 0] cpu_0_data_master_address_to_slave;
  wire    [  3: 0] cpu_0_data_master_byteenable;
  wire    [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1;
  wire    [  1: 0] cpu_0_data_master_dbs_address;
  wire    [ 15: 0] cpu_0_data_master_dbs_write_16;
  wire             cpu_0_data_master_debugaccess;
  wire             cpu_0_data_master_granted_PWM_2_infra_pwm_avalon_slave_0;
  wire             cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_granted_motor_0_avalon_slave_0;
  wire             cpu_0_data_master_granted_motor_1_avalon_slave_0;
  wire             cpu_0_data_master_granted_motor_2_avalon_slave_0;
  wire             cpu_0_data_master_granted_motor_3_avalon_slave_0;
  wire             cpu_0_data_master_granted_motor_4_avalon_slave_0;
  wire             cpu_0_data_master_granted_pio_buzzer_s1;
  wire             cpu_0_data_master_granted_pio_hull_fault1_s1;
  wire             cpu_0_data_master_granted_pio_hull_fault2_s1;
  wire             cpu_0_data_master_granted_pio_hull_fault3_s1;
  wire             cpu_0_data_master_granted_pio_hull_fault4_s1;
  wire             cpu_0_data_master_granted_pio_infra_s1;
  wire             cpu_0_data_master_granted_pio_led_s1;
  wire             cpu_0_data_master_granted_pio_nF2401_in_s1;
  wire             cpu_0_data_master_granted_pio_nF2401_inout_s1;
  wire             cpu_0_data_master_granted_pio_nF2401_out_s1;
  wire             cpu_0_data_master_granted_pio_reset_9557_s1;
  wire             cpu_0_data_master_granted_pio_scl_24_s1;
  wire             cpu_0_data_master_granted_pio_scl_9557_s1;
  wire             cpu_0_data_master_granted_pio_sda_24_s1;
  wire             cpu_0_data_master_granted_pio_sda_9557_s1;
  wire             cpu_0_data_master_granted_pio_shoot_off_s1;
  wire             cpu_0_data_master_granted_sdram_0_s1;
  wire             cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0;
  wire             cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0;
  wire             cpu_0_data_master_granted_sysid_control_slave;
  wire             cpu_0_data_master_granted_timer_0_s1;
  wire             cpu_0_data_master_granted_timer_watchdog_s1;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_latency_counter;
  wire             cpu_0_data_master_qualified_request_PWM_2_infra_pwm_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_qualified_request_motor_0_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_motor_1_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_motor_2_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_motor_3_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_motor_4_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_pio_buzzer_s1;
  wire             cpu_0_data_master_qualified_request_pio_hull_fault1_s1;
  wire             cpu_0_data_master_qualified_request_pio_hull_fault2_s1;
  wire             cpu_0_data_master_qualified_request_pio_hull_fault3_s1;
  wire             cpu_0_data_master_qualified_request_pio_hull_fault4_s1;
  wire             cpu_0_data_master_qualified_request_pio_infra_s1;
  wire             cpu_0_data_master_qualified_request_pio_led_s1;
  wire             cpu_0_data_master_qualified_request_pio_nF2401_in_s1;
  wire             cpu_0_data_master_qualified_request_pio_nF2401_inout_s1;
  wire             cpu_0_data_master_qualified_request_pio_nF2401_out_s1;
  wire             cpu_0_data_master_qualified_request_pio_reset_9557_s1;
  wire             cpu_0_data_master_qualified_request_pio_scl_24_s1;
  wire             cpu_0_data_master_qualified_request_pio_scl_9557_s1;
  wire             cpu_0_data_master_qualified_request_pio_sda_24_s1;
  wire             cpu_0_data_master_qualified_request_pio_sda_9557_s1;
  wire             cpu_0_data_master_qualified_request_pio_shoot_off_s1;
  wire             cpu_0_data_master_qualified_request_sdram_0_s1;
  wire             cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_sysid_control_slave;
  wire             cpu_0_data_master_qualified_request_timer_0_s1;
  wire             cpu_0_data_master_qualified_request_timer_watchdog_s1;
  wire             cpu_0_data_master_read;
  wire             cpu_0_data_master_read_data_valid_PWM_2_infra_pwm_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_adgetnew2_0_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_read_data_valid_motor_0_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_motor_1_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_motor_2_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_motor_3_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_motor_4_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_pio_buzzer_s1;
  wire             cpu_0_data_master_read_data_valid_pio_hull_fault1_s1;
  wire             cpu_0_data_master_read_data_valid_pio_hull_fault2_s1;
  wire             cpu_0_data_master_read_data_valid_pio_hull_fault3_s1;
  wire             cpu_0_data_master_read_data_valid_pio_hull_fault4_s1;
  wire             cpu_0_data_master_read_data_valid_pio_infra_s1;
  wire             cpu_0_data_master_read_data_valid_pio_led_s1;
  wire             cpu_0_data_master_read_data_valid_pio_nF2401_in_s1;
  wire             cpu_0_data_master_read_data_valid_pio_nF2401_inout_s1;
  wire             cpu_0_data_master_read_data_valid_pio_nF2401_out_s1;
  wire             cpu_0_data_master_read_data_valid_pio_reset_9557_s1;
  wire             cpu_0_data_master_read_data_valid_pio_scl_24_s1;
  wire             cpu_0_data_master_read_data_valid_pio_scl_9557_s1;
  wire             cpu_0_data_master_read_data_valid_pio_sda_24_s1;
  wire             cpu_0_data_master_read_data_valid_pio_sda_9557_s1;
  wire             cpu_0_data_master_read_data_valid_pio_shoot_off_s1;
  wire             cpu_0_data_master_read_data_valid_sdram_0_s1;
  wire             cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_shoot_timer_chip_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_shoot_timer_shoot_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_0_data_master_read_data_valid_timer_0_s1;
  wire             cpu_0_data_master_read_data_valid_timer_watchdog_s1;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_readdatavalid;
  wire             cpu_0_data_master_requests_PWM_2_infra_pwm_avalon_slave_0;
  wire             cpu_0_data_master_requests_adgetnew2_0_avalon_slave_0;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_requests_motor_0_avalon_slave_0;
  wire             cpu_0_data_master_requests_motor_1_avalon_slave_0;
  wire             cpu_0_data_master_requests_motor_2_avalon_slave_0;
  wire             cpu_0_data_master_requests_motor_3_avalon_slave_0;
  wire             cpu_0_data_master_requests_motor_4_avalon_slave_0;
  wire             cpu_0_data_master_requests_pio_buzzer_s1;
  wire             cpu_0_data_master_requests_pio_hull_fault1_s1;
  wire             cpu_0_data_master_requests_pio_hull_fault2_s1;
  wire             cpu_0_data_master_requests_pio_hull_fault3_s1;
  wire             cpu_0_data_master_requests_pio_hull_fault4_s1;
  wire             cpu_0_data_master_requests_pio_infra_s1;
  wire             cpu_0_data_master_requests_pio_led_s1;
  wire             cpu_0_data_master_requests_pio_nF2401_in_s1;
  wire             cpu_0_data_master_requests_pio_nF2401_inout_s1;
  wire             cpu_0_data_master_requests_pio_nF2401_out_s1;
  wire             cpu_0_data_master_requests_pio_reset_9557_s1;
  wire             cpu_0_data_master_requests_pio_scl_24_s1;
  wire             cpu_0_data_master_requests_pio_scl_9557_s1;
  wire             cpu_0_data_master_requests_pio_sda_24_s1;
  wire             cpu_0_data_master_requests_pio_sda_9557_s1;
  wire             cpu_0_data_master_requests_pio_shoot_off_s1;
  wire             cpu_0_data_master_requests_sdram_0_s1;
  wire             cpu_0_data_master_requests_shoot_timer_chip_avalon_slave_0;
  wire             cpu_0_data_master_requests_shoot_timer_shoot_avalon_slave_0;
  wire             cpu_0_data_master_requests_sysid_control_slave;
  wire             cpu_0_data_master_requests_timer_0_s1;
  wire             cpu_0_data_master_requests_timer_watchdog_s1;
  wire             cpu_0_data_master_waitrequest;
  wire             cpu_0_data_master_write;
  wire    [ 31: 0] cpu_0_data_master_writedata;
  wire    [ 24: 0] cpu_0_instruction_master_address;
  wire    [ 24: 0] cpu_0_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_0_instruction_master_dbs_address;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_instruction_master_granted_sdram_0_s1;
  wire             cpu_0_instruction_master_latency_counter;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_instruction_master_qualified_request_sdram_0_s1;
  wire             cpu_0_instruction_master_read;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read_data_valid_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_instruction_master_read_data_valid_sdram_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_readdatavalid;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port;
  wire             cpu_0_instruction_master_requests_sdram_0_s1;
  wire             cpu_0_instruction_master_waitrequest;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_0_jtag_debug_module_byteenable;
  wire             cpu_0_jtag_debug_module_chipselect;
  wire             cpu_0_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  wire             cpu_0_jtag_debug_module_reset_n;
  wire             cpu_0_jtag_debug_module_resetrequest;
  wire             cpu_0_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_0_jtag_debug_module_write;
  wire    [ 31: 0] cpu_0_jtag_debug_module_writedata;
  wire             cs_from_the_adgetnew2_0;
  wire             d1_PWM_2_infra_pwm_avalon_slave_0_end_xfer;
  wire             d1_adgetnew2_0_avalon_slave_0_end_xfer;
  wire             d1_cpu_0_jtag_debug_module_end_xfer;
  wire             d1_epcs_flash_controller_0_epcs_control_port_end_xfer;
  wire             d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             d1_motor_0_avalon_slave_0_end_xfer;
  wire             d1_motor_1_avalon_slave_0_end_xfer;
  wire             d1_motor_2_avalon_slave_0_end_xfer;
  wire             d1_motor_3_avalon_slave_0_end_xfer;
  wire             d1_motor_4_avalon_slave_0_end_xfer;
  wire             d1_pio_buzzer_s1_end_xfer;
  wire             d1_pio_hull_fault1_s1_end_xfer;
  wire             d1_pio_hull_fault2_s1_end_xfer;
  wire             d1_pio_hull_fault3_s1_end_xfer;
  wire             d1_pio_hull_fault4_s1_end_xfer;
  wire             d1_pio_infra_s1_end_xfer;
  wire             d1_pio_led_s1_end_xfer;
  wire             d1_pio_nF2401_in_s1_end_xfer;
  wire             d1_pio_nF2401_inout_s1_end_xfer;
  wire             d1_pio_nF2401_out_s1_end_xfer;
  wire             d1_pio_reset_9557_s1_end_xfer;
  wire             d1_pio_scl_24_s1_end_xfer;
  wire             d1_pio_scl_9557_s1_end_xfer;
  wire             d1_pio_sda_24_s1_end_xfer;
  wire             d1_pio_sda_9557_s1_end_xfer;
  wire             d1_pio_shoot_off_s1_end_xfer;
  wire             d1_sdram_0_s1_end_xfer;
  wire             d1_shoot_timer_chip_avalon_slave_0_end_xfer;
  wire             d1_shoot_timer_shoot_avalon_slave_0_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             d1_timer_0_s1_end_xfer;
  wire             d1_timer_watchdog_s1_end_xfer;
  wire             dclk_from_the_epcs_flash_controller_0;
  wire             din_from_the_adgetnew2_0;
  wire             dir_out_from_the_PWM_2_infra_pwm;
  wire    [  8: 0] epcs_flash_controller_0_epcs_control_port_address;
  wire             epcs_flash_controller_0_epcs_control_port_chipselect;
  wire             epcs_flash_controller_0_epcs_control_port_dataavailable;
  wire             epcs_flash_controller_0_epcs_control_port_dataavailable_from_sa;
  wire             epcs_flash_controller_0_epcs_control_port_endofpacket;
  wire             epcs_flash_controller_0_epcs_control_port_endofpacket_from_sa;
  wire             epcs_flash_controller_0_epcs_control_port_irq;
  wire             epcs_flash_controller_0_epcs_control_port_irq_from_sa;
  wire             epcs_flash_controller_0_epcs_control_port_read_n;
  wire    [ 31: 0] epcs_flash_controller_0_epcs_control_port_readdata;
  wire    [ 31: 0] epcs_flash_controller_0_epcs_control_port_readdata_from_sa;
  wire             epcs_flash_controller_0_epcs_control_port_readyfordata;
  wire             epcs_flash_controller_0_epcs_control_port_readyfordata_from_sa;
  wire             epcs_flash_controller_0_epcs_control_port_reset_n;
  wire             epcs_flash_controller_0_epcs_control_port_write_n;
  wire    [ 31: 0] epcs_flash_controller_0_epcs_control_port_writedata;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_irq;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire    [  2: 0] motor_0_avalon_slave_0_address;
  wire             motor_0_avalon_slave_0_chipselect_n;
  wire             motor_0_avalon_slave_0_read_n;
  wire    [ 31: 0] motor_0_avalon_slave_0_readdata;
  wire    [ 31: 0] motor_0_avalon_slave_0_readdata_from_sa;
  wire             motor_0_avalon_slave_0_reset_n;
  wire             motor_0_avalon_slave_0_write_n;
  wire    [ 31: 0] motor_0_avalon_slave_0_writedata;
  wire    [  2: 0] motor_1_avalon_slave_0_address;
  wire             motor_1_avalon_slave_0_chipselect_n;
  wire             motor_1_avalon_slave_0_read_n;
  wire    [ 31: 0] motor_1_avalon_slave_0_readdata;
  wire    [ 31: 0] motor_1_avalon_slave_0_readdata_from_sa;
  wire             motor_1_avalon_slave_0_reset_n;
  wire             motor_1_avalon_slave_0_write_n;
  wire    [ 31: 0] motor_1_avalon_slave_0_writedata;
  wire    [  2: 0] motor_2_avalon_slave_0_address;
  wire             motor_2_avalon_slave_0_chipselect_n;
  wire             motor_2_avalon_slave_0_read_n;
  wire    [ 31: 0] motor_2_avalon_slave_0_readdata;
  wire    [ 31: 0] motor_2_avalon_slave_0_readdata_from_sa;
  wire             motor_2_avalon_slave_0_reset_n;
  wire             motor_2_avalon_slave_0_write_n;
  wire    [ 31: 0] motor_2_avalon_slave_0_writedata;
  wire    [  2: 0] motor_3_avalon_slave_0_address;
  wire             motor_3_avalon_slave_0_chipselect_n;
  wire             motor_3_avalon_slave_0_read_n;
  wire    [ 31: 0] motor_3_avalon_slave_0_readdata;
  wire    [ 31: 0] motor_3_avalon_slave_0_readdata_from_sa;
  wire             motor_3_avalon_slave_0_reset_n;
  wire             motor_3_avalon_slave_0_write_n;
  wire    [ 31: 0] motor_3_avalon_slave_0_writedata;
  wire    [  2: 0] motor_4_avalon_slave_0_address;
  wire             motor_4_avalon_slave_0_chipselect_n;
  wire             motor_4_avalon_slave_0_read_n;
  wire    [ 31: 0] motor_4_avalon_slave_0_readdata;
  wire    [ 31: 0] motor_4_avalon_slave_0_readdata_from_sa;
  wire             motor_4_avalon_slave_0_reset_n;
  wire             motor_4_avalon_slave_0_write_n;
  wire    [ 31: 0] motor_4_avalon_slave_0_writedata;
  wire             out_port_from_the_pio_buzzer;
  wire    [  1: 0] out_port_from_the_pio_led;
  wire    [  2: 0] out_port_from_the_pio_nF2401_out;
  wire             out_port_from_the_pio_reset_9557;
  wire             out_port_from_the_pio_scl_24;
  wire             out_port_from_the_pio_scl_9557;
  wire    [  1: 0] pio_buzzer_s1_address;
  wire             pio_buzzer_s1_chipselect;
  wire             pio_buzzer_s1_readdata;
  wire             pio_buzzer_s1_readdata_from_sa;
  wire             pio_buzzer_s1_reset_n;
  wire             pio_buzzer_s1_write_n;
  wire             pio_buzzer_s1_writedata;
  wire    [  1: 0] pio_hull_fault1_s1_address;
  wire             pio_hull_fault1_s1_readdata;
  wire             pio_hull_fault1_s1_readdata_from_sa;
  wire             pio_hull_fault1_s1_reset_n;
  wire    [  1: 0] pio_hull_fault2_s1_address;
  wire             pio_hull_fault2_s1_readdata;
  wire             pio_hull_fault2_s1_readdata_from_sa;
  wire             pio_hull_fault2_s1_reset_n;
  wire    [  1: 0] pio_hull_fault3_s1_address;
  wire             pio_hull_fault3_s1_readdata;
  wire             pio_hull_fault3_s1_readdata_from_sa;
  wire             pio_hull_fault3_s1_reset_n;
  wire    [  1: 0] pio_hull_fault4_s1_address;
  wire             pio_hull_fault4_s1_readdata;
  wire             pio_hull_fault4_s1_readdata_from_sa;
  wire             pio_hull_fault4_s1_reset_n;
  wire    [  1: 0] pio_infra_s1_address;
  wire             pio_infra_s1_chipselect;
  wire             pio_infra_s1_irq;
  wire             pio_infra_s1_irq_from_sa;
  wire             pio_infra_s1_readdata;
  wire             pio_infra_s1_readdata_from_sa;
  wire             pio_infra_s1_reset_n;
  wire             pio_infra_s1_write_n;
  wire             pio_infra_s1_writedata;
  wire    [  1: 0] pio_led_s1_address;
  wire             pio_led_s1_chipselect;
  wire    [  1: 0] pio_led_s1_readdata;
  wire    [  1: 0] pio_led_s1_readdata_from_sa;
  wire             pio_led_s1_reset_n;
  wire             pio_led_s1_write_n;
  wire    [  1: 0] pio_led_s1_writedata;
  wire    [  1: 0] pio_nF2401_in_s1_address;
  wire             pio_nF2401_in_s1_chipselect;
  wire             pio_nF2401_in_s1_irq;
  wire             pio_nF2401_in_s1_irq_from_sa;
  wire             pio_nF2401_in_s1_readdata;
  wire             pio_nF2401_in_s1_readdata_from_sa;
  wire             pio_nF2401_in_s1_reset_n;
  wire             pio_nF2401_in_s1_write_n;
  wire             pio_nF2401_in_s1_writedata;
  wire    [  1: 0] pio_nF2401_inout_s1_address;
  wire             pio_nF2401_inout_s1_chipselect;
  wire    [  2: 0] pio_nF2401_inout_s1_readdata;
  wire    [  2: 0] pio_nF2401_inout_s1_readdata_from_sa;
  wire             pio_nF2401_inout_s1_reset_n;
  wire             pio_nF2401_inout_s1_write_n;
  wire    [  2: 0] pio_nF2401_inout_s1_writedata;
  wire    [  1: 0] pio_nF2401_out_s1_address;
  wire             pio_nF2401_out_s1_chipselect;
  wire    [  2: 0] pio_nF2401_out_s1_readdata;
  wire    [  2: 0] pio_nF2401_out_s1_readdata_from_sa;
  wire             pio_nF2401_out_s1_reset_n;
  wire             pio_nF2401_out_s1_write_n;
  wire    [  2: 0] pio_nF2401_out_s1_writedata;
  wire    [  1: 0] pio_reset_9557_s1_address;
  wire             pio_reset_9557_s1_chipselect;
  wire             pio_reset_9557_s1_readdata;
  wire             pio_reset_9557_s1_readdata_from_sa;
  wire             pio_reset_9557_s1_reset_n;
  wire             pio_reset_9557_s1_write_n;
  wire             pio_reset_9557_s1_writedata;
  wire    [  1: 0] pio_scl_24_s1_address;
  wire             pio_scl_24_s1_chipselect;
  wire             pio_scl_24_s1_readdata;
  wire             pio_scl_24_s1_readdata_from_sa;
  wire             pio_scl_24_s1_reset_n;
  wire             pio_scl_24_s1_write_n;
  wire             pio_scl_24_s1_writedata;
  wire    [  1: 0] pio_scl_9557_s1_address;
  wire             pio_scl_9557_s1_chipselect;
  wire             pio_scl_9557_s1_readdata;
  wire             pio_scl_9557_s1_readdata_from_sa;
  wire             pio_scl_9557_s1_reset_n;
  wire             pio_scl_9557_s1_write_n;
  wire             pio_scl_9557_s1_writedata;
  wire    [  1: 0] pio_sda_24_s1_address;
  wire             pio_sda_24_s1_chipselect;
  wire             pio_sda_24_s1_readdata;
  wire             pio_sda_24_s1_readdata_from_sa;
  wire             pio_sda_24_s1_reset_n;
  wire             pio_sda_24_s1_write_n;
  wire             pio_sda_24_s1_writedata;
  wire    [  1: 0] pio_sda_9557_s1_address;
  wire             pio_sda_9557_s1_chipselect;
  wire             pio_sda_9557_s1_readdata;
  wire             pio_sda_9557_s1_readdata_from_sa;
  wire             pio_sda_9557_s1_reset_n;
  wire             pio_sda_9557_s1_write_n;
  wire             pio_sda_9557_s1_writedata;
  wire    [  1: 0] pio_shoot_off_s1_address;
  wire             pio_shoot_off_s1_readdata;
  wire             pio_shoot_off_s1_readdata_from_sa;
  wire             pio_shoot_off_s1_reset_n;
  wire             pwm_from_the_PWM_2_infra_pwm;
  wire             reset_n_sources;
  wire             sce_from_the_epcs_flash_controller_0;
  wire             sdo_from_the_epcs_flash_controller_0;
  wire    [ 21: 0] sdram_0_s1_address;
  wire    [  1: 0] sdram_0_s1_byteenable_n;
  wire             sdram_0_s1_chipselect;
  wire             sdram_0_s1_read_n;
  wire    [ 15: 0] sdram_0_s1_readdata;
  wire    [ 15: 0] sdram_0_s1_readdata_from_sa;
  wire             sdram_0_s1_readdatavalid;
  wire             sdram_0_s1_reset_n;
  wire             sdram_0_s1_waitrequest;
  wire             sdram_0_s1_waitrequest_from_sa;
  wire             sdram_0_s1_write_n;
  wire    [ 15: 0] sdram_0_s1_writedata;
  wire    [ 31: 0] set_from_the_motor_0;
  wire    [ 31: 0] set_from_the_motor_1;
  wire    [ 31: 0] set_from_the_motor_2;
  wire    [ 31: 0] set_from_the_motor_3;
  wire    [ 31: 0] set_from_the_motor_4;
  wire             shoot_timer_chip_avalon_slave_0_read_n;
  wire    [ 31: 0] shoot_timer_chip_avalon_slave_0_readdata;
  wire    [ 31: 0] shoot_timer_chip_avalon_slave_0_readdata_from_sa;
  wire             shoot_timer_chip_avalon_slave_0_reset_n;
  wire             shoot_timer_chip_avalon_slave_0_write_n;
  wire    [ 31: 0] shoot_timer_chip_avalon_slave_0_writedata;
  wire             shoot_timer_shoot_avalon_slave_0_read_n;
  wire    [ 31: 0] shoot_timer_shoot_avalon_slave_0_readdata;
  wire    [ 31: 0] shoot_timer_shoot_avalon_slave_0_readdata_from_sa;
  wire             shoot_timer_shoot_avalon_slave_0_reset_n;
  wire             shoot_timer_shoot_avalon_slave_0_write_n;
  wire    [ 31: 0] shoot_timer_shoot_avalon_slave_0_writedata;
  wire             sysid_control_slave_address;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire    [  2: 0] timer_0_s1_address;
  wire             timer_0_s1_chipselect;
  wire             timer_0_s1_irq;
  wire             timer_0_s1_irq_from_sa;
  wire    [ 15: 0] timer_0_s1_readdata;
  wire    [ 15: 0] timer_0_s1_readdata_from_sa;
  wire             timer_0_s1_reset_n;
  wire             timer_0_s1_write_n;
  wire    [ 15: 0] timer_0_s1_writedata;
  wire    [  2: 0] timer_watchdog_s1_address;
  wire             timer_watchdog_s1_chipselect;
  wire             timer_watchdog_s1_irq;
  wire             timer_watchdog_s1_irq_from_sa;
  wire    [ 15: 0] timer_watchdog_s1_readdata;
  wire    [ 15: 0] timer_watchdog_s1_readdata_from_sa;
  wire             timer_watchdog_s1_reset_n;
  wire             timer_watchdog_s1_resetrequest;
  wire             timer_watchdog_s1_resetrequest_from_sa;
  wire             timer_watchdog_s1_write_n;
  wire    [ 15: 0] timer_watchdog_s1_writedata;
  wire    [ 11: 0] zs_addr_from_the_sdram_0;
  wire    [  1: 0] zs_ba_from_the_sdram_0;
  wire             zs_cas_n_from_the_sdram_0;
  wire             zs_cke_from_the_sdram_0;
  wire             zs_cs_n_from_the_sdram_0;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram_0;
  wire    [  1: 0] zs_dqm_from_the_sdram_0;
  wire             zs_ras_n_from_the_sdram_0;
  wire             zs_we_n_from_the_sdram_0;
  PWM_2_infra_pwm_avalon_slave_0_arbitrator the_PWM_2_infra_pwm_avalon_slave_0
    (
      .PWM_2_infra_pwm_avalon_slave_0_address                             (PWM_2_infra_pwm_avalon_slave_0_address),
      .PWM_2_infra_pwm_avalon_slave_0_reset_n                             (PWM_2_infra_pwm_avalon_slave_0_reset_n),
      .PWM_2_infra_pwm_avalon_slave_0_write_n                             (PWM_2_infra_pwm_avalon_slave_0_write_n),
      .PWM_2_infra_pwm_avalon_slave_0_writedata                           (PWM_2_infra_pwm_avalon_slave_0_writedata),
      .clk                                                                (clk_0),
      .cpu_0_data_master_address_to_slave                                 (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_PWM_2_infra_pwm_avalon_slave_0           (cpu_0_data_master_granted_PWM_2_infra_pwm_avalon_slave_0),
      .cpu_0_data_master_latency_counter                                  (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_PWM_2_infra_pwm_avalon_slave_0 (cpu_0_data_master_qualified_request_PWM_2_infra_pwm_avalon_slave_0),
      .cpu_0_data_master_read                                             (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_PWM_2_infra_pwm_avalon_slave_0   (cpu_0_data_master_read_data_valid_PWM_2_infra_pwm_avalon_slave_0),
      .cpu_0_data_master_requests_PWM_2_infra_pwm_avalon_slave_0          (cpu_0_data_master_requests_PWM_2_infra_pwm_avalon_slave_0),
      .cpu_0_data_master_write                                            (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                        (cpu_0_data_master_writedata),
      .d1_PWM_2_infra_pwm_avalon_slave_0_end_xfer                         (d1_PWM_2_infra_pwm_avalon_slave_0_end_xfer),
      .reset_n                                                            (clk_0_reset_n)
    );

  PWM_2_infra_pwm the_PWM_2_infra_pwm
    (
      .addr    (PWM_2_infra_pwm_avalon_slave_0_address),
      .clk     (clk_0),
      .dir_out (dir_out_from_the_PWM_2_infra_pwm),
      .pwm     (pwm_from_the_PWM_2_infra_pwm),
      .reset   (PWM_2_infra_pwm_avalon_slave_0_reset_n),
      .wr_n    (PWM_2_infra_pwm_avalon_slave_0_write_n),
      .wrdata  (PWM_2_infra_pwm_avalon_slave_0_writedata)
    );

  adgetnew2_0_avalon_slave_0_arbitrator the_adgetnew2_0_avalon_slave_0
    (
      .adgetnew2_0_avalon_slave_0_address                             (adgetnew2_0_avalon_slave_0_address),
      .adgetnew2_0_avalon_slave_0_chipselect_n                        (adgetnew2_0_avalon_slave_0_chipselect_n),
      .adgetnew2_0_avalon_slave_0_read_n                              (adgetnew2_0_avalon_slave_0_read_n),
      .adgetnew2_0_avalon_slave_0_readdata                            (adgetnew2_0_avalon_slave_0_readdata),
      .adgetnew2_0_avalon_slave_0_readdata_from_sa                    (adgetnew2_0_avalon_slave_0_readdata_from_sa),
      .adgetnew2_0_avalon_slave_0_reset_n                             (adgetnew2_0_avalon_slave_0_reset_n),
      .clk                                                            (clk_0),
      .cpu_0_data_master_address_to_slave                             (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_dbs_address                                  (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0           (cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0),
      .cpu_0_data_master_latency_counter                              (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0 (cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0),
      .cpu_0_data_master_read                                         (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_adgetnew2_0_avalon_slave_0   (cpu_0_data_master_read_data_valid_adgetnew2_0_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register    (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_adgetnew2_0_avalon_slave_0          (cpu_0_data_master_requests_adgetnew2_0_avalon_slave_0),
      .cpu_0_data_master_write                                        (cpu_0_data_master_write),
      .d1_adgetnew2_0_avalon_slave_0_end_xfer                         (d1_adgetnew2_0_avalon_slave_0_end_xfer),
      .reset_n                                                        (clk_0_reset_n)
    );

  adgetnew2_0 the_adgetnew2_0
    (
      .addr     (adgetnew2_0_avalon_slave_0_address),
      .clk      (clk_0),
      .clk_out  (clk_out_from_the_adgetnew2_0),
      .cs       (cs_from_the_adgetnew2_0),
      .cs_n     (adgetnew2_0_avalon_slave_0_chipselect_n),
      .din      (din_from_the_adgetnew2_0),
      .dout     (dout_to_the_adgetnew2_0),
      .read_n   (adgetnew2_0_avalon_slave_0_read_n),
      .readdata (adgetnew2_0_avalon_slave_0_readdata),
      .reset_n  (adgetnew2_0_avalon_slave_0_reset_n),
      .sars     (sars_to_the_adgetnew2_0)
    );

  cpu_0_jtag_debug_module_arbitrator the_cpu_0_jtag_debug_module
    (
      .clk                                                                (clk_0),
      .cpu_0_data_master_address_to_slave                                 (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                       (cpu_0_data_master_byteenable),
      .cpu_0_data_master_debugaccess                                      (cpu_0_data_master_debugaccess),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module                  (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_latency_counter                                  (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module        (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read                                             (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module          (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register        (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module                 (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_write                                            (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                        (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module           (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_latency_counter                           (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module          (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_jtag_debug_module_address                                    (cpu_0_jtag_debug_module_address),
      .cpu_0_jtag_debug_module_begintransfer                              (cpu_0_jtag_debug_module_begintransfer),
      .cpu_0_jtag_debug_module_byteenable                                 (cpu_0_jtag_debug_module_byteenable),
      .cpu_0_jtag_debug_module_chipselect                                 (cpu_0_jtag_debug_module_chipselect),
      .cpu_0_jtag_debug_module_debugaccess                                (cpu_0_jtag_debug_module_debugaccess),
      .cpu_0_jtag_debug_module_readdata                                   (cpu_0_jtag_debug_module_readdata),
      .cpu_0_jtag_debug_module_readdata_from_sa                           (cpu_0_jtag_debug_module_readdata_from_sa),
      .cpu_0_jtag_debug_module_reset_n                                    (cpu_0_jtag_debug_module_reset_n),
      .cpu_0_jtag_debug_module_resetrequest                               (cpu_0_jtag_debug_module_resetrequest),
      .cpu_0_jtag_debug_module_resetrequest_from_sa                       (cpu_0_jtag_debug_module_resetrequest_from_sa),
      .cpu_0_jtag_debug_module_write                                      (cpu_0_jtag_debug_module_write),
      .cpu_0_jtag_debug_module_writedata                                  (cpu_0_jtag_debug_module_writedata),
      .d1_cpu_0_jtag_debug_module_end_xfer                                (d1_cpu_0_jtag_debug_module_end_xfer),
      .reset_n                                                            (clk_0_reset_n)
    );

  cpu_0_data_master_arbitrator the_cpu_0_data_master
    (
      .adgetnew2_0_avalon_slave_0_readdata_from_sa                                   (adgetnew2_0_avalon_slave_0_readdata_from_sa),
      .clk                                                                           (clk_0),
      .cpu_0_data_master_address                                                     (cpu_0_data_master_address),
      .cpu_0_data_master_address_to_slave                                            (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                                  (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_sdram_0_s1                                       (cpu_0_data_master_byteenable_sdram_0_s1),
      .cpu_0_data_master_dbs_address                                                 (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                                                (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_granted_PWM_2_infra_pwm_avalon_slave_0                      (cpu_0_data_master_granted_PWM_2_infra_pwm_avalon_slave_0),
      .cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0                          (cpu_0_data_master_granted_adgetnew2_0_avalon_slave_0),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module                             (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port           (cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port),
      .cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave                       (cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_granted_motor_0_avalon_slave_0                              (cpu_0_data_master_granted_motor_0_avalon_slave_0),
      .cpu_0_data_master_granted_motor_1_avalon_slave_0                              (cpu_0_data_master_granted_motor_1_avalon_slave_0),
      .cpu_0_data_master_granted_motor_2_avalon_slave_0                              (cpu_0_data_master_granted_motor_2_avalon_slave_0),
      .cpu_0_data_master_granted_motor_3_avalon_slave_0                              (cpu_0_data_master_granted_motor_3_avalon_slave_0),
      .cpu_0_data_master_granted_motor_4_avalon_slave_0                              (cpu_0_data_master_granted_motor_4_avalon_slave_0),
      .cpu_0_data_master_granted_pio_buzzer_s1                                       (cpu_0_data_master_granted_pio_buzzer_s1),
      .cpu_0_data_master_granted_pio_hull_fault1_s1                                  (cpu_0_data_master_granted_pio_hull_fault1_s1),
      .cpu_0_data_master_granted_pio_hull_fault2_s1                                  (cpu_0_data_master_granted_pio_hull_fault2_s1),
      .cpu_0_data_master_granted_pio_hull_fault3_s1                                  (cpu_0_data_master_granted_pio_hull_fault3_s1),
      .cpu_0_data_master_granted_pio_hull_fault4_s1                                  (cpu_0_data_master_granted_pio_hull_fault4_s1),
      .cpu_0_data_master_granted_pio_infra_s1                                        (cpu_0_data_master_granted_pio_infra_s1),
      .cpu_0_data_master_granted_pio_led_s1                                          (cpu_0_data_master_granted_pio_led_s1),
      .cpu_0_data_master_granted_pio_nF2401_in_s1                                    (cpu_0_data_master_granted_pio_nF2401_in_s1),
      .cpu_0_data_master_granted_pio_nF2401_inout_s1                                 (cpu_0_data_master_granted_pio_nF2401_inout_s1),
      .cpu_0_data_master_granted_pio_nF2401_out_s1                                   (cpu_0_data_master_granted_pio_nF2401_out_s1),
      .cpu_0_data_master_granted_pio_reset_9557_s1                                   (cpu_0_data_master_granted_pio_reset_9557_s1),
      .cpu_0_data_master_granted_pio_scl_24_s1                                       (cpu_0_data_master_granted_pio_scl_24_s1),
      .cpu_0_data_master_granted_pio_scl_9557_s1                                     (cpu_0_data_master_granted_pio_scl_9557_s1),
      .cpu_0_data_master_granted_pio_sda_24_s1                                       (cpu_0_data_master_granted_pio_sda_24_s1),
      .cpu_0_data_master_granted_pio_sda_9557_s1                                     (cpu_0_data_master_granted_pio_sda_9557_s1),
      .cpu_0_data_master_granted_pio_shoot_off_s1                                    (cpu_0_data_master_granted_pio_shoot_off_s1),
      .cpu_0_data_master_granted_sdram_0_s1                                          (cpu_0_data_master_granted_sdram_0_s1),
      .cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0                     (cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0),
      .cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0                    (cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0),
      .cpu_0_data_master_granted_sysid_control_slave                                 (cpu_0_data_master_granted_sysid_control_slave),
      .cpu_0_data_master_granted_timer_0_s1                                          (cpu_0_data_master_granted_timer_0_s1),
      .cpu_0_data_master_granted_timer_watchdog_s1                                   (cpu_0_data_master_granted_timer_watchdog_s1),
      .cpu_0_data_master_irq                                                         (cpu_0_data_master_irq),
      .cpu_0_data_master_latency_counter                                             (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_PWM_2_infra_pwm_avalon_slave_0            (cpu_0_data_master_qualified_request_PWM_2_infra_pwm_avalon_slave_0),
      .cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0                (cpu_0_data_master_qualified_request_adgetnew2_0_avalon_slave_0),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module                   (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port (cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port),
      .cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave             (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_qualified_request_motor_0_avalon_slave_0                    (cpu_0_data_master_qualified_request_motor_0_avalon_slave_0),
      .cpu_0_data_master_qualified_request_motor_1_avalon_slave_0                    (cpu_0_data_master_qualified_request_motor_1_avalon_slave_0),
      .cpu_0_data_master_qualified_request_motor_2_avalon_slave_0                    (cpu_0_data_master_qualified_request_motor_2_avalon_slave_0),
      .cpu_0_data_master_qualified_request_motor_3_avalon_slave_0                    (cpu_0_data_master_qualified_request_motor_3_avalon_slave_0),
      .cpu_0_data_master_qualified_request_motor_4_avalon_slave_0                    (cpu_0_data_master_qualified_request_motor_4_avalon_slave_0),
      .cpu_0_data_master_qualified_request_pio_buzzer_s1                             (cpu_0_data_master_qualified_request_pio_buzzer_s1),
      .cpu_0_data_master_qualified_request_pio_hull_fault1_s1                        (cpu_0_data_master_qualified_request_pio_hull_fault1_s1),
      .cpu_0_data_master_qualified_request_pio_hull_fault2_s1                        (cpu_0_data_master_qualified_request_pio_hull_fault2_s1),
      .cpu_0_data_master_qualified_request_pio_hull_fault3_s1                        (cpu_0_data_master_qualified_request_pio_hull_fault3_s1),
      .cpu_0_data_master_qualified_request_pio_hull_fault4_s1                        (cpu_0_data_master_qualified_request_pio_hull_fault4_s1),
      .cpu_0_data_master_qualified_request_pio_infra_s1                              (cpu_0_data_master_qualified_request_pio_infra_s1),
      .cpu_0_data_master_qualified_request_pio_led_s1                                (cpu_0_data_master_qualified_request_pio_led_s1),
      .cpu_0_data_master_qualified_request_pio_nF2401_in_s1                          (cpu_0_data_master_qualified_request_pio_nF2401_in_s1),
      .cpu_0_data_master_qualified_request_pio_nF2401_inout_s1                       (cpu_0_data_master_qualified_request_pio_nF2401_inout_s1),
      .cpu_0_data_master_qualified_request_pio_nF2401_out_s1                         (cpu_0_data_master_qualified_request_pio_nF2401_out_s1),
      .cpu_0_data_master_qualified_request_pio_reset_9557_s1                         (cpu_0_data_master_qualified_request_pio_reset_9557_s1),
      .cpu_0_data_master_qualified_request_pio_scl_24_s1                             (cpu_0_data_master_qualified_request_pio_scl_24_s1),
      .cpu_0_data_master_qualified_request_pio_scl_9557_s1                           (cpu_0_data_master_qualified_request_pio_scl_9557_s1),
      .cpu_0_data_master_qualified_request_pio_sda_24_s1                             (cpu_0_data_master_qualified_request_pio_sda_24_s1),
      .cpu_0_data_master_qualified_request_pio_sda_9557_s1                           (cpu_0_data_master_qualified_request_pio_sda_9557_s1),
      .cpu_0_data_master_qualified_request_pio_shoot_off_s1                          (cpu_0_data_master_qualified_request_pio_shoot_off_s1),
      .cpu_0_data_master_qualified_request_sdram_0_s1                                (cpu_0_data_master_qualified_request_sdram_0_s1),
      .cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0           (cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0),
      .cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0          (cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0),
      .cpu_0_data_master_qualified_request_sysid_control_slave                       (cpu_0_data_master_qualified_request_sysid_control_slave),
      .cpu_0_data_master_qualified_request_timer_0_s1                                (cpu_0_data_master_qualified_request_timer_0_s1),
      .cpu_0_data_master_qualified_request_timer_watchdog_s1                         (cpu_0_data_master_qualified_request_timer_watchdog_s1),
      .cpu_0_data_master_read                                                        (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_PWM_2_infra_pwm_avalon_slave_0              (cpu_0_data_master_read_data_valid_PWM_2_infra_pwm_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_adgetnew2_0_avalon_slave_0                  (cpu_0_data_master_read_data_valid_adgetnew2_0_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module                     (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read_data_valid_epcs_flash_controller_0_epcs_control_port   (cpu_0_data_master_read_data_valid_epcs_flash_controller_0_epcs_control_port),
      .cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave               (cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_read_data_valid_motor_0_avalon_slave_0                      (cpu_0_data_master_read_data_valid_motor_0_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_motor_1_avalon_slave_0                      (cpu_0_data_master_read_data_valid_motor_1_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_motor_2_avalon_slave_0                      (cpu_0_data_master_read_data_valid_motor_2_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_motor_3_avalon_slave_0                      (cpu_0_data_master_read_data_valid_motor_3_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_motor_4_avalon_slave_0                      (cpu_0_data_master_read_data_valid_motor_4_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_pio_buzzer_s1                               (cpu_0_data_master_read_data_valid_pio_buzzer_s1),
      .cpu_0_data_master_read_data_valid_pio_hull_fault1_s1                          (cpu_0_data_master_read_data_valid_pio_hull_fault1_s1),
      .cpu_0_data_master_read_data_valid_pio_hull_fault2_s1                          (cpu_0_data_master_read_data_valid_pio_hull_fault2_s1),
      .cpu_0_data_master_read_data_valid_pio_hull_fault3_s1                          (cpu_0_data_master_read_data_valid_pio_hull_fault3_s1),
      .cpu_0_data_master_read_data_valid_pio_hull_fault4_s1                          (cpu_0_data_master_read_data_valid_pio_hull_fault4_s1),
      .cpu_0_data_master_read_data_valid_pio_infra_s1                                (cpu_0_data_master_read_data_valid_pio_infra_s1),
      .cpu_0_data_master_read_data_valid_pio_led_s1                                  (cpu_0_data_master_read_data_valid_pio_led_s1),
      .cpu_0_data_master_read_data_valid_pio_nF2401_in_s1                            (cpu_0_data_master_read_data_valid_pio_nF2401_in_s1),
      .cpu_0_data_master_read_data_valid_pio_nF2401_inout_s1                         (cpu_0_data_master_read_data_valid_pio_nF2401_inout_s1),
      .cpu_0_data_master_read_data_valid_pio_nF2401_out_s1                           (cpu_0_data_master_read_data_valid_pio_nF2401_out_s1),
      .cpu_0_data_master_read_data_valid_pio_reset_9557_s1                           (cpu_0_data_master_read_data_valid_pio_reset_9557_s1),
      .cpu_0_data_master_read_data_valid_pio_scl_24_s1                               (cpu_0_data_master_read_data_valid_pio_scl_24_s1),
      .cpu_0_data_master_read_data_valid_pio_scl_9557_s1                             (cpu_0_data_master_read_data_valid_pio_scl_9557_s1),
      .cpu_0_data_master_read_data_valid_pio_sda_24_s1                               (cpu_0_data_master_read_data_valid_pio_sda_24_s1),
      .cpu_0_data_master_read_data_valid_pio_sda_9557_s1                             (cpu_0_data_master_read_data_valid_pio_sda_9557_s1),
      .cpu_0_data_master_read_data_valid_pio_shoot_off_s1                            (cpu_0_data_master_read_data_valid_pio_shoot_off_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1                                  (cpu_0_data_master_read_data_valid_sdram_0_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register                   (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_read_data_valid_shoot_timer_chip_avalon_slave_0             (cpu_0_data_master_read_data_valid_shoot_timer_chip_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_shoot_timer_shoot_avalon_slave_0            (cpu_0_data_master_read_data_valid_shoot_timer_shoot_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_sysid_control_slave                         (cpu_0_data_master_read_data_valid_sysid_control_slave),
      .cpu_0_data_master_read_data_valid_timer_0_s1                                  (cpu_0_data_master_read_data_valid_timer_0_s1),
      .cpu_0_data_master_read_data_valid_timer_watchdog_s1                           (cpu_0_data_master_read_data_valid_timer_watchdog_s1),
      .cpu_0_data_master_readdata                                                    (cpu_0_data_master_readdata),
      .cpu_0_data_master_readdatavalid                                               (cpu_0_data_master_readdatavalid),
      .cpu_0_data_master_requests_PWM_2_infra_pwm_avalon_slave_0                     (cpu_0_data_master_requests_PWM_2_infra_pwm_avalon_slave_0),
      .cpu_0_data_master_requests_adgetnew2_0_avalon_slave_0                         (cpu_0_data_master_requests_adgetnew2_0_avalon_slave_0),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module                            (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port          (cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port),
      .cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave                      (cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_requests_motor_0_avalon_slave_0                             (cpu_0_data_master_requests_motor_0_avalon_slave_0),
      .cpu_0_data_master_requests_motor_1_avalon_slave_0                             (cpu_0_data_master_requests_motor_1_avalon_slave_0),
      .cpu_0_data_master_requests_motor_2_avalon_slave_0                             (cpu_0_data_master_requests_motor_2_avalon_slave_0),
      .cpu_0_data_master_requests_motor_3_avalon_slave_0                             (cpu_0_data_master_requests_motor_3_avalon_slave_0),
      .cpu_0_data_master_requests_motor_4_avalon_slave_0                             (cpu_0_data_master_requests_motor_4_avalon_slave_0),
      .cpu_0_data_master_requests_pio_buzzer_s1                                      (cpu_0_data_master_requests_pio_buzzer_s1),
      .cpu_0_data_master_requests_pio_hull_fault1_s1                                 (cpu_0_data_master_requests_pio_hull_fault1_s1),
      .cpu_0_data_master_requests_pio_hull_fault2_s1                                 (cpu_0_data_master_requests_pio_hull_fault2_s1),
      .cpu_0_data_master_requests_pio_hull_fault3_s1                                 (cpu_0_data_master_requests_pio_hull_fault3_s1),
      .cpu_0_data_master_requests_pio_hull_fault4_s1                                 (cpu_0_data_master_requests_pio_hull_fault4_s1),
      .cpu_0_data_master_requests_pio_infra_s1                                       (cpu_0_data_master_requests_pio_infra_s1),
      .cpu_0_data_master_requests_pio_led_s1                                         (cpu_0_data_master_requests_pio_led_s1),
      .cpu_0_data_master_requests_pio_nF2401_in_s1                                   (cpu_0_data_master_requests_pio_nF2401_in_s1),
      .cpu_0_data_master_requests_pio_nF2401_inout_s1                                (cpu_0_data_master_requests_pio_nF2401_inout_s1),
      .cpu_0_data_master_requests_pio_nF2401_out_s1                                  (cpu_0_data_master_requests_pio_nF2401_out_s1),
      .cpu_0_data_master_requests_pio_reset_9557_s1                                  (cpu_0_data_master_requests_pio_reset_9557_s1),
      .cpu_0_data_master_requests_pio_scl_24_s1                                      (cpu_0_data_master_requests_pio_scl_24_s1),
      .cpu_0_data_master_requests_pio_scl_9557_s1                                    (cpu_0_data_master_requests_pio_scl_9557_s1),
      .cpu_0_data_master_requests_pio_sda_24_s1                                      (cpu_0_data_master_requests_pio_sda_24_s1),
      .cpu_0_data_master_requests_pio_sda_9557_s1                                    (cpu_0_data_master_requests_pio_sda_9557_s1),
      .cpu_0_data_master_requests_pio_shoot_off_s1                                   (cpu_0_data_master_requests_pio_shoot_off_s1),
      .cpu_0_data_master_requests_sdram_0_s1                                         (cpu_0_data_master_requests_sdram_0_s1),
      .cpu_0_data_master_requests_shoot_timer_chip_avalon_slave_0                    (cpu_0_data_master_requests_shoot_timer_chip_avalon_slave_0),
      .cpu_0_data_master_requests_shoot_timer_shoot_avalon_slave_0                   (cpu_0_data_master_requests_shoot_timer_shoot_avalon_slave_0),
      .cpu_0_data_master_requests_sysid_control_slave                                (cpu_0_data_master_requests_sysid_control_slave),
      .cpu_0_data_master_requests_timer_0_s1                                         (cpu_0_data_master_requests_timer_0_s1),
      .cpu_0_data_master_requests_timer_watchdog_s1                                  (cpu_0_data_master_requests_timer_watchdog_s1),
      .cpu_0_data_master_waitrequest                                                 (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                                       (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                                   (cpu_0_data_master_writedata),
      .cpu_0_jtag_debug_module_readdata_from_sa                                      (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_PWM_2_infra_pwm_avalon_slave_0_end_xfer                                    (d1_PWM_2_infra_pwm_avalon_slave_0_end_xfer),
      .d1_adgetnew2_0_avalon_slave_0_end_xfer                                        (d1_adgetnew2_0_avalon_slave_0_end_xfer),
      .d1_cpu_0_jtag_debug_module_end_xfer                                           (d1_cpu_0_jtag_debug_module_end_xfer),
      .d1_epcs_flash_controller_0_epcs_control_port_end_xfer                         (d1_epcs_flash_controller_0_epcs_control_port_end_xfer),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                                     (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .d1_motor_0_avalon_slave_0_end_xfer                                            (d1_motor_0_avalon_slave_0_end_xfer),
      .d1_motor_1_avalon_slave_0_end_xfer                                            (d1_motor_1_avalon_slave_0_end_xfer),
      .d1_motor_2_avalon_slave_0_end_xfer                                            (d1_motor_2_avalon_slave_0_end_xfer),
      .d1_motor_3_avalon_slave_0_end_xfer                                            (d1_motor_3_avalon_slave_0_end_xfer),
      .d1_motor_4_avalon_slave_0_end_xfer                                            (d1_motor_4_avalon_slave_0_end_xfer),
      .d1_pio_buzzer_s1_end_xfer                                                     (d1_pio_buzzer_s1_end_xfer),
      .d1_pio_hull_fault1_s1_end_xfer                                                (d1_pio_hull_fault1_s1_end_xfer),
      .d1_pio_hull_fault2_s1_end_xfer                                                (d1_pio_hull_fault2_s1_end_xfer),
      .d1_pio_hull_fault3_s1_end_xfer                                                (d1_pio_hull_fault3_s1_end_xfer),
      .d1_pio_hull_fault4_s1_end_xfer                                                (d1_pio_hull_fault4_s1_end_xfer),
      .d1_pio_infra_s1_end_xfer                                                      (d1_pio_infra_s1_end_xfer),
      .d1_pio_led_s1_end_xfer                                                        (d1_pio_led_s1_end_xfer),
      .d1_pio_nF2401_in_s1_end_xfer                                                  (d1_pio_nF2401_in_s1_end_xfer),
      .d1_pio_nF2401_inout_s1_end_xfer                                               (d1_pio_nF2401_inout_s1_end_xfer),
      .d1_pio_nF2401_out_s1_end_xfer                                                 (d1_pio_nF2401_out_s1_end_xfer),
      .d1_pio_reset_9557_s1_end_xfer                                                 (d1_pio_reset_9557_s1_end_xfer),
      .d1_pio_scl_24_s1_end_xfer                                                     (d1_pio_scl_24_s1_end_xfer),
      .d1_pio_scl_9557_s1_end_xfer                                                   (d1_pio_scl_9557_s1_end_xfer),
      .d1_pio_sda_24_s1_end_xfer                                                     (d1_pio_sda_24_s1_end_xfer),
      .d1_pio_sda_9557_s1_end_xfer                                                   (d1_pio_sda_9557_s1_end_xfer),
      .d1_pio_shoot_off_s1_end_xfer                                                  (d1_pio_shoot_off_s1_end_xfer),
      .d1_sdram_0_s1_end_xfer                                                        (d1_sdram_0_s1_end_xfer),
      .d1_shoot_timer_chip_avalon_slave_0_end_xfer                                   (d1_shoot_timer_chip_avalon_slave_0_end_xfer),
      .d1_shoot_timer_shoot_avalon_slave_0_end_xfer                                  (d1_shoot_timer_shoot_avalon_slave_0_end_xfer),
      .d1_sysid_control_slave_end_xfer                                               (d1_sysid_control_slave_end_xfer),
      .d1_timer_0_s1_end_xfer                                                        (d1_timer_0_s1_end_xfer),
      .d1_timer_watchdog_s1_end_xfer                                                 (d1_timer_watchdog_s1_end_xfer),
      .epcs_flash_controller_0_epcs_control_port_irq_from_sa                         (epcs_flash_controller_0_epcs_control_port_irq_from_sa),
      .epcs_flash_controller_0_epcs_control_port_readdata_from_sa                    (epcs_flash_controller_0_epcs_control_port_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                                     (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                                (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                             (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .motor_0_avalon_slave_0_readdata_from_sa                                       (motor_0_avalon_slave_0_readdata_from_sa),
      .motor_1_avalon_slave_0_readdata_from_sa                                       (motor_1_avalon_slave_0_readdata_from_sa),
      .motor_2_avalon_slave_0_readdata_from_sa                                       (motor_2_avalon_slave_0_readdata_from_sa),
      .motor_3_avalon_slave_0_readdata_from_sa                                       (motor_3_avalon_slave_0_readdata_from_sa),
      .motor_4_avalon_slave_0_readdata_from_sa                                       (motor_4_avalon_slave_0_readdata_from_sa),
      .pio_buzzer_s1_readdata_from_sa                                                (pio_buzzer_s1_readdata_from_sa),
      .pio_hull_fault1_s1_readdata_from_sa                                           (pio_hull_fault1_s1_readdata_from_sa),
      .pio_hull_fault2_s1_readdata_from_sa                                           (pio_hull_fault2_s1_readdata_from_sa),
      .pio_hull_fault3_s1_readdata_from_sa                                           (pio_hull_fault3_s1_readdata_from_sa),
      .pio_hull_fault4_s1_readdata_from_sa                                           (pio_hull_fault4_s1_readdata_from_sa),
      .pio_infra_s1_irq_from_sa                                                      (pio_infra_s1_irq_from_sa),
      .pio_infra_s1_readdata_from_sa                                                 (pio_infra_s1_readdata_from_sa),
      .pio_led_s1_readdata_from_sa                                                   (pio_led_s1_readdata_from_sa),
      .pio_nF2401_in_s1_irq_from_sa                                                  (pio_nF2401_in_s1_irq_from_sa),
      .pio_nF2401_in_s1_readdata_from_sa                                             (pio_nF2401_in_s1_readdata_from_sa),
      .pio_nF2401_inout_s1_readdata_from_sa                                          (pio_nF2401_inout_s1_readdata_from_sa),
      .pio_nF2401_out_s1_readdata_from_sa                                            (pio_nF2401_out_s1_readdata_from_sa),
      .pio_reset_9557_s1_readdata_from_sa                                            (pio_reset_9557_s1_readdata_from_sa),
      .pio_scl_24_s1_readdata_from_sa                                                (pio_scl_24_s1_readdata_from_sa),
      .pio_scl_9557_s1_readdata_from_sa                                              (pio_scl_9557_s1_readdata_from_sa),
      .pio_sda_24_s1_readdata_from_sa                                                (pio_sda_24_s1_readdata_from_sa),
      .pio_sda_9557_s1_readdata_from_sa                                              (pio_sda_9557_s1_readdata_from_sa),
      .pio_shoot_off_s1_readdata_from_sa                                             (pio_shoot_off_s1_readdata_from_sa),
      .reset_n                                                                       (clk_0_reset_n),
      .sdram_0_s1_readdata_from_sa                                                   (sdram_0_s1_readdata_from_sa),
      .sdram_0_s1_waitrequest_from_sa                                                (sdram_0_s1_waitrequest_from_sa),
      .shoot_timer_chip_avalon_slave_0_readdata_from_sa                              (shoot_timer_chip_avalon_slave_0_readdata_from_sa),
      .shoot_timer_shoot_avalon_slave_0_readdata_from_sa                             (shoot_timer_shoot_avalon_slave_0_readdata_from_sa),
      .sysid_control_slave_readdata_from_sa                                          (sysid_control_slave_readdata_from_sa),
      .timer_0_s1_irq_from_sa                                                        (timer_0_s1_irq_from_sa),
      .timer_0_s1_readdata_from_sa                                                   (timer_0_s1_readdata_from_sa),
      .timer_watchdog_s1_irq_from_sa                                                 (timer_watchdog_s1_irq_from_sa),
      .timer_watchdog_s1_readdata_from_sa                                            (timer_watchdog_s1_readdata_from_sa)
    );

  cpu_0_instruction_master_arbitrator the_cpu_0_instruction_master
    (
      .clk                                                                                  (clk_0),
      .cpu_0_instruction_master_address                                                     (cpu_0_instruction_master_address),
      .cpu_0_instruction_master_address_to_slave                                            (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                                                 (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module                             (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port           (cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port),
      .cpu_0_instruction_master_granted_sdram_0_s1                                          (cpu_0_instruction_master_granted_sdram_0_s1),
      .cpu_0_instruction_master_latency_counter                                             (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module                   (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port (cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port),
      .cpu_0_instruction_master_qualified_request_sdram_0_s1                                (cpu_0_instruction_master_qualified_request_sdram_0_s1),
      .cpu_0_instruction_master_read                                                        (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module                     (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read_data_valid_epcs_flash_controller_0_epcs_control_port   (cpu_0_instruction_master_read_data_valid_epcs_flash_controller_0_epcs_control_port),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1                                  (cpu_0_instruction_master_read_data_valid_sdram_0_s1),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register                   (cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_instruction_master_readdata                                                    (cpu_0_instruction_master_readdata),
      .cpu_0_instruction_master_readdatavalid                                               (cpu_0_instruction_master_readdatavalid),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module                            (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port          (cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port),
      .cpu_0_instruction_master_requests_sdram_0_s1                                         (cpu_0_instruction_master_requests_sdram_0_s1),
      .cpu_0_instruction_master_waitrequest                                                 (cpu_0_instruction_master_waitrequest),
      .cpu_0_jtag_debug_module_readdata_from_sa                                             (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_cpu_0_jtag_debug_module_end_xfer                                                  (d1_cpu_0_jtag_debug_module_end_xfer),
      .d1_epcs_flash_controller_0_epcs_control_port_end_xfer                                (d1_epcs_flash_controller_0_epcs_control_port_end_xfer),
      .d1_sdram_0_s1_end_xfer                                                               (d1_sdram_0_s1_end_xfer),
      .epcs_flash_controller_0_epcs_control_port_readdata_from_sa                           (epcs_flash_controller_0_epcs_control_port_readdata_from_sa),
      .reset_n                                                                              (clk_0_reset_n),
      .sdram_0_s1_readdata_from_sa                                                          (sdram_0_s1_readdata_from_sa),
      .sdram_0_s1_waitrequest_from_sa                                                       (sdram_0_s1_waitrequest_from_sa)
    );

  cpu_0 the_cpu_0
    (
      .clk                                   (clk_0),
      .d_address                             (cpu_0_data_master_address),
      .d_byteenable                          (cpu_0_data_master_byteenable),
      .d_irq                                 (cpu_0_data_master_irq),
      .d_read                                (cpu_0_data_master_read),
      .d_readdata                            (cpu_0_data_master_readdata),
      .d_readdatavalid                       (cpu_0_data_master_readdatavalid),
      .d_waitrequest                         (cpu_0_data_master_waitrequest),
      .d_write                               (cpu_0_data_master_write),
      .d_writedata                           (cpu_0_data_master_writedata),
      .i_address                             (cpu_0_instruction_master_address),
      .i_read                                (cpu_0_instruction_master_read),
      .i_readdata                            (cpu_0_instruction_master_readdata),
      .i_readdatavalid                       (cpu_0_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_0_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_0_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_0_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_0_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_0_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_0_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_0_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_0_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_0_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_0_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_0_jtag_debug_module_writedata),
      .reset_n                               (cpu_0_jtag_debug_module_reset_n)
    );

  epcs_flash_controller_0_epcs_control_port_arbitrator the_epcs_flash_controller_0_epcs_control_port
    (
      .clk                                                                                  (clk_0),
      .cpu_0_data_master_address_to_slave                                                   (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port                  (cpu_0_data_master_granted_epcs_flash_controller_0_epcs_control_port),
      .cpu_0_data_master_latency_counter                                                    (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port        (cpu_0_data_master_qualified_request_epcs_flash_controller_0_epcs_control_port),
      .cpu_0_data_master_read                                                               (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_epcs_flash_controller_0_epcs_control_port          (cpu_0_data_master_read_data_valid_epcs_flash_controller_0_epcs_control_port),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register                          (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port                 (cpu_0_data_master_requests_epcs_flash_controller_0_epcs_control_port),
      .cpu_0_data_master_write                                                              (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                                          (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                                            (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port           (cpu_0_instruction_master_granted_epcs_flash_controller_0_epcs_control_port),
      .cpu_0_instruction_master_latency_counter                                             (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port (cpu_0_instruction_master_qualified_request_epcs_flash_controller_0_epcs_control_port),
      .cpu_0_instruction_master_read                                                        (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_epcs_flash_controller_0_epcs_control_port   (cpu_0_instruction_master_read_data_valid_epcs_flash_controller_0_epcs_control_port),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register                   (cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port          (cpu_0_instruction_master_requests_epcs_flash_controller_0_epcs_control_port),
      .d1_epcs_flash_controller_0_epcs_control_port_end_xfer                                (d1_epcs_flash_controller_0_epcs_control_port_end_xfer),
      .epcs_flash_controller_0_epcs_control_port_address                                    (epcs_flash_controller_0_epcs_control_port_address),
      .epcs_flash_controller_0_epcs_control_port_chipselect                                 (epcs_flash_controller_0_epcs_control_port_chipselect),
      .epcs_flash_controller_0_epcs_control_port_dataavailable                              (epcs_flash_controller_0_epcs_control_port_dataavailable),
      .epcs_flash_controller_0_epcs_control_port_dataavailable_from_sa                      (epcs_flash_controller_0_epcs_control_port_dataavailable_from_sa),
      .epcs_flash_controller_0_epcs_control_port_endofpacket                                (epcs_flash_controller_0_epcs_control_port_endofpacket),
      .epcs_flash_controller_0_epcs_control_port_endofpacket_from_sa                        (epcs_flash_controller_0_epcs_control_port_endofpacket_from_sa),
      .epcs_flash_controller_0_epcs_control_port_irq                                        (epcs_flash_controller_0_epcs_control_port_irq),
      .epcs_flash_controller_0_epcs_control_port_irq_from_sa                                (epcs_flash_controller_0_epcs_control_port_irq_from_sa),
      .epcs_flash_controller_0_epcs_control_port_read_n                                     (epcs_flash_controller_0_epcs_control_port_read_n),
      .epcs_flash_controller_0_epcs_control_port_readdata                                   (epcs_flash_controller_0_epcs_control_port_readdata),
      .epcs_flash_controller_0_epcs_control_port_readdata_from_sa                           (epcs_flash_controller_0_epcs_control_port_readdata_from_sa),
      .epcs_flash_controller_0_epcs_control_port_readyfordata                               (epcs_flash_controller_0_epcs_control_port_readyfordata),
      .epcs_flash_controller_0_epcs_control_port_readyfordata_from_sa                       (epcs_flash_controller_0_epcs_control_port_readyfordata_from_sa),
      .epcs_flash_controller_0_epcs_control_port_reset_n                                    (epcs_flash_controller_0_epcs_control_port_reset_n),
      .epcs_flash_controller_0_epcs_control_port_write_n                                    (epcs_flash_controller_0_epcs_control_port_write_n),
      .epcs_flash_controller_0_epcs_control_port_writedata                                  (epcs_flash_controller_0_epcs_control_port_writedata),
      .reset_n                                                                              (clk_0_reset_n)
    );

  epcs_flash_controller_0 the_epcs_flash_controller_0
    (
      .address       (epcs_flash_controller_0_epcs_control_port_address),
      .chipselect    (epcs_flash_controller_0_epcs_control_port_chipselect),
      .clk           (clk_0),
      .data0         (data0_to_the_epcs_flash_controller_0),
      .dataavailable (epcs_flash_controller_0_epcs_control_port_dataavailable),
      .dclk          (dclk_from_the_epcs_flash_controller_0),
      .endofpacket   (epcs_flash_controller_0_epcs_control_port_endofpacket),
      .irq           (epcs_flash_controller_0_epcs_control_port_irq),
      .read_n        (epcs_flash_controller_0_epcs_control_port_read_n),
      .readdata      (epcs_flash_controller_0_epcs_control_port_readdata),
      .readyfordata  (epcs_flash_controller_0_epcs_control_port_readyfordata),
      .reset_n       (epcs_flash_controller_0_epcs_control_port_reset_n),
      .sce           (sce_from_the_epcs_flash_controller_0),
      .sdo           (sdo_from_the_epcs_flash_controller_0),
      .write_n       (epcs_flash_controller_0_epcs_control_port_write_n),
      .writedata     (epcs_flash_controller_0_epcs_control_port_writedata)
    );

  jtag_uart_0_avalon_jtag_slave_arbitrator the_jtag_uart_0_avalon_jtag_slave
    (
      .clk                                                               (clk_0),
      .cpu_0_data_master_address_to_slave                                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave           (cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_latency_counter                                 (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_read                                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave   (cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register       (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave          (cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_write                                           (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                       (cpu_0_data_master_writedata),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                         (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .jtag_uart_0_avalon_jtag_slave_address                             (jtag_uart_0_avalon_jtag_slave_address),
      .jtag_uart_0_avalon_jtag_slave_chipselect                          (jtag_uart_0_avalon_jtag_slave_chipselect),
      .jtag_uart_0_avalon_jtag_slave_dataavailable                       (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa               (jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_0_avalon_jtag_slave_irq                                 (jtag_uart_0_avalon_jtag_slave_irq),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                         (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_read_n                              (jtag_uart_0_avalon_jtag_slave_read_n),
      .jtag_uart_0_avalon_jtag_slave_readdata                            (jtag_uart_0_avalon_jtag_slave_readdata),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                    (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readyfordata                        (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa                (jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_reset_n                             (jtag_uart_0_avalon_jtag_slave_reset_n),
      .jtag_uart_0_avalon_jtag_slave_waitrequest                         (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                 (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_0_avalon_jtag_slave_write_n                             (jtag_uart_0_avalon_jtag_slave_write_n),
      .jtag_uart_0_avalon_jtag_slave_writedata                           (jtag_uart_0_avalon_jtag_slave_writedata),
      .reset_n                                                           (clk_0_reset_n)
    );

  jtag_uart_0 the_jtag_uart_0
    (
      .av_address     (jtag_uart_0_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_0_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_0_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_0_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_0_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_0_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_0_avalon_jtag_slave_writedata),
      .clk            (clk_0),
      .dataavailable  (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_0_avalon_jtag_slave_reset_n)
    );

  motor_0_avalon_slave_0_arbitrator the_motor_0_avalon_slave_0
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_motor_0_avalon_slave_0            (cpu_0_data_master_granted_motor_0_avalon_slave_0),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_motor_0_avalon_slave_0  (cpu_0_data_master_qualified_request_motor_0_avalon_slave_0),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_motor_0_avalon_slave_0    (cpu_0_data_master_read_data_valid_motor_0_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_motor_0_avalon_slave_0           (cpu_0_data_master_requests_motor_0_avalon_slave_0),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_motor_0_avalon_slave_0_end_xfer                          (d1_motor_0_avalon_slave_0_end_xfer),
      .motor_0_avalon_slave_0_address                              (motor_0_avalon_slave_0_address),
      .motor_0_avalon_slave_0_chipselect_n                         (motor_0_avalon_slave_0_chipselect_n),
      .motor_0_avalon_slave_0_read_n                               (motor_0_avalon_slave_0_read_n),
      .motor_0_avalon_slave_0_readdata                             (motor_0_avalon_slave_0_readdata),
      .motor_0_avalon_slave_0_readdata_from_sa                     (motor_0_avalon_slave_0_readdata_from_sa),
      .motor_0_avalon_slave_0_reset_n                              (motor_0_avalon_slave_0_reset_n),
      .motor_0_avalon_slave_0_write_n                              (motor_0_avalon_slave_0_write_n),
      .motor_0_avalon_slave_0_writedata                            (motor_0_avalon_slave_0_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  motor_0 the_motor_0
    (
      .A           (A_from_the_motor_0),
      .B           (B_from_the_motor_0),
      .Z_Brushless (Z_Brushless_from_the_motor_0),
      .Z_OpenLoop  (Z_OpenLoop_from_the_motor_0),
      .addr        (motor_0_avalon_slave_0_address),
      .clk         (clk_0),
      .code0       (code0_to_the_motor_0),
      .code1       (code1_to_the_motor_0),
      .code2       (code2_to_the_motor_0),
      .code3       (code3_to_the_motor_0),
      .cs_n        (motor_0_avalon_slave_0_chipselect_n),
      .rd_n        (motor_0_avalon_slave_0_read_n),
      .rddata      (motor_0_avalon_slave_0_readdata),
      .rst_n       (motor_0_avalon_slave_0_reset_n),
      .set         (set_from_the_motor_0),
      .wr_n        (motor_0_avalon_slave_0_write_n),
      .wrdata      (motor_0_avalon_slave_0_writedata)
    );

  motor_1_avalon_slave_0_arbitrator the_motor_1_avalon_slave_0
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_motor_1_avalon_slave_0            (cpu_0_data_master_granted_motor_1_avalon_slave_0),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_motor_1_avalon_slave_0  (cpu_0_data_master_qualified_request_motor_1_avalon_slave_0),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_motor_1_avalon_slave_0    (cpu_0_data_master_read_data_valid_motor_1_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_motor_1_avalon_slave_0           (cpu_0_data_master_requests_motor_1_avalon_slave_0),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_motor_1_avalon_slave_0_end_xfer                          (d1_motor_1_avalon_slave_0_end_xfer),
      .motor_1_avalon_slave_0_address                              (motor_1_avalon_slave_0_address),
      .motor_1_avalon_slave_0_chipselect_n                         (motor_1_avalon_slave_0_chipselect_n),
      .motor_1_avalon_slave_0_read_n                               (motor_1_avalon_slave_0_read_n),
      .motor_1_avalon_slave_0_readdata                             (motor_1_avalon_slave_0_readdata),
      .motor_1_avalon_slave_0_readdata_from_sa                     (motor_1_avalon_slave_0_readdata_from_sa),
      .motor_1_avalon_slave_0_reset_n                              (motor_1_avalon_slave_0_reset_n),
      .motor_1_avalon_slave_0_write_n                              (motor_1_avalon_slave_0_write_n),
      .motor_1_avalon_slave_0_writedata                            (motor_1_avalon_slave_0_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  motor_1 the_motor_1
    (
      .A           (A_from_the_motor_1),
      .B           (B_from_the_motor_1),
      .Z_Brushless (Z_Brushless_from_the_motor_1),
      .Z_OpenLoop  (Z_OpenLoop_from_the_motor_1),
      .addr        (motor_1_avalon_slave_0_address),
      .clk         (clk_0),
      .code0       (code0_to_the_motor_1),
      .code1       (code1_to_the_motor_1),
      .code2       (code2_to_the_motor_1),
      .code3       (code3_to_the_motor_1),
      .cs_n        (motor_1_avalon_slave_0_chipselect_n),
      .rd_n        (motor_1_avalon_slave_0_read_n),
      .rddata      (motor_1_avalon_slave_0_readdata),
      .rst_n       (motor_1_avalon_slave_0_reset_n),
      .set         (set_from_the_motor_1),
      .wr_n        (motor_1_avalon_slave_0_write_n),
      .wrdata      (motor_1_avalon_slave_0_writedata)
    );

  motor_2_avalon_slave_0_arbitrator the_motor_2_avalon_slave_0
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_motor_2_avalon_slave_0            (cpu_0_data_master_granted_motor_2_avalon_slave_0),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_motor_2_avalon_slave_0  (cpu_0_data_master_qualified_request_motor_2_avalon_slave_0),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_motor_2_avalon_slave_0    (cpu_0_data_master_read_data_valid_motor_2_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_motor_2_avalon_slave_0           (cpu_0_data_master_requests_motor_2_avalon_slave_0),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_motor_2_avalon_slave_0_end_xfer                          (d1_motor_2_avalon_slave_0_end_xfer),
      .motor_2_avalon_slave_0_address                              (motor_2_avalon_slave_0_address),
      .motor_2_avalon_slave_0_chipselect_n                         (motor_2_avalon_slave_0_chipselect_n),
      .motor_2_avalon_slave_0_read_n                               (motor_2_avalon_slave_0_read_n),
      .motor_2_avalon_slave_0_readdata                             (motor_2_avalon_slave_0_readdata),
      .motor_2_avalon_slave_0_readdata_from_sa                     (motor_2_avalon_slave_0_readdata_from_sa),
      .motor_2_avalon_slave_0_reset_n                              (motor_2_avalon_slave_0_reset_n),
      .motor_2_avalon_slave_0_write_n                              (motor_2_avalon_slave_0_write_n),
      .motor_2_avalon_slave_0_writedata                            (motor_2_avalon_slave_0_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  motor_2 the_motor_2
    (
      .A           (A_from_the_motor_2),
      .B           (B_from_the_motor_2),
      .Z_Brushless (Z_Brushless_from_the_motor_2),
      .Z_OpenLoop  (Z_OpenLoop_from_the_motor_2),
      .addr        (motor_2_avalon_slave_0_address),
      .clk         (clk_0),
      .code0       (code0_to_the_motor_2),
      .code1       (code1_to_the_motor_2),
      .code2       (code2_to_the_motor_2),
      .code3       (code3_to_the_motor_2),
      .cs_n        (motor_2_avalon_slave_0_chipselect_n),
      .rd_n        (motor_2_avalon_slave_0_read_n),
      .rddata      (motor_2_avalon_slave_0_readdata),
      .rst_n       (motor_2_avalon_slave_0_reset_n),
      .set         (set_from_the_motor_2),
      .wr_n        (motor_2_avalon_slave_0_write_n),
      .wrdata      (motor_2_avalon_slave_0_writedata)
    );

  motor_3_avalon_slave_0_arbitrator the_motor_3_avalon_slave_0
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_motor_3_avalon_slave_0            (cpu_0_data_master_granted_motor_3_avalon_slave_0),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_motor_3_avalon_slave_0  (cpu_0_data_master_qualified_request_motor_3_avalon_slave_0),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_motor_3_avalon_slave_0    (cpu_0_data_master_read_data_valid_motor_3_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_motor_3_avalon_slave_0           (cpu_0_data_master_requests_motor_3_avalon_slave_0),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_motor_3_avalon_slave_0_end_xfer                          (d1_motor_3_avalon_slave_0_end_xfer),
      .motor_3_avalon_slave_0_address                              (motor_3_avalon_slave_0_address),
      .motor_3_avalon_slave_0_chipselect_n                         (motor_3_avalon_slave_0_chipselect_n),
      .motor_3_avalon_slave_0_read_n                               (motor_3_avalon_slave_0_read_n),
      .motor_3_avalon_slave_0_readdata                             (motor_3_avalon_slave_0_readdata),
      .motor_3_avalon_slave_0_readdata_from_sa                     (motor_3_avalon_slave_0_readdata_from_sa),
      .motor_3_avalon_slave_0_reset_n                              (motor_3_avalon_slave_0_reset_n),
      .motor_3_avalon_slave_0_write_n                              (motor_3_avalon_slave_0_write_n),
      .motor_3_avalon_slave_0_writedata                            (motor_3_avalon_slave_0_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  motor_3 the_motor_3
    (
      .A           (A_from_the_motor_3),
      .B           (B_from_the_motor_3),
      .Z_Brushless (Z_Brushless_from_the_motor_3),
      .Z_OpenLoop  (Z_OpenLoop_from_the_motor_3),
      .addr        (motor_3_avalon_slave_0_address),
      .clk         (clk_0),
      .code0       (code0_to_the_motor_3),
      .code1       (code1_to_the_motor_3),
      .code2       (code2_to_the_motor_3),
      .code3       (code3_to_the_motor_3),
      .cs_n        (motor_3_avalon_slave_0_chipselect_n),
      .rd_n        (motor_3_avalon_slave_0_read_n),
      .rddata      (motor_3_avalon_slave_0_readdata),
      .rst_n       (motor_3_avalon_slave_0_reset_n),
      .set         (set_from_the_motor_3),
      .wr_n        (motor_3_avalon_slave_0_write_n),
      .wrdata      (motor_3_avalon_slave_0_writedata)
    );

  motor_4_avalon_slave_0_arbitrator the_motor_4_avalon_slave_0
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_motor_4_avalon_slave_0            (cpu_0_data_master_granted_motor_4_avalon_slave_0),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_motor_4_avalon_slave_0  (cpu_0_data_master_qualified_request_motor_4_avalon_slave_0),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_motor_4_avalon_slave_0    (cpu_0_data_master_read_data_valid_motor_4_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_motor_4_avalon_slave_0           (cpu_0_data_master_requests_motor_4_avalon_slave_0),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_motor_4_avalon_slave_0_end_xfer                          (d1_motor_4_avalon_slave_0_end_xfer),
      .motor_4_avalon_slave_0_address                              (motor_4_avalon_slave_0_address),
      .motor_4_avalon_slave_0_chipselect_n                         (motor_4_avalon_slave_0_chipselect_n),
      .motor_4_avalon_slave_0_read_n                               (motor_4_avalon_slave_0_read_n),
      .motor_4_avalon_slave_0_readdata                             (motor_4_avalon_slave_0_readdata),
      .motor_4_avalon_slave_0_readdata_from_sa                     (motor_4_avalon_slave_0_readdata_from_sa),
      .motor_4_avalon_slave_0_reset_n                              (motor_4_avalon_slave_0_reset_n),
      .motor_4_avalon_slave_0_write_n                              (motor_4_avalon_slave_0_write_n),
      .motor_4_avalon_slave_0_writedata                            (motor_4_avalon_slave_0_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  motor_4 the_motor_4
    (
      .A           (A_from_the_motor_4),
      .B           (B_from_the_motor_4),
      .Z_Brushless (Z_Brushless_from_the_motor_4),
      .Z_OpenLoop  (Z_OpenLoop_from_the_motor_4),
      .addr        (motor_4_avalon_slave_0_address),
      .clk         (clk_0),
      .code0       (code0_to_the_motor_4),
      .code1       (code1_to_the_motor_4),
      .code2       (code2_to_the_motor_4),
      .code3       (code3_to_the_motor_4),
      .cs_n        (motor_4_avalon_slave_0_chipselect_n),
      .rd_n        (motor_4_avalon_slave_0_read_n),
      .rddata      (motor_4_avalon_slave_0_readdata),
      .rst_n       (motor_4_avalon_slave_0_reset_n),
      .set         (set_from_the_motor_4),
      .wr_n        (motor_4_avalon_slave_0_write_n),
      .wrdata      (motor_4_avalon_slave_0_writedata)
    );

  pio_buzzer_s1_arbitrator the_pio_buzzer_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_buzzer_s1                     (cpu_0_data_master_granted_pio_buzzer_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_buzzer_s1           (cpu_0_data_master_qualified_request_pio_buzzer_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_buzzer_s1             (cpu_0_data_master_read_data_valid_pio_buzzer_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pio_buzzer_s1                    (cpu_0_data_master_requests_pio_buzzer_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_pio_buzzer_s1_end_xfer                                   (d1_pio_buzzer_s1_end_xfer),
      .pio_buzzer_s1_address                                       (pio_buzzer_s1_address),
      .pio_buzzer_s1_chipselect                                    (pio_buzzer_s1_chipselect),
      .pio_buzzer_s1_readdata                                      (pio_buzzer_s1_readdata),
      .pio_buzzer_s1_readdata_from_sa                              (pio_buzzer_s1_readdata_from_sa),
      .pio_buzzer_s1_reset_n                                       (pio_buzzer_s1_reset_n),
      .pio_buzzer_s1_write_n                                       (pio_buzzer_s1_write_n),
      .pio_buzzer_s1_writedata                                     (pio_buzzer_s1_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  pio_buzzer the_pio_buzzer
    (
      .address    (pio_buzzer_s1_address),
      .chipselect (pio_buzzer_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_pio_buzzer),
      .readdata   (pio_buzzer_s1_readdata),
      .reset_n    (pio_buzzer_s1_reset_n),
      .write_n    (pio_buzzer_s1_write_n),
      .writedata  (pio_buzzer_s1_writedata)
    );

  pio_hull_fault1_s1_arbitrator the_pio_hull_fault1_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_hull_fault1_s1                (cpu_0_data_master_granted_pio_hull_fault1_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_hull_fault1_s1      (cpu_0_data_master_qualified_request_pio_hull_fault1_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_hull_fault1_s1        (cpu_0_data_master_read_data_valid_pio_hull_fault1_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pio_hull_fault1_s1               (cpu_0_data_master_requests_pio_hull_fault1_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .d1_pio_hull_fault1_s1_end_xfer                              (d1_pio_hull_fault1_s1_end_xfer),
      .pio_hull_fault1_s1_address                                  (pio_hull_fault1_s1_address),
      .pio_hull_fault1_s1_readdata                                 (pio_hull_fault1_s1_readdata),
      .pio_hull_fault1_s1_readdata_from_sa                         (pio_hull_fault1_s1_readdata_from_sa),
      .pio_hull_fault1_s1_reset_n                                  (pio_hull_fault1_s1_reset_n),
      .reset_n                                                     (clk_0_reset_n)
    );

  pio_hull_fault1 the_pio_hull_fault1
    (
      .address  (pio_hull_fault1_s1_address),
      .clk      (clk_0),
      .in_port  (in_port_to_the_pio_hull_fault1),
      .readdata (pio_hull_fault1_s1_readdata),
      .reset_n  (pio_hull_fault1_s1_reset_n)
    );

  pio_hull_fault2_s1_arbitrator the_pio_hull_fault2_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_hull_fault2_s1                (cpu_0_data_master_granted_pio_hull_fault2_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_hull_fault2_s1      (cpu_0_data_master_qualified_request_pio_hull_fault2_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_hull_fault2_s1        (cpu_0_data_master_read_data_valid_pio_hull_fault2_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pio_hull_fault2_s1               (cpu_0_data_master_requests_pio_hull_fault2_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .d1_pio_hull_fault2_s1_end_xfer                              (d1_pio_hull_fault2_s1_end_xfer),
      .pio_hull_fault2_s1_address                                  (pio_hull_fault2_s1_address),
      .pio_hull_fault2_s1_readdata                                 (pio_hull_fault2_s1_readdata),
      .pio_hull_fault2_s1_readdata_from_sa                         (pio_hull_fault2_s1_readdata_from_sa),
      .pio_hull_fault2_s1_reset_n                                  (pio_hull_fault2_s1_reset_n),
      .reset_n                                                     (clk_0_reset_n)
    );

  pio_hull_fault2 the_pio_hull_fault2
    (
      .address  (pio_hull_fault2_s1_address),
      .clk      (clk_0),
      .in_port  (in_port_to_the_pio_hull_fault2),
      .readdata (pio_hull_fault2_s1_readdata),
      .reset_n  (pio_hull_fault2_s1_reset_n)
    );

  pio_hull_fault3_s1_arbitrator the_pio_hull_fault3_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_hull_fault3_s1                (cpu_0_data_master_granted_pio_hull_fault3_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_hull_fault3_s1      (cpu_0_data_master_qualified_request_pio_hull_fault3_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_hull_fault3_s1        (cpu_0_data_master_read_data_valid_pio_hull_fault3_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pio_hull_fault3_s1               (cpu_0_data_master_requests_pio_hull_fault3_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .d1_pio_hull_fault3_s1_end_xfer                              (d1_pio_hull_fault3_s1_end_xfer),
      .pio_hull_fault3_s1_address                                  (pio_hull_fault3_s1_address),
      .pio_hull_fault3_s1_readdata                                 (pio_hull_fault3_s1_readdata),
      .pio_hull_fault3_s1_readdata_from_sa                         (pio_hull_fault3_s1_readdata_from_sa),
      .pio_hull_fault3_s1_reset_n                                  (pio_hull_fault3_s1_reset_n),
      .reset_n                                                     (clk_0_reset_n)
    );

  pio_hull_fault3 the_pio_hull_fault3
    (
      .address  (pio_hull_fault3_s1_address),
      .clk      (clk_0),
      .in_port  (in_port_to_the_pio_hull_fault3),
      .readdata (pio_hull_fault3_s1_readdata),
      .reset_n  (pio_hull_fault3_s1_reset_n)
    );

  pio_hull_fault4_s1_arbitrator the_pio_hull_fault4_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_hull_fault4_s1                (cpu_0_data_master_granted_pio_hull_fault4_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_hull_fault4_s1      (cpu_0_data_master_qualified_request_pio_hull_fault4_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_hull_fault4_s1        (cpu_0_data_master_read_data_valid_pio_hull_fault4_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pio_hull_fault4_s1               (cpu_0_data_master_requests_pio_hull_fault4_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .d1_pio_hull_fault4_s1_end_xfer                              (d1_pio_hull_fault4_s1_end_xfer),
      .pio_hull_fault4_s1_address                                  (pio_hull_fault4_s1_address),
      .pio_hull_fault4_s1_readdata                                 (pio_hull_fault4_s1_readdata),
      .pio_hull_fault4_s1_readdata_from_sa                         (pio_hull_fault4_s1_readdata_from_sa),
      .pio_hull_fault4_s1_reset_n                                  (pio_hull_fault4_s1_reset_n),
      .reset_n                                                     (clk_0_reset_n)
    );

  pio_hull_fault4 the_pio_hull_fault4
    (
      .address  (pio_hull_fault4_s1_address),
      .clk      (clk_0),
      .in_port  (in_port_to_the_pio_hull_fault4),
      .readdata (pio_hull_fault4_s1_readdata),
      .reset_n  (pio_hull_fault4_s1_reset_n)
    );

  pio_infra_s1_arbitrator the_pio_infra_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_infra_s1                      (cpu_0_data_master_granted_pio_infra_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_infra_s1            (cpu_0_data_master_qualified_request_pio_infra_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_infra_s1              (cpu_0_data_master_read_data_valid_pio_infra_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pio_infra_s1                     (cpu_0_data_master_requests_pio_infra_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_pio_infra_s1_end_xfer                                    (d1_pio_infra_s1_end_xfer),
      .pio_infra_s1_address                                        (pio_infra_s1_address),
      .pio_infra_s1_chipselect                                     (pio_infra_s1_chipselect),
      .pio_infra_s1_irq                                            (pio_infra_s1_irq),
      .pio_infra_s1_irq_from_sa                                    (pio_infra_s1_irq_from_sa),
      .pio_infra_s1_readdata                                       (pio_infra_s1_readdata),
      .pio_infra_s1_readdata_from_sa                               (pio_infra_s1_readdata_from_sa),
      .pio_infra_s1_reset_n                                        (pio_infra_s1_reset_n),
      .pio_infra_s1_write_n                                        (pio_infra_s1_write_n),
      .pio_infra_s1_writedata                                      (pio_infra_s1_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  pio_infra the_pio_infra
    (
      .address    (pio_infra_s1_address),
      .chipselect (pio_infra_s1_chipselect),
      .clk        (clk_0),
      .in_port    (in_port_to_the_pio_infra),
      .irq        (pio_infra_s1_irq),
      .readdata   (pio_infra_s1_readdata),
      .reset_n    (pio_infra_s1_reset_n),
      .write_n    (pio_infra_s1_write_n),
      .writedata  (pio_infra_s1_writedata)
    );

  pio_led_s1_arbitrator the_pio_led_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_led_s1                        (cpu_0_data_master_granted_pio_led_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_led_s1              (cpu_0_data_master_qualified_request_pio_led_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_led_s1                (cpu_0_data_master_read_data_valid_pio_led_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pio_led_s1                       (cpu_0_data_master_requests_pio_led_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_pio_led_s1_end_xfer                                      (d1_pio_led_s1_end_xfer),
      .pio_led_s1_address                                          (pio_led_s1_address),
      .pio_led_s1_chipselect                                       (pio_led_s1_chipselect),
      .pio_led_s1_readdata                                         (pio_led_s1_readdata),
      .pio_led_s1_readdata_from_sa                                 (pio_led_s1_readdata_from_sa),
      .pio_led_s1_reset_n                                          (pio_led_s1_reset_n),
      .pio_led_s1_write_n                                          (pio_led_s1_write_n),
      .pio_led_s1_writedata                                        (pio_led_s1_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  pio_led the_pio_led
    (
      .address    (pio_led_s1_address),
      .chipselect (pio_led_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_pio_led),
      .readdata   (pio_led_s1_readdata),
      .reset_n    (pio_led_s1_reset_n),
      .write_n    (pio_led_s1_write_n),
      .writedata  (pio_led_s1_writedata)
    );

  pio_nF2401_in_s1_arbitrator the_pio_nF2401_in_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_nF2401_in_s1                  (cpu_0_data_master_granted_pio_nF2401_in_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_nF2401_in_s1        (cpu_0_data_master_qualified_request_pio_nF2401_in_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_nF2401_in_s1          (cpu_0_data_master_read_data_valid_pio_nF2401_in_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pio_nF2401_in_s1                 (cpu_0_data_master_requests_pio_nF2401_in_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_pio_nF2401_in_s1_end_xfer                                (d1_pio_nF2401_in_s1_end_xfer),
      .pio_nF2401_in_s1_address                                    (pio_nF2401_in_s1_address),
      .pio_nF2401_in_s1_chipselect                                 (pio_nF2401_in_s1_chipselect),
      .pio_nF2401_in_s1_irq                                        (pio_nF2401_in_s1_irq),
      .pio_nF2401_in_s1_irq_from_sa                                (pio_nF2401_in_s1_irq_from_sa),
      .pio_nF2401_in_s1_readdata                                   (pio_nF2401_in_s1_readdata),
      .pio_nF2401_in_s1_readdata_from_sa                           (pio_nF2401_in_s1_readdata_from_sa),
      .pio_nF2401_in_s1_reset_n                                    (pio_nF2401_in_s1_reset_n),
      .pio_nF2401_in_s1_write_n                                    (pio_nF2401_in_s1_write_n),
      .pio_nF2401_in_s1_writedata                                  (pio_nF2401_in_s1_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  pio_nF2401_in the_pio_nF2401_in
    (
      .address    (pio_nF2401_in_s1_address),
      .chipselect (pio_nF2401_in_s1_chipselect),
      .clk        (clk_0),
      .in_port    (in_port_to_the_pio_nF2401_in),
      .irq        (pio_nF2401_in_s1_irq),
      .readdata   (pio_nF2401_in_s1_readdata),
      .reset_n    (pio_nF2401_in_s1_reset_n),
      .write_n    (pio_nF2401_in_s1_write_n),
      .writedata  (pio_nF2401_in_s1_writedata)
    );

  pio_nF2401_inout_s1_arbitrator the_pio_nF2401_inout_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_nF2401_inout_s1               (cpu_0_data_master_granted_pio_nF2401_inout_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_nF2401_inout_s1     (cpu_0_data_master_qualified_request_pio_nF2401_inout_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_nF2401_inout_s1       (cpu_0_data_master_read_data_valid_pio_nF2401_inout_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pio_nF2401_inout_s1              (cpu_0_data_master_requests_pio_nF2401_inout_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_pio_nF2401_inout_s1_end_xfer                             (d1_pio_nF2401_inout_s1_end_xfer),
      .pio_nF2401_inout_s1_address                                 (pio_nF2401_inout_s1_address),
      .pio_nF2401_inout_s1_chipselect                              (pio_nF2401_inout_s1_chipselect),
      .pio_nF2401_inout_s1_readdata                                (pio_nF2401_inout_s1_readdata),
      .pio_nF2401_inout_s1_readdata_from_sa                        (pio_nF2401_inout_s1_readdata_from_sa),
      .pio_nF2401_inout_s1_reset_n                                 (pio_nF2401_inout_s1_reset_n),
      .pio_nF2401_inout_s1_write_n                                 (pio_nF2401_inout_s1_write_n),
      .pio_nF2401_inout_s1_writedata                               (pio_nF2401_inout_s1_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  pio_nF2401_inout the_pio_nF2401_inout
    (
      .address    (pio_nF2401_inout_s1_address),
      .bidir_port (bidir_port_to_and_from_the_pio_nF2401_inout),
      .chipselect (pio_nF2401_inout_s1_chipselect),
      .clk        (clk_0),
      .readdata   (pio_nF2401_inout_s1_readdata),
      .reset_n    (pio_nF2401_inout_s1_reset_n),
      .write_n    (pio_nF2401_inout_s1_write_n),
      .writedata  (pio_nF2401_inout_s1_writedata)
    );

  pio_nF2401_out_s1_arbitrator the_pio_nF2401_out_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_nF2401_out_s1                 (cpu_0_data_master_granted_pio_nF2401_out_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_nF2401_out_s1       (cpu_0_data_master_qualified_request_pio_nF2401_out_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_nF2401_out_s1         (cpu_0_data_master_read_data_valid_pio_nF2401_out_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pio_nF2401_out_s1                (cpu_0_data_master_requests_pio_nF2401_out_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_pio_nF2401_out_s1_end_xfer                               (d1_pio_nF2401_out_s1_end_xfer),
      .pio_nF2401_out_s1_address                                   (pio_nF2401_out_s1_address),
      .pio_nF2401_out_s1_chipselect                                (pio_nF2401_out_s1_chipselect),
      .pio_nF2401_out_s1_readdata                                  (pio_nF2401_out_s1_readdata),
      .pio_nF2401_out_s1_readdata_from_sa                          (pio_nF2401_out_s1_readdata_from_sa),
      .pio_nF2401_out_s1_reset_n                                   (pio_nF2401_out_s1_reset_n),
      .pio_nF2401_out_s1_write_n                                   (pio_nF2401_out_s1_write_n),
      .pio_nF2401_out_s1_writedata                                 (pio_nF2401_out_s1_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  pio_nF2401_out the_pio_nF2401_out
    (
      .address    (pio_nF2401_out_s1_address),
      .chipselect (pio_nF2401_out_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_pio_nF2401_out),
      .readdata   (pio_nF2401_out_s1_readdata),
      .reset_n    (pio_nF2401_out_s1_reset_n),
      .write_n    (pio_nF2401_out_s1_write_n),
      .writedata  (pio_nF2401_out_s1_writedata)
    );

  pio_reset_9557_s1_arbitrator the_pio_reset_9557_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_reset_9557_s1                 (cpu_0_data_master_granted_pio_reset_9557_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_reset_9557_s1       (cpu_0_data_master_qualified_request_pio_reset_9557_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_reset_9557_s1         (cpu_0_data_master_read_data_valid_pio_reset_9557_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pio_reset_9557_s1                (cpu_0_data_master_requests_pio_reset_9557_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_pio_reset_9557_s1_end_xfer                               (d1_pio_reset_9557_s1_end_xfer),
      .pio_reset_9557_s1_address                                   (pio_reset_9557_s1_address),
      .pio_reset_9557_s1_chipselect                                (pio_reset_9557_s1_chipselect),
      .pio_reset_9557_s1_readdata                                  (pio_reset_9557_s1_readdata),
      .pio_reset_9557_s1_readdata_from_sa                          (pio_reset_9557_s1_readdata_from_sa),
      .pio_reset_9557_s1_reset_n                                   (pio_reset_9557_s1_reset_n),
      .pio_reset_9557_s1_write_n                                   (pio_reset_9557_s1_write_n),
      .pio_reset_9557_s1_writedata                                 (pio_reset_9557_s1_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  pio_reset_9557 the_pio_reset_9557
    (
      .address    (pio_reset_9557_s1_address),
      .chipselect (pio_reset_9557_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_pio_reset_9557),
      .readdata   (pio_reset_9557_s1_readdata),
      .reset_n    (pio_reset_9557_s1_reset_n),
      .write_n    (pio_reset_9557_s1_write_n),
      .writedata  (pio_reset_9557_s1_writedata)
    );

  pio_scl_24_s1_arbitrator the_pio_scl_24_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_scl_24_s1                     (cpu_0_data_master_granted_pio_scl_24_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_scl_24_s1           (cpu_0_data_master_qualified_request_pio_scl_24_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_scl_24_s1             (cpu_0_data_master_read_data_valid_pio_scl_24_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pio_scl_24_s1                    (cpu_0_data_master_requests_pio_scl_24_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_pio_scl_24_s1_end_xfer                                   (d1_pio_scl_24_s1_end_xfer),
      .pio_scl_24_s1_address                                       (pio_scl_24_s1_address),
      .pio_scl_24_s1_chipselect                                    (pio_scl_24_s1_chipselect),
      .pio_scl_24_s1_readdata                                      (pio_scl_24_s1_readdata),
      .pio_scl_24_s1_readdata_from_sa                              (pio_scl_24_s1_readdata_from_sa),
      .pio_scl_24_s1_reset_n                                       (pio_scl_24_s1_reset_n),
      .pio_scl_24_s1_write_n                                       (pio_scl_24_s1_write_n),
      .pio_scl_24_s1_writedata                                     (pio_scl_24_s1_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  pio_scl_24 the_pio_scl_24
    (
      .address    (pio_scl_24_s1_address),
      .chipselect (pio_scl_24_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_pio_scl_24),
      .readdata   (pio_scl_24_s1_readdata),
      .reset_n    (pio_scl_24_s1_reset_n),
      .write_n    (pio_scl_24_s1_write_n),
      .writedata  (pio_scl_24_s1_writedata)
    );

  pio_scl_9557_s1_arbitrator the_pio_scl_9557_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_scl_9557_s1                   (cpu_0_data_master_granted_pio_scl_9557_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_scl_9557_s1         (cpu_0_data_master_qualified_request_pio_scl_9557_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_scl_9557_s1           (cpu_0_data_master_read_data_valid_pio_scl_9557_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pio_scl_9557_s1                  (cpu_0_data_master_requests_pio_scl_9557_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_pio_scl_9557_s1_end_xfer                                 (d1_pio_scl_9557_s1_end_xfer),
      .pio_scl_9557_s1_address                                     (pio_scl_9557_s1_address),
      .pio_scl_9557_s1_chipselect                                  (pio_scl_9557_s1_chipselect),
      .pio_scl_9557_s1_readdata                                    (pio_scl_9557_s1_readdata),
      .pio_scl_9557_s1_readdata_from_sa                            (pio_scl_9557_s1_readdata_from_sa),
      .pio_scl_9557_s1_reset_n                                     (pio_scl_9557_s1_reset_n),
      .pio_scl_9557_s1_write_n                                     (pio_scl_9557_s1_write_n),
      .pio_scl_9557_s1_writedata                                   (pio_scl_9557_s1_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  pio_scl_9557 the_pio_scl_9557
    (
      .address    (pio_scl_9557_s1_address),
      .chipselect (pio_scl_9557_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_pio_scl_9557),
      .readdata   (pio_scl_9557_s1_readdata),
      .reset_n    (pio_scl_9557_s1_reset_n),
      .write_n    (pio_scl_9557_s1_write_n),
      .writedata  (pio_scl_9557_s1_writedata)
    );

  pio_sda_24_s1_arbitrator the_pio_sda_24_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_sda_24_s1                     (cpu_0_data_master_granted_pio_sda_24_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_sda_24_s1           (cpu_0_data_master_qualified_request_pio_sda_24_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_sda_24_s1             (cpu_0_data_master_read_data_valid_pio_sda_24_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pio_sda_24_s1                    (cpu_0_data_master_requests_pio_sda_24_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_pio_sda_24_s1_end_xfer                                   (d1_pio_sda_24_s1_end_xfer),
      .pio_sda_24_s1_address                                       (pio_sda_24_s1_address),
      .pio_sda_24_s1_chipselect                                    (pio_sda_24_s1_chipselect),
      .pio_sda_24_s1_readdata                                      (pio_sda_24_s1_readdata),
      .pio_sda_24_s1_readdata_from_sa                              (pio_sda_24_s1_readdata_from_sa),
      .pio_sda_24_s1_reset_n                                       (pio_sda_24_s1_reset_n),
      .pio_sda_24_s1_write_n                                       (pio_sda_24_s1_write_n),
      .pio_sda_24_s1_writedata                                     (pio_sda_24_s1_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  pio_sda_24 the_pio_sda_24
    (
      .address    (pio_sda_24_s1_address),
      .bidir_port (bidir_port_to_and_from_the_pio_sda_24),
      .chipselect (pio_sda_24_s1_chipselect),
      .clk        (clk_0),
      .readdata   (pio_sda_24_s1_readdata),
      .reset_n    (pio_sda_24_s1_reset_n),
      .write_n    (pio_sda_24_s1_write_n),
      .writedata  (pio_sda_24_s1_writedata)
    );

  pio_sda_9557_s1_arbitrator the_pio_sda_9557_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_sda_9557_s1                   (cpu_0_data_master_granted_pio_sda_9557_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_sda_9557_s1         (cpu_0_data_master_qualified_request_pio_sda_9557_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_sda_9557_s1           (cpu_0_data_master_read_data_valid_pio_sda_9557_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pio_sda_9557_s1                  (cpu_0_data_master_requests_pio_sda_9557_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_pio_sda_9557_s1_end_xfer                                 (d1_pio_sda_9557_s1_end_xfer),
      .pio_sda_9557_s1_address                                     (pio_sda_9557_s1_address),
      .pio_sda_9557_s1_chipselect                                  (pio_sda_9557_s1_chipselect),
      .pio_sda_9557_s1_readdata                                    (pio_sda_9557_s1_readdata),
      .pio_sda_9557_s1_readdata_from_sa                            (pio_sda_9557_s1_readdata_from_sa),
      .pio_sda_9557_s1_reset_n                                     (pio_sda_9557_s1_reset_n),
      .pio_sda_9557_s1_write_n                                     (pio_sda_9557_s1_write_n),
      .pio_sda_9557_s1_writedata                                   (pio_sda_9557_s1_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  pio_sda_9557 the_pio_sda_9557
    (
      .address    (pio_sda_9557_s1_address),
      .bidir_port (bidir_port_to_and_from_the_pio_sda_9557),
      .chipselect (pio_sda_9557_s1_chipselect),
      .clk        (clk_0),
      .readdata   (pio_sda_9557_s1_readdata),
      .reset_n    (pio_sda_9557_s1_reset_n),
      .write_n    (pio_sda_9557_s1_write_n),
      .writedata  (pio_sda_9557_s1_writedata)
    );

  pio_shoot_off_s1_arbitrator the_pio_shoot_off_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_shoot_off_s1                  (cpu_0_data_master_granted_pio_shoot_off_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_shoot_off_s1        (cpu_0_data_master_qualified_request_pio_shoot_off_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_shoot_off_s1          (cpu_0_data_master_read_data_valid_pio_shoot_off_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pio_shoot_off_s1                 (cpu_0_data_master_requests_pio_shoot_off_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .d1_pio_shoot_off_s1_end_xfer                                (d1_pio_shoot_off_s1_end_xfer),
      .pio_shoot_off_s1_address                                    (pio_shoot_off_s1_address),
      .pio_shoot_off_s1_readdata                                   (pio_shoot_off_s1_readdata),
      .pio_shoot_off_s1_readdata_from_sa                           (pio_shoot_off_s1_readdata_from_sa),
      .pio_shoot_off_s1_reset_n                                    (pio_shoot_off_s1_reset_n),
      .reset_n                                                     (clk_0_reset_n)
    );

  pio_shoot_off the_pio_shoot_off
    (
      .address  (pio_shoot_off_s1_address),
      .clk      (clk_0),
      .in_port  (in_port_to_the_pio_shoot_off),
      .readdata (pio_shoot_off_s1_readdata),
      .reset_n  (pio_shoot_off_s1_reset_n)
    );

  sdram_0_s1_arbitrator the_sdram_0_s1
    (
      .clk                                                                (clk_0),
      .cpu_0_data_master_address_to_slave                                 (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                       (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_sdram_0_s1                            (cpu_0_data_master_byteenable_sdram_0_s1),
      .cpu_0_data_master_dbs_address                                      (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                                     (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_granted_sdram_0_s1                               (cpu_0_data_master_granted_sdram_0_s1),
      .cpu_0_data_master_latency_counter                                  (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_sdram_0_s1                     (cpu_0_data_master_qualified_request_sdram_0_s1),
      .cpu_0_data_master_read                                             (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sdram_0_s1                       (cpu_0_data_master_read_data_valid_sdram_0_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register        (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_sdram_0_s1                              (cpu_0_data_master_requests_sdram_0_s1),
      .cpu_0_data_master_write                                            (cpu_0_data_master_write),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                               (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_sdram_0_s1                        (cpu_0_instruction_master_granted_sdram_0_s1),
      .cpu_0_instruction_master_latency_counter                           (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_sdram_0_s1              (cpu_0_instruction_master_qualified_request_sdram_0_s1),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1                (cpu_0_instruction_master_read_data_valid_sdram_0_s1),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_instruction_master_requests_sdram_0_s1                       (cpu_0_instruction_master_requests_sdram_0_s1),
      .d1_sdram_0_s1_end_xfer                                             (d1_sdram_0_s1_end_xfer),
      .reset_n                                                            (clk_0_reset_n),
      .sdram_0_s1_address                                                 (sdram_0_s1_address),
      .sdram_0_s1_byteenable_n                                            (sdram_0_s1_byteenable_n),
      .sdram_0_s1_chipselect                                              (sdram_0_s1_chipselect),
      .sdram_0_s1_read_n                                                  (sdram_0_s1_read_n),
      .sdram_0_s1_readdata                                                (sdram_0_s1_readdata),
      .sdram_0_s1_readdata_from_sa                                        (sdram_0_s1_readdata_from_sa),
      .sdram_0_s1_readdatavalid                                           (sdram_0_s1_readdatavalid),
      .sdram_0_s1_reset_n                                                 (sdram_0_s1_reset_n),
      .sdram_0_s1_waitrequest                                             (sdram_0_s1_waitrequest),
      .sdram_0_s1_waitrequest_from_sa                                     (sdram_0_s1_waitrequest_from_sa),
      .sdram_0_s1_write_n                                                 (sdram_0_s1_write_n),
      .sdram_0_s1_writedata                                               (sdram_0_s1_writedata)
    );

  sdram_0 the_sdram_0
    (
      .az_addr        (sdram_0_s1_address),
      .az_be_n        (sdram_0_s1_byteenable_n),
      .az_cs          (sdram_0_s1_chipselect),
      .az_data        (sdram_0_s1_writedata),
      .az_rd_n        (sdram_0_s1_read_n),
      .az_wr_n        (sdram_0_s1_write_n),
      .clk            (clk_0),
      .reset_n        (sdram_0_s1_reset_n),
      .za_data        (sdram_0_s1_readdata),
      .za_valid       (sdram_0_s1_readdatavalid),
      .za_waitrequest (sdram_0_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_sdram_0),
      .zs_ba          (zs_ba_from_the_sdram_0),
      .zs_cas_n       (zs_cas_n_from_the_sdram_0),
      .zs_cke         (zs_cke_from_the_sdram_0),
      .zs_cs_n        (zs_cs_n_from_the_sdram_0),
      .zs_dq          (zs_dq_to_and_from_the_sdram_0),
      .zs_dqm         (zs_dqm_from_the_sdram_0),
      .zs_ras_n       (zs_ras_n_from_the_sdram_0),
      .zs_we_n        (zs_we_n_from_the_sdram_0)
    );

  shoot_timer_chip_avalon_slave_0_arbitrator the_shoot_timer_chip_avalon_slave_0
    (
      .clk                                                                 (clk_0),
      .cpu_0_data_master_address_to_slave                                  (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0           (cpu_0_data_master_granted_shoot_timer_chip_avalon_slave_0),
      .cpu_0_data_master_latency_counter                                   (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0 (cpu_0_data_master_qualified_request_shoot_timer_chip_avalon_slave_0),
      .cpu_0_data_master_read                                              (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register         (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_read_data_valid_shoot_timer_chip_avalon_slave_0   (cpu_0_data_master_read_data_valid_shoot_timer_chip_avalon_slave_0),
      .cpu_0_data_master_requests_shoot_timer_chip_avalon_slave_0          (cpu_0_data_master_requests_shoot_timer_chip_avalon_slave_0),
      .cpu_0_data_master_write                                             (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                         (cpu_0_data_master_writedata),
      .d1_shoot_timer_chip_avalon_slave_0_end_xfer                         (d1_shoot_timer_chip_avalon_slave_0_end_xfer),
      .reset_n                                                             (clk_0_reset_n),
      .shoot_timer_chip_avalon_slave_0_read_n                              (shoot_timer_chip_avalon_slave_0_read_n),
      .shoot_timer_chip_avalon_slave_0_readdata                            (shoot_timer_chip_avalon_slave_0_readdata),
      .shoot_timer_chip_avalon_slave_0_readdata_from_sa                    (shoot_timer_chip_avalon_slave_0_readdata_from_sa),
      .shoot_timer_chip_avalon_slave_0_reset_n                             (shoot_timer_chip_avalon_slave_0_reset_n),
      .shoot_timer_chip_avalon_slave_0_write_n                             (shoot_timer_chip_avalon_slave_0_write_n),
      .shoot_timer_chip_avalon_slave_0_writedata                           (shoot_timer_chip_avalon_slave_0_writedata)
    );

  shoot_timer_chip the_shoot_timer_chip
    (
      .Dout   (Dout_from_the_shoot_timer_chip),
      .clk    (clk_0),
      .rd_n   (shoot_timer_chip_avalon_slave_0_read_n),
      .rddata (shoot_timer_chip_avalon_slave_0_readdata),
      .reset  (shoot_timer_chip_avalon_slave_0_reset_n),
      .wr_n   (shoot_timer_chip_avalon_slave_0_write_n),
      .wrdata (shoot_timer_chip_avalon_slave_0_writedata)
    );

  shoot_timer_shoot_avalon_slave_0_arbitrator the_shoot_timer_shoot_avalon_slave_0
    (
      .clk                                                                  (clk_0),
      .cpu_0_data_master_address_to_slave                                   (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0           (cpu_0_data_master_granted_shoot_timer_shoot_avalon_slave_0),
      .cpu_0_data_master_latency_counter                                    (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0 (cpu_0_data_master_qualified_request_shoot_timer_shoot_avalon_slave_0),
      .cpu_0_data_master_read                                               (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register          (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_read_data_valid_shoot_timer_shoot_avalon_slave_0   (cpu_0_data_master_read_data_valid_shoot_timer_shoot_avalon_slave_0),
      .cpu_0_data_master_requests_shoot_timer_shoot_avalon_slave_0          (cpu_0_data_master_requests_shoot_timer_shoot_avalon_slave_0),
      .cpu_0_data_master_write                                              (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                          (cpu_0_data_master_writedata),
      .d1_shoot_timer_shoot_avalon_slave_0_end_xfer                         (d1_shoot_timer_shoot_avalon_slave_0_end_xfer),
      .reset_n                                                              (clk_0_reset_n),
      .shoot_timer_shoot_avalon_slave_0_read_n                              (shoot_timer_shoot_avalon_slave_0_read_n),
      .shoot_timer_shoot_avalon_slave_0_readdata                            (shoot_timer_shoot_avalon_slave_0_readdata),
      .shoot_timer_shoot_avalon_slave_0_readdata_from_sa                    (shoot_timer_shoot_avalon_slave_0_readdata_from_sa),
      .shoot_timer_shoot_avalon_slave_0_reset_n                             (shoot_timer_shoot_avalon_slave_0_reset_n),
      .shoot_timer_shoot_avalon_slave_0_write_n                             (shoot_timer_shoot_avalon_slave_0_write_n),
      .shoot_timer_shoot_avalon_slave_0_writedata                           (shoot_timer_shoot_avalon_slave_0_writedata)
    );

  shoot_timer_shoot the_shoot_timer_shoot
    (
      .Dout   (Dout_from_the_shoot_timer_shoot),
      .clk    (clk_0),
      .rd_n   (shoot_timer_shoot_avalon_slave_0_read_n),
      .rddata (shoot_timer_shoot_avalon_slave_0_readdata),
      .reset  (shoot_timer_shoot_avalon_slave_0_reset_n),
      .wr_n   (shoot_timer_shoot_avalon_slave_0_write_n),
      .wrdata (shoot_timer_shoot_avalon_slave_0_writedata)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_sysid_control_slave               (cpu_0_data_master_granted_sysid_control_slave),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_sysid_control_slave     (cpu_0_data_master_qualified_request_sysid_control_slave),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_read_data_valid_sysid_control_slave       (cpu_0_data_master_read_data_valid_sysid_control_slave),
      .cpu_0_data_master_requests_sysid_control_slave              (cpu_0_data_master_requests_sysid_control_slave),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .d1_sysid_control_slave_end_xfer                             (d1_sysid_control_slave_end_xfer),
      .reset_n                                                     (clk_0_reset_n),
      .sysid_control_slave_address                                 (sysid_control_slave_address),
      .sysid_control_slave_readdata                                (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                        (sysid_control_slave_readdata_from_sa)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .readdata (sysid_control_slave_readdata)
    );

  timer_0_s1_arbitrator the_timer_0_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_timer_0_s1                        (cpu_0_data_master_granted_timer_0_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_timer_0_s1              (cpu_0_data_master_qualified_request_timer_0_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_read_data_valid_timer_0_s1                (cpu_0_data_master_read_data_valid_timer_0_s1),
      .cpu_0_data_master_requests_timer_0_s1                       (cpu_0_data_master_requests_timer_0_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_timer_0_s1_end_xfer                                      (d1_timer_0_s1_end_xfer),
      .reset_n                                                     (clk_0_reset_n),
      .timer_0_s1_address                                          (timer_0_s1_address),
      .timer_0_s1_chipselect                                       (timer_0_s1_chipselect),
      .timer_0_s1_irq                                              (timer_0_s1_irq),
      .timer_0_s1_irq_from_sa                                      (timer_0_s1_irq_from_sa),
      .timer_0_s1_readdata                                         (timer_0_s1_readdata),
      .timer_0_s1_readdata_from_sa                                 (timer_0_s1_readdata_from_sa),
      .timer_0_s1_reset_n                                          (timer_0_s1_reset_n),
      .timer_0_s1_write_n                                          (timer_0_s1_write_n),
      .timer_0_s1_writedata                                        (timer_0_s1_writedata)
    );

  timer_0 the_timer_0
    (
      .address    (timer_0_s1_address),
      .chipselect (timer_0_s1_chipselect),
      .clk        (clk_0),
      .irq        (timer_0_s1_irq),
      .readdata   (timer_0_s1_readdata),
      .reset_n    (timer_0_s1_reset_n),
      .write_n    (timer_0_s1_write_n),
      .writedata  (timer_0_s1_writedata)
    );

  timer_watchdog_s1_arbitrator the_timer_watchdog_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_timer_watchdog_s1                 (cpu_0_data_master_granted_timer_watchdog_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_timer_watchdog_s1       (cpu_0_data_master_qualified_request_timer_watchdog_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_read_data_valid_timer_watchdog_s1         (cpu_0_data_master_read_data_valid_timer_watchdog_s1),
      .cpu_0_data_master_requests_timer_watchdog_s1                (cpu_0_data_master_requests_timer_watchdog_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_timer_watchdog_s1_end_xfer                               (d1_timer_watchdog_s1_end_xfer),
      .reset_n                                                     (clk_0_reset_n),
      .timer_watchdog_s1_address                                   (timer_watchdog_s1_address),
      .timer_watchdog_s1_chipselect                                (timer_watchdog_s1_chipselect),
      .timer_watchdog_s1_irq                                       (timer_watchdog_s1_irq),
      .timer_watchdog_s1_irq_from_sa                               (timer_watchdog_s1_irq_from_sa),
      .timer_watchdog_s1_readdata                                  (timer_watchdog_s1_readdata),
      .timer_watchdog_s1_readdata_from_sa                          (timer_watchdog_s1_readdata_from_sa),
      .timer_watchdog_s1_reset_n                                   (timer_watchdog_s1_reset_n),
      .timer_watchdog_s1_resetrequest                              (timer_watchdog_s1_resetrequest),
      .timer_watchdog_s1_resetrequest_from_sa                      (timer_watchdog_s1_resetrequest_from_sa),
      .timer_watchdog_s1_write_n                                   (timer_watchdog_s1_write_n),
      .timer_watchdog_s1_writedata                                 (timer_watchdog_s1_writedata)
    );

  timer_watchdog the_timer_watchdog
    (
      .address      (timer_watchdog_s1_address),
      .chipselect   (timer_watchdog_s1_chipselect),
      .clk          (clk_0),
      .irq          (timer_watchdog_s1_irq),
      .readdata     (timer_watchdog_s1_readdata),
      .reset_n      (timer_watchdog_s1_reset_n),
      .resetrequest (timer_watchdog_s1_resetrequest),
      .write_n      (timer_watchdog_s1_write_n),
      .writedata    (timer_watchdog_s1_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  SMALL14_CPU_reset_clk_0_domain_synch_module SMALL14_CPU_reset_clk_0_domain_synch
    (
      .clk      (clk_0),
      .data_in  (1'b1),
      .data_out (clk_0_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    cpu_0_jtag_debug_module_resetrequest_from_sa |
    cpu_0_jtag_debug_module_resetrequest_from_sa |
    timer_watchdog_s1_resetrequest_from_sa |
    timer_watchdog_s1_resetrequest_from_sa);


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/91/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/91/quartus/eda/sim_lib/220model.v"
`include "c:/altera/91/quartus/eda/sim_lib/sgate.v"
`include "motor.v"
`include "motor_4.v"
`include "motor_0.v"
`include "motor_2.v"
`include "motor_1.v"
`include "shoot_timer.v"
`include "shoot_timer_chip.v"
`include "adgetnew2.v"
`include "adgetnew2_0.v"
`include "shoot_timer_shoot.v"
`include "motor_3.v"
`include "PWM_2.v"
`include "PWM_2_infra_pwm.v"
`include "pio_nF2401_in.v"
`include "pio_hull_fault1.v"
`include "timer_0.v"
`include "sysid.v"
`include "cpu_0_test_bench.v"
`include "cpu_0_mult_cell.v"
`include "cpu_0_oci_test_bench.v"
`include "cpu_0_jtag_debug_module_tck.v"
`include "cpu_0_jtag_debug_module_sysclk.v"
`include "cpu_0_jtag_debug_module_wrapper.v"
`include "cpu_0.v"
`include "pio_reset_9557.v"
`include "pio_nF2401_inout.v"
`include "jtag_uart_0.v"
`include "sdram_0.v"
`include "sdram_0_test_component.v"
`include "pio_infra.v"
`include "pio_sda_9557.v"
`include "epcs_flash_controller_0.v"
`include "pio_nF2401_out.v"
`include "pio_shoot_off.v"
`include "pio_hull_fault4.v"
`include "timer_watchdog.v"
`include "pio_led.v"
`include "pio_scl_9557.v"
`include "pio_sda_24.v"
`include "pio_scl_24.v"
`include "pio_buzzer.v"
`include "pio_hull_fault3.v"
`include "pio_hull_fault2.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire    [ 31: 0] A_from_the_motor_0;
  wire    [ 31: 0] A_from_the_motor_1;
  wire    [ 31: 0] A_from_the_motor_2;
  wire    [ 31: 0] A_from_the_motor_3;
  wire    [ 31: 0] A_from_the_motor_4;
  wire    [ 31: 0] B_from_the_motor_0;
  wire    [ 31: 0] B_from_the_motor_1;
  wire    [ 31: 0] B_from_the_motor_2;
  wire    [ 31: 0] B_from_the_motor_3;
  wire    [ 31: 0] B_from_the_motor_4;
  wire             Dout_from_the_shoot_timer_chip;
  wire             Dout_from_the_shoot_timer_shoot;
  wire             Z_Brushless_from_the_motor_0;
  wire             Z_Brushless_from_the_motor_1;
  wire             Z_Brushless_from_the_motor_2;
  wire             Z_Brushless_from_the_motor_3;
  wire             Z_Brushless_from_the_motor_4;
  wire             Z_OpenLoop_from_the_motor_0;
  wire             Z_OpenLoop_from_the_motor_1;
  wire             Z_OpenLoop_from_the_motor_2;
  wire             Z_OpenLoop_from_the_motor_3;
  wire             Z_OpenLoop_from_the_motor_4;
  wire    [  2: 0] bidir_port_to_and_from_the_pio_nF2401_inout;
  wire             bidir_port_to_and_from_the_pio_sda_24;
  wire             bidir_port_to_and_from_the_pio_sda_9557;
  wire             clk;
  reg              clk_0;
  wire             clk_out_from_the_adgetnew2_0;
  wire    [ 31: 0] code0_to_the_motor_0;
  wire    [ 31: 0] code0_to_the_motor_1;
  wire    [ 31: 0] code0_to_the_motor_2;
  wire    [ 31: 0] code0_to_the_motor_3;
  wire    [ 31: 0] code0_to_the_motor_4;
  wire    [ 31: 0] code1_to_the_motor_0;
  wire    [ 31: 0] code1_to_the_motor_1;
  wire    [ 31: 0] code1_to_the_motor_2;
  wire    [ 31: 0] code1_to_the_motor_3;
  wire    [ 31: 0] code1_to_the_motor_4;
  wire    [ 31: 0] code2_to_the_motor_0;
  wire    [ 31: 0] code2_to_the_motor_1;
  wire    [ 31: 0] code2_to_the_motor_2;
  wire    [ 31: 0] code2_to_the_motor_3;
  wire    [ 31: 0] code2_to_the_motor_4;
  wire    [ 31: 0] code3_to_the_motor_0;
  wire    [ 31: 0] code3_to_the_motor_1;
  wire    [ 31: 0] code3_to_the_motor_2;
  wire    [ 31: 0] code3_to_the_motor_3;
  wire    [ 31: 0] code3_to_the_motor_4;
  wire             cs_from_the_adgetnew2_0;
  wire             data0_to_the_epcs_flash_controller_0;
  wire             dclk_from_the_epcs_flash_controller_0;
  wire             din_from_the_adgetnew2_0;
  wire             dir_out_from_the_PWM_2_infra_pwm;
  wire             dout_to_the_adgetnew2_0;
  wire             epcs_flash_controller_0_epcs_control_port_dataavailable_from_sa;
  wire             epcs_flash_controller_0_epcs_control_port_endofpacket_from_sa;
  wire             epcs_flash_controller_0_epcs_control_port_readyfordata_from_sa;
  wire             in_port_to_the_pio_hull_fault1;
  wire             in_port_to_the_pio_hull_fault2;
  wire             in_port_to_the_pio_hull_fault3;
  wire             in_port_to_the_pio_hull_fault4;
  wire             in_port_to_the_pio_infra;
  wire             in_port_to_the_pio_nF2401_in;
  wire             in_port_to_the_pio_shoot_off;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire             out_port_from_the_pio_buzzer;
  wire    [  1: 0] out_port_from_the_pio_led;
  wire    [  2: 0] out_port_from_the_pio_nF2401_out;
  wire             out_port_from_the_pio_reset_9557;
  wire             out_port_from_the_pio_scl_24;
  wire             out_port_from_the_pio_scl_9557;
  wire             pwm_from_the_PWM_2_infra_pwm;
  reg              reset_n;
  wire             sars_to_the_adgetnew2_0;
  wire             sce_from_the_epcs_flash_controller_0;
  wire             sdo_from_the_epcs_flash_controller_0;
  wire    [ 31: 0] set_from_the_motor_0;
  wire    [ 31: 0] set_from_the_motor_1;
  wire    [ 31: 0] set_from_the_motor_2;
  wire    [ 31: 0] set_from_the_motor_3;
  wire    [ 31: 0] set_from_the_motor_4;
  wire    [ 11: 0] zs_addr_from_the_sdram_0;
  wire    [  1: 0] zs_ba_from_the_sdram_0;
  wire             zs_cas_n_from_the_sdram_0;
  wire             zs_cke_from_the_sdram_0;
  wire             zs_cs_n_from_the_sdram_0;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram_0;
  wire    [  1: 0] zs_dqm_from_the_sdram_0;
  wire             zs_ras_n_from_the_sdram_0;
  wire             zs_we_n_from_the_sdram_0;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  SMALL14_CPU DUT
    (
      .A_from_the_motor_0                          (A_from_the_motor_0),
      .A_from_the_motor_1                          (A_from_the_motor_1),
      .A_from_the_motor_2                          (A_from_the_motor_2),
      .A_from_the_motor_3                          (A_from_the_motor_3),
      .A_from_the_motor_4                          (A_from_the_motor_4),
      .B_from_the_motor_0                          (B_from_the_motor_0),
      .B_from_the_motor_1                          (B_from_the_motor_1),
      .B_from_the_motor_2                          (B_from_the_motor_2),
      .B_from_the_motor_3                          (B_from_the_motor_3),
      .B_from_the_motor_4                          (B_from_the_motor_4),
      .Dout_from_the_shoot_timer_chip              (Dout_from_the_shoot_timer_chip),
      .Dout_from_the_shoot_timer_shoot             (Dout_from_the_shoot_timer_shoot),
      .Z_Brushless_from_the_motor_0                (Z_Brushless_from_the_motor_0),
      .Z_Brushless_from_the_motor_1                (Z_Brushless_from_the_motor_1),
      .Z_Brushless_from_the_motor_2                (Z_Brushless_from_the_motor_2),
      .Z_Brushless_from_the_motor_3                (Z_Brushless_from_the_motor_3),
      .Z_Brushless_from_the_motor_4                (Z_Brushless_from_the_motor_4),
      .Z_OpenLoop_from_the_motor_0                 (Z_OpenLoop_from_the_motor_0),
      .Z_OpenLoop_from_the_motor_1                 (Z_OpenLoop_from_the_motor_1),
      .Z_OpenLoop_from_the_motor_2                 (Z_OpenLoop_from_the_motor_2),
      .Z_OpenLoop_from_the_motor_3                 (Z_OpenLoop_from_the_motor_3),
      .Z_OpenLoop_from_the_motor_4                 (Z_OpenLoop_from_the_motor_4),
      .bidir_port_to_and_from_the_pio_nF2401_inout (bidir_port_to_and_from_the_pio_nF2401_inout),
      .bidir_port_to_and_from_the_pio_sda_24       (bidir_port_to_and_from_the_pio_sda_24),
      .bidir_port_to_and_from_the_pio_sda_9557     (bidir_port_to_and_from_the_pio_sda_9557),
      .clk_0                                       (clk_0),
      .clk_out_from_the_adgetnew2_0                (clk_out_from_the_adgetnew2_0),
      .code0_to_the_motor_0                        (code0_to_the_motor_0),
      .code0_to_the_motor_1                        (code0_to_the_motor_1),
      .code0_to_the_motor_2                        (code0_to_the_motor_2),
      .code0_to_the_motor_3                        (code0_to_the_motor_3),
      .code0_to_the_motor_4                        (code0_to_the_motor_4),
      .code1_to_the_motor_0                        (code1_to_the_motor_0),
      .code1_to_the_motor_1                        (code1_to_the_motor_1),
      .code1_to_the_motor_2                        (code1_to_the_motor_2),
      .code1_to_the_motor_3                        (code1_to_the_motor_3),
      .code1_to_the_motor_4                        (code1_to_the_motor_4),
      .code2_to_the_motor_0                        (code2_to_the_motor_0),
      .code2_to_the_motor_1                        (code2_to_the_motor_1),
      .code2_to_the_motor_2                        (code2_to_the_motor_2),
      .code2_to_the_motor_3                        (code2_to_the_motor_3),
      .code2_to_the_motor_4                        (code2_to_the_motor_4),
      .code3_to_the_motor_0                        (code3_to_the_motor_0),
      .code3_to_the_motor_1                        (code3_to_the_motor_1),
      .code3_to_the_motor_2                        (code3_to_the_motor_2),
      .code3_to_the_motor_3                        (code3_to_the_motor_3),
      .code3_to_the_motor_4                        (code3_to_the_motor_4),
      .cs_from_the_adgetnew2_0                     (cs_from_the_adgetnew2_0),
      .data0_to_the_epcs_flash_controller_0        (data0_to_the_epcs_flash_controller_0),
      .dclk_from_the_epcs_flash_controller_0       (dclk_from_the_epcs_flash_controller_0),
      .din_from_the_adgetnew2_0                    (din_from_the_adgetnew2_0),
      .dir_out_from_the_PWM_2_infra_pwm            (dir_out_from_the_PWM_2_infra_pwm),
      .dout_to_the_adgetnew2_0                     (dout_to_the_adgetnew2_0),
      .in_port_to_the_pio_hull_fault1              (in_port_to_the_pio_hull_fault1),
      .in_port_to_the_pio_hull_fault2              (in_port_to_the_pio_hull_fault2),
      .in_port_to_the_pio_hull_fault3              (in_port_to_the_pio_hull_fault3),
      .in_port_to_the_pio_hull_fault4              (in_port_to_the_pio_hull_fault4),
      .in_port_to_the_pio_infra                    (in_port_to_the_pio_infra),
      .in_port_to_the_pio_nF2401_in                (in_port_to_the_pio_nF2401_in),
      .in_port_to_the_pio_shoot_off                (in_port_to_the_pio_shoot_off),
      .out_port_from_the_pio_buzzer                (out_port_from_the_pio_buzzer),
      .out_port_from_the_pio_led                   (out_port_from_the_pio_led),
      .out_port_from_the_pio_nF2401_out            (out_port_from_the_pio_nF2401_out),
      .out_port_from_the_pio_reset_9557            (out_port_from_the_pio_reset_9557),
      .out_port_from_the_pio_scl_24                (out_port_from_the_pio_scl_24),
      .out_port_from_the_pio_scl_9557              (out_port_from_the_pio_scl_9557),
      .pwm_from_the_PWM_2_infra_pwm                (pwm_from_the_PWM_2_infra_pwm),
      .reset_n                                     (reset_n),
      .sars_to_the_adgetnew2_0                     (sars_to_the_adgetnew2_0),
      .sce_from_the_epcs_flash_controller_0        (sce_from_the_epcs_flash_controller_0),
      .sdo_from_the_epcs_flash_controller_0        (sdo_from_the_epcs_flash_controller_0),
      .set_from_the_motor_0                        (set_from_the_motor_0),
      .set_from_the_motor_1                        (set_from_the_motor_1),
      .set_from_the_motor_2                        (set_from_the_motor_2),
      .set_from_the_motor_3                        (set_from_the_motor_3),
      .set_from_the_motor_4                        (set_from_the_motor_4),
      .zs_addr_from_the_sdram_0                    (zs_addr_from_the_sdram_0),
      .zs_ba_from_the_sdram_0                      (zs_ba_from_the_sdram_0),
      .zs_cas_n_from_the_sdram_0                   (zs_cas_n_from_the_sdram_0),
      .zs_cke_from_the_sdram_0                     (zs_cke_from_the_sdram_0),
      .zs_cs_n_from_the_sdram_0                    (zs_cs_n_from_the_sdram_0),
      .zs_dq_to_and_from_the_sdram_0               (zs_dq_to_and_from_the_sdram_0),
      .zs_dqm_from_the_sdram_0                     (zs_dqm_from_the_sdram_0),
      .zs_ras_n_from_the_sdram_0                   (zs_ras_n_from_the_sdram_0),
      .zs_we_n_from_the_sdram_0                    (zs_we_n_from_the_sdram_0)
    );

  sdram_0_test_component the_sdram_0_test_component
    (
      .clk      (clk_0),
      .zs_addr  (zs_addr_from_the_sdram_0),
      .zs_ba    (zs_ba_from_the_sdram_0),
      .zs_cas_n (zs_cas_n_from_the_sdram_0),
      .zs_cke   (zs_cke_from_the_sdram_0),
      .zs_cs_n  (zs_cs_n_from_the_sdram_0),
      .zs_dq    (zs_dq_to_and_from_the_sdram_0),
      .zs_dqm   (zs_dqm_from_the_sdram_0),
      .zs_ras_n (zs_ras_n_from_the_sdram_0),
      .zs_we_n  (zs_we_n_from_the_sdram_0)
    );

  initial
    clk_0 = 1'b0;
  always
    #10 clk_0 <= ~clk_0;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on