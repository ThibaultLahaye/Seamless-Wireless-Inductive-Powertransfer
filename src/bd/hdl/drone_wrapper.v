//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Tue Apr 20 14:51:49 2021
//Host        : pc-klas6-7.esat.kuleuven.be running 64-bit CentOS Linux release 8.3.2011
//Command     : generate_target drone_wrapper.bd
//Design      : drone_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module drone_wrapper
   (ADC_inn_14,
    ADC_inn_6,
    ADC_inp_14,
    ADC_inp_6,
    BL,
    BR,
    Core0_nIRQ,
    Core1_nIRQ,
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FCLK_CLK0,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    FL,
    FR,
    IIC_0_scl_io,
    IIC_0_sda_io,
    Mode_switch,
    SWIPT_OUT0,
    SWIPT_OUT1,
    SWIPT_OUT2,
    SWIPT_OUT3,
    Sonar,
    Sounder,
    aile,
    db_port_switch_0,
    elev,
    gpio_testpin_tri_o,
    leds_4bits_tri_o,
    mode_inductive,
    rc_kill,
    rc_kill_out,
    rudd,
    throttle,
    tuner);
  input ADC_inn_14;
  input ADC_inn_6;
  input ADC_inp_14;
  input ADC_inp_6;
  output BL;
  output BR;
  input Core0_nIRQ;
  input Core1_nIRQ;
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  output FCLK_CLK0;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output FL;
  output FR;
  inout IIC_0_scl_io;
  inout IIC_0_sda_io;
  input Mode_switch;
  output SWIPT_OUT0;
  output SWIPT_OUT1;
  output SWIPT_OUT2;
  output SWIPT_OUT3;
  input Sonar;
  output Sounder;
  input aile;
  input db_port_switch_0;
  input elev;
  output [0:0]gpio_testpin_tri_o;
  output [3:0]leds_4bits_tri_o;
  input mode_inductive;
  input rc_kill;
  output rc_kill_out;
  input rudd;
  input throttle;
  input tuner;

  wire ADC_inn_14;
  wire ADC_inn_6;
  wire ADC_inp_14;
  wire ADC_inp_6;
  wire BL;
  wire BR;
  wire Core0_nIRQ;
  wire Core1_nIRQ;
  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FCLK_CLK0;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire FL;
  wire FR;
  wire IIC_0_scl_i;
  wire IIC_0_scl_io;
  wire IIC_0_scl_o;
  wire IIC_0_scl_t;
  wire IIC_0_sda_i;
  wire IIC_0_sda_io;
  wire IIC_0_sda_o;
  wire IIC_0_sda_t;
  wire Mode_switch;
  wire SWIPT_OUT0;
  wire SWIPT_OUT1;
  wire SWIPT_OUT2;
  wire SWIPT_OUT3;
  wire Sonar;
  wire Sounder;
  wire aile;
  wire db_port_switch_0;
  wire elev;
  wire [0:0]gpio_testpin_tri_o;
  wire [3:0]leds_4bits_tri_o;
  wire mode_inductive;
  wire rc_kill;
  wire rc_kill_out;
  wire rudd;
  wire throttle;
  wire tuner;

  IOBUF IIC_0_scl_iobuf
       (.I(IIC_0_scl_o),
        .IO(IIC_0_scl_io),
        .O(IIC_0_scl_i),
        .T(IIC_0_scl_t));
  IOBUF IIC_0_sda_iobuf
       (.I(IIC_0_sda_o),
        .IO(IIC_0_sda_io),
        .O(IIC_0_sda_i),
        .T(IIC_0_sda_t));
  drone drone_i
       (.ADC_inn_14(ADC_inn_14),
        .ADC_inn_6(ADC_inn_6),
        .ADC_inp_14(ADC_inp_14),
        .ADC_inp_6(ADC_inp_6),
        .BL(BL),
        .BR(BR),
        .Core0_nIRQ(Core0_nIRQ),
        .Core1_nIRQ(Core1_nIRQ),
        .DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FCLK_CLK0(FCLK_CLK0),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .FL(FL),
        .FR(FR),
        .IIC_0_scl_i(IIC_0_scl_i),
        .IIC_0_scl_o(IIC_0_scl_o),
        .IIC_0_scl_t(IIC_0_scl_t),
        .IIC_0_sda_i(IIC_0_sda_i),
        .IIC_0_sda_o(IIC_0_sda_o),
        .IIC_0_sda_t(IIC_0_sda_t),
        .Mode_switch(Mode_switch),
        .SWIPT_OUT0(SWIPT_OUT0),
        .SWIPT_OUT1(SWIPT_OUT1),
        .SWIPT_OUT2(SWIPT_OUT2),
        .SWIPT_OUT3(SWIPT_OUT3),
        .Sonar(Sonar),
        .Sounder(Sounder),
        .aile(aile),
        .db_port_switch_0(db_port_switch_0),
        .elev(elev),
        .gpio_testpin_tri_o(gpio_testpin_tri_o),
        .leds_4bits_tri_o(leds_4bits_tri_o),
        .mode_inductive(mode_inductive),
        .rc_kill(rc_kill),
        .rc_kill_out(rc_kill_out),
        .rudd(rudd),
        .throttle(throttle),
        .tuner(tuner));
endmodule
