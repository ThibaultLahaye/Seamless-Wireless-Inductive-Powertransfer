`timescale 1ns/1ps

 module BitstreamGenerator (
	input wire i_clk,
	input wire i_nrst,
	input wire i_enable,
	input wire i_ce,
	output reg o_value
	);

	parameter [31:0] data = 32'b1110111001101011001010000100100;
	reg [4:0] index;

	always @(posedge i_clk) begin
		if( (i_ce) && (i_enable) )
			index = index + 1'b1;
	end

	always @(posedge i_clk, negedge i_nrst) begin
		if(~i_nrst) begin
			index <= 0;
			o_value <= 0; 
		end
		else begin
			o_value = data[index];
		end			
	end	

endmodule
