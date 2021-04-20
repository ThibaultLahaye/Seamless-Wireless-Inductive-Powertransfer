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
	integer counter = 0;

	// Global Counter
	always @(posedge i_clk) 
	begin
		if (i_enable) begin
			counter = counter + 1;
			if (counter>= (i_freq)) 
				counter = 0;
		end else begin 
			counter = 0;
		end
		
	end

	//S1
	always @(posedge i_clk)
	begin
		if (i_enable) begin
			if ( (25 <= counter) && ( (counter + 25) < i_freq>>1) )
				o_s1 <= 1'b1;
			else
				o_s1 <= 1'b0;
		end else 
			o_s1 <= 1'b0;

	end

	//S3
	always @(posedge i_clk)
	begin
		if (i_enable) begin
			if ( ((i_freq>>1) <= counter) && ((counter) <= (i_freq-1)) )
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
			if ( (25 <= counter) && ( (counter + 25) < i_freq>>1) )
				o_s4 <= 1'b1;
			else
				o_s4 <= 1'b0;
		end else 
			o_s4 <= 1'b1;
	end

	//S2
	always @(posedge i_clk)
	begin
		if (i_enable) begin
			if ( ( (0 <= counter) && (counter < i_freq>>1) ) )
				o_s2 <= 1'b0;
			else 
				o_s2 <= 1'b1;
		end else 
				o_s2 <= 1'b1;

	end	
endmodule

