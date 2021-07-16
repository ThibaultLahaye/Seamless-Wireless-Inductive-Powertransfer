`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// This module controls the EAGLE interface. It waits for the right value written by the CPU ('\xaa') and then set 'start' signal to the permutation.
// DUring the execution of the permutation this controller puts value '\x55' to be written to the memory once the permutation is done (o_done signal set high).
// When the permutation is done, this controller goes back to idle state where it waits next right value from the CPU
//////////////////////////////////////////////////////////////////////////////////


module EAGLE_interface_CONTROL(
    input i_clk,
    input i_rst,
    output reg o_a_en_wr, 
    output reg [7:0] o_v_b_din_ctrl_reg,
    input [7:0] i_v_b_dout_ctrl_reg,
    input [7:0] i_v_b_dout_ctrl_numOfRounds,
    output reg o_i_start,
    input i_o_done,
    output [4:0] o_i_v_numberOfRounds
    );
    
    reg [4:0] w_v_numberOfRounds_current, w_v_numberOfRounds_next;
    reg [2:0] current_state, next_state;
    parameter IDLE = 3'b000,  EXECUTE_PERMUTATION = 3'b001;
    
    
    always @(posedge i_clk)//state transition
    if (i_rst)
        begin
            current_state <= IDLE;
            w_v_numberOfRounds_current <= 5'd0;
        end
    else
        begin
            current_state <= next_state;
	    w_v_numberOfRounds_current <= w_v_numberOfRounds_next;
        end
        
     always @(*)//next state logic
        begin         
            next_state = current_state; 
	    w_v_numberOfRounds_next = w_v_numberOfRounds_current;
             
            case (current_state)
            
                IDLE:
                    begin
		    	w_v_numberOfRounds_next = i_v_b_dout_ctrl_numOfRounds[4:0];
                        if (i_v_b_dout_ctrl_reg == 8'haa)
                            next_state = EXECUTE_PERMUTATION;
                    end                                       
                
                EXECUTE_PERMUTATION:
                    begin
                        if (i_o_done == 1'b1)
                            next_state = IDLE;
                    end            
                
                default:
                    next_state = IDLE;
            endcase
        end
        
       
     always @(current_state,i_v_b_dout_ctrl_reg)
        begin
            o_a_en_wr = 1'b1;
            o_v_b_din_ctrl_reg = 8'd0;
            o_i_start = 1'b0;        
            case (current_state)
                IDLE:
                    begin
                        if (i_v_b_dout_ctrl_reg == 8'haa)
                            o_i_start = 1'b1;
                    end            
                EXECUTE_PERMUTATION:
                    begin
                        o_a_en_wr = 1'b0;
                        o_v_b_din_ctrl_reg = 8'h55;
                    end
            endcase
        end

    assign o_i_v_numberOfRounds = w_v_numberOfRounds_current;
    
endmodule
