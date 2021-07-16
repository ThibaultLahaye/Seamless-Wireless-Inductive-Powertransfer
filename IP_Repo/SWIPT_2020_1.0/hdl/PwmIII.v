module PwmIII (
	input wire i_clk,
	input wire i_nrst,
	input wire i_enable,
	input wire i_lock,
	input wire [31:0] i_freq,
	input wire i_data_mode,
	input wire [31:0] i_data_l,
	output reg o_s1,
	output reg o_s2,
	output reg o_s3,
	output reg o_s4,
	output wire o_db_i_data
	);

	//parameter i_enable = 1;
	//parameter i_data = 1;
	//parameter i_freq = 1333;

	integer counter = 0;
	integer counter_one = 0;
	integer counter_two = 0;

    //DataLoading
    //parameter [31:0] data = 32'b1110111001101011001010000100111;
	
	//integer data = 0;
	//always @(posedge i_clk) begin
	//   data = i_data_l;
	//end
	
	//Bitstream Gen	
	reg [4:0] index = 0;
	wire i_data;	
	always @(posedge i_clk)
	begin
		if (i_lock && i_data_mode) begin
			if (counter == 1000) begin
				//counter = 0;
				index = index + 1'b1;
			end 
		end else index = 0;
	end

	assign i_data = i_data_l[index];

	//Difference Controller
	integer difference = 0;
	always @(posedge i_clk)
	begin
		if (i_lock && i_data_mode) begin
			if (i_data) difference = (11*(i_freq>>5));//verschuiving 11/32 dus 2 x 5/32 open dus totaal is 5/16 open
			else difference = (15*(i_freq>>5)); //verschuiving = 1/4+1/8+1/16+1/32 =15/32. totaal open is 2 * 1/32=1/16
		end else 
			difference = (3*(i_freq>>3)); // 3/8 verschuiving dus open op 2x1/8 = 1/4
	end

	//Global counter_one & counter_two 
	always @(posedge i_clk) 
	begin
		if (i_enable) begin
			counter_one = counter_one + 1;
			if ((counter_one )>= (i_freq)) begin //modified difference
				counter_one = 0;
				if (counter == 200) counter = 0;
				else counter = counter + 1;
			end
		end else begin 
			counter_one = 0;
		end
		counter_two = counter_one + difference;
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
			if ( ((i_freq>>1) <= (counter_two )) && ((counter_two ) <= i_freq) ) //modified difference
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
			if ( (25 <= (counter_two )) && ( (counter_two + 25) < i_freq>>1) ) //modified differencec
				o_s4 <= 1'b1;
			else if (i_freq + 25 <=(counter_two ))  //modified difference
				o_s4 <=1'b1; 
			else
				o_s4 <= 1'b0;
		end else 
			o_s4 <= 1'b1;
	end
	
	assign o_db_i_data = i_data;

	
endmodule