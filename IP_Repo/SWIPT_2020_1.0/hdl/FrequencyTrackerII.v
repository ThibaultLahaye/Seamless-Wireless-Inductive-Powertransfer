`timescale 1ns/1ps

module	FrequencyTrackerII (
	input wire i_clk, 
	//input wire i_nrst, 
	//input wire i_enable,
	input wire signed [11:0] i_envelope_max,

	output reg [31:0] o_freq,
	output reg o_enable,
	
	input wire db_switch,
	output wire db_led_0,
	output reg [31:0] db_freq,
    output reg [31:0] db_mid_freq,
    output reg [31:0] db_delta_freq
	);

	///////////////////////////////////////
	/////////// State Variables ///////////
	integer state = 0;		
	parameter frequency = 32'd1;
	parameter delay = 32'd2;
	parameter sampling = 32'd3;
	parameter disabled = 32'd4;
	parameter processing = 32'd66;
	parameter equilibrium = 32'd99;

//	integer substate = 0;
//	parameter equilibrium_freq = 32'd991;
//	parameter equilibrium_delay = 32'd992;
//	parameter equilibrium_steady = 32'd993;
	///////////////////////////////////////
	//////// Algoritme Parameters /////////
	integer mid_freq = 1900;			//INITIAL: MID_FREQUENCY 	
	integer delta_freq = 300; 			//INITIAL: DELTA_FREQUENCY
	///////////////////////////////////////
	///////// Algoritme Variables /////////
	integer prev_lvl_max_amp = 0;
	integer max = 0;
	integer max_freq = 0;
	integer counter = 0;
	integer index_delta = -3;

	integer recursion_depth = 0;
	///////////////////////////////////////
	
	//assign db_led_0 = db_switch;

	always @(posedge i_clk) begin

		case (state)
			default://the reset/init state
			begin
				//state = (delta_freq >= 7) ? frequency: equilibrium;
				state = frequency;
				o_enable = 1;
				recursion_depth = 0;
			end
			//////////////////////////////////////////////////////////////////////
			frequency:
			begin
				o_freq = mid_freq + index_delta*delta_freq;
				state = delay;
			end
			delay:
			begin
				if (counter >= 1200000) begin //1500000
					state = sampling;
					counter = 0;
				end else
					counter = counter + 1;
			end
			sampling:
			begin
				if (i_envelope_max > max) begin
					max = i_envelope_max;
					max_freq = o_freq; 
				end
				state = disabled;
			end
			disabled:
			begin
				o_enable = 0;
				if (counter >= 400000) begin
					o_enable = 1;
					state = equilibrium;
					o_freq = mid_freq;
					counter = 0;
				end else 
					counter = counter + 1;
			end		
			equilibrium:
			begin
			   
			end  	
		endcase	
	end
	
//    always @(posedge i_clk) begin
//        if (mid_freq >= 10000) begin //10000 klokcycli is een freq vqn 10kHz (onderste limiet)
//	       mid_freq = 1000;			//INITIAL: MID_FREQUENCY 	
//	       delta_freq = 300; 
//	    end
//	    else if (mid_freq <= 500) begin
//	       mid_freq = 1000;
//	       delta_freq = 300;            
//        end           
//            //o_enable = 1;
        
//    end
	
endmodule
