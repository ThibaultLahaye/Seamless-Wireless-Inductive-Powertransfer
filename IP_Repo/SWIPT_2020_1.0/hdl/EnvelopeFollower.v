`timescale 1ns/1ps

//-----------------------------------------------------------------------------
// Copyright (C) 2014 iZsh <izsh at fail0verflow.com>
//
// This code is licensed to you under the terms of the GNU GPL, version 2 or,
// at your option, any later version. See the LICENSE.txt file for the text of
// the license.
//-----------------------------------------------------------------------------
// track min and max peak values (envelope follower)
//
// NB: the min value (resp. max value) is updated only when the next high peak
// (resp. low peak) is reached/detected, since you can't know it isn't a
// local minima (resp. maxima) until then.
// This also means the peaks are detected with an unpredictable delay.
// This algorithm therefore can't be used directly for realtime peak detections,
// but it can be used as a simple envelope follower.

module EnvelopeFollower (
	input i_clk, 
	input signed [11:0] i_adc,
	output signed [11:0] o_min, 
	output signed [11:0] o_max);

	parameter signed [11:0] threshold = 200; //180

	reg signed [11:0] min_val = 2047; //4095
    	reg signed [11:0] max_val = -2048; //-4096
    	reg signed [11:0] cur_min_val = 2047; //4095
    	reg signed [11:0] cur_max_val = -2048; //-4096
    	reg [1:0] state = 0;


    	always @(posedge i_clk)
    	begin
        	case (state)
        	0:
           	begin
               	 	if (cur_max_val >= ({1'b0, i_adc} + threshold))
                    		state <= 2;
                	else if (i_adc >= ({1'b0, cur_min_val} + threshold))
                    		state <= 1;
                	if (cur_max_val <= i_adc)
                    		cur_max_val <= i_adc;
                	else if (i_adc <= cur_min_val)
                    	cur_min_val <= i_adc;                 
            	end
       	 	1:
            	begin
                	if (cur_max_val <= i_adc)
                    		cur_max_val <= i_adc;
                	else if (({1'b0, i_adc} + threshold) <= cur_max_val) begin
                    		state <= 2;
                    		cur_min_val <= i_adc;
                   		max_val <= cur_max_val;
                	end    
            	end
        	2:
            	begin
                	if (i_adc <= cur_min_val)
                    		cur_min_val <= i_adc;                   
                	else if (i_adc >= ({1'b0, cur_min_val} + threshold)) begin
                    		state <= 1;
                    		cur_max_val <= i_adc;
                    		min_val <= cur_min_val;
                	end    
            	end
        	endcase
   	end

    	assign o_min = (min_val == 2047) ||(min_val ==  -2048) ? 1'b0: min_val;
    	assign o_max = (max_val == 2047) ||(max_val ==  -2048) ? 1'b0: max_val;

endmodule
