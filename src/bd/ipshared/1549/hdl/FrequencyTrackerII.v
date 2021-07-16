module	FrequencyTrackerII (
	input wire i_clk,
	input wire i_inductive_mode, 
	//input wire i_nrst, 
	//input wire i_enable,
	input wire signed [11:0] i_envelope_max,

	output reg [31:0] o_freq,
	output reg o_enable,
    output wire o_lock,

    output wire [31:0] o_db_state,
    output wire [31:0] o_db_index_delta,
    output wire signed [31:0] o_db_delta_freq
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

	integer substate = 0;
	parameter equilibrium_freq = 32'd991;
	parameter equilibrium_delay = 32'd992;
	parameter equilibrium_steady = 32'd993;
	///////////////////////////////////////
	//////// Algoritme Parameters /////////
	integer mid_freq = 80000;			        //INITIAL: MID_FREQUENCY 	
	//reg signed [5:0] delta_freq = 50; 			//INITIAL: DELTA_FREQUENCY
	integer delta_freq = 5000; 
	///////////////////////////////////////
	///////// Algoritme Variables /////////
	integer prev_lvl_max_amp = 0;
	integer max = 0;
	integer max_freq = 0;
	integer counter = 0;
	//reg signed [5:0] index_delta = -5;
	integer index_delta = -5;
	///////////////////////////////////////
	
	//assign db_led_0 = db_switch;
	//integer db_flag = 0;
    //integer temp = 0;
	always @(posedge i_clk) begin
        if (~i_inductive_mode) begin
            state = 0;
            substate = 0;
            
            mid_freq = 80000;
            delta_freq = 5000;
        
	        prev_lvl_max_amp = 0;
            max = 0;
            max_freq = 0;
            counter = 0;
            
            index_delta = -5;     
            
            o_freq = mid_freq;
            
            o_enable = 1;   
        end else begin
		case (state)
			default://the reset/init state
			begin
				//state = (delta_freq >= 7) ? frequency: equilibrium;
				state = frequency;
				o_enable = 1;
			end
			//////////////////////////////////////////////////////////////////////
			frequency:
			begin
			    o_freq = mid_freq + index_delta*delta_freq; //register voor tussenstap
				state = delay;
			end
			delay:
			begin
				if (counter >= 150000000) begin //1.5sec delay, angepast naar 0.0015
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
				if (counter >= 800000) begin // aangepast van 800000 voor snelle freq tracking
					o_enable = 1;
					state = (index_delta <= 4) ? frequency: processing;
					index_delta = index_delta + 1;
					counter = 0;
				end else 
					counter = counter + 1;
			end
			processing:
            begin
//                if (max >= prev_lvl_max_amp) begin
                    mid_freq = max_freq;                //New    
                    delta_freq = delta_freq>>2;         //New

                    prev_lvl_max_amp = max;
                    
                    max = 0;
                    max_freq = 0;
                    index_delta = -5;

                    state <= (delta_freq >= 100) ? frequency: equilibrium;
//                end //else if ((max + 200)< prev_lvl_max_amp) begin
//                    mid_freq = 1000;                    //New    
//                    delta_freq = 50;                    //New

//                    prev_lvl_max_amp = 0;
                    
//                    max = 0;
//                    max_freq = 0;
//                    index_delta = -5;
                        
//                    state <= frequency;
//                end
            end		
			equilibrium:
			begin
                case (substate)
                                default:
                                begin
                                    o_freq = mid_freq;
                                    substate <= equilibrium_delay;
                                end
                                equilibrium_delay:
                                begin
                                    if (counter >= 150000000) begin // 1.5sec (150000000)// aangepast naar 0.0015sec voor snelle freq tracking
                                        substate = equilibrium_steady;
                                        counter = 0;
                                    end else
                                    counter = counter + 1;
                                end
                                equilibrium_steady:
                                begin

//                                    if ((i_envelope_max + 150)< prev_lvl_max_amp) begin
//                                        mid_freq = 1000;				//New	
//                                        delta_freq = 50;				//New
                                                            
//                                        prev_lvl_max_amp = 0;
                                    
//                                        state <= frequency;
//                                        substate <= 0;
                                        
//                                    end else if (i_envelope_max > (prev_lvl_max_amp + 150)) begin
//                                        mid_freq = 1000;				//New	
//                                        delta_freq = 50;				//New
                                    
//                                        prev_lvl_max_amp = 0;
            
//                                        state <= frequency;
//                                        substate <= 0;		
                                        	
                                   // end
                                end
                endcase
			end  	
		endcase
		end	
	end
	
	assign o_lock = ((state == equilibrium)&&(substate == equilibrium_steady)) ? 1'b1 : 1'b0; 
	
	assign o_db_state = state;
	assign o_db_index_delta = index_delta;
	assign o_db_delta_freq = delta_freq;
			
endmodule
