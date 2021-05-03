`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2020 03:52:49 PM
// Design Name: 
// Module Name: swipt_toplevel
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module swipt_toplevel #(

        // Student parameters start
        
        // Student parameters end
        
        // Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S_AXI_DATA_WIDTH	= 32
	)
	(
	input wire clk,
	input wire nrst,
	input wire [C_S_AXI_DATA_WIDTH-1:0] din_0,
	input wire [C_S_AXI_DATA_WIDTH-1:0] din_1,
	input wire [C_S_AXI_DATA_WIDTH-1:0] din_2,
	input wire [C_S_AXI_DATA_WIDTH-1:0] din_3,
	input wire [C_S_AXI_DATA_WIDTH-1:0] din_4,
    input wire [C_S_AXI_DATA_WIDTH-1:0] din_5,
    input wire [C_S_AXI_DATA_WIDTH-1:0] din_6,
    input wire [C_S_AXI_DATA_WIDTH-1:0] din_7,
	input wire [11:0] ADC_in,
	output wire SWIPT_OUT0,
	output wire SWIPT_OUT1,
	output wire SWIPT_OUT2,
	output wire SWIPT_OUT3,
	input wire swiptONHeartbeat,
	output wire [31:0] db_port_0,
    output wire [31:0] db_port_1,
    output wire [31:0] db_port_2,
    output wire [31:0] db_port_3,
    output wire [31:0] db_port_4,
    output wire [31:0] db_port_5,
    output wire [31:0] db_port_6,
    output wire [31:0] db_port_7,
    input wire db_port_switchADC_in
	);
	
	//-----------------------------//
	// TA heartbeat implementation //
	// Experimental at this point  //
	// Update status after testing //
	//-----------------------------//
	reg [23:0] heartbeatCounter;
	// oldheartbeat should be zero on startup!
	reg oldheartbeat = 0;
	// swiptAlive should be zero on startup!
    reg swiptAlive = 0;
	wire heartbeatEdge;
	
	// Edge detection on the heartbeat signal
	assign heartbeatEdge = swiptONHeartbeat ^ oldheartbeat;
	
	always @(posedge clk) begin
	
	   // Keep track of the heartbeat value of the previous cycle for the edge detection	
	   oldheartbeat <= swiptONHeartbeat;
	
	   // Synchronous reset
	   if (~nrst) begin
	       heartbeatCounter <= 0;
	       swiptAlive <= 0;
	   end
	   // Actual heartbeat logic
	   else begin
	       // On a new heartbeatEdge, swipt is live and counter is reset
	       if(heartbeatEdge) begin
	           heartbeatCounter <= 0;
	           swiptAlive <= 1;
	       end
	       else begin
	           // If last heartbeat more than 1m cycles ago, swipt is dead. DO NOT COUNT TO AVOID OVERFLOW OF COUNTER
	           if(heartbeatCounter >= 1000000) begin
	               swiptAlive <= 0;	         
	           end
	           // Increment counter
	           else begin
	               heartbeatCounter <= heartbeatCounter + 1;
	           end
	       end
	   end
	end
	
	// From here it is upto you (replace 1'b0 with something more usefull). Write the HDL that makes the power&data transfer work!
	// Ensure that you only activate the SWIPT_OUTs when the time is right! 
	// Do not trust the swiptAlive value to do this for you, this is a backup mechanism!

	wire [31:0] db_port_0; //o_freq
	wire [31:0] o_db_state; //db_state
	wire [31:0] o_db_index_delta; //db_index_delta
	wire [31:0] o_db_flag; //db_flag
	wire [31:0] o_db_recursion_depth;
	wire [31:0] db_port_5; 
	wire [31:0] db_port_6;
	wire [31:0] db_port_7;


wire [11:0] o_max;
wire [31:0] o_freq;
wire o_enable;

//    EnvelopeFollower inst_EnvelopeFollower(
//        .i_clk(clk),
//        .i_adc(ADC_in),
//        //.o_min(),
//        .o_max(o_max)
    
//        );

	Boxcar inst_Boxcar (
		.i_clk (clk),
		.i_reset (~nrst),
		.i_sample (ADC_in),
		.o_result (),
		.o_avg_result(o_max)
	);   
        
    assign db_port_5 = o_max;
         
    FrequencyTrackerII inst_FrequencyTrackerII(
    	.i_clk(clk),
    	.i_envelope_max(o_max),
    	.o_freq(o_freq),
    	.o_enable(o_enable),
    	.o_db_state(o_db_state),
    	.o_db_index_delta(o_db_index_delta),
    	.o_db_substate(o_db_substate),
    	.o_db_recursion_depth(o_db_recursion_depth)
    	);
    

	
	wire pwm_t_adc_s1;
    wire pwm_t_adc_s2;
    wire pwm_t_adc_s3;
    wire pwm_t_adc_s4;
	
	Pwm inst_Pwm (
        .i_clk (clk),
        //.i_nrst (nrst),
        .i_enable (o_enable),
        //.i_data (data_bg_t),
        .i_freq (o_freq) ,

        .o_s1 (pwm_t_adc_s1),
        .o_s2 (pwm_t_adc_s2),
        .o_s3 (pwm_t_adc_s3),
        .o_s4 (pwm_t_adc_s4)
        );	
	
	assign SWIPT_OUT0 = pwm_t_adc_s1;
	assign SWIPT_OUT1 = pwm_t_adc_s2;
	assign SWIPT_OUT2 = pwm_t_adc_s3;
	assign SWIPT_OUT3 = pwm_t_adc_s4;
	
	assign db_port_0 = o_freq;
    assign db_port_1 = o_db_state;
    assign db_port_2 = o_db_index_delta;
    assign db_port_3 = o_db_substate;
    assign db_port_4 = o_db_recursion_depth;
    //assign db_port_5 = 32'd500;
    //assign db_port_6 = 32'd600;
    //assign db_port_7 = 32'd700;
	

endmodule