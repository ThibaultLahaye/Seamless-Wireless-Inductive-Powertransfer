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
    input wire [C_S_AXI_DATA_WIDTH-1:0] din_5, //Data
    input wire [C_S_AXI_DATA_WIDTH-1:0] din_6, //Data Mode
    input wire [C_S_AXI_DATA_WIDTH-1:0] din_7, //Inductive Mode
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
    output wire [31:0] db_port_5, //Data Pattern
    //output wire [31:0] i_data_mode, //Data Mode Signal
    //input wire [31:0] db_port_7, //Inductive Mode Signal 
    input wire db_port_switchADC_in
    //input wire [31:0] i_inductive_mode
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

    wire [11:0] o_max;
    wire [31:0] o_freq;
    wire o_enable;
    wire state;
    wire data;
    wire lock;
    
    wire [11:0] ADC_in_comp;

    assign ADC_in_comp = ADC_in[11] ? ~ADC_in : ADC_in;
    
	Boxcar inst_Boxcar (
		.i_clk (clk),
		.i_reset (~nrst),
		.i_sample (ADC_in_comp),
		.o_result (),
		.o_avg_result(o_max)
	);   
        
    wire [31:0] o_db_state;
    wire [31:0] o_db_index_delta;
    wire [31:0] o_db_delta_freq;     
    
	wire [31:0] tss_verbinding;
    wire [31:0] verbinding;        
         
    FrequencyTrackerII inst_FrequencyTrackerII(
    	.i_clk(clk),
    	.i_inductive_mode(din_7[0]), //din_7[0]
    	.i_envelope_max(o_max),
    	.o_freq(tss_verbinding),
    	.o_enable(o_enable),
    	.o_lock (lock),
    	.o_db_state(o_db_state),
    	.o_db_index_delta(o_db_index_delta),
    	.o_db_delta_freq(o_db_delta_freq)
    	);
    	
	wire pwm_t_adc_s1;
    wire pwm_t_adc_s2;
    wire pwm_t_adc_s3;
    wire pwm_t_adc_s4;
	
	wire o_db_i_data;
	
	
	Devidor inst_Devidor (
        .clk (clk),
        .rst (nrst),
        .a (32'd100000000),
        .b (tss_verbinding),
        .vld (1'b1),
        .quo (verbinding),
        .rem (),
        .ack ()
    );	
	
	PwmIII inst_PwmIII (
        .i_clk (clk),
        .i_nrst (nrst),
        .i_enable (o_enable),
        .i_lock (lock),
        .i_freq (verbinding) ,
        .i_data_mode (din_6[0]),//din_6[0],
        .i_data_l (din_5),

        .o_s1 (pwm_t_adc_s1),
        .o_s2 (pwm_t_adc_s2),
        .o_s3 (pwm_t_adc_s3),
        .o_s4 (pwm_t_adc_s4),
        .o_db_i_data (o_db_i_data)
        );	
	
	assign SWIPT_OUT0 = din_7[0] ? pwm_t_adc_s1 : 1'b0; //din_7[0]
	assign SWIPT_OUT1 = din_7[0] ? pwm_t_adc_s2 : 1'b0;
	assign SWIPT_OUT2 = din_7[0] ? pwm_t_adc_s3 : 1'b0;
	assign SWIPT_OUT3 = din_7[0] ? pwm_t_adc_s4 : 1'b0;
	
	assign db_port_0 = o_db_state;
    assign db_port_1 = o_max;
    assign db_port_2 = tss_verbinding;
    assign db_port_3 = verbinding; 
    assign db_port_4 = o_db_i_data;
    assign db_port_5 = o_db_delta_freq;
    //assign db_port_6 = 0;
    //assign db_port_7 = 0;

endmodule
