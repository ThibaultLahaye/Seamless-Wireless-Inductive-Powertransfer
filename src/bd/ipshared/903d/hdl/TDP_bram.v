`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Custom dual port memory for EAGLE crypto. In this memory, both CPU and Keccak permutation can write (and read).
//////////////////////////////////////////////////////////////////////////////////


module TDP_bram(
    input i_common_clk,
    input i_a_wr,
    input i_a_en_wr,
    input i_a_en_rd,
    input [3:0] i_v_a_addr,
    input [31:0] i_v_a_din,
    input [3:0] i_v_S_AXI_WSTRB,
    output reg [31:0] o_v_a_dout,
    input i_b_wr,
    input [399:0] i_v_b_din,
    input [7:0] i_v_b_din_ctrl_reg,
    output  [399:0] o_v_b_dout,
    output  [7:0] o_v_b_dout_ctrl_reg
    );
    
    reg [7:0] mem[63:0];
    wire [399:0] w_v_b_dout_intermediate;
    wire [7:0] w_v_b_dout_ctrl_reg_intermediate;
    integer i;
    genvar j;
    
    //Port A - READ
    always @(posedge i_common_clk) begin
        if (i_a_en_rd)
            o_v_a_dout <= {mem[4*i_v_a_addr],mem[4*i_v_a_addr+1],mem[4*i_v_a_addr+2],mem[4*i_v_a_addr+3]};
    end
    

    
    //Port A and Port B - WRITE
    always @(posedge i_common_clk) begin
        if (i_a_wr==1 && i_a_en_wr==1)
            begin
                if(i_v_S_AXI_WSTRB[3])
                    mem[4*i_v_a_addr] <= i_v_a_din[31:24];
                if(i_v_S_AXI_WSTRB[2])
                    mem[4*i_v_a_addr+1] <= i_v_a_din[23:16];
                if(i_v_S_AXI_WSTRB[1])
                    mem[4*i_v_a_addr+2] <= i_v_a_din[15:8];
                if(i_v_S_AXI_WSTRB[0])
                    mem[4*i_v_a_addr+3] <= i_v_a_din[7:0];
            end
         else if (i_b_wr == 1)
                begin
                    for (i=0; i<48;i = i+4)
                        begin
                            mem[i+3] <= i_v_b_din[(8*i+7)-:8];
                            mem[i+2] <= i_v_b_din[(8*i+8+7)-:8];
                            mem[i+1] <= i_v_b_din[(8*i+16+7)-:8];
                            mem[i] <= i_v_b_din[(8*i+24+7)-:8];
                        end
                    mem[51] <= i_v_b_din[391:384];
                    mem[50] <= i_v_b_din[399:392];
                    mem[48] <= i_v_b_din_ctrl_reg;
                end
    end
    
    
    //Port B - READ 
    generate
    for (j=0;j<48;j=j+4)
        begin: B_GEN
            assign o_v_b_dout[(8*j+7)-:8] = mem[j+3];
            assign o_v_b_dout[(8*j+8+7)-:8] = mem[j+2];
            assign o_v_b_dout[(8*j+16+7)-:8] = mem[j+1];
            assign o_v_b_dout[(8*j+24+7)-:8] = mem[j+0];
        end
    endgenerate
    assign o_v_b_dout[391:384] = mem[51];
    assign o_v_b_dout[399:392] = mem[50];
    assign o_v_b_dout_ctrl_reg = mem[48];
        
endmodule