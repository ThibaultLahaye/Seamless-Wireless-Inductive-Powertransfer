`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//High level module of the interface which connects Keccak permutation to AXI4 full interface logic
//////////////////////////////////////////////////////////////////////////////////


module EAGLE_to_AXI_interface(
    input i_clk,
    input i_rst,
    input i_a_wr,
    input i_a_en_rd,
    input [3:0] i_v_a_addr,
    input [31:0] i_v_a_din,
    input [3:0] i_v_S_AXI_WSTRB,
    output[31:0] o_v_a_dout
    );
    
    
    wire [399:0] w_i_v_permutation_state, w_o_v_permutation_state;
    wire w_a_en_wr;
    wire [7:0] w_v_b_din_ctrl_reg, w_v_b_dout_ctrl_reg;
    wire [7:0] w_v_b_dout_ctrl_numOfRounds;
    wire w_i_start;
    wire [4:0] w_i_v_numberOfRounds;
    wire w_o_done;

    

    
    EAGLE_interface_CONTROL EAGLE_interface_CONTROL_inst(
          .i_clk (i_clk),
          .i_rst (i_rst),
          .o_a_en_wr(w_a_en_wr),//write enable for data arriving from CPU, used to avoid conflict if both CPU and permutation want to write at the same time 
          .o_v_b_din_ctrl_reg (w_v_b_din_ctrl_reg),//control value to be written to the memory once the permutation is finished
          .i_v_b_dout_ctrl_reg (w_v_b_dout_ctrl_reg),//control value read from the memory, when it is set to '\xaa', the permutation can start
	  .i_v_b_dout_ctrl_numOfRounds(w_v_b_dout_ctrl_numOfRounds),//control value read from the memory that represents number of rounds that should be executed
          .o_i_start(w_i_start),//start signal to Keccak permutation
          .i_o_done (w_o_done),//done signal received from Keccak permutation
	  .o_i_v_numberOfRounds (w_i_v_numberOfRounds)// number of rounds to be executed, only used when implementing both regular and twisted permutation
          );
        
    TDP_bram TDP_bram_inst(
         .i_common_clk (i_clk),
         .i_a_wr (i_a_wr),//write enable (from CPU)
         .i_a_en_wr (w_a_en_wr),//write enable for data arriving from CPU, used to avoid conflict if both CPU and permutation want to write at the same time
         .i_a_en_rd (i_a_en_rd),//read enable (from CPU)
         .i_v_a_addr (i_v_a_addr),//address to write or read (from CPU)
         .i_v_a_din (i_v_a_din),//data to be written (from CPU)
         .i_v_S_AXI_WSTRB (i_v_S_AXI_WSTRB),//strobe signal for data from CPU
         .o_v_a_dout (o_v_a_dout),//data read (to CPU)
         .i_b_wr (w_o_done),//write enable (from Keccak permutation)
         .i_v_b_din (w_o_v_permutation_state),//data to be written from Keccak permutation
         .i_v_b_din_ctrl_reg (w_v_b_din_ctrl_reg),//control value to be written to memory to signalize end of Keccak permutation, this value is then read by CPU
         .o_v_b_dout (w_i_v_permutation_state),//data read from Keccak permutation
         .o_v_b_dout_ctrl_numOfRounds (w_v_b_dout_ctrl_numOfRounds),//control value written by CPU to signalize number of rounds that the permutation should execute
         .o_v_b_dout_ctrl_reg (w_v_b_dout_ctrl_reg)//control value written by CPU to signalize start of Keccak permutation
         ); 
            
    Keccak_P_mod_400Permutation Keccak_P_mod_400Permutation_inst(
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_start(w_i_start),
        .i_v_numberOfRounds(w_i_v_numberOfRounds),
        .i_v_state (w_i_v_permutation_state),
        .o_v_state (w_o_v_permutation_state),
        .o_done (w_o_done)
        );        


endmodule
