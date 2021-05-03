 `timescale 1ns/1ps

module Pwm (
	input wire i_clk,
	//input wire i_nrst,
	input wire i_enable,
	//input wire i_data,
	input wire [31:0] i_freq,
	output reg o_s1,
	output reg o_s2,
	output reg o_s3,
	output reg o_s4
	);

    integer counter_one = 0;
    integer counter_two = 500;

    //Controller
    //    ...
        
    //Global counter_one
    always @(posedge i_clk) 
    begin
        if (i_enable) begin
            counter_one = counter_one + 1;
            if (counter_one>= (i_freq)) 
                counter_one = 0;
        end else begin 
            counter_one = 0;
        end
        
    end

    //Global counter_two
    always @(posedge i_clk) 
    begin
        if (i_enable) begin
            counter_two = counter_two + 1;
            if (counter_two>= (i_freq)) 
                counter_two = 0;
        end else begin 
            counter_two = 500;
        end
        
    end

    //S1
    always @(posedge i_clk)
    begin
        if (i_enable) begin
            if ( (25 <= counter_one) && ( (counter_one + 25) < i_freq>>1) )
                o_s1 <= 1'b1;
            else
                o_s1 <= 1'b0;
        end else 
            o_s1 <= 1'b0;

    end

    //S2
    always @(posedge i_clk)
    begin
        if (i_enable) begin
            if ( ((i_freq>>1) <= counter_one) && (counter_one <= i_freq) ) 
                o_s2 <= 1'b1;
            else 
                o_s2 <= 1'b0;
        end else 
                o_s2 <= 1'b1;

    end

    //S3
    always @(posedge i_clk)
    begin
        if (i_enable) begin
            if ( ((i_freq>>1) <= counter_two) && (counter_two <= i_freq) ) 
                o_s3 <= 1'b1;
            else 
                o_s3 <= 1'b0;
        end else 
            o_s3 <= 1'b0;
    end

    //S4
    always @(posedge i_clk)
    begin
        if (i_enable) begin
            if ( (25 <= counter_two) && ( (counter_two + 25) < i_freq>>1) )
                o_s4 <= 1'b1;
            else
                o_s4 <= 1'b0;
        end else 
            o_s4 <= 1'b1;
    end
    
endmodule

